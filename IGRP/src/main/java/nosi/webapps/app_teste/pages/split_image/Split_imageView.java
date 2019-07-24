package nosi.webapps.app_teste.pages.split_image;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;

public class Split_imageView extends View {

	public Field form_1_img_12;
	public Field form_1_img_11;
	public Field form_1_img_2;
	public Field form_1_img_1;
	public Field form_1_img_10;
	public Field form_1_img_9;
	public Field form_1_img_7;
	public Field form_1_img_8;
	public Field form_1_img_5;
	public Field form_1_img_13;
	public Field form_1_img_6;
	public Field form_1_img_16;
	public Field form_1_img_15;
	public Field form_1_img_3;
	public Field form_1_img_4;
	public Field form_1_img_14;
	public Field form_3_img_14;
	public Field form_3_img_1;
	public Field form_3_img_2;
	public Field form_3_img_3;
	public Field form_3_img_4;
	public Field form_3_img_5;
	public Field form_3_img_11;
	public Field form_3_img_13;
	public Field form_3_img_7;
	public Field form_3_img_10;
	public Field form_3_img_9;
	public Field form_3_img_12;
	public Field form_3_img_8;
	public Field form_3_img_15;
	public Field form_3_img_16;
	public Field form_3_img_6;
	public IGRPForm form_1;
	public IGRPForm form_3;


	public Split_imageView(){

		this.setPageTitle("split image");
			
		form_1 = new IGRPForm("form_1","");

		form_3 = new IGRPForm("form_3","");

		form_1_img_12 = new TextField(model,"form_1_img_12");
		form_1_img_12.setLabel(gt("Img"));
		form_1_img_12.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_12.propertie().add("name","p_form_1_img_12").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_11 = new TextField(model,"form_1_img_11");
		form_1_img_11.setLabel(gt("Img"));
		form_1_img_11.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_11.propertie().add("name","p_form_1_img_11").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_2 = new TextField(model,"form_1_img_2");
		form_1_img_2.setLabel(gt("Img"));
		form_1_img_2.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_2.propertie().add("name","p_form_1_img_2").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_1 = new TextField(model,"form_1_img_1");
		form_1_img_1.setLabel(gt("Img"));
		form_1_img_1.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_1.propertie().add("name","p_form_1_img_1").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_10 = new TextField(model,"form_1_img_10");
		form_1_img_10.setLabel(gt("Img"));
		form_1_img_10.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_10.propertie().add("name","p_form_1_img_10").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_9 = new TextField(model,"form_1_img_9");
		form_1_img_9.setLabel(gt("Img"));
		form_1_img_9.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_9.propertie().add("name","p_form_1_img_9").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_7 = new TextField(model,"form_1_img_7");
		form_1_img_7.setLabel(gt("Img"));
		form_1_img_7.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_7.propertie().add("name","p_form_1_img_7").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_8 = new TextField(model,"form_1_img_8");
		form_1_img_8.setLabel(gt("Img"));
		form_1_img_8.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_8.propertie().add("name","p_form_1_img_8").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_5 = new TextField(model,"form_1_img_5");
		form_1_img_5.setLabel(gt("Img"));
		form_1_img_5.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_5.propertie().add("name","p_form_1_img_5").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_13 = new TextField(model,"form_1_img_13");
		form_1_img_13.setLabel(gt("Img"));
		form_1_img_13.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_13.propertie().add("name","p_form_1_img_13").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_6 = new TextField(model,"form_1_img_6");
		form_1_img_6.setLabel(gt("Img"));
		form_1_img_6.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_6.propertie().add("name","p_form_1_img_6").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_16 = new TextField(model,"form_1_img_16");
		form_1_img_16.setLabel(gt("Img"));
		form_1_img_16.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_16.propertie().add("name","p_form_1_img_16").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_15 = new TextField(model,"form_1_img_15");
		form_1_img_15.setLabel(gt("Img"));
		form_1_img_15.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_15.propertie().add("name","p_form_1_img_15").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_3 = new TextField(model,"form_1_img_3");
		form_1_img_3.setLabel(gt("Img"));
		form_1_img_3.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_3.propertie().add("name","p_form_1_img_3").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_4 = new TextField(model,"form_1_img_4");
		form_1_img_4.setLabel(gt("Img"));
		form_1_img_4.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_4.propertie().add("name","p_form_1_img_4").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_1_img_14 = new TextField(model,"form_1_img_14");
		form_1_img_14.setLabel(gt("Img"));
		form_1_img_14.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_1_img_14.propertie().add("name","p_form_1_img_14").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_14 = new TextField(model,"form_3_img_14");
		form_3_img_14.setLabel(gt("Img"));
		form_3_img_14.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_14.propertie().add("name","p_form_3_img_14").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_1 = new TextField(model,"form_3_img_1");
		form_3_img_1.setLabel(gt("Img"));
		form_3_img_1.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_1.propertie().add("name","p_form_3_img_1").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_2 = new TextField(model,"form_3_img_2");
		form_3_img_2.setLabel(gt("Img"));
		form_3_img_2.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_2.propertie().add("name","p_form_3_img_2").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_3 = new TextField(model,"form_3_img_3");
		form_3_img_3.setLabel(gt("Img"));
		form_3_img_3.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_3.propertie().add("name","p_form_3_img_3").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_4 = new TextField(model,"form_3_img_4");
		form_3_img_4.setLabel(gt("Img"));
		form_3_img_4.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_4.propertie().add("name","p_form_3_img_4").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_5 = new TextField(model,"form_3_img_5");
		form_3_img_5.setLabel(gt("Img"));
		form_3_img_5.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_5.propertie().add("name","p_form_3_img_5").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_11 = new TextField(model,"form_3_img_11");
		form_3_img_11.setLabel(gt("Img"));
		form_3_img_11.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_11.propertie().add("name","p_form_3_img_11").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_13 = new TextField(model,"form_3_img_13");
		form_3_img_13.setLabel(gt("Img"));
		form_3_img_13.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_13.propertie().add("name","p_form_3_img_13").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_7 = new TextField(model,"form_3_img_7");
		form_3_img_7.setLabel(gt("Img"));
		form_3_img_7.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_7.propertie().add("name","p_form_3_img_7").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_10 = new TextField(model,"form_3_img_10");
		form_3_img_10.setLabel(gt("Img"));
		form_3_img_10.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_10.propertie().add("name","p_form_3_img_10").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_9 = new TextField(model,"form_3_img_9");
		form_3_img_9.setLabel(gt("Img"));
		form_3_img_9.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_9.propertie().add("name","p_form_3_img_9").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_12 = new TextField(model,"form_3_img_12");
		form_3_img_12.setLabel(gt("Img"));
		form_3_img_12.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_12.propertie().add("name","p_form_3_img_12").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_8 = new TextField(model,"form_3_img_8");
		form_3_img_8.setLabel(gt("Img"));
		form_3_img_8.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_8.propertie().add("name","p_form_3_img_8").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_15 = new TextField(model,"form_3_img_15");
		form_3_img_15.setLabel(gt("Img"));
		form_3_img_15.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_15.propertie().add("name","p_form_3_img_15").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_16 = new TextField(model,"form_3_img_16");
		form_3_img_16.setLabel(gt("Img"));
		form_3_img_16.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_16.propertie().add("name","p_form_3_img_16").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		
		form_3_img_6 = new TextField(model,"form_3_img_6");
		form_3_img_6.setLabel(gt("Img"));
		form_3_img_6.setValue(gt("/IGRP-Template/images/IGRP/IGRP2.3/assets/img/jon_doe.jpg"));
		form_3_img_6.propertie().add("name","p_form_3_img_6").add("type","img").add("width","").add("height","").add("croppie","false").add("rounded","false").add("autoupload","false").add("maxlength","250");
		


		
	}
		
