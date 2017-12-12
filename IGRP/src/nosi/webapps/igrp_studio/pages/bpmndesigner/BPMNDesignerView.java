/*-------------------------*/

/*Create View*/

package nosi.webapps.igrp_studio.pages.bpmndesigner;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

import static nosi.core.i18n.Translator.gt;

public class BPMNDesignerView extends View {
	
	
	public Field page_title_text;
	public Field data;
	public Field link_data;
	public Field area_name;
	public Field env_fk;
	public Field p_link_add_area;
	public Field ctx_nome;
	public Field ctx_link;
	public Field cxt_tipo;
	public Field title;
	public Field id;
	public Field id_pai;
	public Field link;
	public Field id_objeto;
	public Field tipo;
	public Field link_add;
	public Field link_edit;
	public Field processos;
	public Field bpmn;
	public IGRPSectionHeader page_title;
	public IGRPForm form_1;
	public IGRPTable context_menu;
	public IGRPTable gen_table;
	public IGRPTabContent tabcontent_1;

	public IGRPToolsBar fmn;
	public IGRPButton btn_gravar;
	public IGRPButton btn_publicar;
	public IGRPButton btn_exporar_imagem;
	public BPMNDesignerView(BPMNDesigner model){
		this.setPageTitle("BPMN Designer");
			
		page_title = new IGRPSectionHeader("page_title","");
		form_1 = new IGRPForm("form_1","");
		context_menu = new IGRPTable("context_menu","");
		gen_table = new IGRPTable("gen_table","");
		tabcontent_1 = new IGRPTabContent("tabcontent_1","");
		page_title_text = new TextField(model,"page_title_text");
		page_title_text.setLabel("");
		
		page_title_text.setValue(gt("BPMN Designer"));
		page_title_text.propertie().add("type","text").add("name","p_page_title_text").add("persist","true").add("maxlength","4000");
		data = new TextField(model,"data");
		data.setLabel(gt("Node Data"));
		
		data.propertie().add("name","p_data").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		link_data = new TextField(model,"link_data");
		link_data.setLabel(gt("Link Data"));
		
		link_data.propertie().add("name","p_link_data").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		area_name = new TextField(model,"area_name");
		area_name.setLabel(gt("Nome"));
		
		area_name.propertie().add("name","p_area_name").add("type","text").add("maxlength","30").add("required","false").add("change","false").add("readonly","false").add("disabled","false").add("placeholder","").add("right","false");
		env_fk = new ListField(model,"env_fk");
		env_fk.setLabel(gt("Aplicacao"));
		
		env_fk.propertie().add("name","p_env_fk").add("type","select").add("multiple","false").add("domain","").add("maxlength","30").add("required","false").add("change","false").add("disabled","false").add("right","false");
		p_link_add_area = new HiddenField(model,"p_link_add_area");
		p_link_add_area.setLabel("");
		
		p_link_add_area.propertie().add("name","p_link_add_area").add("type","hidden").add("maxlength","30").add("tag","link_add_area");
		ctx_nome = new TextField(model,"ctx_nome");
		ctx_nome.setLabel(gt("Ctx Nome"));
		
		ctx_nome.propertie().add("name","p_ctx_nome").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		ctx_link = new TextField(model,"ctx_link");
		ctx_link.setLabel(gt("Ctx Link"));
		
		ctx_link.propertie().add("name","p_ctx_link").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		cxt_tipo = new TextField(model,"cxt_tipo");
		cxt_tipo.setLabel(gt("Cxt Tipo"));
		
		cxt_tipo.propertie().add("name","p_cxt_tipo").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		title = new TextField(model,"title");
		title.setLabel(gt("Area"));
		
		title.propertie().add("name","p_title").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		id = new TextField(model,"id");
		id.setLabel(gt("Identificacao"));
		
		id.propertie().add("name","p_id").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		id_pai = new TextField(model,"id_pai");
		id_pai.setLabel(gt("Identificacao pai"));
		
		id_pai.propertie().add("name","p_id_pai").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		link = new LinkField(model,"link");
		link.setLabel(gt("Link"));
		
		link.propertie().add("name","p_link").add("type","link").add("target","_self").add("target_fields","").add("closerefresh","false").add("action","index").add("page","BPMNDesigner").add("app","igrp").add("class","link").add("btnSize","").add("iconColor","#333").add("iconClass","").add("img","fa-link").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("desc","true");
		id_objeto = new NumberField(model,"id_objeto");
		id_objeto.setLabel(gt("Id_objeto"));
		
		id_objeto.propertie().add("name","p_id_objeto").add("type","number").add("min","").add("max","").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false").add("total_footer","false");
		tipo = new TextField(model,"tipo");
		tipo.setLabel(gt("Tipo"));
		
		tipo.propertie().add("name","p_tipo").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		link_add = new TextField(model,"link_add");
		link_add.setLabel(gt("Adicionar Sub Area"));
		
		link_add.propertie().add("name","p_link_add").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		link_edit = new TextField(model,"link_edit");
		link_edit.setLabel(gt("Editar Area"));
		
		link_edit.propertie().add("name","p_link_edit").add("type","text").add("maxlength","30").add("align","left").add("lookup_parser","false").add("iskey","false");
		processos = new TextField(model,"processos");
		processos.setLabel(gt("Processos"));
		
		processos.propertie().add("name","p_processos").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-cog").add("maxlength","50");
		bpmn = new TextField(model,"bpmn");
		bpmn.setLabel(gt("BPMN"));
		
		bpmn.propertie().add("name","p_bpmn").add("type","button").add("target_fields","").add("closerefresh","false").add("iconColor","#333").add("iconClass","").add("img","fa-cogs").add("maxlength","50");

		fmn = new IGRPToolsBar("fmn");
		btn_gravar = new IGRPButton(gt("Gravar"),"igrp","BPMNDesigner","gravar","submit","info|fa-floppy-o","","");
		btn_gravar.propertie.add("type","specific").add("code","").add("rel","gravar");
		btn_publicar = new IGRPButton(gt("Publicar"),"igrp","BPMNDesigner","publicar","alert_submit","primary|fa-check-square-o","","");
		btn_publicar.propertie.add("type","specific").add("code","").add("rel","publicar");
		btn_exporar_imagem = new IGRPButton(gt("Exportar Imagem"),"igrp","BPMNDesigner","exporar_imagem","_link","warning|fa-picture-o","","");
		btn_exporar_imagem.propertie.add("type","specific").add("code","").add("rel","exporar_imagem");
		
	}
		
	@Override
	public void render(){
		
		page_title.addField(page_title_text);


		form_1.addField(data);
		form_1.addField(link_data);
		form_1.addField(area_name);
		form_1.addField(env_fk);
		form_1.addField(p_link_add_area);

		context_menu.addField(ctx_nome);
		context_menu.addField(ctx_link);
		context_menu.addField(cxt_tipo);

		gen_table.addField(title);
		gen_table.addField(id);
		gen_table.addField(id_pai);
		gen_table.addField(link);
		gen_table.addField(id_objeto);
		gen_table.addField(tipo);
		gen_table.addField(link_add);
		gen_table.addField(link_edit);

		tabcontent_1.addField(processos);
		tabcontent_1.addField(bpmn);

		fmn.addButton(btn_gravar);
		fmn.addButton(btn_publicar);
		fmn.addButton(btn_exporar_imagem);
		this.addToPage(page_title);
		this.addToPage(form_1);
		this.addToPage(context_menu);
		this.addToPage(gen_table);
		this.addToPage(tabcontent_1);
		this.addToPage(fmn);
	}
}
/*-------------------------*/