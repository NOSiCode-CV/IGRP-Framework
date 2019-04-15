package nosi.webapps.igrp.pages.pesquisa_cae;


import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Pesquisa_cae extends Model{		
	
	private List<Treemenu_1> treemenu_1 = new ArrayList<>();	
	public void setTreemenu_1(List<Treemenu_1> treemenu_1){
		this.treemenu_1 = treemenu_1;
	}
	public List<Treemenu_1> getTreemenu_1(){
		return this.treemenu_1;
	}



	public static class Treemenu_1 extends IGRPTable.Table{
		private IGRPLink treemenu_1_link;
		private String treemenu_1_link_desc;
		private String treemenu_1_tmid;
		private Integer treemenu_1_parent;
		private String treemenu_1_icon;
		private String treemenu_1_child;
		private String treemenu_1_active;
		public IGRPLink setTreemenu_1_link(String app,String page,String action){
			this.treemenu_1_link = new IGRPLink(app,page,action);
			return this.treemenu_1_link;
		}
		public IGRPLink getTreemenu_1_link(){
			return this.treemenu_1_link;
		}
		public void setTreemenu_1_link_desc(String treemenu_1_link_desc){
			this.treemenu_1_link_desc = treemenu_1_link_desc;
		}
		public String getTreemenu_1_link_desc(){
			return this.treemenu_1_link_desc;
		}
	public IGRPLink setTreemenu_1_link(String link){
		this.treemenu_1_link = new IGRPLink(link);
		return this.treemenu_1_link;
	}
	public IGRPLink setTreemenu_1_link(Report link){
		this.treemenu_1_link = new IGRPLink(link);
		return this.treemenu_1_link;
	}

		public void setTreemenu_1_tmid(String treemenu_1_tmid){
			this.treemenu_1_tmid = treemenu_1_tmid;
		}
		public String getTreemenu_1_tmid(){
			return this.treemenu_1_tmid;
		}

		public void setTreemenu_1_parent(Integer treemenu_1_parent){
			this.treemenu_1_parent = treemenu_1_parent;
		}
		public Integer getTreemenu_1_parent(){
			return this.treemenu_1_parent;
		}

		public void setTreemenu_1_icon(String treemenu_1_icon){
			this.treemenu_1_icon = treemenu_1_icon;
		}
		public String getTreemenu_1_icon(){
			return this.treemenu_1_icon;
		}

		public void setTreemenu_1_child(String treemenu_1_child){
			this.treemenu_1_child = treemenu_1_child;
		}
		public String getTreemenu_1_child(){
			return this.treemenu_1_child;
		}

		public void setTreemenu_1_active(String treemenu_1_active){
			this.treemenu_1_active = treemenu_1_active;
		}
		public String getTreemenu_1_active(){
			return this.treemenu_1_active;
		}

	}

	public void loadTreemenu_1(BaseQueryInterface query) {
		this.setTreemenu_1(this.loadTable(query,Treemenu_1.class));
	}

}