	@Override
	public void render(){
		
		form_1.addField(form_1_img_12);
		form_1.addField(form_1_img_11);
		form_1.addField(form_1_img_2);
		form_1.addField(form_1_img_1);
		form_1.addField(form_1_img_10);
		form_1.addField(form_1_img_9);
		form_1.addField(form_1_img_7);
		form_1.addField(form_1_img_8);
		form_1.addField(form_1_img_5);
		form_1.addField(form_1_img_13);
		form_1.addField(form_1_img_6);
		form_1.addField(form_1_img_16);
		form_1.addField(form_1_img_15);
		form_1.addField(form_1_img_3);
		form_1.addField(form_1_img_4);
		form_1.addField(form_1_img_14);

		form_3.addField(form_3_img_14);
		form_3.addField(form_3_img_1);
		form_3.addField(form_3_img_2);
		form_3.addField(form_3_img_3);
		form_3.addField(form_3_img_4);
		form_3.addField(form_3_img_5);
		form_3.addField(form_3_img_11);
		form_3.addField(form_3_img_13);
		form_3.addField(form_3_img_7);
		form_3.addField(form_3_img_10);
		form_3.addField(form_3_img_9);
		form_3.addField(form_3_img_12);
		form_3.addField(form_3_img_8);
		form_3.addField(form_3_img_15);
		form_3.addField(form_3_img_16);
		form_3.addField(form_3_img_6);

		this.addToPage(form_1);
		this.addToPage(form_3);
	}
		
	@Override
	public void setModel(Model model) {
			

		}
}
