package nosi.core.webapp;

import jakarta.enterprise.inject.Instance;
import jakarta.enterprise.inject.spi.CDI;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.http.HttpServletResponse;
import nosi.core.config.Config;
import nosi.core.config.ConfigApp;
import nosi.core.config.ConfigCommonMainConstants;
import nosi.core.exception.ServerErrorHttpException;
import nosi.core.gui.components.IGRPForm;
import nosi.core.gui.components.IGRPMessage;
import nosi.core.gui.components.IGRPView;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.page.Page;
import nosi.core.webapp.activit.rest.entities.TaskService;
import nosi.core.webapp.activit.rest.entities.TaskServiceQuery;
import nosi.core.webapp.activit.rest.entities.TaskVariableDetails;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.core.webapp.bpmn.*;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.Route;
import nosi.core.webapp.helpers.StringHelper;
import nosi.core.webapp.security.SecurtyCallPage;
import nosi.core.webapp.webservices.helpers.FileRest;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;
import java.io.InputStream;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.lang.invoke.MethodHandles;
import java.lang.invoke.MethodType;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Parameter;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.*;
import java.util.function.Predicate;
import java.util.stream.Collectors;

/**
 * @author Marcel Iekiny Apr 15, 2017
 */

public class Controller {

   private static final Logger LOGGER = LoggerFactory.getLogger(Controller.class);

    protected ConfigApp configApp = ConfigApp.getInstance();
    protected String format = Response.FORMAT_XML;
    protected String encoding = Response.CHARSET_UTF_8;
    protected boolean isNoCached = false;
    private QueryString<String, Object> queryString = new QueryString<>();
    private View view;
    private Response responseWrapper;
    private String qs = "";

    private static final Pattern XML_STYLESHEET_HREF =
            Pattern.compile("<\\?xml-stylesheet\\s+[^>]*href\\s*=\\s*\"([^\"]+)\"[^>]*\\?>", Pattern.CASE_INSENSITIVE);


    public Response getResponseWrapper() {
        return responseWrapper;
    }

    public void setResponseWrapper(Response responseWrapper) {
        this.responseWrapper = responseWrapper;
    }

    protected void restartQueryString() {
        queryString = new QueryString<>();
    }

    /**
     * Get all the r Params, and in a forEach does this.addQueryString of them all
     *
     * @return
     */
    protected QueryString<String, Object> loadQueryString() {
        Core.getParameters().entrySet().stream().filter(p -> !p.getKey().equals("r"))
                .forEach(p -> this.addQueryString(p.getKey(), p.getValue() != null ? p.getValue()[0] : ""));
        return this.queryString;
    }

    public QueryString<String, Object> queryString() {
        return this.queryString;
    }

    public QueryString<String, Object> addQueryString(String name, Object value, Predicate<Object> predicate) {
        return predicate.test(value) ? addQueryString(name, value) : queryString();
    }

    public QueryString<String, Object> addQueryString(String name, Object value) {
        if (value instanceof Object[]) {
            for (Object v : (Object[]) value) {
                this.queryString().addQueryString(name, v);
            }
            return this.queryString();
        }
        return this.queryString().addQueryString(name, value);
    }

    public QueryString<String, Object> removeQueryString(String key) {
        return this.queryString.removeQueryString(key);
    }

    protected String[] getQueryArray(String name) {
        return Core.getParamArray(name);
    }

    protected String getQueryString(String name) {
        return Core.getParam(name);
    }

    protected Integer getQueryStringInteger(String name) {
        return Core.getParamInt(name);
    }

    protected Long getQueryStringLong(String name) {
        return Core.getParamLong(name);
    }

    protected Short getQueryStringShort(String name) {
        return Core.getParamShort(name);
    }

    protected Float getQueryStringFloat(String name) {
        return Core.getParamFloat(name);
    }

    protected Double getQueryStringDouble(String name) {
        return Core.getParamDouble(name);
    }

    protected Response renderView(View view, boolean isRenderPartial) throws IOException {
        Response resp = new Response();
        this.view = view;
        view.setContext(this); // associa controller ao view
        this.view.render();
        if (!isRenderPartial)
            this.view.addToPage(this.view.addFieldToFormHidden());
        String result = this.view.getPage().renderContent(!isRenderPartial);
        resp.setType(1);
        resp.setCharacterEncoding(Response.CHARSET_UTF_8);
        resp.setContentType(Response.FORMAT_XML);
        resp.setHttpStatus(HttpStatus.STATUS_200);
        if (this.isNoCached) {
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            resp.setDateHeader("Expires", 0); // Proxies.
        }
        resp.setContent(result);
        return resp;
    }

    public Response renderView(String app, String page, View v) throws IOException {
        return this.renderView(app, page, v, null, null);
    }

