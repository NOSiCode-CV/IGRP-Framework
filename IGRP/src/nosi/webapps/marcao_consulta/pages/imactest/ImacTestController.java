/*-------------------------*/

/*Create Controller*/

package nosi.webapps.marcao_consulta.pages.imactest;
import nosi.core.webapp.Controller;
import java.io.IOException;

/*---- Import your packages here... ----*/
/*---- End ----*/

public class ImacTestController extends Controller {		


	public void actionIndex() throws IOException{
	/*---- Insert your code here... ----*/
		ImacTest model = new ImacTest();
		ImacTestView view = new ImacTestView(model);
		this.renderView(view);	
	/*---- End ----*/
	}


	public void actionDash_board() throws IOException{
	/*---- Insert your code here... ----*/
			this.redirect("marcao_consulta","DashBoard","index");
	/*---- End ----*/
	}
	

	public void actionGravar() throws IOException{
	/*---- Insert your code here... ----*/
			System.out.println("Ok isaias");
			this.redirect("marcao_consulta","ConsultaPendente","index");
	/*---- End ----*/
	}
	

	public void actionListar_medicos() throws IOException{
	/*---- Insert your code here... ----*/
			this.redirect("marcao_consulta","ListaMedico","index");
			System.out.println("fx");
	/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*/
	public void actionTeste(){
		System.out.println("Teste");
	}
	/*---- End ----*/
}
