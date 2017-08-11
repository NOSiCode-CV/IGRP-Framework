/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.lst_balcao;
import nosi.core.config.Config;
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Response;
/*---- Import your packages here... ----*/
import java.util.ArrayList;
import java.util.List;
import nosi.webapps.agenda.dao.Balcao;
import nosi.core.webapp.Igrp;
/*---- End ----*/

public class LST_BALCAOController extends Controller {		


	public Response actionIndex() throws IOException{
		/*---- Insert your code here... ----*/		
		LST_BALCAO model = new LST_BALCAO();
		List<Balcao> balcoes = Balcao.getAllBalcao();
		List<LST_BALCAO.Table_1> data = new ArrayList<>();
		for(Balcao b:balcoes){
			LST_BALCAO.Table_1 t = new LST_BALCAO.Table_1();
			t.setP_id(b.getId());
			t.setBalcao(b.getLocalizacao());
			t.setEntidade(b.getNome_entidade());
			if(b.getEstado().toUpperCase().equals("ATIVO")){
				t.setCheckbox_1_check(b.getId());
			}
			t.setCheckbox_1(b.getId());
			data.add(t);
		}
		LST_BALCAOView view = new LST_BALCAOView(model);
		view.balcao.setLabel("Balcão");
		view.table_1.addData(data);
		return this.renderView(view);
			/*---- End ----*/
	}

	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/	
		LST_BALCAO model = new LST_BALCAO();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			List<Balcao> balcoes = Balcao.getAllBalcao(model.getEntidade());
			List<LST_BALCAO.Table_1> data = new ArrayList<>();
			for(Balcao b:balcoes){
				LST_BALCAO.Table_1 t = new LST_BALCAO.Table_1();
				t.setP_id(b.getId());
				t.setBalcao(b.getLocalizacao());
				t.setEntidade(b.getNome_entidade());
				if(b.getEstado().toUpperCase().equals("ATIVO")){
					t.setCheckbox_1_check(b.getId());
				}
				t.setCheckbox_1(b.getId());
				data.add(t);
			}
			LST_BALCAOView view = new LST_BALCAOView(model);
			view.table_1.addData(data);
			return this.renderView(view);
		}else{
			return this.redirect("agenda","LST_BALCAO","index");
		}
			/*---- End ----*/
	}
	
	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/
		Config.target="_blank";
		return this.redirect("agenda","CONFIG_BALCAO","index");
		/*---- End ----*/
	}
	

	public Response actionEditar() throws IOException{
		/*---- Insert your code here... ----*/
		Config.target="_blank";
		String [] p_ids = Igrp.getInstance().getRequest().getParameterValues("p_checkbox_1");
		return this.redirect("agenda","CONFIG_BALCAO","editar&id_b="+p_ids[0]);
		/*---- End ----*/
	}
	

	public Response actionRemover() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/
		LST_BALCAO model = new LST_BALCAO();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			String [] p_ids = Igrp.getInstance().getRequest().getParameterValues("p_id_fk");
			boolean x = false;
			if(p_ids.length > 0){
				for(String id:p_ids){
					Balcao b = Balcao.getBalcao(Integer.parseInt(id));
					b.setEstado("INATIVO");
					int status = Balcao.update(b);
					x = status==200 || status==202;
				}
			}
			if(x){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}
		}
		return this.redirect("agenda","LST_BALCAO","index");
		/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*//*---- End ----*/
}
