
package nosi.webapps.igrp.pages.transacaoorganica;

import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;
import java.util.ArrayList;
import java.util.List;
/*----#end-code----*/


public class TransacaoOrganicaController extends Controller {		

	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		TransacaoOrganicaView view = new TransacaoOrganicaView();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		model.loadTable_1(Core.query(null,"SELECT 'transacao' as transacao,'nome' as nome "));
		
		
		----#gen-example */
		/*----#start-code(index)----*/
		int id=model.getId();
        String type= model.getType();
	
		if(Core.isInt(model.getId()) && Core.isNotNull(model.getType())){		
			
			ArrayList<TransacaoOrganica.Table_1> data = new ArrayList<>();
			List<Transaction> transactions = null;
			if(type.equals("org")){
				Organization org = new Organization().findOne(id);
				transactions = new Organization().getOrgTransaction(org.getApplication().getId(),org.getId());
			}else if(type.equals("perfil")){
				ProfileType p = new ProfileType().findOne(id);
				if(p.getOrganization()!=null)
					transactions = new Organization().getPerfilTransaction(p.getOrganization().getId(),p.getId());
				else
					transactions = new Organization().getPerfilTransaction(1,p.getId());
			}          
			for(Transaction t:transactions){
				TransacaoOrganica.Table_1 table =new TransacaoOrganica.Table_1();
				table.setTransacao(t.getId());
				table.setNome(t.getDescr()+" ("+t.getCode()+")");
				if(t.isInserted()){
					table.setTransacao_check(t.getId());
				}else{
					table.setTransacao_check(-1);
				}
				data.add(table);
			}
			
			view.table_1.addData(data);
		}
	
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL

		 return this.forward("igrp","TransacaoOrganica","index", this.queryString()); //if submit, loads the values
		}
		
		----#gen-example */
		/*----#start-code(gravar)----*/
		int id = model.getId();
		List<ProfileType> list = null;
		Organization organization1 = new Organization();
		String type = model.getType();
		if(Core.isInt(id) && Core.isNotNull(type)){
			Profile profD = new Profile();
			if(type.equals("org")){
				organization1 = new Organization().findOne(id);
				profD.setOrganization(organization1);
				profD.setType("TRANS");
				profD.setProfileType(profAdmin);
				profD.setUser(userAdmin);
				profD.deleteAllProfile();
				list = new ProfileType().find().andWhere("organization.id", "=", organization1.getId()).all();
				if (list != null && list.size() > 0) {
					list.sort((o1, o2) -> {
						if (o1.getId() > o2.getId())
							return 1;
						else if (o1.getId() < o2.getId())
							return -1;
						return 0;
					});
					ProfileType pAux = list.get(0);
					Profile pAux2 = new Profile();
					pAux2.setOrganization(organization1);
					pAux2.setType("TRANS");
					pAux2.setUser(userAdmin);
					pAux2.setProfileType(pAux);
					pAux2.deleteAllProfile();
				}
			}else if(type.equals("perfil")){
				ProfileType pt = new ProfileType().findOne(id);
				profD.setOrganization(pt.getOrganization());
				profD.setType("TRANS");
				profD.setUser(userAdmin);
				profD.setProfileType(new ProfileType().findOne(id));
				profD.deleteAllProfile();
			}
			String [] trans = Core.getParamArray("p_transacao");
			if(trans!=null  && trans.length>0){
              Boolean sucess=true;
				for(String x:trans){
					Profile prof = new Profile();
					prof.setUser(userAdmin);
					prof.setType("TRANS");
					prof.setType_fk(Integer.parseInt(x.toString()));
					if(type.equals("org")){
						Organization auxOrg = new Organization().findOne(id);
						prof.setOrganization(auxOrg);
						prof.setProfileType(profAdmin);
						list = new ProfileType().find().andWhere("organization.id", "=", auxOrg.getId()).all();
						if (list != null && list.size() > 0) {
							list.sort((o1, o2) -> {
								if (o1.getId() > o2.getId())
									return 1;
								else if (o1.getId() < o2.getId())
									return -1;
								return 0;
							});
							ProfileType pAux = list.get(0);
							Profile pAux2 = new Profile();
							pAux2.setUser(userAdmin);
							pAux2.setType("TRANS");		
							pAux2.setType_fk(Integer.parseInt(x.toString()));
							pAux2.setOrganization(auxOrg);
							pAux2.setProfileType(pAux);
							pAux2.insert();
						}
					}else if(type.equals("perfil")){
						ProfileType p = new ProfileType().findOne(id);
						prof.setOrganization(p.getOrganization());
						prof.setProfileType(new ProfileType().findOne(id));
					}
					prof = prof.insert();
                  if(Core.isNull(prof)){
                    sucess=false;
                  }
				}
              if(sucess){
                Core.setMessageSuccess();
              }else
                Core.setMessageError();
              
			}		
       			
		}
	 return this.forward("igrp","TransacaoOrganica","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionGestao_de_transacoes() throws IOException, IllegalArgumentException, IllegalAccessException{
		
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		/*----#gen-example
		  This is an example of how you can implement your code:
		  In a .query(null,... change 'null' to your db connection name added in application builder.
		
		 this.addQueryString("p_id","12"); //to send a query string in the URL

		 return this.forward("igrp","Transaccao","index", this.queryString()); //if submit, loads the values
		}
		
		----#gen-example */
		/*----#start-code(gestao_de_transacoes)----*/
		
		
		/*----#end-code----*/
		return this.redirect("igrp","Transaccao","index", this.queryString());	
	}
	
	/*----#start-code(custom_actions)----*/

	private User userAdmin = new User().getUserAdmin();
	private ProfileType profAdmin = new ProfileType().getProfileAdmin();
	/*----#end-code----*/
	}
