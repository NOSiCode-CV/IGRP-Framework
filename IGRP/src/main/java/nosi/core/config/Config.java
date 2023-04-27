package nosi.core.config;

import nosi.core.gui.components.IGRPButton;
import nosi.core.gui.components.IGRPToolsBar;
import nosi.core.gui.page.Page;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.bpmn.RuntimeTask;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.Route;
import nosi.core.webapp.import_export_v2.common.Path;
import nosi.core.xml.XMLWritter;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.User;

import jakarta.servlet.ServletContext;
import java.io.File;
import java.util.*;

public class Config {

    //public final String PATTERN_CONTROLLER_NAME = "(([a-zA-Z]|_)+([0-9]*({1}|-{1})?([a-zA-Z]+|[0-9]+|_))*)+";
    private static final String SEPARATOR_FOR_HTTP = "/";
    private static final String SEPARATOR_FOR_FILESYSTEM = File.separator;
    public static final String BASE_PATH_CONFIGURATION = "config";
    public static final String VERSION = "2.0.0.230427";

    public String getLinkXSLLogin() {
        String linkXslLogin = "images/IGRP/IGRP2.3/xsl/IGRP-login.xsl";
        //For Design System Login
        if("ds-beta".equals(ConfigApp.getInstance().getMainSettings().getProperty(ConfigCommonMainConstants.IGRP_LOGIN_TEMPLATE.value())))
        		linkXslLogin = "images/IGRP/IGRP2.3/xsl/IGRP-login-ds.xsl";
        return this.getLinkImgBase().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslLogin;
    }

    public String getLinkXSLGenerator() {
        String linkXslGenerator = "images/IGRP/IGRP2.3/app/igrp/generator/Generator.xsl";
        return this.getLinkImgBase().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslGenerator;
    }

    public String getLinkXSLHomeStudio() {
        String linkXslHomeStudio = "images/IGRP/IGRP2.3/xsl/IGRP-Studio-home.xsl";
        return this.getLinkImgBase().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslHomeStudio;
    }

    public String getLinkXSLHomeApp() {
        String linkXslHomeApp = "images/IGRP/IGRP2.3/xsl/IGRP-homeApp.xsl";
        return this.getLinkImgBase().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslHomeApp;
    }

    public String getLinkXSLHome() {
        String linkXslHome = "images/IGRP/IGRP2.3/xsl/IGRP-home.xsl";
        return this.getLinkImgBase().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslHome;
    }

    public String getLinkXSLMapProcess() {
        String linkXslMapProcess = "images/IGRP/IGRP2.3/xsl/IGRP-process.xsl";
        return this.getLinkImgBase().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslMapProcess;
    }

    public String getLinkXSLGeneratorMCV() {
        //For page sql imported
        String linkXslGeneratorMcv = "images/IGRP/IGRP2.3/core/formgen/util/java/XSL_GENERATOR.xsl";
        return this.getBasePathServerXsl().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslGeneratorMcv;
    }

    public String getLinkXSLGeneratorMCVForm() {
        String linkXslGeneratorMcvForm = "images/IGRP/IGRP2.3/core/formgen/util/java/crud/XSL_CRUD_FORM_GENERATOR.xsl";
        return this.getBasePathServerXsl().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslGeneratorMcvForm;
    }

    public String getLinkXSLGeneratorMCVList() {
        String linkXslGeneratorMcvList = "images/IGRP/IGRP2.3/core/formgen/util/java/crud/XSL_CRUD_LIST_GENERATOR.xsl";
        return this.getBasePathServerXsl().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslGeneratorMcvList;
    }

    public String getLinkXSLGenerator_CRUD() {
        //Generator XSL for CRUD pages
        String linkXslGeneratorCrud = "images/IGRP/IGRP2.3/core/formgen/util/GEN.CRUD.xsl";
        return this.getBasePathServerXsl().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslGeneratorCrud;
    }

    public String getLinkXSLJsonGenerator() {
        //Generator JSON for CRUD pages
        String linkXslJsonGenerator = "images/IGRP/IGRP2.3/core/formgen/util/GEN.JSON.xsl";
        return this.getBasePathServerXsl().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslJsonGenerator;
    }

