/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.req_servicos;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import java.util.ArrayList;

public class REQ_SERVICOS extends Model{		
	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	@RParam(rParamName = "p_servico")
	private int servico;
	@RParam(rParamName = "p_tipo_requisito_fk")
	private String[] p_tipo_requisito_fk;
	@RParam(rParamName = "p_tipo_requisito_fk_desc")
	private String[] p_tipo_requisito_fk_desc;
	@RParam(rParamName = "p_upload_fk")
	private String[] p_upload_fk;
	@RParam(rParamName = "p_upload_fk_desc")
	private String[] p_upload_fk_desc;
	@RParam(rParamName = "p_descritivo_fk")
	private String[] p_descritivo_fk;
	@RParam(rParamName = "p_descritivo_fk_desc")
	private String[] p_descritivo_fk_desc;

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
	
	public void setServico(int servico){
		this.servico = servico;
	}
	public int getServico(){
		return this.servico;
	}
	
	public void setP_tipo_requisito_fk(String[] p_tipo_requisito_fk){
		this.p_tipo_requisito_fk = p_tipo_requisito_fk;
	}
	public String[] getP_tipo_requisito_fk(){
		return this.p_tipo_requisito_fk;
	}
	
	public void setP_tipo_requisito_fk_desc(String[] p_tipo_requisito_fk_desc){
		this.p_tipo_requisito_fk_desc = p_tipo_requisito_fk_desc;
	}
	public String[] getP_tipo_requisito_fk_desc(){
		return this.p_tipo_requisito_fk_desc;
	}
	
	public void setP_upload_fk(String[] p_upload_fk){
		this.p_upload_fk = p_upload_fk;
	}
	public String[] getP_upload_fk(){
		return this.p_upload_fk;
	}
	
	public void setP_upload_fk_desc(String[] p_upload_fk_desc){
		this.p_upload_fk_desc = p_upload_fk_desc;
	}
	public String[] getP_upload_fk_desc(){
		return this.p_upload_fk_desc;
	}
	
	public void setP_descritivo_fk(String[] p_descritivo_fk){
		this.p_descritivo_fk = p_descritivo_fk;
	}
	public String[] getP_descritivo_fk(){
		return this.p_descritivo_fk;
	}
	
	public void setP_descritivo_fk_desc(String[] p_descritivo_fk_desc){
		this.p_descritivo_fk_desc = p_descritivo_fk_desc;
	}
	public String[] getP_descritivo_fk_desc(){
		return this.p_descritivo_fk_desc;
	}


	public static class Separatorlist_1{
		private Pair tipo_requisito;
		private Pair upload;
		private Pair descritivo;
		public static class Pair{
		
			private String key;
			private String value;
			
			public Pair() {}
			
			public Pair(String key, String value) {
				this.key = key;
				this.value = value;
			}
			
			public String getKey() {
				return key;
			}
			public void setKey(String key) {
				this.key = key;
			}
			public String getValue() {
				return value;
			}
			public void setValue(String value) {
				this.value = value;
			}
			
			@Override
			public String toString() {
				return this.key + "_" + this.value;
			}
		}
 		
		public void setTipo_requisito(Pair tipo_requisito){
			this.tipo_requisito = tipo_requisito;
		}
		public Pair getTipo_requisito(){
			return this.tipo_requisito;
		}

		public void setUpload(Pair upload){
			this.upload = upload;
		}
		public Pair getUpload(){
			return this.upload;
		}

		public void setDescritivo(Pair descritivo){
			this.descritivo = descritivo;
		}
		public Pair getDescritivo(){
			return this.descritivo;
		}

	}
}
/*-------------------------*/