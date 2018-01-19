/*---------------------- Create Model ----------------------*/
package nosi.webapps.igrp_studio.pages.bpmndesigner;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class BPMNDesigner extends Model{		
	@RParam(rParamName = "p_page_title_text")
	private String page_title_text;
	@RParam(rParamName = "p_data")
	private String data;
	@RParam(rParamName = "p_link_data")
	private String link_data;
	@RParam(rParamName = "p_area_name")
	private String area_name;
	@RParam(rParamName = "p_env_fk")
	private String env_fk;
	@RParam(rParamName = "p_link_add_area")
	private String p_link_add_area;
	@RParam(rParamName = "p_processos")
	private String processos;
	@RParam(rParamName = "p_bpmn")
	private String bpmn;

	private List<Context_menu> context_menu = new ArrayList<>();
	public void setContext_menu(List<Context_menu> context_menu){
		this.context_menu = context_menu;
	}
	public List<Context_menu> getcontext_menu(){
		return this.context_menu;
	}

	private List<Gen_table> gen_table = new ArrayList<>();
	public void setGen_table(List<Gen_table> gen_table){
		this.gen_table = gen_table;
	}
	public List<Gen_table> getgen_table(){
		return this.gen_table;
	}
	
	public void setPage_title_text(String page_title_text){
		this.page_title_text = page_title_text;
	}
	public String getPage_title_text(){
		return this.page_title_text;
	}
	
	public void setData(String data){
		this.data = data;
	}
	public String getData(){
		return this.data;
	}
	
	public void setLink_data(String link_data){
		this.link_data = link_data;
	}
	public String getLink_data(){
		return this.link_data;
	}
	
	public void setArea_name(String area_name){
		this.area_name = area_name;
	}
	public String getArea_name(){
		return this.area_name;
	}
	
	public void setEnv_fk(String env_fk){
		this.env_fk = env_fk;
	}
	public String getEnv_fk(){
		return this.env_fk;
	}
	
	public void setP_link_add_area(String p_link_add_area){
		this.p_link_add_area = p_link_add_area;
	}
	public String getP_link_add_area(){
		return this.p_link_add_area;
	}
	
	public void setProcessos(String processos){
		this.processos = processos;
	}
	public String getProcessos(){
		return this.processos;
	}
	
	public void setBpmn(String bpmn){
		this.bpmn = bpmn;
	}
	public String getBpmn(){
		return this.bpmn;
	}


	public static class Context_menu{
		private String ctx_nome;
		private String ctx_link;
		private String cxt_tipo;
		public void setCtx_nome(String ctx_nome){
			this.ctx_nome = ctx_nome;
		}
		public String getCtx_nome(){
			return this.ctx_nome;
		}

		public void setCtx_link(String ctx_link){
			this.ctx_link = ctx_link;
		}
		public String getCtx_link(){
			return this.ctx_link;
		}

		public void setCxt_tipo(String cxt_tipo){
			this.cxt_tipo = cxt_tipo;
		}
		public String getCxt_tipo(){
			return this.cxt_tipo;
		}

	}
	public static class Gen_table{
		private String title;
		private String id;
		private String id_pai;
		private String link;
		private String link_desc;
		private float id_objeto;
		private String tipo;
		private String link_add;
		private String link_edit;
		public void setTitle(String title){
			this.title = title;
		}
		public String getTitle(){
			return this.title;
		}

		public void setId(String id){
			this.id = id;
		}
		public String getId(){
			return this.id;
		}

		public void setId_pai(String id_pai){
			this.id_pai = id_pai;
		}
		public String getId_pai(){
			return this.id_pai;
		}

		public void setLink(String app,String page,String action){
			this.link = Config.getResolveUrl(app, page, action);
		}
		public void setLink(String link){
			this.link = link;
		}
		public String getLink(){
			return this.link;
		}
		public void setLink_desc(String link_desc){
			this.link_desc = link_desc;
		}
		public String getLink_desc(){
			return this.link_desc;
		}

		public void setId_objeto(float id_objeto){
			this.id_objeto = id_objeto;
		}
		public float getId_objeto(){
			return this.id_objeto;
		}

		public void setTipo(String tipo){
			this.tipo = tipo;
		}
		public String getTipo(){
			return this.tipo;
		}

		public void setLink_add(String link_add){
			this.link_add = link_add;
		}
		public String getLink_add(){
			return this.link_add;
		}

		public void setLink_edit(String link_edit){
			this.link_edit = link_edit;
		}
		public String getLink_edit(){
			return this.link_edit;
		}

	}
}
/*-------------------------*/