package nosi.core.igrp.mingrations;

import java.util.List;
import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.config.AppConfig;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.*;
import nosi.webapps.igrp.dao.views.CreateViews;
import nosi.webapps.igrp.pages.migrate.Migrate;

/**
 * @author: Emanuel Pereira
 * 2 Aug 2017
 */
public class MigrationIGRP {

	private static List<Application> applications;
	private static List<Action> actions;
	private static List<CLob> clobs;
	private static List<Config_env> config_envs;
	private static List<Config> configs;
	private static List<Menu> menus;
	private static List<Organization> organizations;
	private static List<Profile> profiles;
	private static List<ProfileType> profile_types;
	private static List<RepInstance> rep_instances;
	private static List<RepSource> rep_sources;
	private static List<RepTemplate> rep_templates;
	private static List<RepTemplateParam> rep_template_parmas;
	private static List<RepTemplateSource> rep_template_sources;
	private static List<Session> sessions;
	private static List<Transaction> transactions;
	private static List<User> users;
	
	public static void start(AppConfig appConfig,Migrate model){
		getData();
		Igrp.getInstance().saveAppConfig(appConfig,model);
		Igrp.getInstance().loadAppConfig();
		PersistenceUtils.init();
		saveData();
		new CreateViews();
	}

	private static void getData() {
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
	}
	
	private static void saveData() {
		if(configs.size() > 0){
			for(Config c:configs){
				Config conf = new Config(c.getName(), c.getValue());
				conf.insert();
			}
		}
		if(applications.size() > 0){
			for(Application app:applications){
				Application a = new Application(app.getDad(), app.getName(), app.getImg_src(), app.getDescription(), app.getStatus(), app.getAction());
				a.insert();
			}
		}
		if(actions.size() > 0){
			for(Action a:actions){
				Action ac = new Action(a.getPage(), a.getAction(), a.getPackage_name(), a.getXsl_src(), a.getPage_descr(), a.getAction_descr(), a.getVersion(), a.getStatus(), a.getApplication());
				ac.insert();
			}
		}
		if(clobs.size() > 0){
			for(CLob cl:clobs){
				CLob c = new CLob( cl.getName(), cl.getMime_type(), cl.getC_lob_content(), cl.getDt_created());
				c.insert();
			}
		}
		
		if(config_envs.size() > 0){
			for(Config_env c:config_envs){
				Config_env conf = new Config_env(c.getPort(), c.getType_db(), c.getHost(), c.getName_db(), c.getUsername(), c.getPassword(), c.getCharset(), c.getName(), c.getApplication());
				conf.insert();
			}
		}
		if(menus.size() > 0){
			for(Menu m:menus){
				Menu menu = new Menu(m.getDescr(), m.getOrderby(), m.getStatus(), m.getFlg_base(), m.getTarget(), m.getAction(), m.getApplication(), m.getMenu());
				menu.insert();
			}
		}
		if(users.size() > 0){
			int i=0;
			for(User u:users){
				User user = new User(u.getName(), u.getEmail(), u.getPass_hash(), u.getUserProfile(), u.getValid_until(), u.getStatus(), u.getRemarks(), u.getActivation_key(), u.getUser_name(), u.getPhoto_id(), u.getSignature_id(), u.getMobile(), u.getPhone(), u.getPassword_reset_token(), u.getAuth_key(), u.getCreated_at(), u.getUpdated_at());
				user = user.insert();
				if(i==0){
					user.updateTozero();
				}
				i++;
			}
		}
		if(organizations.size() > 0){
			for(Organization o:organizations){
				Organization org = new Organization(o.getCode(), o.getName(), o.getStatus(), o.getApplication(), o.getUser(), o.getOrganization());
				org.insert();
			}
		}
		if(profile_types.size() > 0){
			int i = 0;
			for(ProfileType p:profile_types){
				ProfileType pt = new ProfileType(p.getDescr(), p.getCode(), p.getStatus(), p.getOrganization(), p.getApplication(), p.getProfiletype());
				pt = pt.insert();
				if(i==0){
					pt.updateToZero();
				}
				i++;
			}
		}
		if(transactions.size() > 0){
			for(Transaction t:transactions){
				Transaction trans = new Transaction(t.getCode(), t.getDescr(), t.getStatus(), t.getApplication());
				trans.insert();
			}
		}
		if(profiles.size() > 0){
			for(Profile p:profiles){
				Profile prof = new Profile(p.getType_fk(), p.getType(), p.getProfileType(), p.getUser(), p.getOrganization());
				prof.insert();
			}
		}
		if(rep_templates.size() > 0){
			for(RepTemplate rt:rep_templates){
				RepTemplate rtemp = new RepTemplate(rt.getCode(), rt.getName(), rt.getDt_created(), rt.getDt_updated(), rt.getStatus(), rt.getUser_created(), rt.getUser_updated(), rt.getApplication(), rt.getXml_content(), rt.getXsl_content());
				rtemp.insert();
			}
		}
		if(rep_template_parmas.size() > 0){
			for(RepTemplateParam rt:rep_template_parmas){
				RepTemplateParam rtp = new RepTemplateParam( rt.getReptemplate(), rt.getParameter());
				rtp.insert();
			}
		}
		if(rep_instances.size() > 0){
			for(RepInstance ri:rep_instances){
				RepInstance rinst = new RepInstance(ri.getTemplate(), ri.getContra_prova(), ri.getDt_created(), ri.getReference(), ri.getRef_fk(), ri.getApplication(), ri.getXml_content(), ri.getXsl_content(), ri.getUser());
				rinst.insert();
			}
		}
		if(rep_sources.size() > 0){
			for(RepSource rs:rep_sources){
				RepSource rsource = new RepSource(rs.getName(), rs.getType(), rs.getType_fk(), rs.getType_name(), rs.getType_query(), rs.getStatus(), rs.getDt_created(), rs.getDt_updated(), rs.getApplication(), rs.getApplication_source(), rs.getUser_created(), rs.getUser_updated());
				rsource.insert();
			}
		}
		if(rep_template_sources.size() > 0){
			for(RepTemplateSource rt:rep_template_sources){
				RepTemplateSource rts =new RepTemplateSource(rt.getRepTemplate(), rt.getRepSource());
				rts.insert();
			}
		}
		if(sessions.size() > 0){
			for(Session s:sessions){
				Session ss = new Session(s.getSessionId(), s.getStartTime(), s.getEndTime(), s.getIpAddress(), s.getUserName(), s.getTarget(), s.getHttps(), s.getSessionOldId(), s.getHost(), s.getHostName(), s.getMediaType(), s.getUser(), s.getApplication(), s.getProfileType(), s.getOrganization());
				ss.insert();
			}
		}
	}

}
