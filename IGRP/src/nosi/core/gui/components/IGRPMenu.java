package nosi.core.gui.components;

import java.util.ArrayList;
import java.util.List;

/**
 * @author: Emanuel Pereira
 * 28 Sep 2017
 
* Description: class to generate xml for Menu
*
/*
<menus>
		<title>Activiti REST - </title>
		<link>redglobal.glb_db.save_favourite?p_id=</link>
		<menu>
			<title>Deployed</title>
			<submenu>
				<title>Processo ManipulaÃ§Ã£o</title>
				<link>https://nosiappsdev.gov.cv/redglobal_lab/!REDGLOBAL.GLB_DISPATCHER.main?igrpaddcbecdae=53599590500408406218&amp;p_env_dad=//ce&amp;p_env_menu=//C9C6C9CCCD&amp;p_prm_definitionId=ProcTeste1:1:150264&amp;p_prm_definitionKey=ProcTeste1&amp;p_prm_processName=PROCESSO MANIPULAA§A£O</link>
				<id />
				<status />
				<target>LEFT_MENU</target>
			</submenu>
			....
		</menu>
</menus>
*/
public class IGRPMenu extends IGRPComponent{
	private String title;
	private String link;
	private List<Menu> menus;
	private List<IGRPMenu> listMenu;
	
	public IGRPMenu(String tag_name) {
		super(tag_name);
	}
	
	public IGRPMenu(String title, String link) {
		this(null);
		this.title = title;
		this.link = link;
		this.menus = new ArrayList<>();
	}

	public IGRPMenu(String tag_name, String title, String link, List<Menu> menus) {
		this(tag_name, title);
		this.link = link;
		this.menus = menus;
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

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}
	
	public void addMenu(Menu menu){
		this.menus.add(menu);
	}
	
	public List<IGRPMenu> getListMenu() {
		return listMenu;
	}

	public void setListMenu(List<IGRPMenu> listMenu) {
		this.listMenu = listMenu;
	}


	public static class Menu{

		private String title;
		private List<SubMenu> submenus;
		
		public Menu(){
			this.submenus = new ArrayList<>();
		}
		public Menu(String title) {
			this();
			this.title = title;
		}
		
		public Menu(String title, List<SubMenu> submenus) {
			this(title);
			this.title = title;
			this.submenus = submenus;
		}

		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public List<SubMenu> getSubmenus() {
			return submenus;
		}
		public void setSubmenus(List<SubMenu> submenus) {
			this.submenus = submenus;
		}
		
		public void addSubMenu(String title,String link,String id, String status,String target){
			this.submenus.add(new SubMenu(title, link, id, status, target));
		}
		
		public void addSubMenu(SubMenu submenu){
			this.submenus.add(submenu);
		}
	}
	public static class SubMenu{
		private String title;
		private String link;
		private String id;
		private String status;
		private String target;
		
		public SubMenu(String title, String link, String id, String status, String target) {
			super();
			this.title = title;
			this.link = link;
			this.id = id;
			this.status = status;
			this.target = target;
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
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getStatus() {
			return status;
		}
		public void setStatus(String status) {
			this.status = status;
		}
		public String getTarget() {
			return target;
		}
		public void setTarget(String target) {
			this.target = target;
		}
	}
	@Override
	public String toString() {
		if(this.listMenu.size() > 0){
			for(IGRPMenu igrpMenu:this.listMenu){
				xml.startElement("menus");
				xml.setElement("title", igrpMenu.getTitle());
				xml.setElement("link", igrpMenu.getLink());
				for(Menu menu:igrpMenu.getMenus()){
					xml.startElement("menu");
						xml.setElement("title", menu.getTitle());
						for(SubMenu submenu:menu.getSubmenus()){
							xml.startElement("submenu");
								xml.setElement("title", submenu.getTitle());
								xml.setElement("link", submenu.getLink());
								xml.setElement("id", submenu.getId());
								xml.setElement("status", submenu.getStatus());
								xml.setElement("target", submenu.getTarget());
							xml.endElement();
						}
					xml.endElement();
				}
				xml.endElement();
			}
		}
		this.listMenu = null;
		return xml.toString();
	}
}