    public String getLinkXSLJsonConvert() {
        //Convert Page in format XML 2.1 to JSON
        String linkXslJsonConvert = "images/IGRP/IGRP2.3/core/formgen/util/jsonConverter.xsl";
        return this.getBasePathServerXsl().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslJsonConvert;
    }

    public String getLinkXSLBpmnControllerGenerator() {
        String linkXslGeneratorControllerBpmn = "images/IGRP/IGRP2.3/core/formgen/util/java/bpmn/XSL_CONTROLLER.xsl";
        return this.getBasePathServerXsl().replace("\\\\", SEPARATOR_FOR_HTTP) + linkXslGeneratorControllerBpmn;
    }

    public String getUserName() {
        final User u = (User) Igrp.getInstance().getUser().getIdentity();
        return (u != null) ? u.getName() : "DUA-hexagon";
    }

    public Properties getConfig() {
        final Properties configs = new Properties();
        for (nosi.webapps.igrp.dao.Config c : new nosi.webapps.igrp.dao.Config().findAll()) {
            configs.put(c.getName(), c.getValue());
        }
        return configs;
    }

    public String getPathLib() {
        return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/lib/");
    }

    public String getPathExport() {
        return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/export/");
    }

    public String getBasePathClass() {
        return Igrp.getInstance().getServlet().getServletContext().getRealPath("/WEB-INF/classes/");
    }

    //caminho onde guarda a classe DAO
    public String getPathDAO(String dad) {
        return Path.getRootPath() + dad + SEPARATOR_FOR_FILESYSTEM + "dao" + SEPARATOR_FOR_FILESYSTEM;
    }

    //caminho onde guarda ficheiro de conexao
    public String getPathConexao() {
        final Config config = new Config();
        if (Core.isNotNull(config.getWorkspace()) && FileHelper.dirExists(config.getWorkspace()))
            return config.getPathWorkspaceResources() + SEPARATOR_FOR_FILESYSTEM;
        else
            return config.getBasePathClass() + SEPARATOR_FOR_FILESYSTEM;

    }


    public String getPathOfImagesFolder() {

        String deployWarName = "";
        try {
            deployWarName = new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName().trim();
        } catch (Exception ignored) {
            // Do nothing on purpose
        }
        return Igrp.getInstance().getServlet().getServletContext().getRealPath("/images").
                replace(deployWarName, this.getLinkImgBase());
    }

    public String getPathOfXslByPage(Action page) {
        return "images" + SEPARATOR_FOR_FILESYSTEM + "IGRP" + SEPARATOR_FOR_FILESYSTEM + "IGRP" + page.getVersion() + SEPARATOR_FOR_FILESYSTEM + "app" + SEPARATOR_FOR_FILESYSTEM + page.getApplication().getDad().toLowerCase() + SEPARATOR_FOR_FILESYSTEM + page.getPage().toLowerCase();
    }

    public String getWorkspace() {
        return ConfigApp.getInstance().getWorkspace();
    }

    public String getEnvironment() {
        return ConfigApp.getInstance().getEnvironment();
    }

    public String getAutenticationType() {
        return ConfigApp.getInstance().getAutenticationType();
    }

    public String getLinkImgBase() {
        final Properties properties = ConfigApp.getInstance().getMainSettings();
        final StringBuilder path = new StringBuilder();
        if (Boolean.parseBoolean(properties.getProperty(ConfigCommonMainConstants.IGRP_MODE_STANDALONE_ENABLED.value(), "false")))
            path.append(properties.getProperty(ConfigCommonMainConstants.IGRP_EMBEDDED_SERVER_SERVLET_CONTEXT_PATH.value(), "/IGRP"));
        else {
            path.append("/");
            path.append(new File(Igrp.getInstance().getServlet().getServletContext().getRealPath("/")).getName());
        }
        path.append("/");
        return path.toString();
    }

    public String getLinkImg() {
        String link = getLinkImgBase() + (getConfig().get("link_img") != null ? getConfig().get("link_img").toString() + getPageVersion() : "images/IGRP/IGRP" + getPageVersion());
        return link.replace("\\\\", SEPARATOR_FOR_HTTP);
    }

