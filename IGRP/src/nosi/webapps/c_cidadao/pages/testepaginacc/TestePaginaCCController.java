/*-------------------------*/

/*Create Controller*/

package nosi.webapps.c_cidadao.pages.testepaginacc;
import nosi.core.webapp.Controller;
import java.io.IOException;

public class TestePaginaCCController extends Controller {		

	public void actionIndex() throws IOException{
		TestePaginaCC model = new TestePaginaCC();
		TestePaginaCCView view = new TestePaginaCCView(model);
		this.renderView(view);
	}

	public void actionMesma_pagina() throws IOException{
		TestePaginaCC model = new TestePaginaCC();
		TestePaginaCCView view = new TestePaginaCCView(model);
		this.renderView(view);
	}
	
}
