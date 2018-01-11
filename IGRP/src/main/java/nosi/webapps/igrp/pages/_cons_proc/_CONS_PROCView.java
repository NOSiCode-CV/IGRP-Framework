
package nosi.webapps.igrp.pages._cons_proc;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;

public class _CONS_PROCView extends View {
	
	
	public Field aplicacao;
	public Field organica;
	public Field area_fk;
	public Field proc_tp_fk;
	public Field user_fk;
	public Field status;
	public Field referencia_pedido;
	public Field requerente;
	public Field num;
	public Field intervalo_entrada;
	public Field dt_ini;
	public Field dt_fim;
	public IGRPForm form;

	public IGRPToolsBar toolsbar;
	public IGRPButton btn_item1;
	public _CONS_PROCView(_CONS_PROC model){
		this.setPageTitle("Consulta Processos");
			
		form = new IGRPForm("form","");
		aplicacao = new ListField(model,"aplicacao");
		aplicacao.setLabel(gt("Modulo"));
		
		aplicacao.propertie().add("name","p_aplicacao").add("type","select").add("change","true").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("disabled","false").add("right","false").add("java-type","");
		organica = new ListField(model,"organica");
		organica.setLabel(gt("Organica"));
		
		organica.propertie().add("name","p_organica").add("type","select").add("change","true").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("disabled","false").add("right","false").add("java-type","");
		area_fk = new ListField(model,"area_fk");
		area_fk.setLabel(gt("Area"));
		
		area_fk.propertie().add("name","p_area_fk").add("type","select").add("change","true").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("disabled","false").add("right","false").add("java-type","");
		proc_tp_fk = new ListField(model,"proc_tp_fk");
		proc_tp_fk.setLabel(gt("Tipo Processo"));
		
		proc_tp_fk.propertie().add("name","p_proc_tp_fk").add("type","select").add("change","true").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("disabled","false").add("right","false").add("java-type","");
		user_fk = new ListField(model,"user_fk");
		user_fk.setLabel(gt("Utilizador"));
		
		user_fk.propertie().add("name","p_user_fk").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("change","false").add("disabled","false").add("right","false").add("java-type","");
		status = new ListField(model,"status");
		status.setLabel(gt("Estado"));
		
		status.propertie().add("name","p_status").add("type","select").add("maxlength","30").add("multiple","false").add("domain","").add("required","false").add("change","false").add("disabled","false").add("right","false").add("java-type","");
		referencia_pedido = new SeparatorField(model,"referencia_pedido");
		referencia_pedido.setLabel(gt("Referencia Pedido"));
		
		referencia_pedido.propertie().add("type","separator").add("name","p_referencia_pedido").add("maxlength","30").add("placeholder","").add("right","false");
		requerente = new TextField(model,"requerente");
		requerente.setLabel(gt("Requerente"));
		
		requerente.propertie().add("name","p_requerente").add("type","text").add("maxlength","250").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		num = new TextField(model,"num");
		num.setLabel(gt("N   Processo"));
		
		num.propertie().add("name","p_num").add("type","text").add("maxlength","150").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		intervalo_entrada = new SeparatorField(model,"intervalo_entrada");
		intervalo_entrada.setLabel(gt("Intervalo Entrada"));
		
		intervalo_entrada.propertie().add("type","separator").add("name","p_intervalo_entrada").add("maxlength","30").add("placeholder","").add("right","false");
		dt_ini = new DateField(model,"dt_ini");
		dt_ini.setLabel(gt("Data Inicio"));
		
		dt_ini.propertie().add("name","p_dt_ini").add("type","date").add("maxlength","30").add("range","false").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");
		dt_fim = new DateField(model,"dt_fim");
		dt_fim.setLabel(gt("Data Fim"));
		
		dt_fim.propertie().add("name","p_dt_fim").add("type","date").add("maxlength","30").add("range","false").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false").add("class","default");

		toolsbar = new IGRPToolsBar("toolsbar");
		btn_item1 = new IGRPButton("Pesquisar","igrp","_CONS_PROC","item1","_self","default|search.png","","");
		btn_item1.propertie.add("type","specific").add("code","").add("rel","item1");
		
	}
		
	@Override
	public void render(){
		

		form.addField(aplicacao);
		form.addField(organica);
		form.addField(area_fk);
		form.addField(proc_tp_fk);
		form.addField(user_fk);
		form.addField(status);
		form.addField(referencia_pedido);
		form.addField(requerente);
		form.addField(num);
		form.addField(intervalo_entrada);
		form.addField(dt_ini);
		form.addField(dt_fim);

		toolsbar.addButton(btn_item1);
		this.addToPage(form);
		this.addToPage(toolsbar);
	}
}
