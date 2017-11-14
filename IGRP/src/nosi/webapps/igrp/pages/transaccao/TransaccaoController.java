
package nosi.webapps.igrp.pages.transaccao;
/*---- Import your packages here... ----*/

import nosi.core.webapp.Controller;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.RParam;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Transaction;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/*---- End ----*/
public class TransaccaoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Transaccao model = new Transaccao();		
		ArrayList<Transaccao.Table_1> table_1 = new ArrayList<>();
		Transaction trans = new Transaction();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();		
		}
		List<Transaction> list =trans.find()
				.andWhere("application", "=", model.getAplicacao()!=null?Integer.parseInt(model.getAplicacao()):null)
				.andWhere("code", "=", model.getCodigo())
				.all();
		for(Transaction t:list){
			Transaccao.Table_1 table = new Transaccao().new Table_1();
			table.setCodigo(t.getCode());
			table.setDescricao(t.getDescr());
			table.setEstado(t.getStatus()==1?"Ativo":"Inativo");
			table_1.add(table);
		}		
		
		TransaccaoView view = new TransaccaoView(model);
		view.title = "Gestao de Transação";
		view.aplicacao.setValue(new Application().getListApps());
//		view.organica.setValue(new Organization().getListMyOrganizations());
		view.table_1.addData(table_1);
		view.codigo.setParam(true);
		return this.renderView(view);
	}
	
	public Response actionEditar(@RParam(rParamName = "codigo")String codigo) throws IOException{
		if(codigo!=null && !codigo.equals(""))
			return this.redirect("igrp", "EditarTransacao", "index&codigo="+codigo);
		else
			return this.redirect("igrp", "error-page", "permission");
	}
	
	public Response actionEliminar() throws IOException{
		String code = Igrp.getInstance().getRequest().getParameter("codigo");
		Transaction t = new Transaction();
		t = t.find().andWhere("code", "=", code).one();
		if(t.delete(t.getId()))
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MESSAGE_SUCCESS);
		else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.MESSAGE_ERROR);
		return this.redirect("igrp","Transaccao","index");
	}
	
	
	public void actionAlterar_estado() throws IOException{
		String code = Igrp.getInstance().getRequest().getParameter("codigo");
		Transaction t = new Transaction();
		t.setCode(code);
		t = t.find().andWhere("code", "=", code).one();
		if(t!=null){
			if(t.getStatus()==0){
				t.setStatus(1);
			}else if(t.getStatus()==1){
				t.setStatus(0);
			}
			t = t.update();
			if(t!=null)	
				Igrp.getInstance().getFlashMessage().addMessage("success","Operação efetuada com sucesso");
			else
				Igrp.getInstance().getFlashMessage().addMessage("error","Falha ao tentar efetuar esta operação");
		}
		this.redirect("igrp","Transaccao","index");
	}
	
}