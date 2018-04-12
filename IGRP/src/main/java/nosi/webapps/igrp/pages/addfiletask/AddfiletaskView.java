
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
	
	
	public Field nome;
	public Field descricao;
	public Field obrigatoriedade;
	public Field documento;
	public Field mostrar;
	public IGRPFormList formlist_documento_task;

	public AddfiletaskView(){

		this.setPageTitle("AddFileTask");
			
		formlist_documento_task = new IGRPFormList("formlist_documento_task","");
		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		descricao = new TextField(model,"descricao");
		descricao.setLabel(gt("Descrição"));
		descricao.propertie().add("name","p_descricao").add("type","text").add("maxlength","100").add("required","false").add("desc","true");
		
		obrigatoriedade = new TextField(model,"obrigatoriedade");
		obrigatoriedade.setLabel(gt("Obrigatoriedade"));
		obrigatoriedade.propertie().add("name","p_obrigatoriedade").add("type","text").add("maxlength","30").add("required","false").add("desc","true");
		
		documento = new FileField(model,"documento");
		documento.setLabel(gt("Documento"));
		documento.propertie().add("name","p_documento").add("type","file").add("accept","").add("targetrend","").add("multiple","false").add("rendvalue","false").add("maxlength","1000").add("required","false").add("desc","true");
		
		mostrar = new LinkField(model,"mostrar");
		mostrar.setLabel(gt("Mostrar"));
		mostrar.setValue(new Config().getResolveUrl("igrp","Addfiletask","index"));
							
		mostrar.propertie().add("name","p_mostrar").add("type","link").add("target","_self").add("maxlength","10000").add("desc","true");
		

		
	}
		
	@Override
	public void render(){
		
		formlist_documento_task.addField(nome);
		formlist_documento_task.addField(descricao);
		formlist_documento_task.addField(obrigatoriedade);
		formlist_documento_task.addField(documento);
		formlist_documento_task.addField(mostrar);

		this.addToPage(formlist_documento_task);
	}
		
	public void setModel(Addfiletask model) {
		
		nome.setValue(model);
		descricao.setValue(model);
		obrigatoriedade.setValue(model);
		documento.setValue(model);	

		formlist_documento_task.loadModel(model.getFormlist_documento_task());
		
	}
}
