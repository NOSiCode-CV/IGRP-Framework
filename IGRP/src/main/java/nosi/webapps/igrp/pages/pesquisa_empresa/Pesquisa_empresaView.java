package nosi.webapps.igrp.pages.pesquisa_empresa;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class Pesquisa_empresaView extends View {

	public Field sectionheader_1_text;
	public Field nif;
	public Field nome_da_firma;
	public Field nif_tab;
	public Field nome_da_firma_tab;
	public Field matriculan_reg_comercial;
	public Field data_registo_data_reg_comercial;
	public Field data_inicio_atividade;
	public Field natureza_juridica;
	public Field natureza_juridica_desc;
	public Field tipo_entidade;
	public Field tipo_entidade_desc;
	public Field estado;
	public IGRPSectionHeader sectionheader_1;
	public IGRPForm form_1;
	public IGRPTable table_1;

	public IGRPButton btn_pesquisar;

	public Pesquisa_empresaView(){

		this.setPageTitle("Pesquisa Empresa");
			
		sectionheader_1 = new IGRPSectionHeader("sectionheader_1","");

		form_1 = new IGRPForm("form_1","");

		table_1 = new IGRPTable("table_1","");

		sectionheader_1_text = new TextField(model,"sectionheader_1_text");
		sectionheader_1_text.setLabel(gt(""));
		sectionheader_1_text.setValue(gt("<p>Pesquisa Empresa</p>"));
		sectionheader_1_text.propertie().add("type","text").add("name","p_sectionheader_1_text").add("maxlength","4000");
		
		nif = new NumberField(model,"nif");
		nif.setLabel(gt("Nif"));
		nif.propertie().add("name","p_nif").add("type","number").add("min","").add("max","").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false").add("java-type","String");
		
		nome_da_firma = new TextField(model,"nome_da_firma");
		nome_da_firma.setLabel(gt("Nome da Firma"));
		nome_da_firma.propertie().add("name","p_nome_da_firma").add("type","text").add("maxlength","250").add("required","false").add("readonly","false").add("disabled","false").add("desclabel","false");
		
		nif_tab = new NumberField(model,"nif_tab");
		nif_tab.setLabel(gt("Nif"));
		nif_tab.propertie().add("name","p_nif_tab").add("type","number").add("min","").add("max","").add("maxlength","30").add("showLabel","true").add("total_footer","false").add("java-type","String");
		
		nome_da_firma_tab = new TextField(model,"nome_da_firma_tab");
		nome_da_firma_tab.setLabel(gt("Nome da Firma"));
		nome_da_firma_tab.propertie().add("name","p_nome_da_firma_tab").add("type","text").add("maxlength","30").add("showLabel","true");
		
		matriculan_reg_comercial = new TextField(model,"matriculan_reg_comercial");
		matriculan_reg_comercial.setLabel(gt("Matricula(Nº Reg. COmercial)"));
		matriculan_reg_comercial.propertie().add("name","p_matriculan_reg_comercial").add("type","text").add("maxlength","30").add("showLabel","true");
		
		data_registo_data_reg_comercial = new TextField(model,"data_registo_data_reg_comercial");
		data_registo_data_reg_comercial.setLabel(gt("DATA REGISTO (Data Reg. Comercial)"));
		data_registo_data_reg_comercial.propertie().add("name","p_data_registo_data_reg_comercial").add("type","text").add("maxlength","30").add("showLabel","true");
		
		data_inicio_atividade = new TextField(model,"data_inicio_atividade");
		data_inicio_atividade.setLabel(gt("Data Início Atividade"));
		data_inicio_atividade.propertie().add("name","p_data_inicio_atividade").add("type","text").add("maxlength","30").add("showLabel","true");
		
		natureza_juridica = new TextField(model,"natureza_juridica");
		natureza_juridica.setLabel(gt("Natureza Juridica"));
		natureza_juridica.propertie().add("name","p_natureza_juridica").add("type","text").add("maxlength","30").add("showLabel","true");
		
		natureza_juridica_desc = new TextField(model,"natureza_juridica_desc");
		natureza_juridica_desc.setLabel(gt("Natureza Juridica Desc"));
		natureza_juridica_desc.propertie().add("name","p_natureza_juridica_desc").add("type","text").add("maxlength","30").add("showLabel","true");
		
		tipo_entidade = new TextField(model,"tipo_entidade");
		tipo_entidade.setLabel(gt("Tipo Entidade"));
		tipo_entidade.propertie().add("name","p_tipo_entidade").add("type","text").add("maxlength","30").add("showLabel","true");
		
		tipo_entidade_desc = new TextField(model,"tipo_entidade_desc");
		tipo_entidade_desc.setLabel(gt("Tipo Entidade Desc"));
		tipo_entidade_desc.propertie().add("name","p_tipo_entidade_desc").add("type","text").add("maxlength","30").add("showLabel","true");
		
		estado = new TextField(model,"estado");
		estado.setLabel(gt("Estado"));
		estado.propertie().add("name","p_estado").add("type","text").add("maxlength","30").add("showLabel","true");
		


		btn_pesquisar = new IGRPButton("Pesquisar","igrp","Pesquisa_empresa","pesquisar","submit_ajax","primary|fa-search","","");
		btn_pesquisar.propertie.add("type","form").add("rel","pesquisar");

		
	}
		
	@Override
	public void render(){
		
		sectionheader_1.addField(sectionheader_1_text);

		form_1.addField(nif);
		form_1.addField(nome_da_firma);

		table_1.addField(nif_tab);
		table_1.addField(nome_da_firma_tab);
		table_1.addField(matriculan_reg_comercial);
		table_1.addField(data_registo_data_reg_comercial);
		table_1.addField(data_inicio_atividade);
		table_1.addField(natureza_juridica);
		table_1.addField(natureza_juridica_desc);
		table_1.addField(tipo_entidade);
		table_1.addField(tipo_entidade_desc);
		table_1.addField(estado);

		form_1.addButton(btn_pesquisar);
		this.addToPage(sectionheader_1);
		this.addToPage(form_1);
		this.addToPage(table_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nif.setValue(model);
		nome_da_firma.setValue(model);
		nif_tab.setValue(model);
		nome_da_firma_tab.setValue(model);
		matriculan_reg_comercial.setValue(model);
		data_registo_data_reg_comercial.setValue(model);
		data_inicio_atividade.setValue(model);
		natureza_juridica.setValue(model);
		natureza_juridica_desc.setValue(model);
		tipo_entidade.setValue(model);
		tipo_entidade_desc.setValue(model);
		estado.setValue(model);	

		table_1.loadModel(((Pesquisa_empresa) model).getTable_1());
		}
}
