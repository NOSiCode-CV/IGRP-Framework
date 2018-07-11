
package nosi.webapps.igrp.pages.startprocess;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;



public class StartprocessView extends View {

	public Field header_text;
	public Field total_proc_finished_tit;
	public Field total_proc_finished_val;
	public Field total_proc_finished_url;
	public Field total_proc_finished_bg;
	public Field total_proc_finished_icn;
	public Field total_proc_em_execucao_tit;
	public Field total_proc_em_execucao_val;
	public Field total_proc_em_execucao_url;
	public Field total_proc_em_execucao_bg;
	public Field total_proc_em_execucao_icn;
	public IGRPForm header;
	public IGRPForm total_proc_finished;
	public IGRPForm total_proc_em_execucao;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_iniciar_processo;

	public StartprocessView(){

		this.setPageTitle("StartProcess");
			
		header = new IGRPForm("header","");

		total_proc_finished = new IGRPForm("total_proc_finished","");

		total_proc_em_execucao = new IGRPForm("total_proc_em_execucao","");

		header_text = new TextField(model,"header_text");
		header_text.setLabel(gt(""));
		header_text.setValue(gt("Process"));
		header_text.propertie().add("type","text").add("name","p_header_text").add("maxlength","4000");
		
		total_proc_finished_tit = new TextField(model,"total_proc_finished_tit");
		total_proc_finished_tit.setLabel(gt("Title"));
		total_proc_finished_tit.setValue(gt("Total de processos executados"));
		total_proc_finished_tit.propertie().add("name","p_total_proc_finished_tit").add("type","text").add("maxlength","4000");
		
		total_proc_finished_val = new TextField(model,"total_proc_finished_val");
		total_proc_finished_val.setLabel(gt("Value"));
		total_proc_finished_val.propertie().add("name","p_total_proc_finished_val").add("type","text").add("maxlength","4000");
		
		total_proc_finished_url = new TextField(model,"total_proc_finished_url");
		total_proc_finished_url.setLabel(gt(""));
		total_proc_finished_url.setValue(gt("[object Object]"));
		total_proc_finished_url.propertie().add("name","p_total_proc_finished_url").add("type","text").add("maxlength","4000");
		
		total_proc_finished_bg = new TextField(model,"total_proc_finished_bg");
		total_proc_finished_bg.setLabel(gt("Background"));
		total_proc_finished_bg.setValue(gt("cp-cyan"));
		total_proc_finished_bg.propertie().add("name","p_total_proc_finished_bg").add("type","text").add("maxlength","4000");
		
		total_proc_finished_icn = new TextField(model,"total_proc_finished_icn");
		total_proc_finished_icn.setLabel(gt("Icon"));
		total_proc_finished_icn.setValue(gt("fa-check"));
		total_proc_finished_icn.propertie().add("name","p_total_proc_finished_icn").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_tit = new TextField(model,"total_proc_em_execucao_tit");
		total_proc_em_execucao_tit.setLabel(gt("Title"));
		total_proc_em_execucao_tit.setValue(gt("Total de processos em execução"));
		total_proc_em_execucao_tit.propertie().add("name","p_total_proc_em_execucao_tit").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_val = new TextField(model,"total_proc_em_execucao_val");
		total_proc_em_execucao_val.setLabel(gt("Value"));
		total_proc_em_execucao_val.propertie().add("name","p_total_proc_em_execucao_val").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_url = new TextField(model,"total_proc_em_execucao_url");
		total_proc_em_execucao_url.setLabel(gt(""));
		total_proc_em_execucao_url.setValue(gt("[object Object]"));
		total_proc_em_execucao_url.propertie().add("name","p_total_proc_em_execucao_url").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_bg = new TextField(model,"total_proc_em_execucao_bg");
		total_proc_em_execucao_bg.setLabel(gt("Background"));
		total_proc_em_execucao_bg.setValue(gt("cp-electric"));
		total_proc_em_execucao_bg.propertie().add("name","p_total_proc_em_execucao_bg").add("type","text").add("maxlength","4000");
		
		total_proc_em_execucao_icn = new TextField(model,"total_proc_em_execucao_icn");
		total_proc_em_execucao_icn.setLabel(gt("Icon"));
		total_proc_em_execucao_icn.setValue(gt("fa-hourglass-start"));
		total_proc_em_execucao_icn.propertie().add("name","p_total_proc_em_execucao_icn").add("type","text").add("maxlength","4000");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_iniciar_processo = new IGRPButton("Iniciar Processo","igrp","Startprocess","iniciar_processo","submit","primary|fa-play","","");
		btn_iniciar_processo.propertie.add("type","specific").add("rel","iniciar_processo");

		
	}
		
	@Override
	public void render(){
		
		header.addField(header_text);


		total_proc_finished.addField(total_proc_finished_tit);
		total_proc_finished.addField(total_proc_finished_val);
		total_proc_finished.addField(total_proc_finished_url);
		total_proc_finished.addField(total_proc_finished_bg);
		total_proc_finished.addField(total_proc_finished_icn);

		total_proc_em_execucao.addField(total_proc_em_execucao_tit);
		total_proc_em_execucao.addField(total_proc_em_execucao_val);
		total_proc_em_execucao.addField(total_proc_em_execucao_url);
		total_proc_em_execucao.addField(total_proc_em_execucao_bg);
		total_proc_em_execucao.addField(total_proc_em_execucao_icn);

		toolsbar_1.addButton(btn_iniciar_processo);
		this.addToPage(header);
		this.addToPage(total_proc_finished);
		this.addToPage(total_proc_em_execucao);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		total_proc_finished_val.setValue(model);
		total_proc_em_execucao_val.setValue(model);	

		
	}
}
