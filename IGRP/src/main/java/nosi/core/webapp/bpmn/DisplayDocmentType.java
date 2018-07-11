package nosi.core.webapp.bpmn;

import static nosi.core.i18n.Translator.gt;
import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPFormList;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.gui.components.IGRPTable.Table;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.TextField;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Emanuel
 * 17 Jun 2018
 */

public class DisplayDocmentType {

	private boolean showInputFile = true;
	private List<TipoDocumentoEtapa> listDocmentType;
	private Field formlist_documento_id_tp_doc;
	private Field formlist_documento_task_nome;
	private Field formlist_documento_task_descricao;
	private Field formlist_documento_task_obrigatoriedade;
	private Field formlist_documento_task_documento;
	private Field formlist_documento_task_mostrar;
	
	public String display() {
		IGRPFormList formlist_documento_task = new IGRPFormList("formlist_documento_task");
		formlist_documento_task.getProperties().put("type", "workflow_document");
		this.addField(formlist_documento_task);		
		formlist_documento_task.addData(this.getData());
		return this.getListDocmentType()!=null && this.getListDocmentType().size() > 0?formlist_documento_task.toString():"";
	}

	public List<TipoDocumentoEtapa> getListDocmentType() {
		return listDocmentType;
	}

	public void setListDocmentType(List<TipoDocumentoEtapa> listDocmentType) {
		this.listDocmentType = listDocmentType;
	}

	
	public boolean isShowInputFile() {
		return showInputFile;
	}

	public void setShowInputFile(boolean showInputFile) {
		this.showInputFile = showInputFile;
	}

	public void addListDocumentType(List<TipoDocumentoEtapa> listTipoDocs) {
		if(this.listDocmentType!=null && listTipoDocs!=null)
			this.listDocmentType.addAll(listTipoDocs);
		if(this.listDocmentType==null && listTipoDocs!=null)
			this.listDocmentType = listTipoDocs;
	}
	
	private List<Formlist_documento_task> getData() {
		List<Formlist_documento_task> data = new ArrayList<>();
		if(this.listDocmentType!=null) {
			this.listDocmentType.stream().forEach(td->{				
				Formlist_documento_task ft = new Formlist_documento_task();
				String descricao="",nome = "";
				ft.setFormlist_documento_id_tp_doc(new Pair(""+td.getId(),""+td.getId()));
				if(td.getTipoDocumento()!=null) {
					descricao = td.getTipoDocumento().getDescricao();
					nome = td.getTipoDocumento().getNome();
				}else if(td.getRepTemplate()!=null) {
					descricao = td.getRepTemplate().getName();
					nome = td.getRepTemplate().getName();
				}
				ft.setFormlist_documento_task_descricao(new Pair(descricao,descricao));
				ft.setFormlist_documento_task_documento(new Pair(td.getTipo(),td.getTipo()));
				if(td.getLink()!=null)
					ft.setFormlist_documento_task_mostrar(new Pair(td.getLink().getLink(),td.getLink().getLink_desc()));
				else
					ft.setFormlist_documento_task_mostrar(new Pair("#",""));
				ft.setFormlist_documento_task_nome(new Pair(nome,nome));
				String r = this.getObrigatoriedade(td.getRequired());
				ft.setFormlist_documento_task_obrigatoriedade(new Pair(r,r));
				data.add(ft);
			});
		}
		return data;
	}

