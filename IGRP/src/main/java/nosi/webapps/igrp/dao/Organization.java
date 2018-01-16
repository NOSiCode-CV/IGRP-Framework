package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;
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
import nosi.core.webapp.helpers.Permission;
import static nosi.core.i18n.Translator.gt;

@Entity
@Table(name="tbl_organization")
public class Organization extends BaseActiveRecord<Organization> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3697544500624399720L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false,unique=true)
	private String code;
	@Column(nullable=false)
	private String name;
	private int status;
	@ManyToOne(cascade=CascadeType.REMOVE, fetch = FetchType.EAGER)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="ORGANIZATION_ENV_FK"),nullable=false)
	private Application application;
	@ManyToOne
	@JoinColumn(name="user_created_fk",foreignKey=@ForeignKey(name="ORGANIZATION_USER_FK"),nullable=false)
	private User user;
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="self_fk",foreignKey=@ForeignKey(name="ORGANIZATION_SELF_FK"),nullable=true)
	private Organization organization;
	@OneToMany(cascade=CascadeType.REMOVE,mappedBy="organization")
	private List<ProfileType> profilesType;
	@OneToMany(mappedBy="organization")
	private List<Profile> profiles;
	
	public Organization(){}
	
	public Organization(String code, String name, int status, Application application, User user,
			Organization organization) {
		super();
		this.code = code;
		this.name = name;
		this.status = status;
		this.application = application;
		this.user = user;
		this.organization = organization;
	}



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Application getApplication() {
		return application;
	}
	public void setApplication(Application application) {
		this.application = application;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public List<ProfileType> getProfilesType() {
		return profilesType;
	}

	public void setProfilesType(List<ProfileType> profilesType) {
		this.profilesType = profilesType;
	}

	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}

	public HashMap<String, String> getListMyOrganizations() {
		HashMap<String,String> lista = new HashMap<>();
		lista.put("", "--- Selecionar Organica ---");
		for(Profile p: new Profile().getMyPerfile()){
			lista.put(p.getOrganization().getId()+"", p.getOrganization().getName());
		}
		return lista;
	}

	public HashMap<String, String> getListOrganizations() {
		HashMap<String,String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar Orgânica --"));
		for(Organization o:this.findAll()){
			lista.put(o.getId()+"", o.getName());
		}
		return lista;
	}
	
	public HashMap<String, String> getListOrganizations(int app) {
		HashMap<String,String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar Orgânica --"));
		for(Organization o:this.find().andWhere("application.id", "=", app).all()){
			lista.put(o.getId()+"", o.getName());
		}
		return lista;
	}

	public List<Menu> getOrgMenu() {	
		Menu m = new Menu();
		String dad = Permission.getCurrentEnv();		
		if("igrp".equalsIgnoreCase(dad)){
			return m.find().andWhere("action", "notnull").all();
		}else{
			Application app = new Application().find().andWhere("dad", "=", Permission.getCurrentEnv()).one();
			List<Menu> myMenu = new ArrayList<>();
			HashMap<String,List<Menu>> menu = m.getMyMenu();
			if(menu !=null){
				for(Entry<String, List<Menu>> mm:menu.entrySet()){
						for(Menu main:mm.getValue()){
							if(main.getMenu()!=null){
								Menu e = new Menu();
								e.setDescr(gt(main.getMenu().getDescr()));
								e.setId(main.getId());
								e.setFlg_base(main.getMenu().getFlg_base());
								myMenu.add(e);
							}
						}
				}
			}
			
			//System.out.println("Menu1 " + myMenu.size());
			
			
			return myMenu; 
		}
	}

	public List<Menu> getPerfilMenu(Integer org) {
		Profile pr = new Profile();
		List<Profile> profiles = pr.findAll(pr.getCriteria().where(
					pr.getBuilder().equal(pr.getRoot().get("type"), "MEN"),
					pr.getBuilder().equal(pr.getRoot().get("organization"), org),
					pr.getBuilder().equal(pr.getRoot().get("profileType"), 0)
				));
		List<Menu> menus = new ArrayList<>();
		for(Profile p:profiles){
			menus.add(new Menu().findOne(p.getType_fk()));
		}
		return menus;
	}

	public List<Transaction> getOrgTransaction() {
		return new Transaction().findAll();
	}

	public List<Transaction> getPerfilTransaction(int org) {
		Profile pr = new Profile();
		List<Profile> profiles = pr.findAll(pr.getCriteria().where(
					pr.getBuilder().equal(pr.getRoot().get("type"), "TRANS"),
					pr.getBuilder().equal(pr.getRoot().get("organization"), org),
					pr.getBuilder().equal(pr.getRoot().get("profileType"), 0)
				));
		List<Transaction> trans = new ArrayList<>();
		for(Profile p:profiles){
			trans.add(new Transaction().findOne(p.getType_fk()));
		}
		return trans;
	}
}