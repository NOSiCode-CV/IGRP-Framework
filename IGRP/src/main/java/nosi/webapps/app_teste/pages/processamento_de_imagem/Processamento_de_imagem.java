package nosi.webapps.app_teste.pages.processamento_de_imagem;

import java.math.BigInteger;
import java.math.BigDecimal;
import nosi.core.config.Config;
import nosi.core.gui.components.IGRPLink;
import nosi.core.webapp.Report;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;

public class Processamento_de_imagem extends Model{		
	@RParam(rParamName = "p_img_1")
	private String img_1;
	
	public void setImg_1(String img_1){
		this.img_1 = img_1;
	}
	public String getImg_1(){
		return this.img_1;
	}



}
