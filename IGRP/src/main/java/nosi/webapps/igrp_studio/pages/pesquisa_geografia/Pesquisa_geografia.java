package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
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
	
	private List<Geo> geo = new ArrayList<>();	
	public void setGeo(List<Geo> geo){
		this.geo = geo;
	}
	public List<Geo> getGeo(){
		return this.geo;
	}
	@RParam(rParamName = "p_geo_id")
	private String[] p_geo_id;
	@RParam(rParamName = "p_geo_del")
	private String[] p_geo_del;
	
	public void setP_geo_id(String[] p_geo_id){
		this.p_geo_id = p_geo_id;
	}
	public String[] getP_geo_id(){
		return this.p_geo_id;
	}
	
	public void setP_geo_del(String[] p_geo_del){
		this.p_geo_del = p_geo_del;
	}
	public String[] getP_geo_del(){
		return this.p_geo_del;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


	public static class Geo extends IGRPTable.Table{
		private IGRPLink geo_link;
		private String geo_link_desc;
		private int geo_tmid;
		private int geo_parent;
		private String geo_icon;
		private String geo_child;
		private String geo_active;
		public IGRPLink setGeo_link(String app,String page,String action){
			this.geo_link = new IGRPLink(app,page,action);
			return this.geo_link;
		}
		public IGRPLink getGeo_link(){
			return this.geo_link;
		}
		public void setGeo_link_desc(String geo_link_desc){
			this.geo_link_desc = geo_link_desc;
		}
		public String getGeo_link_desc(){
			return this.geo_link_desc;
		}
	public IGRPLink setGeo_link(String link){
		this.geo_link = new IGRPLink(link);
		return this.geo_link;
	}
	public IGRPLink setGeo_link(Report link){
		this.geo_link = new IGRPLink(link);
		return this.geo_link;
	}

		public void setGeo_tmid(int geo_tmid){
			this.geo_tmid = geo_tmid;
		}
		public int getGeo_tmid(){
			return this.geo_tmid;
		}

		public void setGeo_parent(int geo_parent){
			this.geo_parent = geo_parent;
		}
		public int getGeo_parent(){
			return this.geo_parent;
		}

		public void setGeo_icon(String geo_icon){
			this.geo_icon = geo_icon;
		}
		public String getGeo_icon(){
			return this.geo_icon;
		}

		public void setGeo_child(String geo_child){
			this.geo_child = geo_child;
		}
		public String getGeo_child(){
			return this.geo_child;
		}

		public void setGeo_active(String geo_active){
			this.geo_active = geo_active;
		}
		public String getGeo_active(){
			return this.geo_active;
		}

	}

	public void loadGeo(BaseQueryInterface query) {
		this.setGeo(this.loadTable(query,Geo.class));
	}

}