    public Response renderView(String app, String page, View v, InterfaceBPMNTask bpmn, RuntimeTask runtimeTask)
            throws IOException {
        String m = new IGRPMessage().toString();
        this.view = v;
        Action ac = new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", Page.resolvePageName(page)).one();
        Response resp = new Response();
        this.view.setContext(this);
        this.view.render();
        resp.setType(1);
        resp.setCharacterEncoding(Response.CHARSET_UTF_8);
        resp.setContentType(Response.FORMAT_XML);
        resp.setHttpStatus(HttpStatus.STATUS_200);
        if (this.isNoCached) {
            resp.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            resp.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            resp.setDateHeader("Expires", 0); // Proxies.
        }
        this.view.addToPage(this.view.addFieldToFormHidden());
        String content = this.view.getPage().renderContent(false);
        content = BPMNButton.removeXMLButton(content);
        XMLWritter xml = new XMLWritter("rows", this.getConfig().getLinkPageXsl(ac));
        xml.addXml(this.getConfig().getHeader(v, ac));
        xml.startElement("content");
        xml.writeAttribute("type", "");
        if (Core.isNotNull(runtimeTask)) {
            TaskServiceRest taskService = new TaskServiceRest();
            String taskId = runtimeTask.getTask().getId();
            if (runtimeTask.isSaveButton()) {
                xml.addXml(BPMNButton.generateButtonBack().toString());
                xml.addXml(BPMNButton.generateButtonTask("igrp", ac.getApplication().getId(), "ExecucaoTarefas",
                        "process-task", taskId, this.queryString).toString());
            }
            ViewTaskDetails details = this.getTaskDetails(taskService, taskId);
            BPMNTimeLine bpmnTimeLine = new BPMNTimeLine();
            xml.addXml(bpmnTimeLine.get().toString());
            xml.addXml(this.getTaskViewDetails(details));
            xml.addXml(content);
            xml.addXml(this.getDocument(runtimeTask, bpmn, ac, details.getUserName()));
            if (m != null)
                xml.addXml(m);
            IGRPForm formHidden = new IGRPForm("hidden_form_igrp");
            HiddenField field = new HiddenField("env_frm_url");
            String pageTask = "ExecucaoTarefas";
            String value = Route.getResolveUrl("igrp", pageTask, "executar_button_minha_tarefas&prm_app=igrp&prm_page=" + pageTask + "&p_id=" + runtimeTask.getTask().getId());
            field.propertie().add("value", value).add("name", "p_env_frm_url").add("type", "hidden").add("maxlength", "250").add("java-type", "").add("tag", "env_frm_url");
            field.setValue(value);
            formHidden.addField(field);
            xml.addXml(formHidden.toString());
        }
        xml.endElement();
        resp.setContent(xml.toString());
        return resp;
    }

    private String getTaskViewDetails(ViewTaskDetails details) {
        IGRPView viewTD = ViewTaskDetails.get(details);
        return viewTD.toString();
    }

    private ViewTaskDetails getTaskDetails(TaskServiceRest taskService, String taskId) {
        ViewTaskDetails details = new ViewTaskDetails();
        Object obj = Core.getAttributeObject(BPMNConstants.PRM_TASK_OBJ, true);
        if (Core.isNotNull(obj)) {
            TaskServiceQuery task = (TaskServiceQuery) obj;
            List<TaskVariableDetails> v = taskService.queryHistoryTaskVariables(task.getId());
            String profId = v.stream().filter(var -> var.getPropertyId().equals("profile")).findFirst().get()
                    .getPropertyValue();
            ProfileType prof = new ProfileType().findOne(Core.toInt(profId));
            String userName = v.stream().filter(var -> var.getPropertyId().equals("userName")).findFirst().get()
                    .getPropertyValue();
            details.setnProcess(task.getProcessInstanceId());
            details.setnTask(taskId);
            details.setProcessName(task.getProcessName());
            details.setTaskName(task.getName());
            details.setEndTime(task.getEndTime());
            details.setOrg(prof.getOrganization().getName());
            details.setProfile(prof.getDescr());
            details.setStartTime(task.getStartTime());
            details.setUserName(userName);
            return details;
        }
        TaskService task = new TaskServiceRest().getTask(taskId);
        if (task != null) {
            details.setnProcess(task.getProcessInstanceId());
            details.setnTask(taskId);
            details.setProcessName(task.getProcessName());
            details.setTaskName(task.getName());
        }
        return details;
    }

    private String getDocument(RuntimeTask runtimeTak, InterfaceBPMNTask bpmn, Action action, String userName) {
        if (bpmn == null)
            return BPMNHelper.addFileSeparator(action.getApplication().getDad(),
                    runtimeTak.getTask().getProcessDefinitionKey(), runtimeTak.getTask().getTaskDefinitionKey(), null);

        DisplayDocmentType display = new DisplayDocmentType();
        display.setUserName(userName);
        display.setListDocmentType(bpmn.getInputDocumentType());

        if (runtimeTak.isDetails())
            display.setShowInputFile(false);

        try {

            Core.setAttribute(BPMNConstants.PRM_TASK_DEFINITION, runtimeTak.getTask().getTaskDefinitionKey());
            String packageName = "nosi.webapps." + action.getApplication().getDad().toLowerCase() + ".process." + runtimeTak.getTask().getProcessDefinitionKey().toLowerCase();
            Class<?> clazz = Class.forName(packageName + "." + BPMNConstants.PREFIX_TASK + runtimeTak.getTask().getTaskDefinitionKey() + "Controller");

            final var lookup = MethodHandles.lookup();
            final var methodHandle = lookup.findVirtual(clazz, "getOutputDocumentType", MethodType.methodType(List.class));
            Object instance = clazz.getDeclaredConstructor().newInstance();

            @SuppressWarnings("unchecked")
            List<TipoDocumentoEtapa> listDocOutput = (List<TipoDocumentoEtapa>) methodHandle.invoke(instance);
            display.addListDocumentType(listDocOutput);

        } catch (Throwable e) {
            e.printStackTrace();
        }
        return display.displayInputNOutputDocsInDistinctFormList();
    }

