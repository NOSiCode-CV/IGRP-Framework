/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.agendar;
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import nosi.core.webapp.Response;
/*---- Import your packages here... ----*/
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Servicos;
/*---- End ----*/

public class AgendarController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		Agendar model = new Agendar();
		AgendarView view = new AgendarView(model);
		
		Map<String, String> comboBox = new HashMap<String,String>();
		for(Entidade entidade : Entidade.getAllEntidade()) {
			comboBox.put(entidade.getId() + "", entidade.getNome_entidade());
		}
		view.entidade.setValue(comboBox);
		
		//
		Map<String, String> comboBox2 = new HashMap<String,String>();
		for(Servicos obj : Servicos.getAllServico()) {
			comboBox2.put("" + obj.getId(), obj.getNome_servico());
		}
		view.servico.setValue(comboBox2);
		
		Map<String, String> comboBox3 = new HashMap<String,String>();
		for(Balcao obj : Balcao.getAllBalcao()) {
			comboBox3.put("" + obj.getId(), obj.getLocalizacao());
		}
		view.balcao.setValue(comboBox3);
		
		return this.renderView(view);
			/*---- End ----*/
	}


	public Response actionAgendar() throws IOException{
		/*---- Insert your code here... ----*/
		return this.redirect("agenda","AddServicos","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