    public String getVersion() {
        final Object version = getConfig().get("version");
        return version != null ? version.toString() : "1.0";

    }

    public String getFooterName() {
        final Object footerName = getConfig().get("footer_name");
        return footerName != null ? footerName.toString() : "2020 - Copyright NOSi v." + VERSION;
    }

    public String getWelcomeNote() {
        final Object welcomeNote = getConfig().get("welcome_note");
        return welcomeNote != null ? welcomeNote.toString() : "Ola";
    }

    public String getPageVersion() {
        String app = Igrp.getInstance().getCurrentAppName();
        String page = Igrp.getInstance().getCurrentPageName();
        String action = Igrp.getInstance().getCurrentActionName();

        if (app != null && page != null && action != null && !app.equals("") && !page.equals("") && !action.equals("")) {
            Action ac = new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", Page.resolvePageName(page)).one();
            return ac != null ? ac.getVersion() : "2.3";
        }
        return "2.3";
    }

    public String getResolveUrl(String app, String page, String action) {
        return Route.getResolveUrl(app, page, action);
    }

    public String getHostName() {
        return Igrp.getInstance().getRequest().getRequestURL().toString();
    }

    public String getRootPaht() {
        return Igrp.getInstance().getBasePath() + SEPARATOR_FOR_HTTP;
    }

    public Map<String, String> getVersions() {
        final Map<String, String> versions = new HashMap<>();
        versions.put("2.3", "2.3");
        return versions;
    }

    public String getLinkPageXsl(Action ac) {
        if (!ac.getApplication().getDad().equalsIgnoreCase("igrp") && !ac.getApplication().getDad().equalsIgnoreCase("igrp_studio") && !ac.getApplication().getDad().equalsIgnoreCase("tutorial"))
            return this.getRootPaht() + "images/IGRP/IGRP" + this.getPageVersion() + "/app/" + ac.getXsl_src();
        return this.getLinkImgBase() + "images/IGRP/IGRP" + this.getPageVersion() + "/app/" + ac.getXsl_src();
    }

    public String getResolvePathPage(String app, String page, String version) {
        return this.getLinkImgBase() + "images" + SEPARATOR_FOR_HTTP + "IGRP" + SEPARATOR_FOR_HTTP + "IGRP" + version + SEPARATOR_FOR_HTTP + "app" + SEPARATOR_FOR_HTTP + app.toLowerCase() + SEPARATOR_FOR_HTTP + page.toLowerCase();
    }

    public String getCurrentResolvePathPage(String app, String page, String version) {
        return this.getRootPaht() + "images" + SEPARATOR_FOR_HTTP + "IGRP" + SEPARATOR_FOR_HTTP + "IGRP" + version + SEPARATOR_FOR_HTTP + "app" + SEPARATOR_FOR_HTTP + app.toLowerCase() + SEPARATOR_FOR_HTTP + page.toLowerCase();
    }

    public String getResolvePathXsl(Action page) {
        return getResolvePathPage(page.getApplication().getDad(), page.getPage(), page.getVersion());
    }


    public String getDefaultPageController(String app, String title) {
        return "package nosi.webapps." + app.toLowerCase() + ".pages.defaultpage;\n\n"
                + "import nosi.webapps.igrp.pages.home.HomeAppView;\n"
                + "import nosi.webapps.igrp.dao.Application;\n"
                + "import java.io.IOException;\n"
                + "import nosi.core.webapp.Response;\n"
                + "import nosi.core.webapp.Controller;\n\n"
                + "public class DefaultPageController extends Controller {	\n"
                + "\tpublic Response actionIndex() throws IOException{\n"
                + "\tApplication app = new Application().find().andWhere(\"dad\",\"=\",\"" + app + "\").one();\n"
                + "\t		if(app!=null && app.getAction()!=null) {\n"
                + "\t			return this.redirect(app.getDad().toLowerCase(),app.getAction().getPage(), \"index\");\n"
                + "\t		}\n"
                + "\tHomeAppView view = new HomeAppView();\n"
                + "\tview.title = \"" + title + "\";\n"
                + "\treturn this.renderView(view,true);\n"
                + "\t}\n"
                + "}";
    }

