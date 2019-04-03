package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import javax.persistence.Column;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.ResultSet.Record;
import nosi.core.webapp.helpers.EncrypDecrypt;
import static nosi.core.i18n.Translator.gt;

@Entity
@Table(name="tbl_menu")
public class Menu extends IGRPBaseActiveRecord<Menu> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2363727513490936688L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private String descr;
	private int orderby;
	private int status;
	private int flg_base;
	private String target;
	@ManyToOne
	@JoinColumn(name="action_fk",foreignKey=@ForeignKey(name="MENU_ACTION_FK"),nullable=true)
	private Action action;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="MENU_ENV_FK"),nullable=false)
	private Application application;
	@OneToOne
	@JoinColumn(name="self_fk",foreignKey=@ForeignKey(name="MENU_SELF_FK"),nullable=true)
	private Menu menu;	
	@Transient
	private Organization organization;
	@Transient
	private String link;
	@Transient
	private boolean isInserted;
	@Transient
	private final String sqlMenuByProfile = " SELECT prof.org_fk,prof.prof_type_fk,prof.user_fk,m_sub.*,"
								 + " m_super.id as id_menu_pai,m_super.descr as descr_menu_pai," 
								 + " ac.page,ac.action,ac.versao,env_a.dad as dad_app_page,env_prof.dad as dad_app_profile, "
								 + " case WHEN (m_super.self_fk is not null AND m_super.self_fk=m_super.id) then 1 else 0 END as isSubMenuAndSuperMenu " 
								 + " FROM tbl_profile prof INNER JOIN tbl_menu m_sub ON prof.type_fk=m_sub.id AND prof.type='MEN' " 
								 + " LEFT JOIN tbl_menu m_super ON m_sub.self_fk=m_super.id " 
								 + " LEFT JOIN tbl_action ac ON ac.id=m_sub.action_fk " 
								 + " LEFT JOIN tbl_env env_a ON env_a.id=ac.env_fk "
								 + " LEFT JOIN tbl_profile_type prof_type ON prof_type.id=prof.prof_type_fk "  
								 + " LEFT JOIN tbl_env env_prof ON env_prof.id=prof_type.env_fk "
								 + " WHERE prof.org_fk=:org_fk AND prof.prof_type_fk=:prof_type_fk AND env_prof.dad=:dad AND m_sub.status=:status";
	@Transient
	private final String sqlMenuByUser = " SELECT prof.org_fk,prof.prof_type_fk,prof.user_fk,m_sub.*,"
								 + " m_super.id as id_menu_pai,m_super.descr as descr_menu_pai," 
								 + " ac.page,ac.action,ac.versao,env_a.dad as dad_app_page,env_prof.dad as dad_app_profile, "
								 + " case WHEN (m_super.self_fk is not null AND m_super.self_fk=m_super.id) then 1 else 0 END as isSubMenuAndSuperMenu " 
								 + " FROM tbl_profile prof INNER JOIN tbl_menu m_sub ON prof.type_fk=m_sub.id AND prof.type='MEN_USER' AND user_fk=:user_fk" 
								 + " LEFT JOIN tbl_menu m_super ON m_sub.self_fk=m_super.id " 
								 + " LEFT JOIN tbl_action ac ON ac.id=m_sub.action_fk " 
								 + " LEFT JOIN tbl_env env_a ON env_a.id=ac.env_fk "
								 + " LEFT JOIN tbl_profile_type prof_type ON prof_type.id=prof.prof_type_fk "  
								 + " LEFT JOIN tbl_env env_prof ON env_prof.id=prof_type.env_fk "
								 + " WHERE prof.org_fk=:org_fk AND prof.prof_type_fk=:prof_type_fk AND env_prof.dad=:dad AND m_sub.status=:status ";
	public Menu(){}
	
	public Menu(String descr, int orderby, int status,int flg_base,String target, Action action,Application application, Menu menu) {
		super();
		this.descr = descr;
		this.orderby = orderby;
		this.status = status;
		this.flg_base = flg_base;
		this.target = target;
		this.action = action;
		this.application = application;
		this.menu = menu;
	}



	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getDescr() {
		return descr;
	}
	public void setDescr(String descr) {
		this.descr = descr;
	}
	public int getOrderby() {
		return orderby;
	}
	public void setOrderby(int orderby) {
		this.orderby = orderby;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	public int getFlg_base() {
		return flg_base;
	}
	public void setFlg_base(int flg_base) {
		this.flg_base = flg_base;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public Action getAction() {
		return action;
	}
	public void setAction(Action action) {
		this.action = action;
	}
	public Application getApplication() {
		return application;
	}
	public void setApplication(Application application) {
		this.application = application;
	}
	public Menu getMenu() {
		return menu;
	}
	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	@Transient
	public Organization getOrganization() {
		return organization;
	}
	@Transient
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}

	public boolean isInserted() {
		return isInserted;
	}

	public void setInserted(boolean isInserted) {
		this.isInserted = isInserted;
	}

	public boolean getPermissionMen(String app) {
		
		List<Profile> p = new Profile().find()
				.andWhere("type", "=","MEN")
				.andWhere("organization", "=",Core.getCurrentOrganization())
				.andWhere("profileType", "=",Core.getCurrentProfile())
				.andWhere("profileType.status", "=", 1)
				.all();
		return p.size() > 0;
		
		
	}
	public List<Menu> getMyMen_de_env(int env_fk) {
//		First shows all the app pages than all the public pages in the menu
		List<Menu> list = new Menu().find().andWhere("action", "notnull")
				.andWhere("status", "=", 1).andWhere("application", "=", env_fk).all();
		List<Menu> menus_App = new Menu().find().andWhere("action", "notnull").andWhere("flg_base", "=", 1)
				.andWhere("status", "=", 1).andWhere("application", "<>", env_fk).all();
		
		if (list != null) {
			list.addAll(menus_App);
			return list;
		}			
		return menus_App;
	}
	

	public LinkedHashMap<String,List<MenuProfile>> getMyMenu() {
		
		LinkedHashMap<String,List<MenuProfile>> list = new LinkedHashMap<>();
		String currentDad = Core.getCurrentDad();
		Record row = Core.query(this.getConnectionName(),sqlMenuByProfile)
						 .union()
						 .select(sqlMenuByUser)
						 .addInt("org_fk", Core.getCurrentOrganization())
						 .addInt("prof_type_fk", Core.getCurrentProfile())
						 .addString("dad", currentDad )
						 .addInt("status", 1)
						 .addInt("org_fk", Core.getCurrentOrganization())
						 .addInt("prof_type_fk", Core.getCurrentProfile())
						 .addString("dad", currentDad )
						 .addInt("status", 1)
						 .addInt("user_fk", Core.getCurrentUser().getId())
						 .orderByAsc("orderby")
						 .getRecordList();
		if(row.RowList!=null) {
				row.RowList.forEach(r->{
				//Get Menu Pai
				MenuProfile ms = new MenuProfile();
				ms.setId(r.getInt("id"));
				ms.setOrder(r.getInt("orderby"));
				ms.setTitle(r.getString("descr"));
				ms.setTarget(r.getString("target"));
				ms.setStatus(r.getShort("status"));
				
				ms.setLink(new EncrypDecrypt().encrypt(r.getString("dad_app_page")+"/"+r.getString("page")+"/"+r.getString("action"))+"&dad="+currentDad);
				//ms.setLink(r.getString("dad_app_page")+"/"+r.getString("page")+"/"+r.getString("action")+"&dad="+currentDad);	
			
				
				ms.setSubMenuAndSuperMenu(r.getInt("isSubMenuAndSuperMenu") == 1);
				
				List<MenuProfile> value = new ArrayList<>();
				value.add(ms);
				
				if(list.containsKey(r.getString("descr_menu_pai"))){
					value.addAll(list.get(r.getString("descr_menu_pai")));
				}
				list.put(r.getString("descr_menu_pai"), value);
			});
		}
		return list;
	}

	public LinkedHashMap<Integer, String> getListPrincipalMenus() {
		LinkedHashMap<Integer,String> lista = new LinkedHashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		for(Menu m:this.findAll(this.getCriteria().where(this.getBuilder().isNull(this.getRoot().get("menu"))))){
			lista.put(m.getId(),m.getDescr());
		}
		return lista;
	}	
	
	public LinkedHashMap<Integer, String> getListPrincipalMenus(int app) {
		LinkedHashMap<Integer,String> lista = new LinkedHashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		List<Menu> aux = this.find().andWhere("application", "=",app).andWhere("menu", "isnull").all();
		for(Menu m : aux){
			lista.put(m.getId(),m.getDescr());
		}
		return lista;
	}	

	@Override
	public String toString() {
		return "Menu [id=" + id + ", descr=" + descr + ", orderby=" + orderby + ", status=" + status + ", flg_base="
				+ flg_base + ", target=" + target + ", action=" + action + ", application=" + application + ", menu="
				+ menu + ", organization=" + organization + "]";
	}
	
	
	public static class MenuProfile{
		private Integer id;
		private String title;
		private String link;
		private short status;
		private String target;
		private int order;
		private boolean isSubMenuAndSuperMenu;
		
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		public short getStatus() {
			return status;
		}
		public void setStatus(short status) {
			this.status = status;
		}
		public String getTarget() {
			return target;
		}
		public void setTarget(String target) {
			this.target = target;
		}
		public int getOrder() {
			return order;
		}
		public void setOrder(int order) {
			this.order = order;
		}
		public boolean isSubMenuAndSuperMenu() {
			return isSubMenuAndSuperMenu;
		}
		public void setSubMenuAndSuperMenu(boolean isSubMenuAndSuperMenu) {
			this.isSubMenuAndSuperMenu = isSubMenuAndSuperMenu;
		}
	}
}
