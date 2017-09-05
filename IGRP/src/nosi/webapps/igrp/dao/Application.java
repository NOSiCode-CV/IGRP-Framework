package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Query;
import javax.persistence.Table;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.Igrp;

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
	@ManyToOne()
	@JoinColumn(name = "action_fk",foreignKey = @ForeignKey(name="ENV_ACTION_FK"))
	private Action action;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="application")
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
		this.dad = dad;
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

	public HashMap<Integer,String> getListApps(){
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, "--- Selecionar Aplicacao ---");
		for(Application app:this.findAll()){
			lista.put(app.getId(), app.getName());
		}
		return lista;
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

	@SuppressWarnings("unchecked")
	public List<Object[]> getMyApp() {	
		User u = (User) Igrp.getInstance().getUser().getIdentity();
		EntityManager em = this.entityManagerFactory.createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		String query = "SELECT E.* FROM tbl_env E,tbl_profile P "
				+ "	WHERE "
				+ " E.id = P.type_fk "
				+ "	AND P.type=?"
				+ " AND P.user_fk=?"
				+ " AND E.id <> ? "
				+ "	ORDER BY id";
		Query q = em.createNativeQuery(query);
		q.setParameter(1, "ENV");
		q.setParameter(2, u.getId());
		q.setParameter(3,1);
		List<Object[]> list = q.getResultList();
		t.commit();
		em.close();
		return list;
	}
	
	@SuppressWarnings("unchecked")
	public List<Object[]> getOtherApp() {
		User u = (User) Igrp.getInstance().getUser().getIdentity();
		EntityManager em = this.entityManagerFactory.createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		String query ="SELECT E.* FROM tbl_env E"
				+ " WHERE E.id NOT IN (SELECT P.type_fk FROM tbl_profile P WHERE P.type=? AND P.user_fk=?)  AND E.id<>?";
		Query q = em.createNativeQuery(query);
		q.setParameter(1, "ENV");
		q.setParameter(2, u.getId());
		q.setParameter(3,1);
		List<Object[]> list = q.getResultList();
		t.commit();
		em.close();
		return list;
	}
}