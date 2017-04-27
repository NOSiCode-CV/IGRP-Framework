/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.novaorganica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class NovaOrganicaView extends View {		
	
	public Field codigo;
	public Field nome;
	public Field aplicacao;
	public Field ativo;
	public Field organica_pai;
	public IGRPForm form_1;

	public IGRPButton btn_gravar;
	public IGRPButton btn_voltar;
	public NovaOrganicaView(NovaOrganica model){			
		form_1 = new IGRPForm("form_1");
		codigo = new TextField(model,"codigo");
		codigo.setLabel("Codigo");
		codigo.propertie().add("name","p_codigo").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		nome = new TextField(model,"nome");
		nome.setLabel("Nome");
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new TextField(model,"aplicacao");
		aplicacao.setLabel("Aplicacao");
		aplicacao.propertie().add("name","p_aplicacao").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		ativo = new CheckBoxField(model,"ativo");
		ativo.setLabel("Ativo");
		ativo.propertie().add("name","p_ativo").add("type","checkbox").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("right","false").add("check","true");
		organica_pai = new ListField(model,"organica_pai");
		organica_pai.setLabel("Organica Pai");
		organica_pai.propertie().add("name","p_organica_pai").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");

		btn_gravar = new IGRPButton("Gravar","RED","Teste","Action","submit","default|fa-angle-right","","");
		btn_gravar.propertie.add("type","form").add("code","").add("class","default").add("rel","gravar");
		btn_voltar = new IGRPButton("Voltar","RED","Teste","Action","_back","default|fa-angle-right","","");
		btn_voltar.propertie.add("type","form").add("code","").add("class","default").add("rel","voltar");
		
	}
		
	@Override
	public void render(){

		form_1.addField(codigo);
		form_1.addField(nome);
		form_1.addField(aplicacao);
		form_1.addField(ativo);
		form_1.addField(organica_pai);

		form_1.addButton(btn_gravar);
		form_1.addButton(btn_voltar);
		this.addToPage(form_1);
	}
}
/*-------------------------*/