package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import javax.persistence.Column;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.helpers.Permission;
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
				.andWhere("organization", "=",Permission.getCurrentOrganization())
				.andWhere("profileType", "=",Permission.getCurrentPerfilId())
				.all();
//		EntityManager em = this.getEntityManagerFactory().createEntityManager();
//		EntityTransaction t =  em.getTransaction();
//		t.begin();
//		String sql =  "SELECT * FROM GLB_V_PROF_MENU WHERE ORG_FK=? AND PROF_TYPE_FK=? AND ID IN (SELECT ID FROM GLB_V_ORG_MENU WHERE ORG_FK=? AND ENV_FK=?) AND ACTION_FK=? "
//					+ "UNION "
//					+ "SELECT M1.ID, M2.DESCR, M1.DESCR DESCR_MENU, M1.ORDERBY, M1.ENV_FK, M1.SELF_FK, M1.ACTION_FK, 0 as PROF_TYPE_FK, 0 as USER_FK, null as PROF_CODE, null as PROF_NAME, 0 as ORG_FK, M1.STATUS, M1.TARGET, 0 as ENV_FK_PROF_TYPE, 0 as FLG_BASE "
//					+ "FROM tbl_MENU M1, tbl_menu M2 "
//					+ "WHERE M1.SELF_FK=M2.ID AND M1.flg_base=1 "
//					+ "AND M1.ENV_FK=? "
//					+ "ORDER BY orderby ";
//		Query q =  em.createNativeQuery(sql);
//		q.setParameter(1,Permission.getCurrentPerfilId());
//		q.setParameter(2,Permission.getCurrentOrganization());
//		q.setParameter(3,Permission.getCurrentOrganization());	
//		Application a = new Application().find().andWhere("dad", "=", app).one();
//		q.setParameter(4,(a!=null && a.getId()>0)?a.getId():-1);	
//		Action ac = new Action().find().andWhere("page", "=", Igrp.getInstance().getCurrentPageName())
//									   .andWhere("action","=",Igrp.getInstance().getCurrentActionName())
//									   .one();
//		q.setParameter(5,(ac!=null && ac.getId()>0)?ac.getId():-1);		
//		q.setParameter(6,(a!=null && a.getId()>0)?a.getId():-1);	
//		int x = q.getResultList().size();
//		t.commit();
//		em.close();
		return p.size() > 0;
	}

	@SuppressWarnings("unchecked")
	public HashMap<String,List<Menu>> getMyMenu() {
		EntityManager em = this.getEntityManagerFactory().createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		String sql = "SELECT * FROM GLB_V_PROF_MENU WHERE ORG_FK=? AND PROF_TYPE_FK=? AND env_fk_prof_type=? AND ID IN (SELECT ID FROM GLB_V_ORG_MENU WHERE ORG_FK=?)";
//					+ "UNION "
//					+ "SELECT M1.ID, M2.DESCR, M1.DESCR DESCR_MENU, M1.ORDERBY, M1.ENV_FK, M1.SELF_FK, M1.ACTION_FK, 0 as PROF_TYPE_FK, 0 as USER_FK, null as PROF_CODE, null as PROF_NAME, 0 as ORG_FK, M1.STATUS, M1.TARGET, 0 as ENV_FK_PROF_TYPE, 1 as FLG_BASE "
//					+ "FROM tbl_MENU M1, tbl_menu M2 "
//					+ "WHERE M1.SELF_FK=M2.ID AND M1.flg_base=1 AND M1.ID NOT IN (SELECT TYPE_FK FROM tbl_profile WHERE TYPE=? AND PROF_TYPE_FK=? AND ORG_FK=?) "
//					+ "ORDER BY orderby";
		TypedQuery<Object[]> q = (TypedQuery<Object[]>) em.createNativeQuery(sql);
		q.setParameter(1,Permission.getCurrentOrganization());
		q.setParameter(2,Permission.getCurrentPerfilId());		
		Application a = new Application();
		a = a.findOne(a.getCriteria().where(a.getBuilder().equal(a.getRoot().get("dad"),Permission.getCurrentEnv() )));
		q.setParameter(3, a.getId());
		q.setParameter(4,Permission.getCurrentOrganization());	
//		q.setParameter(5,"MEN");	
//		q.setParameter(6,Permission.getCurrentPerfilId());	
//		q.setParameter(7,Permission.getCurrentOrganization());	
		HashMap<String,List<Menu>> list = new HashMap<>();
		for(Object[] o: q.getResultList()){
			if(o instanceof Object[]){
				Menu m = new Menu();
				m.setId(Integer.parseInt(o[5].toString()));
				m.setDescr(o[1].toString());
//	not working...			m.setOrderby((int) o[]); 
				Menu selfM = new Menu();
				selfM.setId(Integer.parseInt(o[0].toString()));
				selfM.setDescr(o[2].toString());
				selfM.setOrderby(Integer.parseInt(o[3].toString()));
				Action ac = new Action();
				Application ap = new Application();
				ap = ap.findOne(Integer.parseInt(o[4].toString()));
				ac = ac.findOne(Integer.parseInt(o[6].toString()));
				m.setAction(ac);
				selfM.setAction(ac);
				selfM.setApplication(ap);
				selfM.setStatus(Integer.parseInt(o[12].toString()));
				selfM.setTarget(o[13].toString());
				selfM.setFlg_base(Integer.parseInt(o[15].toString()));
				m.setMenu(selfM);	
				List<Menu> value = new ArrayList<>();
				value.add(m);
				if(list.containsKey(m.getDescr())){
					value.addAll(list.get(m.getDescr()));
				}
				list.put(m.getDescr(), value);	
			}
		}
		t.commit();
		em.close();
		return list;
	}

	@Transient
	public String getLink() {
		if(this.getAction()!=null){
			String dad = this.getAction().getApplication().getDad().toLowerCase();
			return dad+"/"+
				   this.getAction().getPage()+"/"+
				   this.getAction().getAction()+"&dad="+dad;
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
		List<Menu> aux = this.getEntityManagerFactory().createEntityManager().createQuery("select t from Menu t where t.application.id = :_a and t.menu is null ")
				.setParameter("_a", app)
				.getResultList();
		for(Menu m : aux){
			lista.put(m.getId(),m.getDescr());
		}
		return lista;
	}	
	
	@SuppressWarnings("unchecked")
	public List<Menu> searchMen(){
		List<Menu> list = new ArrayList<>();
		String sql = "SELECT DISTINCT M1.descr super_title, M2.descr sub_title, M2.id, M2.status,M2.flg_base, M1.id super_id,A.Page page"
		+ " FROM tbl_menu M1, tbl_menu M2, tbl_action A, tbl_profile prof"	
		    + " WHERE M2.SELF_FK = M1.ID AND A.ID = M2.ACTION_FK AND prof.type_fk = M2.id AND prof.type = ? ";
		sql = sql + (this.getApplication() != null ? "and (M1.env_fk = " + this.getApplication().getId() + " AND M2.env_fk = " + this.getApplication().getId() + ") " : "");
		sql = sql + (this.getMenu() != null ? " and M1.id = " + this.getMenu().getId() + " " : "");
		sql = sql + (this.getOrganization()!=null? " AND prof.org_fk= "+this.getOrganization().getId():"");
		EntityManager em = this.getEntityManagerFactory().createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		TypedQuery<Object[]> q = (TypedQuery<Object[]>) em.createNativeQuery(sql);
		q.setParameter(1,"MEN");	
		for(Object[] obj:q.getResultList()){
			Menu m = new Menu();
			Menu sm = new Menu();
			m.setDescr(obj[0].toString());
			sm.setDescr(obj[1].toString());
			sm.setId(Integer.parseInt(obj[5].toString()));
			m.setStatus(Integer.parseInt(obj[3].toString()));
			m.setFlg_base(Integer.parseInt(obj[4].toString()));
			m.setId(Integer.parseInt(obj[2].toString()));
			Action ac = new Action();
			ac.setPage(obj[6].toString());
			m.setAction(ac);
			m.setMenu(sm);
			list.add(m);
		}
		t.commit();
		em.close();
		return list;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", descr=" + descr + ", orderby=" + orderby + ", status=" + status + ", flg_base="
				+ flg_base + ", target=" + target + ", action=" + action + ", application=" + application + ", menu="
				+ menu + ", organization=" + organization + "]";
	}
	
	
}