    protected Response renderView(View view) throws IOException {
        return this.renderView(view, false);
    }

    /**
     * Calls this.xSend
     *
     * @param file
     * @param name
     * @param contentType
     * @param download
     * @return
     */
    public Response render(byte[] file, String name, String contentType, boolean download) {
        return this.xSend(file, name, contentType, download);
    }

    /**
     * Calls this.xSend
     *
     * @param file
     * @param name
     * @param contentType
     * @param download
     * @param url
     * @return
     */
    Response render(byte[] file, String name, String contentType, boolean download, String url) {
        return this.xSend(file, name, contentType, download, url);

    }

    protected Response renderView(String content) {
        Response resp = new Response();
        resp.setType(1);
        resp.setCharacterEncoding(this.encoding);
        resp.setContentType(this.format);
        resp.setContent(content);
        return resp;
    }

    private Response redirect_(String url) {
        Response resp = new Response();
        resp.setType(2);
        resp.setCharacterEncoding(Response.CHARSET_UTF_8);
        resp.setContentType(this.format);
        resp.setUrl(url);
        resp.setHttpStatus(HttpStatus.STATUS_200);
        return resp;
    }

    protected Response redirect(String app, String page, String action, Model model,
                                QueryString<String, Object> queryString) throws IOException {
        Igrp.getInstance().getRequest().getSession().setAttribute(Model.ATTRIBUTE_NAME_REQUEST, model);
        return this.redirect(app, page, action, queryString);
    }

    protected Response redirect(String app, String page, String action, QueryString<String, Object> queryString)
            throws IOException {
        redirectAddQueryStrFuncion(action, queryString);
        return this.redirect_(Route.toUrl(app, page, action, qs));
    }

    protected Response redirect(String app, String page, String action, QueryString<String, Object> queryString, int isPublic)
            throws IOException {
        redirectAddQueryStrFuncion(action, queryString);
        return this.redirect_(Route.toUrl(app, page, action, qs, isPublic));
    }

    private void redirectAddQueryStrFuncion(String action, QueryString<String, Object> queryString) {

        if (queryString.getValues("dad") == null && !action.contains("dad"))
            queryString.addQueryString("dad", Core.getParam("dad"));

        final String jsonLookup = Core.getParam("jsonLookup");
        if (Core.isNotNull(jsonLookup))
            queryString.addQueryString("jsonLookup", jsonLookup);

        this.setQueryString(queryString);

        Core.getParameters().entrySet().stream()
                .filter(param -> param.getKey().startsWith("p_fwl_"))
                .filter(param -> !param.getKey().equalsIgnoreCase("p_fwl_search"))
                .forEach(param -> {
                    final String qsParam = "&" + param.getKey() + "=" + param.getValue()[0];
                    if (!qs.contains(qsParam))
                        qs += qsParam;
                });
    }

    private void setQueryString(QueryString<String, Object> queryString) {

        qs = "";

        if (queryString == null || queryString.getQueryString().isEmpty())
            return;

        queryString.getQueryString().forEach((key, values) -> values.stream().filter(Objects::nonNull)
                .distinct()
                .forEach(value -> {
                    final boolean isString = Core.isNotNull(value) && value instanceof String;
                    final Object obj = isString ? URLEncoder.encode((String) value, StandardCharsets.UTF_8) : value;
                    final String qsParam = "&" + key + "=" + obj;
                    if (!qs.contains(qsParam))
                        qs += qsParam;
                }));
    }

    private void setQueryStringToAttributes(QueryString<String, Object> queryString) {
        if (queryString != null && !queryString.getQueryString().isEmpty())
            queryString.getQueryString().forEach((key, value) -> Core.setAttribute(key, value.toArray()));
    }

    protected Response redirect(String app, String page, String action, String qs) throws IOException {
        return this.redirect_(Route.toUrl(app, page, action, qs));
    }

    protected Response redirect(String r, String qs) throws IOException {
        return this.redirect_(Route.toUrl(r, qs));
    }

    protected Response redirect(String r) {
        return this.redirect_(Route.toUrl(r));
    }

    protected Response redirectError() throws IOException {
        return this.redirect_(Route.toUrl("igrp", "error-page", "exception"));
    }
    protected Response redirectError(String dad) throws IOException {
        return this.redirect_(Route.toUrl("igrp", "error-page", "exception","&dad="+dad));
    }

