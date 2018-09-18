package nosi.webapps.tutorial.pages.defaultpage;

import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;

public class DefaultPage extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_infopanel_1_title")
	private String infopanel_1_title;
	@RParam(rParamName = "p_infopanel_1_val")
	private String infopanel_1_val;
	@RParam(rParamName = "p_infopanel_1_url")
	private String infopanel_1_url;
	@RParam(rParamName = "p_infopanel_1_bg")
	private String infopanel_1_bg;
	@RParam(rParamName = "p_infopanel_1_icn")
	private String infopanel_1_icn;
	@RParam(rParamName = "p_carousel_1_label")
	private String carousel_1_label;
	@RParam(rParamName = "p_carousel_1_img")
	private String carousel_1_img;
	
	private List<Carousel_1> carousel_1 = new ArrayList<>();	
	public void setCarousel_1(List<Carousel_1> carousel_1){
		this.carousel_1 = carousel_1;
	}
	public List<Carousel_1> getCarousel_1(){
		return this.carousel_1;
	}
	@RParam(rParamName = "p_carousel_1_id")
	private String[] p_carousel_1_id;
	@RParam(rParamName = "p_carousel_1_del")
	private String[] p_carousel_1_del;
	
	public void setP_carousel_1_id(String[] p_carousel_1_id){
		this.p_carousel_1_id = p_carousel_1_id;
	}
	public String[] getP_carousel_1_id(){
		return this.p_carousel_1_id;
	}
	
	public void setP_carousel_1_del(String[] p_carousel_1_del){
		this.p_carousel_1_del = p_carousel_1_del;
	}
	public String[] getP_carousel_1_del(){
		return this.p_carousel_1_del;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setInfopanel_1_title(String infopanel_1_title){
		this.infopanel_1_title = infopanel_1_title;
	}
	public String getInfopanel_1_title(){
		return this.infopanel_1_title;
	}
	
	public void setInfopanel_1_val(String infopanel_1_val){
		this.infopanel_1_val = infopanel_1_val;
	}
	public String getInfopanel_1_val(){
		return this.infopanel_1_val;
	}
	
	public void setInfopanel_1_url(String infopanel_1_url){
		this.infopanel_1_url = infopanel_1_url;
	}
	public String getInfopanel_1_url(){
		return this.infopanel_1_url;
	}
	
	public void setInfopanel_1_bg(String infopanel_1_bg){
		this.infopanel_1_bg = infopanel_1_bg;
	}
	public String getInfopanel_1_bg(){
		return this.infopanel_1_bg;
	}
	
	public void setInfopanel_1_icn(String infopanel_1_icn){
		this.infopanel_1_icn = infopanel_1_icn;
	}
	public String getInfopanel_1_icn(){
		return this.infopanel_1_icn;
	}
	
	public void setCarousel_1_label(String carousel_1_label){
		this.carousel_1_label = carousel_1_label;
	}
	public String getCarousel_1_label(){
		return this.carousel_1_label;
	}
	
	public void setCarousel_1_img(String carousel_1_img){
		this.carousel_1_img = carousel_1_img;
	}
	public String getCarousel_1_img(){
		return this.carousel_1_img;
	}


	public static class Carousel_1 extends IGRPTable.Table{
		private String carousel_1_label;
		private String carousel_1_img;
		public void setCarousel_1_label(String carousel_1_label){
			this.carousel_1_label = carousel_1_label;
		}
		public String getCarousel_1_label(){
			return this.carousel_1_label;
		}

		public void setCarousel_1_img(String carousel_1_img){
			this.carousel_1_img = carousel_1_img;
		}
		public String getCarousel_1_img(){
			return this.carousel_1_img;
		}

	}

	public void loadCarousel_1(BaseQueryInterface query) {
		this.setCarousel_1(this.loadTable(query,Carousel_1.class));
	}

}
