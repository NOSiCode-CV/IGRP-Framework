package nosi.core.igrp.mingrations;

import java.util.List;
import java.util.stream.Collectors;
import nosi.base.ActiveRecord.HibernateUtils;
import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.Connection;
import nosi.webapps.igrp.dao.*;
import nosi.webapps.igrp.dao.views.CreateViews;
import nosi.webapps.igrp.pages.migrate.Migrate;

/**
 * @author: Emanuel Pereira
 * 2 Aug 2017
 */
public final class MigrationIGRP {

	private List<Application> applications;
	private List<Action> actions;
	private List<CLob> clobs;
	private List<Config_env> config_envs;
	private List<Config> configs;
	private List<Menu> menus;
	private List<Organization> organizations;
	private List<Profile> profiles;
	private List<ProfileType> profile_types;
	private List<RepInstance> rep_instances;
	private List<RepSource> rep_sources;
	private List<RepTemplate> rep_templates;
	private List<RepTemplateParam> rep_template_parmas;
	private List<RepTemplateSource> rep_template_sources;
	private List<Session> sessions;
	private List<Transaction> transactions;
	private List<User> users;
	private List<Domain> domains;
	private List<Modulo> modulos;
	private List<Share> shares;
	private List<TaskAccess> taskAccess;
	private List<TaskComponent> taskComponents;
	private List<TipoDocumento> tipoDocumentos;
	private List<TipoDocumentoEtapa> tipoDocumentoEtapas;
	
	// For OAuth 2.0
	private List<OAuthClient> authClients;
	private List<OAuthAccessToken> accessTokens;
	private List<OAuthorizationCode> authorizationCodes;
	private List<OAuthRefreshToken> refreshTokens;
	private List<OAuthScope> authScopes;
	private List<UserRole> userRoles;	
	private String connetionName;
	
	public void start(Migrate model){
		if(model!=null){
			ConfigDBIGRP config = ConfigDBIGRP.getInstance();
			config.setType_db(model.getTipo_base_dados());
			config.setUsername(model.getUsername());
			config.setPassword(model.getPassword());
			config.setUrlConnection(model.getUrl_connection());
			config.setDriverConnection(model.getDriver_connection());
			this.getData();
			if(config.save()) {
				HibernateUtils.removeSessionFactory(model.getNome_de_conexao());
				HibernateUtils.getSessionFactory(model.getNome_de_conexao(),null);
			}
			else {
				Core.setMessageError("Não foi possivel efetuar migração do IGRP");
				return;
			}
		}
		this.connetionName = model.getNome_de_conexao();
		this.saveData();
		new CreateViews();
	}
	
	public boolean validate(Migrate model){
		if(model!=null){
			return new Connection().validate(model.getUrl_connection(),model.getDriver_connection(),model.getUsername(),model.getPassword());
		}
		return false;
	}

	private void getData() {
		applications = new Application().findAll();
		actions = new Action().findAll();
		clobs = new CLob().findAll();
		configs = new Config().findAll();
		config_envs = new Config_env().findAll();
		menus = new Menu().findAll();
		organizations = new Organization().findAll();
		profiles = new Profile().findAll();
		profile_types = new ProfileType().findAll();
		rep_instances = new RepInstance().findAll();
		rep_sources = new RepSource().findAll();
		rep_templates = new RepTemplate().findAll();
		rep_template_parmas = new RepTemplateParam().findAll();
		rep_template_sources = new RepTemplateSource().findAll();
		sessions = new Session().findAll();
		transactions = new Transaction().findAll();
		users = new User().findAll();
		domains = new Domain().findAll();
		modulos = new Modulo().findAll();
		shares = new Share().findAll();
		taskAccess = new TaskAccess().findAll();
		taskComponents = new TaskComponent().findAll();
		tipoDocumentos = new TipoDocumento().findAll();
		tipoDocumentoEtapas = new TipoDocumentoEtapa().findAll();
		
		// For OAuth 2.0
		authScopes = new OAuthScope().findAll();
		authClients = new OAuthClient().findAll();
		authorizationCodes = new OAuthorizationCode().findAll();
		accessTokens = new OAuthAccessToken().findAll();
		refreshTokens = new OAuthRefreshToken().findAll();
		userRoles = new UserRole().findAll();
	}

