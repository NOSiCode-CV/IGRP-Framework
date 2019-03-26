package nosi.core.webapp.bpmn;

import static nosi.core.i18n.Translator.gt;
import java.util.ArrayList;
import java.util.List;
import nosi.core.gui.components.IGRPFormList;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.gui.fields.LinkField;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.bpmn.FormlistDocument.Formlist_documento_task;
import nosi.webapps.igrp.dao.TipoDocumentoEtapa;

/**
 * Emanuel
 * 17 Jun 2018
 */

public class DisplayDocmentType{		

	private boolean showInputFile = true;
	private List<TipoDocumentoEtapa> listDocmentType;
	private Field formlist_documento_id_tp_doc;
	private Field formlist_documento_task_nome;
	private Field formlist_documento_task_descricao;
	private Field formlist_documento_task_obrigatoriedade;
	private Field formlist_documento_task_documento;
	private Field formlist_documento_user;
	private Field formlist_documento_doc_id;
	private Field formlist_documento_task_mostrar;
	private String userName;
	
	public String display() {
		IGRPFormList formlist_documento_task = new IGRPFormList("formlist_documento_task");
		formlist_documento_task.getProperties().put("type", "workflow_document");
		formlist_documento_task.getProperties().add("no-delete", "true").add("no-add", "true");
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
				ft.setFormlist_documento_user(new Pair(this.userName,this.userName));
				ft.setFormlist_documento_doc_id(new Pair(""+td.getFileId(), ""+td.getFileId()));
				data.add(ft);
			});
		}
		return data;
	}

	private void addField(IGRPFormList formlist_documento_task) {
		formlist_documento_id_tp_doc = new HiddenField(null,"formlist_documento_id_tp_doc");
		formlist_documento_id_tp_doc.propertie().add("name","p_formlist_documento_id_tp_doc").add("maxlength","100").add("required","false").add("desc","true");
		
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
		formlist_documento_task_mostrar.propertie().add("name","p_formlist_documento_task_mostrar").add("type","link").add("target","_newtab").add("maxlength","10000").add("desc","true");
		
		formlist_documento_user = new TextField(null,"formlist_documento_user");	
		formlist_documento_user.setLabel(gt("Utilizador"));					
		formlist_documento_user.propertie().add("name","p_formlist_documento_user").add("type","text").add("maxlength","10000").add("desc","true");
		
		formlist_documento_doc_id = new HiddenField(null,"formlist_documento_doc_id");	
		formlist_documento_doc_id.propertie().add("name","p_formlist_documento_doc_id").add("type","hidden").add("maxlength","10000").add("desc","true");
		

		formlist_documento_task.addField(formlist_documento_doc_id);
		formlist_documento_task.addField(formlist_documento_task_nome);
		formlist_documento_task.addField(formlist_documento_task_descricao);
		formlist_documento_task.addField(formlist_documento_task_obrigatoriedade);
		formlist_documento_task.addField(formlist_documento_id_tp_doc);
		formlist_documento_task.addField(formlist_documento_user);
		if(this.isShowInputFile())
			formlist_documento_task.addField(formlist_documento_task_documento);
		formlist_documento_task.addField(formlist_documento_task_mostrar);
	}
	
	private String getObrigatoriedade(int required) {
		return required==1?"Sim":"Nao";
	}
	
	

	public void setUserName(String userName) {
		this.userName= userName;
	}
}
