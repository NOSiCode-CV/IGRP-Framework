/*-------------------------*/

/*Create Controller*/

package nosi.webapps.igrp.pages.transacaoorganica;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class TransacaoOrganicaController extends Controller {		

	public Response actionIndex() throws IOException{
		String type = Igrp.getInstance().getRequest().getParameter("type");
		String id = Igrp.getInstance().getRequest().getParameter("id");
		TransacaoOrganicaView view = null;
		if(id!=null && type!=null){
			TransacaoOrganica model = new TransacaoOrganica();
			model.setId(Integer.parseInt(id));
			model.setType(type);
			ArrayList<TransacaoOrganica.Table_1> data = new ArrayList<>();
			List<Transaction> transactions = null;
			if(type.equals("org")){
				transactions = new Organization().getOrgTransaction();
			}else if(type.equals("perfil")){
				ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
				transactions = new Organization().getPerfilTransaction(p.getOrganization()!=null?p.getOrganization().getId():1);
			}
			for(Transaction t:transactions){
				TransacaoOrganica.Table_1 table = new TransacaoOrganica().new Table_1();
				table.setTransacao(t.getId());
				table.setDescricao(t.getDescr());
				Profile prof = new Profile();
				prof.setOrganization(new Organization().findOne(Integer.parseInt(id)));
				prof.setProfileType(new ProfileType().findOne(0));
				prof.setUser(new User().findOne(0));
				prof.setType_fk(t.getId());
				if(type.equals("perfil")){
					ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
					prof.setOrganization(p.getOrganization());
					prof.setProfileType(new ProfileType().findOne(p.getId()));
				}
				if((type.equals("org") && prof.isInsertedOrgTrans()) || (type.equals("perfil") && prof.isInsertedPerfTrans())){
					table.setTransacao_check(t.getId());
				}else{
					table.setTransacao_check(-1);
				}
				data.add(table);
			}
			view = new TransacaoOrganicaView(model);
			view.table_1.addData(data);
		}
		return this.renderView(view);
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		String type = Igrp.getInstance().getRequest().getParameter("type");
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST") && type!=null && id!=null){
			TransacaoOrganica model = new TransacaoOrganica();
			model.load();
			Profile profD = new Profile();
			if(type.equals("org")){
				profD.setOrganization(new Organization().findOne(Integer.parseInt(id)));
				profD.setType("TRANS");
				profD.setProfileType(new ProfileType().findOne(0));
				profD.setUser(new User().findOne(0));
				profD.deleteAllProfile();
			}else if(type.equals("perfil")){
				ProfileType pt = new ProfileType().findOne(Integer.parseInt(id));
				profD.setOrganization(pt.getOrganization());
				profD.setType("TRANS");
				profD.setUser(new User().findOne(0));
				profD.setProfileType(new ProfileType().findOne(Integer.parseInt(id)));
				profD.deleteAllProfile();
			}
			String [] trans = Igrp.getInstance().getRequest().getParameterValues("p_transacao");
			if(trans!=null  && trans.length>0){
				for(String x:trans){
					Profile prof = new Profile();
					prof.setUser(new User().findOne(0));
					prof.setType("TRANS");
					prof.setType_fk(Integer.parseInt(x.toString()));
					if(type.equals("org")){
						prof.setOrganization(new Organization().findOne(Integer.parseInt(id)));
						prof.setProfileType(new ProfileType().findOne(0));
					}else if(type.equals("perfil")){
						ProfileType p = new ProfileType().findOne(Integer.parseInt(id));
						prof.setOrganization(p.getOrganization());
						prof.setProfileType(new ProfileType().findOne(Integer.parseInt(id)));
					}
					prof = prof.insert();
				}
			}
			Igrp.getInstance().getFlashMessage().addMessage("success", "Operação realizada com sucesso");
		}
		return this.redirect("igrp", "TransacaoOrganica", "index","id="+id+"&type="+type);
	}
	
	public Response actionVoltar() throws IOException{
		return this.redirect("igrp","TransacaoOrganica","index");
	}
	
}
