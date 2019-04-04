package nosi.webapps.igrp.dao;

/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;
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
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;

@Entity
@Table(name = "tbl_env")
public class Application extends IGRPBaseActiveRecord<Application> implements Serializable {

	/*
	 * 
	 */
	private static final long serialVersionUID = 1261352599073552072L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable = false, unique = true)
	private String dad;
	@Column(nullable = false)
	private String name;
	private String img_src;
	private String description;
	private int status;
	private String template;
	private int externo;
	private String url;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "action_fk", foreignKey = @ForeignKey(name = "ENV_ACTION_FK"))
	private Action action;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<Action> actions;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<Config_env> configs;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<Menu> menus;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<ProfileType> profilesType;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<Organization> organizations;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<RepSource> repsources;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<RepTemplate> repTemplates;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<Transaction> transactions;
	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private Set<RepInstance> repinstances;

	@OneToMany(cascade = CascadeType.REMOVE, mappedBy = "application")
	private List<Modulo> modulo;

	public Application() {
		super();
	}

	public Application(String dad, String name, String img_src, String description, int status, Action action) {
		this();
		this.dad = dad;
		this.name = name;
		this.img_src = img_src;
		this.description = description;
		this.status = status;
		this.action = action;
	}

	public Application(String dad, String name, String img_src, String description, int status, Action action,
			String template) {
		this(dad, name, img_src, description, status, action);
		this.template = template;
	}

	public int getExternal() {
		return externo;
	}

	public void setExternal(int external) {
		this.externo = external;
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
		this.dad = dad.replaceAll("\\s+", "_").toLowerCase();
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

	public String getTemplate() {
		return template;
	}

	public void setTemplate(String template) {
		this.template = template;
	}

	public Set<Action> getActions() {
		return actions;
	}

	public void setActions(Set<Action> actions) {
		this.actions = actions;
	}

	public Set<Config_env> getConfigs() {
		return configs;
	}

	public void setConfigs(Set<Config_env> configs) {
		this.configs = configs;
	}

	public Set<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

	public Set<ProfileType> getProfilesType() {
		return profilesType;
	}

	public void setProfilesType(Set<ProfileType> profilesType) {
		this.profilesType = profilesType;
	}

	public Set<Organization> getOrganizations() {
		return organizations;
	}

	public void setOrganizations(Set<Organization> organizations) {
		this.organizations = organizations;
	}

	public Set<RepSource> getRepsources() {
		return repsources;
	}

	public void setRepsources(Set<RepSource> repsources) {
		this.repsources = repsources;
	}

	public Set<RepTemplate> getRepTemplates() {
		return repTemplates;
	}

	public void setRepTemplates(Set<RepTemplate> repTemplates) {
		this.repTemplates = repTemplates;
	}

	public Set<Transaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(Set<Transaction> transactions) {
		this.transactions = transactions;
	}

	public Set<RepInstance> getRepinstances() {
		return repinstances;
	}

	public void setRepinstances(Set<RepInstance> repinstances) {
		this.repinstances = repinstances;
	}

	public List<Modulo> getModulo() {
		return modulo;
	}

	public void setModulo(List<Modulo> modulo) {
		this.modulo = modulo;
	}

	@Override
	public String toString() {
		return "Application [dad=" + dad + ", name=" + name + ", description=" + description + ", status=" + status
				+ ", url=" + url + ", action=" + action + "]";
	}

	public Map<Object, Object> getListApps() {
		User user = (User) Core.getCurrentUser();
		return Core.toMap(getListMyApp(user.getId()), "id", "name", gt("-- Selecionar --"));
	}

	public Map<Object, Object> getAllApps() {
		return Core.toMap(this.findAll(), "id", "name", gt("-- Selecionar --"));
	}

	public Map<Object, Object> getAllAppsActiveByFilterId(int appId) {
		return Core.toMap(this.find().andWhere("id", "<>", appId).andWhere("status", "=", 1).all(), "id", "name", gt("-- Selecionar --"));
	}

	public List<Application> getListMyApp(int idUser) {
		return getListMyApp(idUser, false);
	}

	public List<Application> getListMyApp(int idUser, boolean allInative){
		List<Application> listApp = new ArrayList<>();
		List<Profile> list = new ArrayList<>();
		if(Core.getCurrentUser().getEmail().compareTo("igrpweb@nosi.cv")==0) {//User master
			list = new Profile().find()
					.andWhere("type", "=", "ENV")
					//.groupBy("type_fk")					
					.all();
		}else {
			Profile p = new Profile();
			list = p.find()
					.andWhere("type", "=", "ENV")
					.andWhere("user", "=", idUser)
					.andWhere("type_fk", ">", 3) // Oculta IGRP Core,IGRP Tutorial,Oculta IGRP Studio 
					.all();
		}		
		if(!list.isEmpty()){
			list=list.stream() 
					.filter(distinctByKey(p -> p.getType_fk())) 
					.collect(Collectors.toList());
				list.sort(Comparator.comparing(Profile::getType_fk));
			if(allInative) {
			list.stream().peek(e->listApp.add(e.getProfileType().getApplication()))
			.collect(Collectors.toList());
			}else {
			list.stream().filter(profile->profile.getOrganization().getApplication().getStatus()==1)
			.peek(e->listApp.add(e.getProfileType().getApplication()))
			.collect(Collectors.toList());
			}
			
			
			listApp.sort(Comparator.comparing(Application::getId));
		}
		
		return listApp;
	}

	public boolean getPermissionApp(String dad) {
		User u = (User) Core.getCurrentUser();
		Profile p = new Profile();
		p = p.findOne(p.getCriteria().where(p.getBuilder().equal(p.getRoot().get("user"), u.getId()),
				p.getBuilder().equal(p.getRoot().get("type"), "ENV"),
				p.getBuilder().equal(p.getRoot().join("profileType").join("application").get("dad"), dad)));
		return p != null;
	}

	public List<Profile> getMyApp() {
		User u = (User) Core.getCurrentUser();
		List<Profile> list = new Profile().find()
				.andWhere("type", "=", "ENV")
				.andWhere("user", "=", u.getId())
				.andWhere("type_fk", ">", 1).all();
		list=list.stream() 
			.filter(distinctByKey(p -> p.getType_fk())) 
			.collect(Collectors.toList());
		list.sort(Comparator.comparing(Profile::getType_fk));
	
		return list;
	}
	public static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor)
	{
	    Map<Object, Boolean> map = new ConcurrentHashMap<>();
	    return t -> map.putIfAbsent(keyExtractor.apply(t), Boolean.TRUE) == null;
	}
	public List<Application> getOtherApp() {
		List<Application> list = this.find().andWhere("id", "<>", 1).andWhere("status", "=", 1).all();

		return list;
	}

	@Override
	public Application insert() {
		this.setStatus(1);
		Application app = super.insert();
		if (app != null) {
			User user = new User();
			user = user.findOne(Core.getCurrentUser().getIdentityId());
			Organization org = new Organization();
			org.setCode("Org." + app.getDad());
			org.setName("IGRP"); // + app.getName()
			org.setUser(user);
			org.setApplication(app);
			org.setStatus(1);
			org = org.insert();
			if (org != null) {
				ProfileType proty = new ProfileType();
				proty.setCode("admin." + app.getDad());
				proty.setDescr("Admin");
				proty.setOrganization(org);
				proty.setApplication(app);
				proty.setStatus(1);
				proty = proty.insert();
				if (proty != null) {
					Profile p1 = new Profile(app.getId(), "ENV", proty, user, org);
					p1.insert();
					Profile p2 = new Profile(proty.getId(), "PROF", proty, user, org);
					p2.insert();
				}
				ProfileType proty2 = new ProfileType();
				proty2.setCode("user." + app.getDad());
				proty2.setDescr("User");
				proty2.setOrganization(org);
				proty2.setApplication(app);
				proty2.setStatus(1);
				proty2 = proty2.insert();
				if (proty2 != null) {
					Profile p2 = new Profile(proty2.getId(), "PROF", proty2, user, org);
					p2.insert();
				}

				// Organization - Access Management (Gestão de acesso) is ID 10,
				new Profile(10, "MEN", new ProfileType().getProfileAdmin(), new User().getUserAdmin(), org).insert();
				// Profile/Perfil - Access Management (Gestão de acesso) is ID 10, ignores USER
				// by using 0 to facilitates delete
				new Profile(10, "MEN", proty, new User().getUserAdmin(), org).insert();

//				
			}
		}
		return app;
	}

	public Application insertOnly() {
		return super.insert();
	}

	public Application findByDad(String dad) {
		return new Application().find().andWhere("dad", "=", dad).one();
	}
	
	public LinkedHashMap<String, String> getAtivesEstadoRegisto() {
		 LinkedHashMap<String, String> m = new  LinkedHashMap<String, String>();
		 m.put(null, "--- Selecionar ---");
		 m.put("1", "Externo"); 
		 m.put("2", "Custom Dad"); 
		 return m;
	}

}