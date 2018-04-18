
package nosi.webapps.igrp.pages.addfiletask;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.config.Config;
import java.util.Map;
import java.util.HashMap;

public class AddfiletaskView extends View {
	
	
	public Field formlist_documento_task_nome;
	public Field formlist_documento_task_descricao;
	public Field formlist_documento_task_obrigatoriedade;
	public Field formlist_documento_task_documento;
	public Field formlist_documento_task_mostrar;
	public IGRPFormList formlist_documento_task;

	public AddfiletaskView(){

		this.setPageTitle("AddFileTask");
			
		formlist_documento_task = new IGRPFormList("formlist_documento_task","");
		formlist_documento_task_nome = new TextField(model,"formlist_documento_task_nome");
		formlist_documento_task_nome.setLabel(gt("Nome"));
		formlist_documento_task_nome.propertie().add("name","p_formlist_documento_task_nome").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		formlist_documento_task_descricao = new TextField(model,"formlist_documento_task_descricao");
		formlist_documento_task_descricao.setLabel(gt("Descrição"));
		formlist_documento_task_descricao.propertie().add("name","p_formlist_documento_task_descricao").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		formlist_documento_task_obrigatoriedade = new TextField(model,"formlist_documento_task_obrigatoriedade");
		formlist_documento_task_obrigatoriedade.setLabel(gt("Obrigatoriedade"));
		formlist_documento_task_obrigatoriedade.propertie().add("name","p_formlist_documento_task_obrigatoriedade").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		
		formlist_documento_task_documento = new FileField(model,"formlist_documento_task_documento");
		formlist_documento_task_documento.setLabel(gt("Documento"));
		formlist_documento_task_documento.propertie().add("name","p_formlist_documento_task_documento").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","1000").add("required","false").add("desc","true");
		
		formlist_documento_task_mostrar = new LinkField(model,"formlist_documento_task_mostrar");
		formlist_documento_task_mostrar.setLabel(gt("Mostrar"));
		formlist_documento_task_mostrar.setValue(new Config().getResolveUrl("igrp","Addfiletask","index"));
							
		formlist_documento_task_mostrar.propertie().add("name","p_formlist_documento_task_mostrar").add("type","link").add("target","_newtab").add("maxlength","10000").add("desc","true");
		

		
	}
		
	@Override
	public void render(){
		
		formlist_documento_task.addField(formlist_documento_task_nome);
		formlist_documento_task.addField(formlist_documento_task_descricao);
		formlist_documento_task.addField(formlist_documento_task_obrigatoriedade);
		formlist_documento_task.addField(formlist_documento_task_documento);
		formlist_documento_task.addField(formlist_documento_task_mostrar);

		this.addToPage(formlist_documento_task);
	}
		
	public void setModel(Addfiletask model) {
		
		formlist_documento_task_nome.setValue(model);
		formlist_documento_task_descricao.setValue(model);
		formlist_documento_task_obrigatoriedade.setValue(model);
		formlist_documento_task_documento.setValue(model);	

		formlist_documento_task.loadModel(model.getFormlist_documento_task());
		
	}
}
