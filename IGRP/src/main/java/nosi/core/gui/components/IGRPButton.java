package nosi.core.gui.components;

import nosi.core.gui.fields.FieldProperties;
import nosi.core.webapp.Core;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Report;
import nosi.core.webapp.helpers.Route;
import nosi.core.webapp.security.EncrypDecrypt;
import nosi.core.webapp.security.Permission;
import nosi.core.xml.XMLWritter;
import static nosi.core.i18n.Translator.gt;
import java.util.Map.Entry;




public class IGRPButton {

	private String tag = "item";
	private String title = "";
	private String app = "";
	private String page = "";
	private String link = "";
	private String target = "";
	private String img = "";
	private String params = "";
	private String parameter = "";
	private String type = "form";
	private String prefix = "";
	private boolean visible = true;
	private boolean genReverse = false;
	private Report report;
	public FieldProperties propertie;
	
	public IGRPButton(String title, String app, String page, String link, String target, String img, String parameter,
			String params) {
		this.propertie = new FieldProperties();
		this.title = title;
		this.setApp(app);
		this.setPage(page);
		this.setLink(link);
		this.target = target;
		this.img = img;
		this.params = params;
		this.parameter = parameter;
		if(this.target.equalsIgnoreCase(FlashMessage.CONFIRM) || this.target.equalsIgnoreCase("alert_submit")) {
			Core.setMessageConfirm();
		}
	}

	public IGRPButton(String title, String app, String page, String link, String target, String img, String parameter,
			String params, boolean genReverse) {
		this(title, app, page, link, target, img, parameter, params);
		this.genReverse = genReverse;
	}

	public IGRPButton() {
		this.propertie = new FieldProperties();
	}

	public boolean isVisible() {
		return visible;
	}

	public void setVisible(boolean visible) {
		this.visible = visible;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTitle() {
		return gt(title);
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getApp() {
		return app;
	}

	public void setApp(String app) {
		this.app = app;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}
	
	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	
	public String getPrefix() {
		return this.prefix;
	}
	
	public String getLink() {	
		if(this.report!=null) {
			link = this.report.getLink();
			this.report.getParams().entrySet().stream().forEach(p->{
				link += ("&name_array="+p.getKey() + "&value_array="+p.getValue());
			});
			link = link.replaceAll("webapps\\?r=", "");
			return link;
		}
		String target_ = "";
		if (Igrp.getInstance().getRequest().getParameter("target") != null) {
			target_ += "&target=" + Igrp.getInstance().getRequest().getParameter("target");
		}
		target_ += Route.getQueryString(link);//Get Query String
		link = Route.resolveAction(link);
		String result = null;
		int isPublic = Core.getParamInt("isPublic");
		if(isPublic==1) {
			result = app + "/" + page + "/" + (link+target_)+"&isPublic=1";
		}else {
			result = !isGenReverse() ? EncrypDecrypt.encrypt(app + "/" + page + "/" + link)+target_ : EncrypDecrypt.encrypt(link)+target_; 
		}
		return result;
	}

	public boolean isGenReverse() {
		return genReverse;
	}

	public void setGenReverse(boolean genReverse) {
		this.genReverse = genReverse;
	}

	public void setLink(String link) {		
		this.link = link;
	}

	public void setLink(Report report) {
		this.report = report;
	}
	
	public void setLink(String app, String page, String action) {
		this.setApp(app);
		this.setPage(page);
		this.setLink(action);		
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getParams() {
		return params;
	}

	public void setParams(String params) {
		this.params = params;
	}

	public String getParameter() {
		return Core.isNotNull(this.parameter)?this.parameter:"";
	}

	public void setParameter(String parameter) {
		this.parameter = parameter;
	}
	

	public IGRPButton addParameter(String parameter,Object valor) {
		
		if(valor instanceof String[])
			for(String oneVal:(String[])valor) {
				this.parameter += "&"+parameter+"="+oneVal;
			}
		else 
			this.parameter += "&"+parameter+"="+(Core.isNotNull(valor)?valor.toString():"");
		return this;
	}
	
	
	public FieldProperties getProperties() {
		return this.propertie;
	}
	
	public String toString() {
		if(this.isVisible()) {
			//Check the transaction permission
			if(this.getProperties().getProperty("flg_transaction")!=null && this.getProperties().getProperty("flg_transaction").equals("true")){
				if(new Permission().isPermission(this.getApp().toLowerCase()+"_"+this.getPage()+"_"+this.getProperties().getProperty("rel"))){
					return this.genItem();
				}
			}else {
				return this.genItem();
			}		
		}
		return "";
	}

	private String genItem() {
		XMLWritter xml = new XMLWritter();
		xml.startElement(this.getTag());
		if(this.report!=null) {
			this.propertie.remove("type");
			this.propertie.put("type", "report");
		}
		for(Entry<Object, Object> prop : this.getProperties().entrySet()) {
			xml.writeAttribute(prop.getKey().toString(), prop.getValue().toString());
		}
		xml.setElement("title",this.getTitle());
		xml.setElement("app",this.getApp());
		xml.setElement("page",this.getPage());
		xml.setElement("link",this.getPrefix()+this.getLink()+this.getParameter()+"&dad="+Core.getCurrentDad());
		xml.setElement("target",this.getTarget());
		xml.setElement("img", this.getImg());
		if(Core.isNotNull(this.getParams())){
			xml.setElement("params", this.getParams());
		}
		if(Core.isNotNull(this.getParams())){
			xml.setElement("parameter", this.getParameter());
		}
		xml.endElement();
		return xml.toString();
	}
	
	public void setMessage(String msg) {
		if(this.getTarget().equalsIgnoreCase(FlashMessage.CONFIRM) || this.target.equalsIgnoreCase("alert_submit")) {
			FlashMessage flashMessage = Igrp.getInstance().getFlashMessage();
			flashMessage.removeMsg(FlashMessage.CONFIRM);
			Core.setMessageConfirm(msg);
		}
	}
}
