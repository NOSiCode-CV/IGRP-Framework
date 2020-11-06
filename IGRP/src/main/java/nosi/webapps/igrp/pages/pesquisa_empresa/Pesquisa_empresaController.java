package nosi.webapps.igrp.pages.pesquisa_empresa;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import java.net.URLEncoder;
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
		model.loadTable_1(Core.query(null,"SELECT 'S' as estado,'0' as nif_tab,'Totam stract sit labore perspi' as nome_da_firma_tab,'Voluptatem sit aliqua elit nat' as matriculan_reg_comercial,'Deserunt officia sit iste dolo' as data_registo_data_reg_comercial,'Magna perspiciatis consectetur' as data_inicio_atividade,'Doloremque iste officia aperia' as natureza_juridica,'Anim stract aperiam elit lorem' as natureza_juridica_desc,'Consectetur omnis stract ipsum' as tipo_entidade,'Stract deserunt omnis elit ist' as tipo_entidade_desc "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		view.btn_pesquisar.setLink("index");
		
		List<Pesquisa_empresa.Table_1> lista_emp = new ArrayList<>();
		
		
		if(Core.isNotNull(model.getNif()) || Core.isNotNull(model.getNome_da_firma())) {
			
			List<PesquisaEmpresa> empresas = PesquisaEmpresaService.pesquisaEmpresa(model.getNif().trim(),URLEncoder.encode(model.getNome_da_firma().toUpperCase().trim(), StandardCharsets.UTF_8.toString()));
			
			for(PesquisaEmpresa empresa : empresas) {
				Pesquisa_empresa.Table_1 tab = new Pesquisa_empresa.Table_1();
				
				tab.setNif_tab(empresa.getNif());
				tab.setNome_da_firma_tab(empresa.getNome_firma());
				tab.setMatriculan_reg_comercial(empresa.getMatricula());
				
				tab.setData_inicio_atividade(empresa.getDt_ini_atividade());
				tab.setNatureza_juridica(empresa.getNatureza_juridica());
				tab.setNatureza_juridica_desc(empresa.getNatureza_juridica_desc());
				tab.setTipo_entidade(empresa.getTipo_entidade());
				tab.setTipo_entidade_desc(empresa.getTipo_entidade_desc());
				
				tab.setData_registo_data_reg_comercial(empresa.getData_registo());
				tab.setEstado(empresa.getEstado());
				
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
		  return this.forward("igrp","Pesquisa_empresa","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(pesquisar)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Pesquisa_empresa","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/


/*----#end-code----*/
}
