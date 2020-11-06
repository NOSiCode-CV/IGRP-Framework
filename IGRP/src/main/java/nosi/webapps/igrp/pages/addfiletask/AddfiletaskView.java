package nosi.webapps.igrp.pages.addfiletask;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class AddfiletaskView extends View {

	public Field formlist_documento_task_nome;
	public Field formlist_documento_task_descricao;
	public Field formlist_documento_task_obrigatoriedade;
	public Field formlist_documento_task_documento;
	public Field user;
	public Field formlist_documento_task_mostrar;
	public Field formlist_documento_task_mostrar_desc;
	public Field formlist_documento_id_tp_doc_desc;
	public Field formlist_documento_id_tp_doc;
	public IGRPFormList formlist_documento_task;


	public AddfiletaskView(){

		this.setPageTitle("AddFileTask");
			
		formlist_documento_task = new IGRPFormList("formlist_documento_task","");

		formlist_documento_task_nome = new TextField(model,"formlist_documento_task_nome");
		formlist_documento_task_nome.setLabel(gt("Nome"));
		formlist_documento_task_nome.propertie().add("name","p_formlist_documento_task_nome").add("type","text").add("maxlength","100").add("required","false").add("readonly","true").add("disabled","false").add("desc","true");
		
		formlist_documento_task_descricao = new TextField(model,"formlist_documento_task_descricao");
		formlist_documento_task_descricao.setLabel(gt("Descrição"));
		formlist_documento_task_descricao.propertie().add("name","p_formlist_documento_task_descricao").add("type","text").add("maxlength","100").add("required","false").add("readonly","true").add("disabled","false").add("desc","true");
		
		formlist_documento_task_obrigatoriedade = new TextField(model,"formlist_documento_task_obrigatoriedade");
		formlist_documento_task_obrigatoriedade.setLabel(gt("Obrigatoriedade"));
		formlist_documento_task_obrigatoriedade.propertie().add("name","p_formlist_documento_task_obrigatoriedade").add("type","text").add("maxlength","30").add("required","false").add("readonly","true").add("disabled","false").add("desc","true");
		
		formlist_documento_task_documento = new FileField(model,"formlist_documento_task_documento");
		formlist_documento_task_documento.setLabel(gt("Documento"));
		formlist_documento_task_documento.propertie().add("name","p_formlist_documento_task_documento").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","1000").add("required","false").add("disabled","false").add("desc","true");
		
		user = new TextField(model,"user");
		user.setLabel(gt("User"));
		user.propertie().add("name","p_user").add("type","text").add("maxlength","250").add("required","false").add("readonly","true").add("disabled","true").add("desc","true");
		
		formlist_documento_task_mostrar = new LinkField(model,"formlist_documento_task_mostrar");
		formlist_documento_task_mostrar.setLabel(gt("Mostrar"));
		formlist_documento_task_mostrar.setValue(new Config().getResolveUrl("igrp","Dominio","index"));

									formlist_documento_task_mostrar_desc = new LinkField(model,"formlist_documento_task_mostrar_desc");
		formlist_documento_task_mostrar_desc.setLabel(gt("Mostrar"));
		formlist_documento_task_mostrar.propertie().add("name","p_formlist_documento_task_mostrar").add("type","link").add("target","_newtab").add("maxlength","10000").add("request_fields","").add("refresh_submit","false").add("desc","true");
		
		formlist_documento_id_tp_doc = new HiddenField(model,"formlist_documento_id_tp_doc");
		formlist_documento_id_tp_doc.setLabel(gt(""));
		formlist_documento_id_tp_doc.propertie().add("name","p_formlist_documento_id_tp_doc").add("type","hidden").add("maxlength","250").add("java-type","").add("tag","formlist_documento_id_tp_doc").add("desc","true");
		


		
	}
		
	@Override
	public void render(){
		
		formlist_documento_task.addField(formlist_documento_task_nome);
		formlist_documento_task.addField(formlist_documento_task_descricao);
		formlist_documento_task.addField(formlist_documento_task_obrigatoriedade);
		formlist_documento_task.addField(formlist_documento_task_documento);
		formlist_documento_task.addField(user);
		formlist_documento_task.addField(formlist_documento_task_mostrar);
		formlist_documento_task.addField(formlist_documento_task_mostrar_desc);
		formlist_documento_task.addField(formlist_documento_id_tp_doc);

		this.addToPage(formlist_documento_task);
	}
		
	@Override
	public void setModel(Model model) {
		
		formlist_documento_task_nome.setValue(model);
		formlist_documento_task_descricao.setValue(model);
		formlist_documento_task_obrigatoriedade.setValue(model);
		formlist_documento_task_documento.setValue(model);
		user.setValue(model);
		formlist_documento_task_mostrar.setValue(model);
		formlist_documento_task_mostrar_desc.setValue(model);
		formlist_documento_id_tp_doc.setValue(model);	

		formlist_documento_task.loadModel(((Addfiletask) model).getFormlist_documento_task());
		}
}
