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
import java.io.IOException;
import java.util.ArrayList;


public class TransacaoOrganicaController extends Controller {		

	public Response actionIndex() throws IOException{
		String type = Igrp.getInstance().getRequest().getParameter("type");
		String id = Igrp.getInstance().getRequest().getParameter("id");
		if(id!=null && type!=null){
			TransacaoOrganica model = new TransacaoOrganica();
			model.setId(Integer.parseInt(id));
			model.setType(type);
			TransacaoOrganicaView view = new TransacaoOrganicaView(model);
			ArrayList<TransacaoOrganica.Table_1> data = new ArrayList<>();
			Object[] transactions = null;
			if(type.equals("org")){
				transactions = new Organization().getOrgTransaction();
			}else if(type.equals("perfil")){
				ProfileType pt = new ProfileType();
				pt.setId(Integer.parseInt(id));
				ProfileType p = (ProfileType) pt.getOne();
				transactions = new Organization().getPerfilTransaction(p.getOrg_fk());
			}
			for(Object obj:transactions){
				Transaction t = (Transaction) obj;
				TransacaoOrganica.Table_1 table = new TransacaoOrganica().new Table_1();
				table.setTransacao(t.getId());
				table.setDescricao(t.getDescr());
				Profile prof = new Profile();
				prof.setOrg_fk(Integer.parseInt(id));
				prof.setProf_type_fk(0);
				prof.setUser_fk(0);
				prof.setType_fk(t.getId());
				if(type.equals("perfil")){
					ProfileType pt = new ProfileType();
					pt.setId(Integer.parseInt(id));
					ProfileType p = (ProfileType) pt.getOne();
					prof.setOrg_fk(p.getOrg_fk());
					prof.setProf_type_fk(pt.getId());
				}
				if((type.equals("org") && prof.isInsertedOrgTrans()) || (type.equals("perfil") && prof.isInsertedPerfTrans())){
					table.setTransacao_check(t.getId());
				}else{
					table.setTransacao_check(-1);
				}
				data.add(table);
			}
			view.table_1.addData(data);
			return this.renderView(view);
		}
		return null;
	}

	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		String id = Igrp.getInstance().getRequest().getParameter("id");
		String type = Igrp.getInstance().getRequest().getParameter("type");
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST") && type!=null && id!=null){
			TransacaoOrganica model = new TransacaoOrganica();
			model.load();
			Profile profD = new Profile();
			profD.setProf_type_fk(0);
			if(type.equals("org")){
				profD.setOrg_fk(Integer.parseInt(id));
				profD.setType("TRANS");
				profD.setUser_fk(0);
				profD.deleteAllOrgProfile();
			}else if(type.equals("perfil")){
				ProfileType pt = new ProfileType();
				pt.setId(Integer.parseInt(id));
				ProfileType p = (ProfileType) pt.getOne();
				profD.setOrg_fk(p.getOrg_fk());
				profD.setType("TRANS");
				profD.setProf_type_fk(Integer.parseInt(id));
				profD.deleteAllPerfilProfile();
			}
			String [] trans = Igrp.getInstance().getRequest().getParameterValues("p_transacao");
			if(trans!=null  && trans.length>0){
				for(String x:trans){
					Profile prof = new Profile();
					prof.setUser_fk(0);
					if(type.equals("org")){
						prof.setOrg_fk(Integer.parseInt(id));
						prof.setType("TRANS");
						prof.setType_fk(Integer.parseInt(x.toString()));
						prof.setProf_type_fk(0);
					}else if(type.equals("perfil")){
						ProfileType pt = new ProfileType();
						pt.setId(Integer.parseInt(id));
						ProfileType p = (ProfileType) pt.getOne();
						prof.setOrg_fk(p.getOrg_fk());
						prof.setType("TRANS");
						prof.setType_fk(Integer.parseInt(x.toString()));
						prof.setProf_type_fk(Integer.parseInt(id));
					}
					prof.insert();
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