    public String getBasePackage(String app) {
        if (app != null && !app.equals(""))
            return "nosi.webapps." + app.toLowerCase();
        return "nosi.webapps.igrp.pages";
    }

    public String getRawBasePathClassWorkspace() {
        String workSpace = this.getWorkspace();
        if (Core.isNotNull(workSpace))
            return workSpace + SEPARATOR_FOR_FILESYSTEM + "src" + SEPARATOR_FOR_FILESYSTEM + "main" + SEPARATOR_FOR_FILESYSTEM + "java" + SEPARATOR_FOR_FILESYSTEM;
        return null;
    }

    public String getPathWorkspaceResources() {
        String workSpace = this.getWorkspace();
        if (Core.isNotNull(workSpace))
            return workSpace + SEPARATOR_FOR_FILESYSTEM + "src" + SEPARATOR_FOR_FILESYSTEM + "main" + SEPARATOR_FOR_FILESYSTEM + "resources";
        return null;
    }

    public String getBasePahtClassWorkspace(String app) {
        String workSpace = this.getRawBasePathClassWorkspace();
        if (Core.isNotNull(workSpace))
            return workSpace + this.getBasePackage(app).replace(".", SEPARATOR_FOR_FILESYSTEM);
        return null;
    }

    public String getBasePahtClassWorkspace(String app, String page) {
        String workSpace = this.getRawBasePathClassWorkspace();
        if (Core.isNotNull(workSpace))
            return workSpace + this.getBasePackage(app, page).replace(".", SEPARATOR_FOR_FILESYSTEM);
        return null;
    }

    private String getBasePackage(String app, String page) {
        return "nosi.webapps." + app.toLowerCase() + ".pages." + page.toLowerCase();
    }

    public String getPathServerClass(String app) {
        return this.getBasePathClass() + "nosi" + SEPARATOR_FOR_FILESYSTEM + "webapps" + SEPARATOR_FOR_FILESYSTEM + app.toLowerCase() + SEPARATOR_FOR_FILESYSTEM;
    }

    public String getBasePathServerXsl() {

        String appLinkImage = null;

        if (ConfigApp.getInstance().isInstall())
            appLinkImage = this.getLinkImgBase();

        if (appLinkImage != null) {
            appLinkImage = appLinkImage + SEPARATOR_FOR_HTTP;

            final StringBuilder roots = new StringBuilder();

            String[] paths = Igrp.getInstance().getServlet().getServletContext().getRealPath("/").split(SEPARATOR_FOR_FILESYSTEM + SEPARATOR_FOR_FILESYSTEM);
            if (paths.length <= 1) {
                paths = Igrp.getInstance().getServlet().getServletContext().getRealPath("/").split(SEPARATOR_FOR_FILESYSTEM);
            }
            for (int i = 0; i < paths.length - 1; i++) {
                roots.append(paths[i]).append(SEPARATOR_FOR_HTTP);
            }
            roots.append(appLinkImage);

            return roots.toString();
        }
        return Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
    }

    public String basePathServer() {
        return Igrp.getInstance().getServlet().getServletContext().getRealPath("/");
    }

    public String getImageAppPath(Action page) {
        return "images" + SEPARATOR_FOR_HTTP + "IGRP" + SEPARATOR_FOR_HTTP + "IGRP" + page.getVersion() + SEPARATOR_FOR_HTTP + "app" + SEPARATOR_FOR_HTTP + page.getApplication().getDad().toLowerCase() + SEPARATOR_FOR_HTTP + page.getPage().toLowerCase();
    }

    public String getBaseServerPahtXsl(Action page) {
        return this.getBasePathServerXsl() + this.getImageAppPath(page);
    }

    public String getCurrentBaseServerPahtXsl(Action page) {
        ServletContext sc = Igrp.getInstance().getServlet().getServletContext();
        String path = sc.getRealPath("/") + this.getImageAppPath(page);
        if (page.getApplication().getExterno() == 2) {
            String deployedName = new File(sc.getRealPath("/")).getName();
            path = path.replace(deployedName + File.separator + "images", page.getApplication().getUrl() + File.separator + "images");
        }
        return path;
    }

