/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.testetabela;
import nosi.core.webapp.Controller;

import java.io.IOException;

public class TestetabelaController extends Controller {		

	public void actionIndex() throws IOException{
		Testetabela model = new Testetabela();
		TestetabelaView view = new TestetabelaView(model);
		Testetabela.Table1 table1 = new Testetabela().new Table1();
		table1.setData_nascimento("2000-10-10");
		table1.setN_bi(1);
		table1.setNome("Teste");
		view.table_1.addData(model.getTable_1());
		model.setTable1(table1);
		this.renderView(view,true);
	}

	public void actionSave() throws IOException{
	}
	
	public void actionPesquisar() throws IOException{
	}
	
}
