package nosi.webapps.app_teste.pages.processamento_de_imagem;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class Processamento_de_imagemView extends View {

	public Field img_1;
	public IGRPForm form_4;
	public IGRPForm form_2;
	public IGRPForm form_3;
	public IGRPForm form_1;

	public IGRPButton btn_diminuir_cont;
	public IGRPButton btn_aumentar_cont;
	public IGRPButton btn_diminuir_bril;
	public IGRPButton btn_aumentar_bril;
	public IGRPButton btn_diminuir_inv;
	public IGRPButton btn_aumentar_inv;

	public Processamento_de_imagemView(){

		this.setPageTitle("Processamento de Imagem");
			
		form_4 = new IGRPForm("form_4","Contraste");

		form_2 = new IGRPForm("form_2","Brilho");

		form_3 = new IGRPForm("form_3","Inversão de Cores");

		form_1 = new IGRPForm("form_1","");

		img_1 = new TextField(model,"img_1");
		img_1.setLabel(gt("Img"));
		img_1.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		img_1.propertie().add("name","p_img_1").add("type","img").add("width","550").add("height","600").add("croppie","true").add("rounded","false").add("maxlength","250").add("autoupload","false");
		


		btn_diminuir_cont = new IGRPButton("","app_teste","Processamento_de_imagem","diminuir_cont","void","primary|fa-arrow-down","","");
		btn_diminuir_cont.propertie.add("type","form").add("rel","diminuir_cont");

		btn_aumentar_cont = new IGRPButton("","app_teste","Processamento_de_imagem","aumentar_cont","void","primary|fa-arrow-up","","");
		btn_aumentar_cont.propertie.add("type","form").add("rel","aumentar_cont");

		btn_diminuir_bril = new IGRPButton("","app_teste","Processamento_de_imagem","diminuir_bril","void","primary|fa-arrow-down","","");
		btn_diminuir_bril.propertie.add("type","form").add("rel","diminuir_bril");

		btn_aumentar_bril = new IGRPButton("","app_teste","Processamento_de_imagem","aumentar_bril","void","primary|fa-arrow-up","","");
		btn_aumentar_bril.propertie.add("type","form").add("rel","aumentar_bril");

		btn_diminuir_inv = new IGRPButton("","app_teste","Processamento_de_imagem","diminuir_inv","void","primary|fa-arrow-down","","");
		btn_diminuir_inv.propertie.add("type","form").add("rel","diminuir_inv");

		btn_aumentar_inv = new IGRPButton("","app_teste","Processamento_de_imagem","aumentar_inv","void","primary|fa-arrow-up","","");
		btn_aumentar_inv.propertie.add("type","form").add("rel","aumentar_inv");

		
	}
		
	@Override
	public void render(){
		



		form_1.addField(img_1);

		form_4.addButton(btn_diminuir_cont);
		form_4.addButton(btn_aumentar_cont);
		form_2.addButton(btn_diminuir_bril);
		form_2.addButton(btn_aumentar_bril);
		form_3.addButton(btn_diminuir_inv);
		form_3.addButton(btn_aumentar_inv);
		this.addToPage(form_4);
		this.addToPage(form_2);
		this.addToPage(form_3);
		this.addToPage(form_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		}
}