	private void saveData() {
		if(configs.size() > 0){
			configs.stream().forEach(c->{
				c.setId(null);
				c.insert();
			});
		}
		
		if(applications.size() > 0){
			applications.stream().forEach(app->{
				Core.insert(this.connetionName,"tbl_env")
					.addInt("id", app.getId())
					.addString("dad", app.getDad())
					.addString("description", app.getDescription())
					.addInt("external", app.getExternal())
					.addString("img_src", app.getImg_src())
					.addString("name", app.getName())
					.addString("template", app.getTemplate())
					.addInt("status", app.getStatus())
					.addString("url", app.getUrl())
					.execute();
				try {
					new Application().insertOnly();//Using to increment value for last id
				}catch(Exception e) {
					
				}
			});
		}
		
		if(modulos.size() > 0 ) {
			modulos.stream().forEach(m->{
				Core.insert(this.connetionName,"tbl_modulo")
					.addInt("id", m.getId())
					.addString("name", m.getName())
					.addInt("env_fk", m.getApplication().getId())
					.execute();
				new Modulo().insert();//Using to increment value for last id
			});
		}
		if(domains.size() > 0 ) {
			domains.stream().forEach(d->{
				Core.insert(this.connetionName,"tbl_domain")
					.addInt("id", d.getId())
					.addString("description", d.getDescription())
					.addString("dominio",d.getDominio())
					.addInt("ordem", d.getordem())
					.addString("status", d.getStatus())
					.addString("valor", d.getValor())
					.execute();
				new Domain().insert();//Using to increment value for last id
			});
		}
		
		if(actions.size() > 0){
			actions.stream().forEach(a->{
				Core.insert(this.connetionName,"tbl_action")
					.addInt("id", a.getId())
					.addString("action", a.getAction())
					.addString("action_descr",a.getAction_descr())
					.addShort("isComponent", a.getIsComponent())
					.addString("package_name", a.getPackage_name())
					.addString("page", a.getPage())
					.addString("page_descr", a.getPage_descr())
					.addString("processKey", a.getProcessKey())
					.addInt("status", a.getStatus())
					.addString("version", a.getVersion())
					.addString("xmlContent", a.getXmlContent())
					.addString("xslContent",a.getXslContent())
					.addString("xsl_src", a.getXsl_src())
					.addInt("env_fk", a.getApplication().getId())
					.addString("nomeModulo", a.getNomeModulo())
					.execute();
				new Action().insert();//Using to increment value for last id 
			});
			applications = applications.stream().filter(a->a.getAction()!=null).collect(Collectors.toList());
			applications.stream().forEach(app->{
				Core.update(this.connetionName,"tbl_env")
					.addInt("action_fk", app.getAction().getId())
					.where("id=:id")
					.addInt("id", app.getId())
					.execute();				
			});
		}
		
		if(shares.size() > 0 ) {
			shares.stream().forEach(s->{
				Core.insert(this.connetionName,"glb_t_acl")
					.addInt("id",s.getId())
					.addInt("status", s.getStatus())
					.addString("type", s.getType())
					.addInt("type_fk", s.getType_fk())
					.addInt("env_fk", s.getEnv().getId())
					.addInt("env_owner_fk", s.getOwner().getId())
					.execute();
				new Share().insert();//Using to increment value for last id
			});
		}
		
		
		if(clobs.size() > 0){
			clobs.stream().forEach(cl->{
				Core.insert(this.connetionName,"tbl_clob")
					.addInt("id", cl.getId())
					.addByte("c_lob_content", cl.getC_lob_content())
					.addDate("dt_created", cl.getDt_created())
					.addString("mime_type", cl.getMime_type())
					.addString("name", cl.getName())
					.execute();
				new CLob().insert();//Using to increment value for last id
			});
		}
		
		if(config_envs.size() > 0){
			config_envs.stream().forEach(c->{
				Core.insert(this.connetionName,"tbl_config_env")
					.addInt("id", c.getId())
					.addString("charset", c.getCharset())
					.addString("driver_connection", c.getDriver_connection())
					.addString("host", c.getHost())
					.addString("name", c.getName())
					.addString("name_db", c.getName_db())
					.addString("password", c.getPassword())
					.addString("port", c.getPort())
					.addString("type_db", c.getType_db())
					.addString("url_connection", c.getUrl_connection())
					.addString("username", c.getUsername())
					.addInt("env_fk", c.getApplication().getId())
					.execute();
				new Config_env().insert();//Using to increment value for last id
			});
		}
		if(users.size() > 0){
			users.stream().forEach(u->{
				Core.insert(this.connetionName,"tbl_user")
					.addInt("id", u.getId())
					.addString("activation_key", u.getActivation_key())
					.addString("auth_key", u.getAuth_key())
					.addLong("created_at", u.getCreated_at())
					.addString("email", u.getEmail())
					.addString("mobile", u.getMobile())
					.addString("name", u.getName())
					.addString("pass_hash", u.getPass_hash())
					.addString("password_reset_token", u.getPassword_reset_token())
					.addString("phone", u.getPhone())
					.addString("photo_id", u.getPhoto_id())
					.addString("remarks", u.getRemarks())
					.addString("signature_id", u.getSignature_id())
					.addInt("status", u.getStatus())
					.addLong("updated_at", u.getUpdated_at())
					.addString("userprofile", u.getUserProfile())
					.addString("user_name", u.getUser_name())
					.addString("valid_until", u.getValid_until())
					.execute();
				new User().insert();//Using to increment value for last id
			});
		}
		if(organizations.size() > 0){
			organizations.stream().forEach(o->{
				Core.insert(this.connetionName,"tbl_organization")
					.addInt("id", o.getId())
					.addString("code", o.getCode())
					.addString("name", o.getName())
					.addInt("status", o.getStatus())
					.addInt("env_fk", o.getApplication().getId())
					.addInt("self_fk", o.getOrganization()!=null?o.getOrganization().getId():null)
					.addInt("user_created_fk", o.getUser().getId())
					.execute();
				new Organization().insert();//Using to increment value for last id
			});
		}
		if(profile_types.size() > 0){
			profile_types.stream().forEach(p->{
				Core.insert(this.connetionName,"tbl_profile_type")
					.addInt("id", p.getId())
					.addString("code", p.getCode())
					.addString("descr", p.getDescr())
					.addInt("status", p.getStatus())
					.addInt("env_fk", p.getApplication().getId())
					.addInt("self_fk", p.getProfiletype()!=null?p.getProfiletype().getId():null)
					.addInt("org_fk", p.getOrganization()!=null?p.getOrganization().getId():null)
					.execute();
				new ProfileType().insert();//Using to increment value for last id
			});
		}		

		if(menus.size() > 0){
			menus.stream().forEach(m->{
				Core.insert(this.connetionName,"tbl_menu")
					.addInt("id", m.getId())
					.addString("descr", m.getDescr())
					.addString("target", m.getTarget())
					.addInt("flg_base", m.getFlg_base())
					.addInt("orderby", m.getOrderby())
					.addInt("status", m.getStatus())
					.addInt("action_fk", m.getAction()!=null? m.getAction().getId():null)
					.addInt("env_fk", m.getApplication().getId())
					.addInt("self_fk", m.getMenu()!=null?m.getMenu().getId():null)
					.execute();
				new Menu().insert();//Using to increment value for last id
			});
		}
		
		if(transactions.size() > 0){
			transactions.stream().forEach(t->{
				Core.insert(this.connetionName,"tbl_transaction")
					.addInt("id", t.getId())
					.addString("code", t.getCode())
					.addString("descr", t.getDescr())
					.addInt("status", t.getStatus())
					.addInt("env_fk", t.getApplication().getId())
					.execute();
				new Transaction().insert();//Using to increment value for last id
			});
		}
		
		if(profiles.size() > 0){
			profiles.stream().forEach(p->{
				Core.insert(this.connetionName,"tbl_profile")
					.addInt("id", p.getId())
					.addString("type", p.getType())
					.addInt("type_fk", p.getType_fk())
					.addInt("org_fk", p.getOrganization().getId())
					.addInt("prof_type_fk", p.getProfileType().getId())
					.addInt("user_fk",p.getUser().getId())
					.execute();
				new Profile().insert();//Using to increment value for last id
			});
		}
		
		if(rep_templates.size() > 0){
			rep_templates.stream().forEach(rt->{
				Core.insert(this.connetionName,"tbl_rep_template")
					.addInt("id", rt.getId())
					.addString("code", rt.getCode())
					.addDate("dt_created", rt.getDt_created())
					.addDate("dt_updated", rt.getDt_updated())
					.addString("name", rt.getName())
					.addInt("status", rt.getStatus())
					.addInt("env_fk", rt.getApplication().getId())
					.addInt("user_created_fk", rt.getUser_created()!=null?rt.getUser_created().getId():null)
					.addInt("user_updated_fk", rt.getUser_updated()!=null?rt.getUser_updated().getId():null)
					.addInt("xml_content_fk",rt.getXml_content().getId())
					.addInt("xsl_content_fk", rt.getXsl_content().getId())
					.execute();
				new RepTemplate().insert();//Using to increment value for last id
			});
		}
		if(rep_template_parmas.size() > 0){
			rep_template_parmas.stream().forEach(rt->{
				Core.insert(this.connetionName,"tbl_rep_template_param")
					.addInt("id", rt.getId())
					.addString("parameter", rt.getParameter())
					.addInt("rep_template_fk", rt.getReptemplate().getId())
					.execute();
				new RepTemplateParam().insert();//Using to increment value for last id
			});
		}
		if(rep_instances.size() > 0){
			rep_instances.stream().forEach(ri->{
				Core.insert(this.connetionName,"tbl_rep_instance")
					.addInt("id", ri.getId())
					.addString("contra_prova", ri.getContra_prova())
					.addDate("dt_created", ri.getDt_created())
					.addInt("ref_fk", ri.getRef_fk())
					.addString("reference", ri.getReference())
					.addInt("env_fk", ri.getApplication().getId())
					.addInt("rep_template_fk", ri.getTemplate().getId())
					.addInt("user_fk", ri.getUser().getId())
					.addInt("xml_content_fk", ri.getXml_content().getId())
					.addInt("xsl_content_fk", ri.getXsl_content().getId())
					.execute();
				new RepInstance().insert();//Using to increment value for last id
			});
		}
		if(rep_sources.size() > 0){
			rep_sources.stream().forEach(rs->{
				Core.insert(this.connetionName,"tbl_rep_source")
					.addInt("id", rs.getId())
					.addDate("dt_created", rs.getDt_created())
					.addDate("dt_updated", rs.getDt_updated())
					.addString("formkey", rs.getFormkey())
					.addString("name", rs.getName())
					.addString("processid", rs.getProcessid())
					.addInt("status", rs.getStatus())
					.addString("taskid", rs.getTaskid())
					.addString("type", rs.getType())
					.addInt("type_fk", rs.getType_fk())
					.addString("type_name", rs.getType_name())
					.addString("type_query", rs.getType_query())
					.addInt("env_fk", rs.getApplication().getId())
					.addInt("env_source_fk", rs.getApplication()!=null?rs.getApplication().getId():null)
					.addInt("config_env_fk", rs.getConfig_env()!=null?rs.getConfig_env().getId():null)
					.addInt("user_created_fk", rs.getUser_created()!=null?rs.getUser_created().getId():null)
					.addInt("user_updated_fk", rs.getUser_updated()!=null?rs.getUser_updated().getId():null)
					.execute();
				new RepSource().insert();//Using to increment value for last id
			});
		}
		if(rep_template_sources.size() > 0){
			rep_template_sources.stream().forEach(rt->{
				Core.insert(this.connetionName,"tbl_rep_template_source")
					.addInt("id", rt.getId())
					.addInt("rep_source_fk", rt.getRepSource().getId())
					.addInt("rep_template_fk", rt.getRepTemplate().getId())
					.execute();
				new RepTemplateSource().insert();//Using to increment value for last id
			});
		}
		
		if(taskComponents.size() > 0) {
			taskComponents.stream().forEach(tc->{
				Core.insert(this.connetionName,"tbl_task_component")
					.addInt("id", tc.getId())
					.addString("codigo", tc.getCodigo())
					.addShort("ordem", tc.getOrdem())
					.addString("processId", tc.getProcessId())
					.addString("taskId", tc.getTaskId())
					.addString("title", tc.getTitle())
					.addInt("action_fk", tc.getAction().getId())
					.execute();
				new TaskComponent().insert();//Using to increment value for last id
			});
		}
		
		if(taskAccess.size() > 0 ) {
			taskAccess.stream().forEach(ta->{
				Core.insert(this.connetionName,"tbl_task_access")
					.addInt("id", ta.getId())
					.addString("processName", ta.getProcessName())
					.addString("taskName", ta.getTaskName())
					.addInt("user_fk", ta.getUser_fk())
					.addInt("org_fk", ta.getOrganization()!=null?ta.getOrganization().getId():null)
					.addInt("prof_fk", ta.getProfileType()!=null?ta.getProfileType().getId():null)
					.execute();
				new TaskAccess().insert();//Using to increment value for last id
			});
		}
		
		if(tipoDocumentos.size() > 0 ) {
			tipoDocumentos.stream().forEach(td->{
				Core.insert(this.connetionName,"tbl_tipo_documento")
					.addInt("id", td.getId())
					.addString("codigo", td.getCodigo())
					.addString("descricao", td.getDescricao())
					.addString("nome", td.getNome())
					.addInt("status", td.getStatus())
					.addInt("env_fk", td.getApplication().getId())
					.execute();
				new TipoDocumento().insert();//Using to increment value for last id
			});
		}
		
		if(tipoDocumentoEtapas.size() > 0 ) {
			tipoDocumentoEtapas.stream().forEach(td->{
				Core.insert(this.connetionName,"tbl_tipo_documento_etapa")
					.addInt("id", td.getId())
					.addString("processId", td.getProcessId())
					.addInt("required", td.getRequired())
					.addInt("status", td.getStatus())
					.addString("taskId", td.getTaskId())
					.addString("tipo", td.getTipo())
					.addInt("report_fk", td.getRepTemplate()!=null?td.getRepTemplate().getId():null)
					.addInt("tipo_documento_fk", td.getTipoDocumento()!=null?td.getTipoDocumento().getId():null)
					.execute();
				new TipoDocumentoEtapa().insert();//Using to increment value for last id
			});
		}
		
		if(sessions.size() > 0){
			sessions.stream().forEach(s->{
				Core.insert(this.connetionName,"tbl_session")
					.addInt("id", s.getId())
					.addLong("endTime", s.getEndTime())
					.addString("host", s.getHost())
					.addString("hostName", s.getHostName())
					.addInt("https", s.getHttps())
					.addString("ipAddress", s.getIpAddress())
					.addString("mediaType", s.getMediaType())
					.addString("sessionId", s.getSessionId())
					.addString("sessionOldId", s.getSessionOldId())
					.addLong("startTime", s.getStartTime())
					.addString("target", s.getTarget())
					.addString("url", s.getUrl())
					.addString("userName", s.getUserName())
					.addInt("env_fk", s.getApplication()!=null?s.getApplication().getId():null)
					.addInt("org_fk", s.getOrganization()!=null?s.getOrganization().getId():null)
					.addInt("prof_type_fk", s.getProfileType()!=null?s.getProfileType().getId():null)
					.addInt("user_fk", s.getUser()!=null?s.getUser().getId():null)
					.execute();
				new Session().insert();//Using to increment value for last id
			});
		}
		
		// For OAuth 2.0
		
		if(authClients.size() > 0 ) {
			authClients.stream().forEach(obj-> {
				Core.insert(this.connetionName,"oauth_clients")
					.addInt("id", obj.getId())
					.addString("client_id", obj.getClient_id())
					.addString("client_secret", obj.getClient_secret())
					.addString("grant_types", obj.getGrant_types())
					.addString("redirect_uri", obj.getRedirect_uri())
					.addString("scope", obj.getScope())
					.addInt("user_id", obj.getUser()!=null?obj.getUser().getId():null)
					.execute();
				new OAuthClient().insert();//Using to increment value for last id
			});
		}
		
		if(authScopes.size() > 0) {
			authScopes.stream().forEach(obj-> {
				Core.insert(this.connetionName,"oauth_scopes")
					.addString("scope", obj.getScope())
					.addInt("is_default", obj.getIs_default())
					.execute();
				new OAuthScope().insert();//Using to increment value for last id
			});
		}
		
		if(authorizationCodes.size() > 0) {
			authorizationCodes.stream().forEach(obj->{
				Core.insert(this.connetionName,"oauth_authorization_code")
					.addInt("id", obj.getId())
					.addString("authorization_code", obj.getAuthorization_code())
					.addString("expires", obj.getExpires())
					.addString("id_token", obj.getId_token())
					.addString("redirect_uri", obj.getRedirect_uri())
					.addString("scope", obj.getScope())
					.addString("client_id", obj.getAuthClient().getClient_id())
					.addInt("user_id", obj.getUser()!=null?obj.getUser().getId():null)
					.execute();
				new OAuthorizationCode().insert();//Using to increment value for last id
			});
		}
		
		if(accessTokens.size() > 0) {
			accessTokens.stream().forEach(obj->{
				Core.insert(this.connetionName,"oauth_access_tokens")
					.addInt("id", obj.getId())
					.addString("access_token", obj.getAccess_token())
					.addString("expires", obj.getExpires())
					.addString("scope", obj.getScope())
					.addString("client_id", obj.getAuthClient().getClient_id())
					.addInt("user_id", obj.getUser()!=null?obj.getUser().getId():null)
					.execute();
				new OAuthAccessToken().insert();//Using to increment value for last id
			});
		}
		
		if(refreshTokens.size() > 0) {
			refreshTokens.stream().forEach(obj->{
				Core.insert(this.connetionName,"oauth_refresh_tokens")
				.addInt("id", obj.getId())
				.addString("refresh_token", obj.getRefresh_token())
				.addString("expires", obj.getExpires())
				.addString("scope", obj.getScope())
				.addString("client_id", obj.getAuthClient().getClient_id())
				.addInt("user_id", obj.getUser()!=null?obj.getUser().getId():null)
				.execute();
				new OAuthRefreshToken().insert();//Using to increment value for last id
			});
		}
		
		if(userRoles.size() > 0 ) {
			userRoles.stream().forEach(obj->{
				Core.insert(this.connetionName,"tbl_user_roles")
				.addInt("id", obj.getId())
				.addString("role_name", obj.getRole_name())
				.addString("user_name",obj.getUser()!=null? obj.getUser().getUser_name():null)
				.execute();
				new UserRole().insert();//Using to increment value for last id
			});
		}
		
	}

}