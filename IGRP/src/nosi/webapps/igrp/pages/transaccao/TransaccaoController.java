
package nosi.webapps.igrp.pages.transaccao;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Transaction;

import java.io.IOException;
import java.util.ArrayList;


public class TransaccaoController extends Controller {		

	public void actionIndex() throws IOException{
		Transaccao model = new Transaccao();		
		ArrayList<Transaccao.Table_1> table_1 = new ArrayList<>();
		for(Object obj:new Transaction().getAll()){
			Transaction t = (Transaction) obj;
			Transaccao.Table_1 table = new Transaccao().new Table_1();
			table.setCodigo(t.getCode());
			table.setDescricao(t.getDescr());
			table.setEstado(t.getStatus()==1?"Ativo":"Inativo");
			table_1.add(table);
		}		
		
		TransaccaoView view = new TransaccaoView(model);
		view.title = "Gestao de Transação";
		view.aplicacao.setValue(new Application().getListApps());
		view.organica.setValue(new Organization().getListOrganizations());
		view.table_1.addData(table_1);
		view.codigo.setParam(true);
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
		String code = Igrp.getInstance().getRequest().getParameter("codigo");
		Transaction t = new Transaction();
		t.setCode(code);
		t = (Transaction) t.getOne();
		if(t.delete())
			Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
		else
			Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
		this.redirect("igrp","Transaccao","index");
	}
	
	public void actionAlterar_estado() throws IOException{
		String code = Igrp.getInstance().getRequest().getParameter("codigo");
		Transaction t = new Transaction();
		t.setCode(code);
		if(((Transaction) t.getOne()).getCode()!=null){
			t = (Transaction) t.getOne();
			if(t.getStatus()==0){
				t.setStatus(1);
			}else if(t.getStatus()==1){
				t.setStatus(0);
			}
			if(t.update())	
				Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
			else
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
		}
		this.redirect("igrp","Transaccao","index");
	}
	
}