    public String getImageAppPath(Application app, String version) {
        return "images" + SEPARATOR_FOR_HTTP + "IGRP" + SEPARATOR_FOR_HTTP + "IGRP" + version + SEPARATOR_FOR_HTTP + "app" + SEPARATOR_FOR_HTTP + app.getDad().toLowerCase();
    }

    public String getBaseServerPahtXsl(Application app, String version) {
        return this.getBasePathServerXsl() + this.getImageAppPath(app, version);
    }

    public String getBaseHttpServerPahtXsl(Action page) {
        String APP_LINK_IMAGE = this.getLinkImgBase();
        if (APP_LINK_IMAGE != null && page != null) {
            APP_LINK_IMAGE = SEPARATOR_FOR_HTTP + APP_LINK_IMAGE + SEPARATOR_FOR_HTTP;
            return APP_LINK_IMAGE + "images" + SEPARATOR_FOR_HTTP + "IGRP" + SEPARATOR_FOR_HTTP + "IGRP" + page.getVersion() + SEPARATOR_FOR_HTTP + "app" + SEPARATOR_FOR_HTTP + page.getApplication().getDad().toLowerCase() + SEPARATOR_FOR_HTTP + page.getPage().toLowerCase();
        }
        return getBaseServerPahtXsl(page);
    }

    public String getBasePahtXslWorkspace(Action page) {
        String workSpace = this.getWorkspace();
        if (Core.isNotNull(workSpace))
            return workSpace + SEPARATOR_FOR_FILESYSTEM + this.getWebapp() + SEPARATOR_FOR_FILESYSTEM + this.getImageAppPath(page);
        return null;
    }

    public String getBasePahtXslWorkspace(Application app) {
        String workSpace = this.getWorkspace();
        if (Core.isNotNull(workSpace))
            return workSpace + SEPARATOR_FOR_FILESYSTEM + this.getWebapp() + SEPARATOR_FOR_FILESYSTEM + this.getImageAppPath(app, "2.3");
        return null;
    }

    public String getWebapp() {
        return "src" + SEPARATOR_FOR_FILESYSTEM + "main" + SEPARATOR_FOR_FILESYSTEM + "webapp";
    }

    /**
     * getResourcesConfigDB
     *
     * @return {@code "src"+SEPARATOR_FOR_FILESYS+"main"+SEPARATOR_FOR_FILESYS+"resources"+SEPARATOR_FOR_FILESYS+"config"+SEPARATOR_FOR_FILESYS+"db"+SEPARATOR_FOR_FILESYS; }
     */
    public String getResourcesConfigDB() {
        return "src" + SEPARATOR_FOR_FILESYSTEM + "main" + SEPARATOR_FOR_FILESYSTEM + "resources" + SEPARATOR_FOR_FILESYSTEM + BASE_PATH_CONFIGURATION + SEPARATOR_FOR_FILESYSTEM + "db" + SEPARATOR_FOR_FILESYSTEM;
    }

    public String getPackage(String app, String page, String action) {
        String basePackage = "nosi.webapps." + app.toLowerCase() + ".pages." + page.toLowerCase() + "." + page + "Controller";

        if (Core.isNotNull(app) && Core.isNotNull(page)) {

            RuntimeTask runtimeTask = RuntimeTask.getRuntimeTask();

            Action ac = new Action();
            if (Core.isNotNull(runtimeTask)) {
                List<Action> actions = new Action().find()
                        .andWhere("application.dad", "=", runtimeTask.getTask().getTenantId())
                        .andWhere("page", "=", Page.resolvePageName(page))
                        .all();
                if (actions != null && !actions.isEmpty()) {
                    Optional<Action> opt = actions.stream().filter(p -> p.getProcessKey() != null && p.getProcessKey().equalsIgnoreCase(runtimeTask.getTask().getProcessDefinitionKey()))
                            .findFirst();
                    if (opt.isPresent())
                        ac = opt.get();
                }
            } else {
                ac = ac.find()
                        .andWhere("application.dad", "=", app.toLowerCase())
                        .andWhere("page", "=", Page.resolvePageName(page))
                        .one();
            }
            if (ac != null && ac.getPackage_name() != null) {
                String p = ac.getPackage_name().toLowerCase();
                if (p.endsWith("pages"))
                    basePackage = ac.getPackage_name().toLowerCase() + "." + ac.getPage().toLowerCase() + "." + ac.getPage() + "Controller";
                else
                    basePackage = ac.getPackage_name().toLowerCase() + "." + ac.getPage() + "Controller";
            }
        }
        return basePackage;
    }

