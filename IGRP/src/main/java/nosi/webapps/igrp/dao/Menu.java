package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import javax.persistence.Entity;
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
import java.util.HashMap;
import java.util.List;
import javax.persistence.Column;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.ResultSet.Record;
import nosi.core.webapp.helpers.EncrypDecrypt;
import static nosi.core.i18n.Translator.gt;

@Entity
@Table(name="tbl_menu")
public class Menu extends BaseActiveRecord<Menu> implements Serializable{
	
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
	@ManyToOne
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="MENU_ENV_FK"),nullable=false)
	private Application application;
	@OneToOne
	@JoinColumn(name="self_fk",foreignKey=@ForeignKey(name="MENU_SELF_FK"),nullable=true)
	private Menu menu;	
	@Transient
	private Organization organization;
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
	

	public HashMap<String,List<Menu>> getMyMenu() {
		HashMap<String,List<Menu>> list = new HashMap<>();
		String sql = "select * from glb_v_prof_menu where status=1 and org_fk=:org_fk and prof_type_fk=:prof_type_fk and env_fk_prof_type=:env_fk_prof_type and id in (select id from glb_v_org_menu where org_fk=:org_fk)";
		Record row = Core.query(this.getConnectionName(),sql)
						 .addInt("org_fk", Core.getCurrentOrganization())
						 .addInt("prof_type_fk", Core.getCurrentProfile())
						 .addInt("env_fk_prof_type", Core.getCurrentApp().getId())
						 .addInt("org_fk", Core.getCurrentOrganization())
						 .getRecordList();
		row.RowList.forEach(r->{
			Menu m = new Menu();
			m.setId(r.getInt("self_fk"));
			m.setDescr(r.getString("descr"));
			Menu selfM = new Menu();
			selfM.setId(r.getInt("id"));
			selfM.setDescr(r.getString("descr_menu"));
			selfM.setOrderby(r.getInt("orderby"));
			Action ac = new Action();
			Application ap = new Application();
			ap = ap.findOne(r.getInt("env_fk"));
			ac = ac.findOne(r.getInt("action_fk"));
			m.setAction(ac);
			selfM.setAction(ac);
			selfM.setApplication(ap);
			selfM.setStatus(r.getInt("status"));
			selfM.setTarget(r.getString("target"));
			selfM.setFlg_base(r.getInt("flg_base"));
			m.setMenu(selfM);	
			List<Menu> value = new ArrayList<>();
			value.add(m);
			if(list.containsKey(m.getDescr())){
				value.addAll(list.get(m.getDescr()));
			}
			list.put(m.getDescr(), value);
		});
		return list;
	}

	@Transient
	public String getLink() {
		if(this.getAction()!=null){
			String dad = this.getAction().getApplication().getDad().toLowerCase();
			return EncrypDecrypt.encrypt(dad+"/"+this.getAction().getPage()+"/"+this.getAction().getAction())+"&dad="+dad;
		}
		return null;
	}

	public HashMap<Integer, String> getListPrincipalMenus() {
		HashMap<Integer,String> lista = new HashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		for(Menu m:this.findAll(this.getCriteria().where(this.getBuilder().isNull(this.getRoot().get("menu"))))){
			lista.put(m.getId(),m.getDescr());
		}
		return lista;
	}	
	
	public HashMap<Integer, String> getListPrincipalMenus(int app) {
		HashMap<Integer,String> lista = new HashMap<>();
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
	
	
}
