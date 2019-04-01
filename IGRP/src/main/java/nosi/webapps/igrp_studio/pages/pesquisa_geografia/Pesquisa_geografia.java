package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class Pesquisa_geografia extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	private List<Treemenu_1> treemenu_1 = new ArrayList<>();	
	public void setTreemenu_1(List<Treemenu_1> treemenu_1){
		this.treemenu_1 = treemenu_1;
	}
	public List<Treemenu_1> getTreemenu_1(){
		return this.treemenu_1;
	}
	@RParam(rParamName = "p_treemenu_1_id")
	private String[] p_treemenu_1_id;
	@RParam(rParamName = "p_treemenu_1_del")
	private String[] p_treemenu_1_del;
	
	public void setP_treemenu_1_id(String[] p_treemenu_1_id){
		this.p_treemenu_1_id = p_treemenu_1_id;
	}
	public String[] getP_treemenu_1_id(){
		return this.p_treemenu_1_id;
	}
	
	public void setP_treemenu_1_del(String[] p_treemenu_1_del){
		this.p_treemenu_1_del = p_treemenu_1_del;
	}
	public String[] getP_treemenu_1_del(){
		return this.p_treemenu_1_del;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
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
