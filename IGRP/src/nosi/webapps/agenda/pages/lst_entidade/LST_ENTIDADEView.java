/*-------------------------*/

/*Create View*/

package nosi.webapps.agenda.pages.lst_entidade;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class LST_ENTIDADEView extends View {
	
	
	public Field entidade;
	public Field aplicacao;
	public Field p_id;
	public Field table_1_filter;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_nova_entidade;
	public IGRPButton btn_servicos;
	public IGRPButton btn_balcoes;
	public IGRPButton btn_agenda;
	public LST_ENTIDADEView(LST_ENTIDADE model){
		this.setPageTitle("Lista de Entidades");
			
		form_1 = new IGRPForm("form_1");
		table_1 = new IGRPTable("table_1");
		entidade = new TextField(model,"entidade");
		entidade.setLabel("Entidade");
		entidade.propertie().add("name","p_entidade").add("type","text").add("maxlength","100").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel("AplicaÃ§Ã£o");
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("multiple","false").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false").add("domain","");
		p_id = new HiddenField(model,"p_id");
		p_id.setLabel("");
		p_id.propertie().add("name","p_id").add("type","hidden").add("maxlength","30").add("tag","id");
		table_1_filter = new TextField(model,"table_1_filter");
		table_1_filter.setLabel("");
		table_1_filter.propertie().add("name","p_table_1_filter").add("type","text").add("maxlength","100");

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");
		btn_nova_entidade = new IGRPButton("Nova Entidade","agenda","LST_ENTIDADE","nova_entidade","modal","success|fa-plus-square","","");
		btn_nova_entidade.propertie.add("type","specific").add("code","").add("rel","nova_entidade");
		btn_servicos = new IGRPButton("Serviços","agenda","LST_ENTIDADE","servicos","modal","info|fa-server","","");
		btn_servicos.propertie.add("type","specific").add("code","").add("class","info").add("rel","servicos");
		btn_balcoes = new IGRPButton("Balcões","agenda","LST_ENTIDADE","balcoes","modal","success|fa-sitemap","","");
		btn_balcoes.propertie.add("type","specific").add("code","").add("class","success").add("rel","balcoes");
		btn_agenda = new IGRPButton("Agenda","agenda","LST_ENTIDADE","agenda","modal","warning|fa-calendar","","");
		btn_agenda.propertie.add("type","specific").add("code","").add("class","warning").add("rel","agenda");
		
	
	}
		
	@Override
	public void render(){
		
		form_1.addField(entidade);
		form_1.addField(aplicacao);


		table_1.addField(entidade);
		table_1.addField(aplicacao);
		table_1.addField(p_id);
		table_1.addField(table_1_filter);

		toolsbar_1.addButton(btn_nova_entidade);
		//table_1.addButton(btn_servicos);
		table_1.addButton(btn_balcoes);
		table_1.addButton(btn_agenda);
		this.addToPage(form_1);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
}
/*-------------------------*/