	private void addField(IGRPFormList formlist_documento_task) {
		formlist_documento_id_tp_doc = new HiddenField(null,"formlist_documento_id_tp_doc");
		formlist_documento_id_tp_doc.propertie().add("name","p_formlist_documento_id_tp_doc").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		formlist_documento_task_nome = new TextField(null,"formlist_documento_task_nome");
		formlist_documento_task_nome.setLabel(gt("Nome"));
		formlist_documento_task_nome.propertie().add("name","p_formlist_documento_task_nome").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		formlist_documento_task_descricao = new TextField(null,"formlist_documento_task_descricao");
		formlist_documento_task_descricao.setLabel(gt("Descrição"));
		formlist_documento_task_descricao.propertie().add("name","p_formlist_documento_task_descricao").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		formlist_documento_task_obrigatoriedade = new TextField(null,"formlist_documento_task_obrigatoriedade");
		formlist_documento_task_obrigatoriedade.setLabel(gt("Obrigatoriedade"));
		formlist_documento_task_obrigatoriedade.propertie().add("name","p_formlist_documento_task_obrigatoriedade").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		
		formlist_documento_task_documento = new FileField(null,"formlist_documento_task_documento");
		formlist_documento_task_documento.setLabel(gt("Documento"));
		formlist_documento_task_documento.propertie().add("name","p_formlist_documento_task_documento").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","1000").add("required","false").add("desc","true");
		
		formlist_documento_task_mostrar = new LinkField(null,"formlist_documento_task_mostrar");
		formlist_documento_task_mostrar.setLabel(gt("Mostrar"));
		formlist_documento_task_mostrar.setValue(new Config().getResolveUrl("igrp","Addfiletask","index"));							
		formlist_documento_task_mostrar.propertie().add("name","p_formlist_documento_task_mostrar").add("type","link").add("target","_newtab").add("maxlength","10000").add("desc","true");
		
		formlist_documento_task.addField(formlist_documento_task_nome);
		formlist_documento_task.addField(formlist_documento_task_descricao);
		formlist_documento_task.addField(formlist_documento_task_obrigatoriedade);
		formlist_documento_task.addField(formlist_documento_id_tp_doc);
		if(this.isShowInputFile())
			formlist_documento_task.addField(formlist_documento_task_documento);
		formlist_documento_task.addField(formlist_documento_task_mostrar);
	}
	
	private String getObrigatoriedade(int required) {
		return required==1?"Sim":"Nao";
	}
	
	public static class Formlist_documento_task extends Table{
		
		private Pair formlist_documento_id_tp_doc;
		private Pair formlist_documento_task_nome;
		private Pair formlist_documento_task_descricao;
		private Pair formlist_documento_task_obrigatoriedade;
		private Pair formlist_documento_task_documento;
		private Pair formlist_documento_task_mostrar;		
		
		public Pair getFormlist_documento_id_tp_doc() {
			return formlist_documento_id_tp_doc;
		}
		
		public void setFormlist_documento_id_tp_doc(Pair formlist_documento_id_tp_doc) {
			this.formlist_documento_id_tp_doc = formlist_documento_id_tp_doc;
		}
		
		public void setFormlist_documento_task_nome(Pair formlist_documento_task_nome){
			this.formlist_documento_task_nome = formlist_documento_task_nome;
		}
		
		public Pair getFormlist_documento_task_nome(){
			return this.formlist_documento_task_nome;
		}

		public void setFormlist_documento_task_descricao(Pair formlist_documento_task_descricao){
			this.formlist_documento_task_descricao = formlist_documento_task_descricao;
		}
		
		public Pair getFormlist_documento_task_descricao(){
			return this.formlist_documento_task_descricao;
		}

		public void setFormlist_documento_task_obrigatoriedade(Pair formlist_documento_task_obrigatoriedade){
			this.formlist_documento_task_obrigatoriedade = formlist_documento_task_obrigatoriedade;
		}
		
		public Pair getFormlist_documento_task_obrigatoriedade(){
			return this.formlist_documento_task_obrigatoriedade;
		}

		public void setFormlist_documento_task_documento(Pair formlist_documento_task_documento){
			this.formlist_documento_task_documento = formlist_documento_task_documento;
		}
		public Pair getFormlist_documento_task_documento(){
			return this.formlist_documento_task_documento;
		}

		public void setFormlist_documento_task_mostrar(Pair formlist_documento_task_mostrar){
			this.formlist_documento_task_mostrar = formlist_documento_task_mostrar;
		}
		
		public Pair getFormlist_documento_task_mostrar(){
			return this.formlist_documento_task_mostrar;
		}
	}
}
