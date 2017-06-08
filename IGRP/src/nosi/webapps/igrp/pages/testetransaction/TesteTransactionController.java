/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.testetransaction;
import nosi.core.webapp.Controller;
import java.io.IOException;

public class TesteTransactionController extends Controller {		

	public void actionIndex() throws IOException{
		TesteTransaction model = new TesteTransaction();
		TesteTransactionView view = new TesteTransactionView(model);
		this.renderView(view);
	}

	public void actionConfirmar() throws IOException{
			this.redirect("igrp","Transaccao","index");
	}
	
	public void actionEnviar() throws IOException{
			this.redirect("igrp","TesteTransaction","index");
	}
	
	public void actionPesquisar() throws IOException{
		TesteTransaction model = new TesteTransaction();
		TesteTransactionView view = new TesteTransactionView(model);
		this.renderView(view);
	}
	
	public void actionSave() throws IOException{
		TesteTransaction model = new TesteTransaction();
		TesteTransactionView view = new TesteTransactionView(model);
		this.renderView(view);
	}
	
	public void actionEditar() throws IOException{
		TesteTransaction model = new TesteTransaction();
		TesteTransactionView view = new TesteTransactionView(model);
		this.renderView(view);
	}
	
	public void actionEliminar() throws IOException{
		TesteTransaction model = new TesteTransaction();
		TesteTransactionView view = new TesteTransactionView(model);
		this.renderView(view);
	}
	
}
