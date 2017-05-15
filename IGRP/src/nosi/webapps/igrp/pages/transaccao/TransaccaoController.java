
package nosi.webapps.igrp.pages.transaccao;
import nosi.core.webapp.Controller;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import java.io.IOException;
import java.util.ArrayList;


public class TransaccaoController extends Controller {		

	public void actionIndex() throws IOException{
		Transaccao model = new Transaccao();
		TransaccaoView view = new TransaccaoView(model);
		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(new Organization().getListOrganizations());
		ArrayList<Transaccao.Table_1> table_1 = new ArrayList<>();
		
		for(Object obj:new Organization().getAll()){
			Organization org = (Organization) obj;
			Transaccao.Table_1 t = new Transaccao().new Table_1();
			t.setCodigo(org.getCode());
			t.setDescricao(org.getName());
			t.setEstado(org.getStatus()==1?"Ativo":"Inativo");
			table_1.add(t);
		}
		view.title = "Gestao de Transação";
		model.setTable_1(table_1);
		this.renderView(view);
	}

	public void actionPesquisar() throws IOException{
		Transaccao model = new Transaccao();
		TransaccaoView view = new TransaccaoView(model);
		this.renderView(view);
	}
	
	public void actionEditar() throws IOException{
		Transaccao model = new Transaccao();
		TransaccaoView view = new TransaccaoView(model);
		this.renderView(view);
	}
	
	public void actionEliminar() throws IOException{
			this.redirect("igrp","Transaccao","index");
	}
	
	public void actionAlterar_estado() throws IOException{
			this.redirect("igrp","Transaccao","index");
	}
	
}