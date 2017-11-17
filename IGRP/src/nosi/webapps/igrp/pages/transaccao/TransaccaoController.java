
package nosi.webapps.igrp.pages.transaccao;

/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
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
import static nosi.core.i18n.Translator.gt;
/*----#END-PRESERVED-AREA----*/

public class TransaccaoController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
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
		view.title = gt("Gestão de Transação");
		view.aplicacao.setValue(new Application().getListApps());
//		view.organica.setValue(new Organization().getListMyOrganizations());
		view.table_1.addData(table_1);
		view.codigo.setParam(true);
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEditar(@RParam(rParamName = "codigo")String codigo) throws IOException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		if(codigo!=null && !codigo.equals(""))
			return this.redirect("igrp", "EditarTransacao", "index&codigo="+codigo);
		else
			return this.redirect("igrp", "error-page", "permission");
		/*----#END-PRESERVED-AREA----*/
	}
	
	public Response actionEliminar() throws IOException{
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		String code = Igrp.getInstance().getRequest().getParameter("codigo");
		Transaction t = new Transaction();
		t = t.find().andWhere("code", "=", code).one();
		if(t.delete(t.getId()))
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.SUCCESS,FlashMessage.MESSAGE_SUCCESS);
		else
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,FlashMessage.MESSAGE_ERROR);
		return this.redirect("igrp","Transaccao","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	
	public void actionAlterar_estado() throws IOException{
		/*----#START-PRESERVED-AREA(ALTERAR_ESTADO)----*/
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
				Igrp.getInstance().getFlashMessage().addMessage("success",gt("Operação efetuada com sucesso"));
			else
				Igrp.getInstance().getFlashMessage().addMessage("error",gt("Falha ao tentar efetuar esta operação"));
		}
		this.redirect("igrp","Transaccao","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
	
}