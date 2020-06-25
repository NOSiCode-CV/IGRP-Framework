package nosi.webapps.marcacao_consulta.pages.maindashboard;

import nosi.core.gui.components.IGRPTable;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import java.util.ArrayList;
import java.util.List;
import nosi.core.webapp.uploadfile.UploadFile;

public class Maindashboard extends Model{		

	@RParam(rParamName = "p_upload")
	private UploadFile upload;

	@RParam(rParamName = "p_images")
	private String images;

	@RParam(rParamName = "p_sectionheader_1_text")
	private String sectionheader_1_text;
	
	private List<Table_1> table_1 = new ArrayList<>();	
	public void setTable_1(List<Table_1> table_1){
		this.table_1 = table_1;
	}
	public List<Table_1> getTable_1(){
		return this.table_1;
	}

	
	public void setUpload(UploadFile upload){
		this.upload = upload;
	}
	public UploadFile getUpload(){
		return this.upload;
	}
	
	public void setImages(String images){
		this.images = images;
	}
	public String getImages(){
		return this.images;
	}
	
	public void setSectionheader_1_text(String sectionheader_1_text){
		this.sectionheader_1_text = sectionheader_1_text;
	}
	public String getSectionheader_1_text(){
		return this.sectionheader_1_text;
	}


	public static class Table_1 extends IGRPTable.Table{
		private String nome;
		private String morada;
		private String data_nascimento;
		public void setNome(String nome){
			this.nome = nome;
		}
		public String getNome(){
			return this.nome;
		}

		public void setMorada(String morada){
			this.morada = morada;
		}
		public String getMorada(){
			return this.morada;
		}

		public void setData_nascimento(String data_nascimento){
			this.data_nascimento = data_nascimento;
		}
		public String getData_nascimento(){
			return this.data_nascimento;
		}

	}

	public void loadTable_1(BaseQueryInterface query) {
		this.setTable_1(this.loadTable(query,Table_1.class));
	}

}
