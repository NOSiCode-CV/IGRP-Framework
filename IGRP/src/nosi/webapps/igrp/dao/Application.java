package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.Permission;
import static nosi.core.i18n.Translator.gt;

@Entity
@Table(name="tbl_env")
public class Application extends BaseActiveRecord<Application> implements Serializable{

	/*
	 * 
	 */
	private static final long serialVersionUID = 1261352599073552072L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false,unique=true)
	private String dad;
	@Column(nullable=false)
	private String name;
	private String img_src;
	private String description;
	private int status;
	
	private int external;
	private String url;
	
	@ManyToOne()
	@JoinColumn(name = "action_fk",foreignKey = @ForeignKey(name="ENV_ACTION_FK"))
	private Action action;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application",fetch=FetchType.EAGER)
	private List<Action> actions;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<Config_env> configs;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<Menu> menus;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<ProfileType> profilesType;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<Organization> organizations;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<RepSource> repsources;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<RepTemplate> repTemplates;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<Transaction> transactions;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
	private List<RepInstance> repinstances;
	
	public Application(){
		
	}
	
	public Application(String dad, String name, String img_src, String description, int status,
			Action action) {
		super();
		this.dad = dad;
		this.name = name;
		this.img_src = img_src;
		this.description = description;
		this.status = status;
		this.action = action;
	}
	
	public int getExternal() {
		return external;
	}

	public void setExternal(int external) {
		this.external = external;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDad() {
		return dad;
	}
	public void setDad(String dad) {
		this.dad = dad.replaceAll("\\s+","_").toLowerCase();
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Action getAction() {
		return action;
	}
	public void setAction(Action action) {
		this.action = action;
	}
	
	public List<Action> getActions() {
		return actions;
	}

	public void setActions(List<Action> actions) {
		this.actions = actions;
	}

	public List<Config_env> getConfigs() {
		return configs;
	}

	public void setConfigs(List<Config_env> configs) {
		this.configs = configs;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	
	public List<ProfileType> getProfilesType() {
		return profilesType;
	}

	public void setProfilesType(List<ProfileType> profilesType) {
		this.profilesType = profilesType;
	}

	public List<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(List<Organization> organizations) {
		this.organizations = organizations;
	}

	public List<RepSource> getRepsources() {
		return repsources;
	}

	public void setRepsources(List<RepSource> repsources) {
		this.repsources = repsources;
	}

	public List<RepTemplate> getRepTemplates() {
		return repTemplates;
	}

	public void setRepTemplates(List<RepTemplate> repTemplates) {
		this.repTemplates = repTemplates;
	}

	public List<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<Transaction> transactions) {
		this.transactions = transactions;
	}

	public List<RepInstance> getRepinstances() {
		return repinstances;
	}

	public void setRepinstances(List<RepInstance> repinstances) {
		this.repinstances = repinstances;
	}

	
	
	@Override
	public String toString() {
		return "Application [dad=" + dad + ", name=" + name + ", description=" + description + ", status=" + status
				+ ", url=" + url + ", action=" + action + "]";
	}

	public Map<Object, Object> getListApps(){
		int idUser = Igrp.getInstance().getUser().getIdentity().getIdentityId();
		int idProf = Permission.getCurrentPerfilId();
		ProfileType p = new ProfileType().findOne(idProf);		
		if(p!=null && p.getCode().equalsIgnoreCase("ALL")){
			return IgrpHelper.toMap(this.findAll(), "id", "name", gt("-- Selecionar Aplicação --"));
		}else if(p!=null){
			Application app = this.find().andWhere("dad", "=", Permission.getCurrentEnv()).one();
			if(app!=null){
				List<Application> listApp = new ArrayList<>();
				List<Profile> list = new Profile().find()
								.andWhere("profileType.application", "=",app.getId())
								.andWhere("organization", "=",Permission.getCurrentOrganization())
								.andWhere("profileType", "=",Permission.getCurrentPerfilId())
								.andWhere("type", "=", "ENV")
								.andWhere("user", "=", idUser)
								.all();
				if(!list.isEmpty()){				
					list.stream().peek(e->listApp.add(e.getProfileType().getApplication())).collect(Collectors.toList());
					return IgrpHelper.toMap(listApp, "id", "name", gt("-- Selecionar Aplicação --"));
				}
			}
		}
		return null;
	}
	
	public boolean getPermissionApp(String dad) {
		 User u = (User) Igrp.getInstance().getUser().getIdentity();
		 Profile p = new Profile();
		 p = p.findOne(p.getCriteria().where(
				 p.getBuilder().equal(p.getRoot().get("user"), u.getId()),
				 p.getBuilder().equal(p.getRoot().get("type"), "ENV"),
				 p.getBuilder().equal(p.getRoot().join("profileType").join("application").get("dad"), dad)
				));
		return p!=null;
	}

	public List<Profile> getMyApp() {	
		User u = (User) Igrp.getInstance().getUser().getIdentity();
		List<Profile> list = new Profile().find()
									 .andWhere("type", "=", "ENV")
									 .andWhere("user", "=", u.getId())
									 .andWhere("type_fk", "<>", 1)
									 .all();
		return list;
	}

	public List<Application> getOtherApp() {
		List<Application> list = this.find()
				 .andWhere("id", "<>", 1)
				 .all();
		return list;
	}
	
	@Override
	public Application insert() {
		Application app = super.insert();
		if(app!=null){
			User user = new User();
			user = user.findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId());
			Organization org = new Organization();				
			org.setCode("org.admin." + app.getDad());
			org.setName("Organica Admin - " + app.getName());
			org.setUser(user);
			org.setApplication(app);
			org.setStatus(1);
			org = org.insert();
			if(org!=null){	
				ProfileType proty = new ProfileType();			
				proty.setCode("perfil." + app.getDad());
				proty.setDescr("Perfil Admin - " + org.getName());
				proty.setOrganization(org);
				proty.setApplication(app);
				proty.setStatus(1);		
				proty = proty.insert();				
			}
		}
		return null;
	}
	
	public Application insertOnly() {
		return super.insert();
	}
}