    protected Response redirect(String app, String page, String action) throws IOException {
        String ssoUrl = ssoUrl(app, page, action, null, null);
        if (ssoUrl != null)
            return this.redirectToUrl(ssoUrl);
        return this.redirect_(Route.toUrl(app, page, this.addParamDad(action)));
    }

    protected Response redirect(String app, String page, String action, Model model) throws IOException {
        return this.redirect(app, page, action, model, new QueryString<>());
    }

    protected Response redirect(String app, String page, String action, String[] paramNames, String[] paramValues)
            throws IOException {
        String ssoUrl = ssoUrl(app, page, action, paramNames, paramValues);
        if (ssoUrl != null)
            return this.redirectToUrl(ssoUrl);
        return this.redirect_(Route.toUrl(app, page, action, paramNames, paramValues));
    }

    private String ssoUrl(String app, String page, String action, String[] paramNames, String[] paramValues) {
        String ssoUrl = null;
        Map<String, String> params = new LinkedHashMap<>();
        if (paramNames != null && paramValues != null && paramValues.length == paramNames.length)
            for (int i = 0; i < paramNames.length; i++)
                params.put(paramNames[i], paramValues[i]);
        String currentDad = Core.getCurrentDad();
        if (currentDad != null && !currentDad.equals(app) && Core.isSharedPage(currentDad, app, page)) {
            String stateValue = Core.buildStateValueForSsoAutentikaWhenPage(page, app, null, null, !params.isEmpty() ? params : null);
            ssoUrl = Core.buildAppUrlUsingAutentikaForSSO(app, stateValue);
        }
        return ssoUrl;
    }

    protected Response redirectToUrl(String url) {
        final Response resp = new Response();
        resp.setType(2);
        resp.setUrl(url);
        resp.setHttpStatus(HttpStatus.STATUS_200);
        return resp;
    }

    protected Response forward(String app, String page, String action) {
        final Response resp = new Response();
        resp.setType(3);
        resp.setUrl(Route.toUrl(app, page, this.addParamDad(action)));
        return resp;
    }

    private String addParamDad(String action) {
        if (!action.contains("dad"))
            action += "&dad=" + Core.getParam("dad");
        return action;
    }

