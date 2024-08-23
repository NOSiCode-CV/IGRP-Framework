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

import nosi.base.ActiveRecord.RestrictionImpl;
import nosi.core.config.ConfigApp;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.ResultSet.Record;
import nosi.core.webapp.security.EncrypDecrypt;

import static nosi.core.i18n.Translator.gt;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.Column;

@Entity
@Table(name = "tbl_menu")
public class Menu extends IGRPBaseActiveRecord<Menu> implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2363727513490936688L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable = false)
	private String descr;
	private int orderby;
	private int status;
	private int flg_base;
	private String target;
	private String menu_icon;
	@ManyToOne
	@JoinColumn(name = "action_fk", foreignKey = @ForeignKey(name = "MENU_ACTION_FK"), nullable = true)
	private Action action;
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "env_fk", foreignKey = @ForeignKey(name = "MENU_ENV_FK"), nullable = false)
	private Application application;
	@OneToOne
	@JoinColumn(name = "self_fk", foreignKey = @ForeignKey(name = "MENU_SELF_FK"), nullable = true)
	private Menu menu;
	@Transient
	private Organization organization;

	@Column(length = 2000)
	private String link;

	@Transient
	private boolean isInserted;
	@Transient
	private static final String sqlMenuByProfile = " SELECT prof.org_fk,prof.prof_type_fk,m_sub.id,m_sub.orderby,m_sub.descr,m_sub.target,m_sub.status,m_sub.menu_icon,m_sub.link,"
			+ " m_super.id as id_menu_pai,m_super.descr as descr_menu_pai,"
			+ " ac.page,ac.action,ac.versao,ac.tipo,env_a.dad as dad_app_page,env_prof.dad as dad_app_profile,env_a.externo as external,env_a.url as url, "
			+ " case WHEN (m_super.self_fk is not null AND m_super.self_fk=m_super.id) then 1 else 0 END as isSubMenuAndSuperMenu "
			+ " FROM tbl_profile prof INNER JOIN tbl_menu m_sub ON prof.type_fk=m_sub.id AND prof.type='MEN' "
			+ " LEFT JOIN tbl_menu m_super ON m_sub.self_fk=m_super.id "
			+ " LEFT JOIN tbl_action ac ON ac.id=m_sub.action_fk "
			+ " LEFT JOIN tbl_env env_a ON env_a.id=ac.env_fk "
			+ " LEFT JOIN tbl_profile_type prof_type ON prof_type.id=prof.prof_type_fk "
			+ " LEFT JOIN tbl_env env_prof ON env_prof.id=prof_type.env_fk "
			+ " WHERE prof.org_fk=:org_fk AND prof.prof_type_fk=:prof_type_fk AND env_prof.dad=:dad AND m_sub.status=:status";
	@Transient
	private static final String sqlMenuByUser = " SELECT prof.org_fk,prof.prof_type_fk,m_sub.id,m_sub.orderby,m_sub.descr,m_sub.target,m_sub.status,m_sub.menu_icon,m_sub.link,"
			+ " m_super.id as id_menu_pai,m_super.descr as descr_menu_pai,"
			+ " ac.page,ac.action,ac.versao,ac.tipo,env_a.dad as dad_app_page,env_prof.dad as dad_app_profile,env_a.externo as external,env_a.url as url, "
			+ " case WHEN (m_super.self_fk is not null AND m_super.self_fk=m_super.id) then 1 else 0 END as isSubMenuAndSuperMenu "
			+ " FROM tbl_profile prof INNER JOIN tbl_menu m_sub ON prof.type_fk=m_sub.id AND prof.type='MEN_USER' AND user_fk=:user_fk"
			+ " LEFT JOIN tbl_menu m_super ON m_sub.self_fk=m_super.id "
			+ " LEFT JOIN tbl_action ac ON ac.id=m_sub.action_fk "
			+ " LEFT JOIN tbl_env env_a ON env_a.id=ac.env_fk "
			+ " LEFT JOIN tbl_profile_type prof_type ON prof_type.id=prof.prof_type_fk "
			+ " LEFT JOIN tbl_env env_prof ON env_prof.id=prof_type.env_fk "
			+ " WHERE prof.org_fk=:org_fk AND prof.prof_type_fk=:prof_type_fk AND env_prof.dad=:dad AND m_sub.status=:status ";

	public Menu() {
	}

	public Menu(String descr, int orderby, int status, int flg_base, String target, Action action,
			Application application, Menu menu) {
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

	public String getMenu_icon() {
		return menu_icon;
	}

	public void setMenu_icon(String menu_icon) {
		this.menu_icon = menu_icon;
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

	public boolean getPermissionMen(String app, String page) {
		RestrictionImpl r = new RestrictionImpl(Menu.class, "obj_" +Menu.class.getSimpleName().toLowerCase());
		Long m = new Menu().find()
				.where("action.page", "=", page)
				.andWhere(r.equals("application.dad",  app)
						.and().equals("status",  1)
						.or().equals("flg_base", 1))
				.getCount();
		return m > 0;
	}

	public List<Menu> getMyMen_de_env(int env_fk) {
		// First shows all the app pages than all the public pages in the menu
		List<Menu> list = new Menu().find().andWhere("action", "notnull").andWhere("status", "=", 1)
				.andWhere("application", "=", env_fk).all();
		List<Menu> menus_App = new Menu().find().andWhere("action", "notnull").andWhere("flg_base", "=", 1)
				.andWhere("status", "=", 1).andWhere("application", "<>", env_fk).all();

		if (list != null) {
			list.addAll(menus_App);
			return list;
		}
		return menus_App;
	}

	public LinkedHashMap<String, List<MenuProfile>> getMyMenu() {
		LinkedHashMap<String, List<MenuProfile>> list = new LinkedHashMap<>();
		final String currentDad = Core.getCurrentDad();
		final Integer currentOrganization = Core.getCurrentOrganization();
		final Integer currentProfile = Core.getCurrentProfile();
		final String deployedWarName = Core.getDeployedWarName();
		final String aux = Igrp.getInstance().getServlet().getInitParameter("default_language");
		final Record row = Core.query(this.getConnectionName(), sqlMenuByProfile).union().select(sqlMenuByUser)
				.addInt("org_fk", currentOrganization).addInt("prof_type_fk", currentProfile)
				.addString("dad", currentDad).addInt("status", 1).addInt("org_fk", currentOrganization)
				.addInt("prof_type_fk", currentProfile).addString("dad", currentDad).addInt("status", 1)
				.addInt("user_fk", Core.getCurrentUser().getId()).orderByAsc("orderby").getRecordList();
		if (row.RowList != null) {
			row.RowList.forEach(r -> {
				// Get Menu Pai
				MenuProfile ms = new MenuProfile();
				ms.setId(r.getInt("id"));
				ms.setOrder(r.getInt("orderby"));
				ms.setTitle(r.getString("descr"));
				ms.setTarget(r.getString("target"));
				ms.setStatus(r.getShort("status"));
				ms.setMenu_icon(r.getString("menu_icon"));
				String linky = r.getString("link");
				if (linky != null && !linky.trim().isEmpty()) {
					final String currentOrganizationCode = Core.getCurrentOrganizationCode();
					final String currentProfileCode = Core.getCurrentProfileCode();
					if (linky.contains("$CONTEXT$"))
						linky = linky.replace("$CONTEXT$", String.format("%s:%s:%s", currentDad, currentOrganizationCode, currentProfileCode)).replace("$PARAMS$", "");
					ms.setLink(linky);
					ms.setType(2);
				} else {
					
					if (r.getString("page") != null) {
						if (r.getInt("tipo") == 1) { // If it is a public page ...
							ms.setType(1);
							
							ms.setLink(r.getString("dad_app_page") + "/" + r.getString("page") + "/"
									+ r.getString("action") + "&dad=" + currentDad + "&isPublic=1&lang="
									+ (Core.isNull(aux) ? "pt_PT" : aux) /* + "&target=_blank" */);
						} else {

							final int external = r.getInt("external");
							if (!r.getString("dad_app_page").equals("tutorial")
									&& !r.getString("dad_app_page").equals("igrp_studio")
									&& !r.getString("dad_app_page").equals("igrp")
									&& !r.getString("dad_app_page").equals(currentDad)
									&& external != 0) {

								ms.setType(2);

								
								// Externo
								final String url = r.getString("url");
								if (external == 1) {
									if (deployedWarName.equals(url)) {
										ms.setType(3);
										ms.setLink(EncrypDecrypt.encrypt(r.getString("dad_app_page") + "/"
												+ r.getString("page") + "/" + r.getString("action")) + "&dad="
												+ currentDad);
									} else {
										String _u = buildMenuUrlByDadUsingAutentika(r.getString("dad_app_page"),
												r.getString("dad_app_page"), r.getString("page"));
										ms.setLink(_u);
									}
								}
								// Custom host folder
								if (external == 2) {
									if (deployedWarName.equals(url)) {
										ms.setType(3);
										ms.setLink(EncrypDecrypt.encrypt(r.getString("dad_app_page") + "/"
												+ r.getString("page") + "/" + r.getString("action")) + "&dad="
												+ currentDad);
									} else {
										String _u = buildMenuUrlByDadUsingAutentika(url,
												r.getString("dad_app_page"), r.getString("page")); // Custom Dad
										ms.setLink(_u);
									}
								}
							} else
								ms.setLink(EncrypDecrypt.encrypt(r.getString("dad_app_page") + "/" + r.getString("page")
										+ "/" + r.getString("action")) + "&dad=" + currentDad);
						}
					}
				}
				ms.setSubMenuAndSuperMenu(r.getInt("isSubMenuAndSuperMenu") == 1);

				List<MenuProfile> value = new ArrayList<>();
				value.add(ms);

				if (list.containsKey(r.getString("descr_menu_pai"))) {
					value.addAll(list.get(r.getString("descr_menu_pai")));
				}
				list.put(r.getString("descr_menu_pai"), value);
			});
		}
		return list;
	}

	public Map<Integer, String> getListPrincipalMenus() {
		LinkedHashMap<Integer, String> lista = new LinkedHashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		for (Menu m : this.findAll(this.getCriteria().where(this.getBuilder().isNull(this.getRoot().get("menu"))))) {
			lista.put(m.getId(), m.getDescr());
		}
		return lista;
	}

	public Map<Integer, String> getListPrincipalMenus(int app) {
		LinkedHashMap<Integer, String> lista = new LinkedHashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		List<Map<String, Object>> aux = this.find().keepConnection().andWhere("application", "=", app).andWhereIsNull("menu")
				.allColumns("id", "descr");
		for (Map<String, Object> m : aux) {
			lista.put((Integer) m.get("id"), m.get("descr") + "");
		}
		return lista;
	}

	// Returns the actions/Pages of all the items of the menu of a app
	public Map<Integer, String> getListAction(int app) {
		LinkedHashMap<Integer, String> lista = new LinkedHashMap<>();
		lista.put(null, gt("-- Selecionar --"));
		List<Menu> aux = this.find().keepConnection()
				.andWhere("application", "=", app)
				.andWhere("status", "=", 1)
				.andWhereNotNull("action")
				.orWhere("flg_base", "=", 1)
					.andWhereNotNull("action")
				.orderBy("flg_base").all();
		for (Menu m : aux) {

			lista.put(m.getAction().getId(),
					m.getFlg_base() == 0 ? m.getDescr() : m.getDescr() + " [" + m.getApplication().getDad() + "]");
		}
		return lista;
	}

	// Returns the actions/Pages of all the items of the menu of a app of a Org
	public Map<Integer, String> getListActionByOrg(int appID, int orgID) {
		LinkedHashMap<Integer, String> lista = new LinkedHashMap<>();
		lista.put(null, gt("-- Selecionar --"));

		String sqlMenuByApp = "SELECT m.id,m.descr,m.flg_base,m.action_fk  FROM tbl_menu m where  ((m.env_fk=:env_fk or  m.flg_base=1) and EXISTS (SELECT type_fk from tbl_profile p where p.type='MEN' AND p.org_fk=:org_fk AND p.type_fk=m.id ) ) ";
		// String sqlPublicMenu = "SELECT m.id,m.descr,m.flg_base,m.action_fk,(CASE WHEN
		// EXISTS (SELECT type_fk from tbl_profile where type='MEN' AND org_fk=:org_fk
		// AND type_fk=m.id) then 1 else 0 END) as isInserted FROM tbl_menu m WHERE
		// m.action_fk is not null AND m.status=1 AND m.env_fk<>:env_fk AND
		// m.flg_base=1";
		ResultSet.Record record = Core.query(this.getConnectionName(), sqlMenuByApp).addInt("org_fk", orgID)
				.addInt("env_fk", appID).orderByAsc("flg_base").getRecordList();
		record.RowList.forEach(row -> lista.put(row.getInt("action_fk"), row.getString("descr")));

		return lista;
	}

	@Override
	public String toString() {
		return "Menu [id=" + id + ", descr=" + descr + ", orderby=" + orderby + ", status=" + status + ", flg_base="
				+ flg_base + ", target=" + target + ", action=" + action + ", application=" + application + ", menu="
				+ menu + ", organization=" + organization + "]";
	}

	private String buildMenuUrlByDadUsingAutentika(String dad, String app, String page) {
		String url = "#";
		try {
			Action pagina = new Action().find().andWhere("application.dad", "=", app).andWhere("page", "=", page).one();
			if (pagina != null) {
				String orgCode = Core.getCurrentOrganizationCode();
				String profCode = Core.getCurrentProfileCode();
				String stateValue = Core.buildStateValueForSsoAutentika("PAGE", pagina.getId() + "", app, orgCode,
						profCode, null);
				url = ConfigApp.getInstance().getAutentikaUrlForSso();
				url = url.replace("/IGRP/", "/" + dad + "/").replace("state=igrp", "state=" + stateValue);
			}
		} catch (Exception ignored) {
		}
		return url;
	}

	// To integrate with PL-SQL services as a Rest
	public List<MenuProfile> getMyMenu(String currentDad, Integer userId, Integer currentOrg, Integer currentProf) {
		List<MenuProfile> list = new ArrayList<>();
		Record row = Core.query(this.getConnectionName(), sqlMenuByProfile).union().select(sqlMenuByUser)
				.addInt("org_fk", currentOrg).addInt("prof_type_fk", currentProf).addString("dad", currentDad)
				.addInt("status", 1).addInt("org_fk", currentOrg).addInt("prof_type_fk", currentProf)
				.addString("dad", currentDad).addInt("status", 1).addInt("user_fk", userId).orderByAsc("orderby")
				.getRecordList();
		if (row.RowList != null) {
			row.RowList.forEach(r -> {
				// Get Menu Pai
				MenuProfile ms = new MenuProfile();
				ms.setId(r.getInt("id"));
				ms.setOrder(r.getInt("orderby"));
				ms.setTitle(r.getString("descr"));
				ms.setTarget(r.getString("target"));
				ms.setStatus(r.getShort("status"));
				ms.setMenu_icon(r.getString("menu_icon"));
				ms.setPage(r.getString("page"));
				ms.setApp(r.getString("dad_app_page"));
				ms.setAction(r.getString("action"));

				ms.setSelf_id(r.getInt("self_fk"));

				ms.setSubMenuAndSuperMenu(r.getInt("isSubMenuAndSuperMenu") == 1);

				list.add(ms);
			});
		}
		return list;
	}

	public static class MenuProfile {
		private Integer id;
		private String title;
		private String link;
		private short status;
		private String menu_icon;
		private String target;
		private int order;
		private boolean isSubMenuAndSuperMenu;

		private String page;
		private String app;
		private String action;

		private Integer self_id;

		// 0 - normal menu; 1 - menu para uma pagina externa publica; 2 - menu para uma
		// pagina externa
		private int type;

		public String getMenu_icon() {
			return menu_icon;
		}

		public void setMenu_icon(String menu_icon) {
			this.menu_icon = menu_icon;
		}

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

		public int getType() {
			return type;
		}

		public void setType(int type) {
			this.type = type;
		}

		public String getPage() {
			return page;
		}

		public void setPage(String page) {
			this.page = page;
		}

		public String getApp() {
			return app;
		}

		public void setApp(String app) {
			this.app = app;
		}

		public String getAction() {
			return action;
		}

		public void setAction(String action) {
			this.action = action;
		}

		public Integer getSelf_id() {
			return self_id;
		}

		public void setSelf_id(Integer self_id) {
			this.self_id = self_id;
		}
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

}
