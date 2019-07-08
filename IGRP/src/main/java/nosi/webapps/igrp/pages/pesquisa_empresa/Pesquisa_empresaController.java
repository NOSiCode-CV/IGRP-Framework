package nosi.webapps.igrp.pages.pesquisa_empresa;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import java.util.ArrayList;
import java.util.List;

import nosi.core.webapp.webservices.rest.PesquisaEmpresaService;
import nosi.core.webapp.webservices.rest.pesquisa_geral.PesquisaEmpresa;


/*----#end-code----*/
		
public class Pesquisa_empresaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_empresa model = new Pesquisa_empresa();
		model.load();
		Pesquisa_empresaView view = new Pesquisa_empresaView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '2' as nif_tab,'Iste totam iste perspiciatis s' as nome_da_firma_tab,'Labore officia adipiscing offi' as matriculan_reg_comercial,'Stract sed natus rem voluptate' as data_registo_data_reg_comercial,'Perspiciatis sed consectetur i' as data_inicio_atividade,'Rem omnis iste adipiscing natu' as natureza_juridica,'Unde anim natus unde stract' as natureza_juridica_desc,'Magna rem sit unde sed' as tipo_entidade,'Iste unde mollit accusantium a' as tipo_entidade_desc "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.btn_pesquisar.setLink("index");
		
		List<Pesquisa_empresa.Table_1> lista_emp = new ArrayList<>();
		
		
		if(Core.isNotNull(model.getNif()) || Core.isNotNull(model.getNome_da_firma())) {
			
			List<PesquisaEmpresa> empresas = PesquisaEmpresaService.pesquisaEmpresa(model.getNif(),model.getNome_da_firma());
			
			for(PesquisaEmpresa empresa : empresas) {
				Pesquisa_empresa.Table_1 tab = new Pesquisa_empresa.Table_1();
				
				tab.setNif_tab(empresa.getNif());
				tab.setNome_da_firma_tab(empresa.getNome_firma());
				tab.setMatriculan_reg_comercial(empresa.getMatricula());
				//tab.setData_registo_data_reg_comercial(empresa.getd);
				tab.setData_inicio_atividade(empresa.getDt_ini_atividade());
				tab.setNatureza_juridica(empresa.getNatureza_juridica());
				tab.setNatureza_juridica_desc(empresa.getNatureza_juridica_desc());
				tab.setTipo_entidade(empresa.getTipo_entidade());
				tab.setTipo_entidade_desc(empresa.getTipo_entidade_desc());
				
				lista_emp.add(tab);
			}
			
			
		}
			
		model.setTable_1(lista_emp);

		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_empresa model = new Pesquisa_empresa();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","Pesquisa_empresa","index", model, this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Pesquisa_empresa","index", this.queryString());	
	}
	
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
