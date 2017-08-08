/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.req_servicos;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class REQ_SERVICOS extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_servico")
	private String servico;
	@RParam(rParamName = "p_tipo_requisito")
	private String tipo_requisito;
	@RParam(rParamName = "p_upload")
	private String upload;
	@RParam(rParamName = "p_descritivo")
	private String descritivo;

	private ArrayList<Separatorlist_1> separatorlist_1 = new ArrayList<>();
	public void setSeparatorlist_1(ArrayList<Separatorlist_1> separatorlist_1){
		this.separatorlist_1 = separatorlist_1;
	}
	public ArrayList<Separatorlist_1> getseparatorlist_1(){
		return this.separatorlist_1;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}
	
	public void setServico(String servico){
		this.servico = servico;
	}
	public String getServico(){
		return this.servico;
	}
	
	public void setTipo_requisito(String tipo_requisito){
		this.tipo_requisito = tipo_requisito;
	}
	public String getTipo_requisito(){
		return this.tipo_requisito;
	}
	
	public void setUpload(String upload){
		this.upload = upload;
	}
	public String getUpload(){
		return this.upload;
	}
	
	public void setDescritivo(String descritivo){
		this.descritivo = descritivo;
	}
	public String getDescritivo(){
		return this.descritivo;
	}


	public class Separatorlist_1{
		private String tipo_requisito;
		private String upload;
		private String descritivo;
		public void setTipo_requisito(String tipo_requisito){
			this.tipo_requisito = tipo_requisito;
		}
		public String getTipo_requisito(){
			return this.tipo_requisito;
		}

		public void setUpload(String upload){
			this.upload = upload;
		}
		public String getUpload(){
			return this.upload;
		}

		public void setDescritivo(String descritivo){
			this.descritivo = descritivo;
		}
		public String getDescritivo(){
			return this.descritivo;
		}

	}
}
/*-------------------------*/