    public String getPackageProcess(String app, String processId, String taskName) {
        return "nosi.webapps." + app.toLowerCase() + ".process." + processId.toLowerCase() + "." + taskName + "Controller";
    }

    public String getHeader(IHeaderConfig config) {
        return getHeader(config, null);
    }

    public String getHeader(IHeaderConfig config, Action page) {
        Application app = Core.getCurrentApp();
        IHeaderConfig headerConfig = config;
        if (headerConfig == null) {
            //Use default config
            headerConfig = new IHeaderConfig() {
            };
        }
        final String target = Core.getParam("target");

        String title = app.getName();
        String description = app.getDescription();
        String linkHome = headerConfig.getLinkHome();
        XMLWritter xml = new XMLWritter();
        xml.setElement("ispublic", page != null ?page.getTipo():0); // 0 = Privado (Authentication); 1 = Publico; 2 = Publico e Link Encryptado 
        
        xml.setElement("template", app.getTemplate());
        xml.setElement("title", Core.getSwitchNotNullValue(title, headerConfig.getTitle()));
        xml.setElement("description", Core.getSwitchNotNullValue(description, ""));

        xml.setElement("version", VERSION);
        xml.setElement("link", linkHome);
        xml.setElement("link_img", getLinkImg());
        if (Core.isNotNull(target)) {
            xml.setElement("target", target);
        }
        xml.startElement("site");
        xml.setElement("welcome_note", getWelcomeNote());
        xml.setElement("footer_note", getFooterName());
        xml.setElement("user_name", getUserName());
        IGRPToolsBar button = new IGRPToolsBar("button");
        IGRPButton bt = new IGRPButton("Sair", "igrp", "login", "logout", "_self", "exit.png", "", "");
        bt.setPrefix("webapps?r=");
        button.addButton(bt);
        xml.addXml(button.toXmlButton());
        xml.endElement();
        xml.setElement("app", page != null ? page.getApplication().getDad() : app.getDad());
        xml.setElement("page", page != null ? page.getPage() : "Form");
        xml.startElement("plsql");
        xml.setElement("action", "1");
        String packageName = page != null ? page.getPackage_name() : "";
        int x = page != null ? page.getPackage_name().indexOf("." + page.getPage().toLowerCase()) : -1;
        if (x != -1 && page != null) {
            packageName = page.getPackage_name().substring(0, page.getPackage_name().indexOf("." + page.getPage().toLowerCase()));
        }
        xml.setElement("package_db", packageName);
        xml.setElement("package_html", page != null ? Page.resolvePageName(page.getPage()) : null);
        xml.setElement("package_instance", headerConfig.getPackageInstance());
        xml.setElement("with_replace", "false");
        xml.setElement("with_label", "false");
        xml.setElement("with_biztalk", "false");
        xml.setElement("dynamic_menu", "false");
        xml.setElement("copy_menu", "false");
        xml.setElement("package_copy_db", headerConfig.getPackageCopyDb());
        xml.setElement("package_copy_html", headerConfig.getPackageCopyHtml());
        xml.endElement();
        xml.startElement("navigation");
        xml.writeAttribute("url", "webapps?");
        xml.writeAttribute("prm_app", "prm_app");
        xml.writeAttribute("prm_page", "prm_page");
        xml.writeAttribute("prm_action", "r");
        xml.endElement();
        xml.startElement("slide-menu");
        xml.writeAttribute("file", headerConfig.getLinkSileMenu());
        xml.endElement();
        xml.startElement("top_menu");
        xml.writeAttribute("file", headerConfig.getLinkTopMenu());
        xml.endElement();
        if (headerConfig.getTypeHeader().equals("home")) {
            xml.startElement("applications");
            xml.writeAttribute("file", headerConfig.getLinkMyApps());
            xml.endElement();
        }
        return xml.toString();
    }

}
