
package nosi.webapps.igrp.pages.transaccao;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Transaction;

import java.io.IOException;
import java.util.ArrayList;


public class TransaccaoController extends Controller {		

	public void actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Transaccao model = new Transaccao();		
		ArrayList<Transaccao.Table_1> table_1 = new ArrayList<>();
		Transaction trans = new Transaction();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
			if(model.getAplicacao()!=null && !model.getAplicacao().equals(""))
				trans.setEnv_fk(Integer.parseInt(model.getAplicacao()));
			if(model.getOrganica()!=null && !model.getOrganica().equals(""))
				trans.setOrg_fk(Integer.parseInt(model.getOrganica()));
			trans.setCode(model.getCodigo());
		}
		for(Object obj:trans.getAll()){
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
	
	public void actionEditar(@RParam(rParamName = "codigo")String codigo) throws IOException{
		if(codigo!=null && !codigo.equals(""))
			this.redirect("igrp", "EditarTransacao", "index&codigo="+codigo);
		else
			this.redirect("igrp", "error-page", "permission");
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