package nosi.webapps.app_teste.pages.page_utente;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.config.Config;

public class Page_utenteView extends View {


	public IGRPVerticalMenu inseir_exame;
	public IGRPVerticalMenu listar_exame;
	public IGRPVerticalMenu verticalmenu_1;
	public IGRPButton btn_inserir_exame;
	public IGRPButton btn_ver_exames;
	public IGRPButton btn_fazer_ficha_de_consulta;

	public Page_utenteView(){

		this.setPageTitle("Page Utente");
			

		inseir_exame = new IGRPVerticalMenu("inseir_exame");
		listar_exame = new IGRPVerticalMenu("listar_exame");
		verticalmenu_1 = new IGRPVerticalMenu("verticalmenu_1");

		btn_inserir_exame = new IGRPButton("Inserir Exame do paciente","app_teste","Page_utente","inserir_exame","mpsubmit","primary|fa-angle-right","","");
		btn_inserir_exame.propertie.add("type","specific").add("rel","inserir_exame");

		btn_ver_exames = new IGRPButton("Ver exames do paciente","app_teste","Page_utente","ver_exames","submit","primary|fa-angle-right","","");
		btn_ver_exames.propertie.add("type","specific").add("rel","ver_exames");

		btn_fazer_ficha_de_consulta = new IGRPButton("Fazer Ficha de Consulta","app_teste","Page_utente","fazer_ficha_de_consulta","_blank","primary|fa-angle-right","","");
		btn_fazer_ficha_de_consulta.propertie.add("type","specific").add("rel","fazer_ficha_de_consulta");

		
	}
		
	@Override
	public void render(){
		



		inseir_exame.addButton(btn_inserir_exame);
		listar_exame.addButton(btn_ver_exames);
		verticalmenu_1.addButton(btn_fazer_ficha_de_consulta);
		this.addToPage(inseir_exame);
		this.addToPage(listar_exame);
		this.addToPage(verticalmenu_1);
	}
		
	@Override
	public void setModel(Model model) {
			

		}
}
