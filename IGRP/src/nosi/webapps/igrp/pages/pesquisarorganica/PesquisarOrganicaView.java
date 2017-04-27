/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp.pages.pesquisarorganica;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class PesquisarOrganicaView extends View {		
	
	public Field aplicacao;
	public Field descricao;
	public Field estado;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_novo;
	public IGRPButton btn_pesquisar;
	public PesquisarOrganicaView(PesquisarOrganica model){			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("Aplicação");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","true").add("change","false").add("disabled","false").add("right","false");
		descricao = new PlainTextField(model,"descricao");
		descricao.setLabel("Descrição");
		descricao.propertie().add("name","p_descricao").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false");
		estado = new PlainTextField(model,"estado");
		estado.setLabel("Estado");
		estado.propertie().add("name","p_estado").add("type","plaintext").add("maxlength","30").add("align","left").add("lookup_parser","false");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_novo = new IGRPButton("Novo","RED","Teste","Action","_blank","default|fa-angle-right","default||fa-angle-right|www","http://igrp.teste.gov.cv/images/IGRP/Teste.xml");
		btn_novo.propertie.add("type","specific").add("code","").add("rel","novo");
		btn_pesquisar = new IGRPButton("Pesquisar","RED","Teste","Action","_blank","default|fa-angle-right","","");
		btn_pesquisar.propertie.add("type","form").add("code","").add("class","default").add("rel","pesquisar");
		
	}
		
	@Override
	public void render(){

		form_1.addField(aplicacao);


		table_1.addField(descricao);
		table_1.addField(estado);

		toolsbar_1.addButton(btn_novo);
		form_1.addButton(btn_pesquisar);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
}
/*-------------------------*/