    protected Response sendFile(File file, String name, String contentType, boolean download) {
        byte[] content = null;
        try (FileInputStream in = new FileInputStream(file)) {
            return this.xSend(FileHelper.convertInputStreamToByte(in), name, contentType, download);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return this.xSend(content, name, contentType, download); // send it as stream ... binary file
    }

    // send it as stream ... binary file
    public Response xSend(byte[] file, String name, String contentType, boolean download) {
        return xSend(file, name, contentType, download, null);
    }

    public Response xSend(byte[] file, String name, String contentType, boolean download, String url) {
        Igrp igrpApp = Igrp.getInstance();
        String secTimeCache = Core.getParam("cache","10");
        if (file == null)
            throw new ServerErrorHttpException();
        Response response = new Response();
        if (contentType == null || contentType.isEmpty())
            contentType = "application/octet-stream";
        else {
            try {
                String extension = "." + contentType.split("/")[1];
                if (name == null || name.trim().isEmpty())
                    name = String.format("igrp-file%s", extension);
                if (!name.contains("."))
                    name = String.format("%s%s", name, extension);
            } catch (Exception e) {
                contentType = "application/octet-stream";
                e.printStackTrace();
            }
        }
        igrpApp.getResponse().addHeader("Content-Description", "File Transfer");
        igrpApp.getResponse().setHeader("Cache-Control", "public, max-age="+secTimeCache); // 1 year
        if (download) {
            igrpApp.getResponse().setHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");
        }
        else {
            igrpApp.getResponse().setHeader("Content-Disposition", "inline; filename=\"" + name + "\"");
        }

        response.setType(1);
        response.setContentLength(file.length);
        response.setContentType(contentType);
        response.setStream(file);
        if (url != null && !url.trim().isEmpty())
            response.setUrl(url);
        return response;
    }

    public View getView() {
        return this.view;
    }

    public void initControllerNRunAction() throws IOException {
        this.resolveRoute();
        this.prepareResponse();
    }

    private void prepareResponse() throws IOException {
        Object obj = this.run();
        if (obj instanceof Response)
            Igrp.getInstance().getCurrentController().setResponseWrapper((Response) obj);
    }

    private void resolveRoute() {
        Igrp app = Igrp.getInstance();
        String r = Core.isNotNull(app.getRequest().getParameter("r")) ? app.getRequest().getParameter("r") : "igrp/login/login";
        r = SecurtyCallPage.resolvePage(r);
        if (r != null) {
            String[] aux = r.split("/");
            if (aux.length == 3) {
                app.setCurrentAppName(aux[0]);
                app.setCurrentPageName(aux[1]);
                app.setCurrentActionName(aux[2]);
            } else
                throw new ServerErrorHttpException("The route format is invalid");
        }

        final var applicationName = "Application: " + app.getCurrentAppName();
        final var pageName = "Page: " + app.getCurrentPageName();
        final var actionName = "Action: " + app.getCurrentActionName();

        final var currentAppNameLowerCase = app.getCurrentAppName().trim().toLowerCase();
        final var pagesPackagePath = "nosi.webapps." + currentAppNameLowerCase + ".pages.";
        final var controllerPath = "Controller: " + pagesPackagePath + app.getCurrentPageName() + "Controller.java";
        final var viewPath = "View: " + pagesPackagePath + app.getCurrentPageName() + "View.java";
        final var modelPath = "Model: " + pagesPackagePath + app.getCurrentPageName() + ".java";

        final var xslPath = "xsl: " + Igrp.getInstance().getServlet().getServletContext().getContextPath()
                + "/images/IGRP/IGRP2.3/app/" + currentAppNameLowerCase + "/"
                + app.getCurrentPageName().toLowerCase() + "/" + app.getCurrentPageName() + ".xsl";

        app.getLog().addMessage(applicationName);
        app.getLog().addMessage(pageName);
        app.getLog().addMessage(actionName);
        app.getLog().addMessage(modelPath);
        app.getLog().addMessage(viewPath);
        app.getLog().addMessage(controllerPath);
        app.getLog().addMessage(xslPath);
    }

    protected Object run() {

        Igrp app = Igrp.getInstance();

        if (app == null || app.getCurrentAppName() == null || app.getCurrentActionName() == null || app.getCurrentPageName() == null) {
            final var defaultControllerPath = this.getConfig().getPackage("igrp", "Home");
            return loadPage(defaultControllerPath, "actionIndex");
        }

        final var capitalizedAppName = capitalizeAndJoin(app.getCurrentAppName());
        final var capitalizedPageName = capitalizeAndJoin(app.getCurrentPageName());
        final var capitalizedActionName = "action" + capitalizeAndJoin(app.getCurrentActionName());

        final var controllerPath = this.getConfig().getPackage(capitalizedAppName, capitalizedPageName);

        return loadPage(controllerPath, capitalizedActionName);
    }

    private String capitalizeAndJoin(String input) {
        return Arrays.stream(input.split("-"))
                .map(word -> word.substring(0, 1).toUpperCase() + word.substring(1))
                .collect(Collectors.joining());
    }

    protected Response call(String app, String page, String action) {
        return this.call(app, page, action, null);
    }

    public Response call(String app, String page, String action, QueryString<String, Object> queryString) {
        IGRPMessage msg = new IGRPMessage();
        Igrp igrpApp = Igrp.getInstance();
        String m = msg.toString();
        this.setQueryStringToAttributes(queryString);
        String auxcontrollerPath = this.getConfig().getPackage(app, page);
        igrpApp.setCurrentAppName(app);
        igrpApp.setCurrentPageName(page);
        igrpApp.setCurrentActionName(action);
        Object obj = loadPage(auxcontrollerPath, "action" + StringHelper.camelCaseFirst(action));
        Response resp = (Response) obj;
        if (resp != null) {
            String content = resp.getContent();
            if (m != null)
                content = Core.isNotNull(content) ? content.replace("<messages></messages>", m) : content;
            resp.setContent(content);
        }
        return resp;
    }

    protected Response forward(String app, String page, String action, QueryString<String, Object> queryString) {
        this.setQueryString(queryString);
        Response resp = new Response();
        resp.setType(3);
        resp.setUrl(Route.toUrl(app, page, action, addParamDad(qs)));
        return resp;
    }

    protected Response xSend(FileRest file, String name, String contentType, boolean download) {
        Response response = new Response();
        Igrp.getInstance().getResponse().addHeader("Content-Description", "File Transfer");
        if (download)
            Igrp.getInstance().getResponse().addHeader("Content-Disposition", "attachment; filename=\"" + name + "\"");
        else
            Igrp.getInstance().getResponse().addHeader("Content-Disposition", "inline; filename=\"" + name + "\"");
        response.setType(1);
        response.setFile(file);
        return response;
    }

    public void sendResponse() {
        Response responseWrapper2 = Igrp.getInstance().getCurrentController().getResponseWrapper();
        if (responseWrapper2 != null) {
            try {
                switch (responseWrapper2.getType()) {
                    case 1: // render it
                        try {
                            if (responseWrapper2.getStream() != null && responseWrapper2.getStream().length > 0) {
                                Igrp.getInstance().getResponse().getOutputStream().write(responseWrapper2.getStream());
                                Igrp.getInstance().getResponse().getOutputStream().flush();
                                Igrp.getInstance().getResponse().getOutputStream().close();
                                Igrp.getInstance().getResponse().flushBuffer();
                            } else if (responseWrapper2.getFile() != null) {
                                HttpServletResponse response = Igrp.getInstance().getResponse();
                                String name = responseWrapper2.getFile().getFileName();
                                response.setContentType(responseWrapper2.getFile().getContentType());
                                response.setHeader("Content-Disposition", "attachment; filename=\"" + name + "\";");
                                response.setHeader("Cache-Control", "no-cache");
                                response.setContentLength(responseWrapper2.getFile().getSize());
                                try (ServletOutputStream sos = response.getOutputStream();
                                     BufferedInputStream bis = new BufferedInputStream(
                                             responseWrapper2.getFile().getContent())) {
                                    int data;
                                    while ((data = bis.read()) != -1) {
                                        sos.write(data);
                                    }
                                } catch (IOException e) {
                                    e.printStackTrace();
                                }
                                responseWrapper2.getFile().getContent().close();
                            } else {
                                String content = responseWrapper2.getContent();

                                // --- NEW: server-side XSLT transformation (instead of Chrome xml-stylesheet) ---
                                String transformed = tryTransformXmlWithStylesheetPI(content);
                                if (transformed != null) {
                                    HttpServletResponse resp = Igrp.getInstance().getResponse();
                                    resp.setCharacterEncoding(Response.CHARSET_UTF_8);
                                    resp.setContentType("text/html;charset=" + Response.CHARSET_UTF_8);
                                    resp.getWriter().append(transformed);
                                } else {
                                    if(Core.getParam("ir_cf").equals("xml"))
                                        content="<rows>"+StringUtils.substringAfter(content,"<rows>");
                                    Igrp.getInstance().getResponse().getWriter().append(content);
                                }
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 2: // redirect
                        boolean isAbsolute;
                        try {
                            String url = responseWrapper2.getUrl();
                            try {
                                java.net.URI uri = java.net.URI.create(url);
                                isAbsolute = uri.isAbsolute() && uri.toURL().getProtocol().matches("(?i)(http|https)");
                            } catch (MalformedURLException e) { // Ensure the url format is perfect ...
                                isAbsolute = false;
                            }
                            if (!Igrp.getInstance().getResponse().isCommitted()) {
                                Igrp.getInstance().getResponse().sendRedirect(
                                        isAbsolute ? url : (url.startsWith("webapps") ? url : ("webapps" + url)));
                            }
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 3: // forward
                        String url = responseWrapper2.getUrl().replace("&&", "&");
                        url = url.startsWith("webapps") ? ("app/" + url) : ("app/webapps" + url);
                        try {
                            Igrp.getInstance().getRequest().getRequestDispatcher(url)
                                    .forward(Igrp.getInstance().getRequest(), Igrp.getInstance().getResponse());
                        } catch (ServletException | IOException e) {
                            e.printStackTrace();
                        }
                        break;
                    case 4:
                        try {
                            Igrp.getInstance().getResponse().sendRedirect("pg_studio.jsp");
                            Igrp.getInstance().getResponse().getOutputStream().close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        break;
                    default:
                }
            } catch (NullPointerException e) {
                e.printStackTrace();
            }
        }
    }

    public Config getConfig() {
        return this.configApp.getConfig();
    }
    public static Object loadPage(String controllerPath, String actionName) {
        Igrp igrpApp = Igrp.getInstance();
        try {
            Class<?> classController = Class.forName(controllerPath);
            Object controller;

            // Usar CDI para obter a instância do controller
            Instance<?> instance = CDI.current().select(classController);
            controller = instance.isUnsatisfied() ?
                    classController.getDeclaredConstructor().newInstance() :
                    instance.get();

            igrpApp.setCurrentController((Controller) controller);
            Method action = Arrays.stream(classController.getDeclaredMethods()).filter(p -> p.getName().equals(actionName)).findFirst().orElseThrow(() -> new NoSuchMethodException("Não existe action " + actionName + " na pagina " + igrpApp.getCurrentPageName()));
            if (action.getParameterCount() == 0)
                return action.invoke(controller);
            return action.invoke(controller, formalParameters(action, igrpApp).toArray());
        } catch (Exception e) {
            addParametersToErrorPage(igrpApp);
            LOGGER.error(e.getMessage(), e);
            throw new RuntimeException(e.getMessage(), e);
        }
    }

    private static List<Object> formalParameters(Method action, Igrp igrpApp) throws ClassNotFoundException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchMethodException, SecurityException {
        List<Object> paramValues = new ArrayList<>();
        for (Parameter parameter : action.getParameters()) {
            if (parameter.getType().getSuperclass().getName().equals("nosi.core.webapp.Model")) {
                // Dependency Injection for models
                Class<?> classModel = Class.forName(parameter.getType().getName());
                Model model = (Model) classModel.getDeclaredConstructor().newInstance();
                model.load();
                paramValues.add(model);
            } else // Dependency Injection for simple vars ...
                if (parameter.getType().getName().equals("java.lang.String") && parameter.isAnnotationPresent(RParam.class)) {
                    final var annotationRParamName = parameter.getAnnotation(RParam.class).rParamName();
                    if (parameter.getType().isArray())
                        paramValues.add(igrpApp.getRequest().getParameterValues(annotationRParamName));
                    else
                        paramValues.add(igrpApp.getRequest().getParameter(annotationRParamName));
                } else
                    paramValues.add(null);
        }
        return paramValues;
    }

    private static void addParametersToErrorPage(Igrp igrpApp) {

        final var env = ConfigCommonMainConstants.IGRP_ENV.environmentValue();

        Map<String, Object> errorParam = new HashMap<>();
        errorParam.put("dad", igrpApp.getCurrentAppName());
        errorParam.put(ConfigCommonMainConstants.IGRP_ENV.value(), env);
        igrpApp.getRequest().setAttribute("igrp.error", errorParam);
    }
    protected <T> T getComponent(Class<T> componentType) {
        try {
            return CDI.current().select(componentType).get();
        } catch (jakarta.enterprise.inject.UnsatisfiedResolutionException e) {
            return null;
        }
    }


    /**
     * If the XML contains <?xml-stylesheet href="...">, load that XSL from the webapp
     * and transform XML -> HTML on the server.
     *
     * @return HTML string if transformed; null if no transform was applied.
     */
    private String tryTransformXmlWithStylesheetPI(String xml) {
        if (xml == null || xml.isBlank())
            return null;

        Matcher m = XML_STYLESHEET_HREF.matcher(xml);
        if (!m.find() || Core.getParam("ir_cf").equals("xml"))
            return null;

        String href = m.group(1);
        if (href == null || href.isBlank())
            return null;

        // Strip query string (?v=...)
        String rawPath = href.split("\\?", 2)[0];

        // Only handle absolute webapp paths
        if (!rawPath.startsWith("/"))
            return null;

        ServletContext ctx = Igrp.getInstance().getServlet().getServletContext();

        // Normalize "/IGRP/..." (context path included) into "/..."
        String contextPath = ctx.getContextPath(); // e.g. "/IGRP"
        String xslWebPath = rawPath;
        if (contextPath != null && !contextPath.isBlank() && xslWebPath.startsWith(contextPath + "/")) {
            xslWebPath = xslWebPath.substring(contextPath.length());
        }
        try (InputStream mainXslStream = ctx.getResourceAsStream(xslWebPath)) {
            if (mainXslStream == null)
                return null;

            TransformerFactory tf = TransformerFactory.newInstance();

            WebAppXslUriResolver resolver = new WebAppXslUriResolver(ctx);

            tf.setURIResolver(resolver);

            StreamSource xslSource = new StreamSource(mainXslStream);
            xslSource.setSystemId("webapp:" + xslWebPath);

            Transformer transformer = tf.newTransformer(xslSource);

            // IMPORTANT: document() and other URI loads will consult this
            transformer.setURIResolver(resolver);

            StringWriter out = new StringWriter();
            StreamSource xmlSource = new StreamSource(new StringReader(xml));
            // Setting a System ID for the XML allows relative document() calls within it to resolve via our resolver
            xmlSource.setSystemId("webapp:/dynamic.xml");
            transformer.transform(xmlSource, new StreamResult(out));
            return out.toString();
        } catch (Exception ex) {
            LOGGER.warn("XSLT server-side transform failed for href={}", href, ex);
            return null;
        }
    }
    /**
     * Resolves XSL includes/imports inside the web application (ServletContext).
     * Supports relative hrefs like "../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=19".
     */
    private static final class WebAppXslUriResolver implements URIResolver {
        private final ServletContext ctx;

        private WebAppXslUriResolver(ServletContext ctx) {
            this.ctx = ctx;
        }

        @Override
        public Source resolve(String href, String base) {
            if (href == null || href.isBlank())
                return null;

            // strip query string (?v=...) from both href and base
            String cleanHref = href.split("\\?", 2)[0];
            String cleanBase = base != null ? base.split("\\?", 2)[0] : null;

            // Accept "webapp:/..." (our internal systemId)
            if (cleanHref.startsWith("webapp:")) {
                cleanHref = cleanHref.substring("webapp:".length());
            }

            // Strip context path if present (e.g. "/IGRP/...")
            String contextPath = ctx.getContextPath(); // e.g. "/IGRP"
            if (contextPath != null && !contextPath.isBlank() && !contextPath.equals("/")) {
                String lowerHref = cleanHref.toLowerCase();
                String lowerCtx = contextPath.toLowerCase() + "/";
                if (lowerHref.startsWith(lowerCtx)) {
                    cleanHref = cleanHref.substring(contextPath.length());
                }
            }

            // Optional: let real http(s) URLs be handled by default engine/network (or block them)
            if (cleanHref.matches("(?i)^https?://.*")) {
                return null;
            }

            String resolvedWebPath;
            if (cleanHref.startsWith("/")) {
                resolvedWebPath = normalizeWebPath(cleanHref);
            } else {
                // base looks like "webapp:/images/.../Gestaodeacesso.xsl"
                String basePath = cleanBase;

                if (basePath == null)
                    return null;

                if (basePath.startsWith("webapp:"))
                    basePath = basePath.substring("webapp:".length()); // -> "/images/.../Gestaodeacesso.xsl"

                int lastSlash = basePath.lastIndexOf('/');
                String baseDir = lastSlash >= 0 ? basePath.substring(0, lastSlash + 1) : "/";

                resolvedWebPath = normalizeWebPath(baseDir + cleanHref);
            }

            // --- HANDLE webapps?r=... (Internal IGRP Routes) ---
            if (resolvedWebPath.equals("/webapps") || resolvedWebPath.equals("webapps")) {
                String query = "";
                int qIdx = href.indexOf('?');
                if (qIdx != -1)
                    query = href.substring(qIdx + 1);

                if (!query.isEmpty()) {
                    Map<String, List<String>> params = new HashMap<>();
                    for (String pair : query.split("&")) {
                        String[] kv = pair.split("=", 2);
                        if (kv.length > 0 && !kv[0].isEmpty()) {
                            String k = kv[0];
                            String v = kv.length > 1 ? kv[1] : "";
                            try { v = java.net.URLDecoder.decode(v, StandardCharsets.UTF_8); } catch (Exception ignored) {}
                            params.computeIfAbsent(k, key -> new ArrayList<>()).add(v);
                        }
                    }

                    List<String> rList = params.get("r");
                    if (rList != null && !rList.isEmpty()) {
                        String r = rList.get(0);
                        String resolvedRoute = nosi.core.webapp.security.SecurtyCallPage.resolvePage(r);
                        if (resolvedRoute != null) {
                            String[] parts = resolvedRoute.split("/");
                            if (parts.length >= 3) {
                                String app = parts[0];
                                String page = parts[1];
                                String actionPart = parts[2];

                                QueryString<String, Object> qs = new QueryString<>();
                                params.forEach((k, vList) -> {
                                    if (!"r".equals(k)) {
                                        for (String v : vList) qs.addQueryString(k, v);
                                    }
                                });

                                String action = actionPart;
                                if (actionPart.contains("&")) {
                                    String[] aParts = actionPart.split("&", 2);
                                    action = aParts[0];
                                    for (String p : aParts[1].split("&")) {
                                        String[] kv = p.split("=", 2);
                                        if (kv.length > 0 && !kv[0].isEmpty()) {
                                            String v = kv.length > 1 ? kv[1] : "";
                                            try { v = java.net.URLDecoder.decode(v, StandardCharsets.UTF_8); } catch (Exception ignored) {}
                                            qs.addQueryString(kv[0], v);
                                        }
                                    }
                                }
                                nosi.core.webapp.Response resp = new Controller().call(app, page, action, qs);
                                if (resp != null && resp.getContent() != null) {
                                    return new StreamSource(new StringReader(resp.getContent()));
                                }
                            }
                        }
                    }
                }
            }

            // --- TRY RESOLVE ---
            StreamSource src = openAsStreamSource(resolvedWebPath);
            if (src != null)
                return src;

            // --- FALLBACK 1: Swap IGRP version ---
            String alt = swapIgrpVersion(resolvedWebPath);
            if (alt != null) {
                src = openAsStreamSource(alt);
                if (src != null)
                    return src;
            }

            // --- FALLBACK 2: Try stripping common IGRP prefixes if absolute ---
            if (resolvedWebPath.startsWith("/IGRP/")) {
                src = openAsStreamSource(resolvedWebPath.substring(5));
                if (src != null) return src;
            }
            if (resolvedWebPath.startsWith("/IGRP_v4/")) {
                src = openAsStreamSource(resolvedWebPath.substring(8));
                if (src != null) return src;
            }

            // To avoid "unknown protocol: webapp" crash when a file is missing,
            // return a dummy valid empty XSL stylesheet if we are still using the webapp: protocol.
            // This prevents the XSLT engine from falling back to default Java URL handling
            // and also prevents fatal parse errors during xsl:include.
            if (href.startsWith("webapp:") || (base != null && base.startsWith("webapp:"))) {
                LOGGER.warn("URIResolver could not find resource: {} (href={}, base={})", resolvedWebPath, href, base);
                return new StreamSource(new StringReader(
                    "<xsl:stylesheet version=\"1.0\" xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\"/>"
                ));
            }

            return null;
        }
        private StreamSource openAsStreamSource(String webPath) {
            try {
                InputStream is = ctx.getResourceAsStream(webPath);
                if (is == null)
                    return null;

                StreamSource s = new StreamSource(is);
                s.setSystemId("webapp:" + webPath);
                return s;
            } catch (Exception ignored) {
                return null;
            }
        }

        private static String swapIgrpVersion(String webPath) {
            if (webPath == null)
                return null;
            if (webPath.contains("/IGRP2.3/"))
                return webPath.replace("/IGRP2.3/", "/IGRP2.4/");
            if (webPath.contains("/IGRP2.4/"))
                return webPath.replace("/IGRP2.4/", "/IGRP2.3/");
            return null;
        }
        private static String normalizeWebPath(String path) {
            // Normalize things like "/a/b/../c" and "/a/./b"
            String[] parts = path.split("/");
            java.util.Deque<String> stack = new java.util.ArrayDeque<>();
            for (String p : parts) {
                if (p == null || p.isEmpty() || ".".equals(p))
                    continue;
                if ("..".equals(p)) {
                    if (!stack.isEmpty())
                        stack.removeLast();
                    continue;
                }
                stack.addLast(p);
            }
            StringBuilder sb = new StringBuilder("/");
            java.util.Iterator<String> it = stack.iterator();
            while (it.hasNext()) {
                sb.append(it.next());
                if (it.hasNext())
                    sb.append("/");
            }
            return sb.toString();
        }
    }


}