package nosi.webapps.igrp.pages.transacaoorganica;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import nosi.core.config.ConfigDBIGRP;
import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.helpers.CheckBoxHelper;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Share;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;
import nosi.webapps.igrp_studio.pages.partilhageral.TipoPartilha;

/*----#end-code----*/
		
public class TransacaoOrganicaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		TransacaoOrganicaView view = new TransacaoOrganicaView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as transacao,'Officia consectetur mollit nat' as nome "));
		  ----#gen-example */
		/*----#start-code(index)----*/
		int id=model.getId();
        String type= model.getType();
        
        model.setHelp(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=transacao"));
		if(Core.isInt(id) && Core.isNotNull(type)){		
			
			ArrayList<TransacaoOrganica.Table_1> data = new ArrayList<>();
			List<Transaction> transactions = null;
			User user = null;
			Profile profile = null;
			Application app = null;
			
			if(type.equals("org")){
				Organization org = Core.findOrganizationById(id);
				app = org.getApplication();
				transactions = new Organization().getOrgTransaction(org.getApplication().getId(),org.getId());
				view.btn_gestao_de_transacoes.addParameter("p_aplicacao", org.getApplication().getId());
				
			}else if(type.equals("perfil")){
				ProfileType p = new ProfileType().findOne(id); 
				app = p.getApplication();
				if(p.getOrganization()!=null)
					transactions = new Organization().getPerfilTransaction(p.getOrganization().getId(),p.getId());
				else
					transactions = new Organization().getPerfilTransaction(1,p.getId()); 
			} else if(type.equalsIgnoreCase("user")) {
				profile = new Profile().findOne(id);
				app = profile.getOrganization().getApplication();
		      	user = Core.findUserByEmail(Core.getParam("userEmail"));
		      	if(user!=null)
		      		transactions = new Organization().getOrgTransactionByUser(profile.getOrganization().getId(),user.getId());
			}   
			
			for(Transaction t : transactions){ 
				if(t.getApplication().getId().equals(app.getId())) { 
					TransacaoOrganica.Table_1 table = new TransacaoOrganica.Table_1(); 
					table.setTransacao(t.getId()); 
					table.setNome(t.getDescr()+" ("+t.getCode()+")"); 
					if(t.isInserted()){
						table.setTransacao_check(t.getId()); 
					}else{
						table.setTransacao_check(-1); 
					}
					data.add(table);
				}
			}
			
			sharesTransactions(data, model); 
			
			data.sort(Comparator.comparing(TransacaoOrganica.Table_1::getTransacao_check).reversed()); 
			
			if(type.equals("user") && user!=null) {
				view.btn_gravar.addParameter("user_id",  user.getId())
				.addParameter("userEmail",  user.getEmail())
				.addParameter("org_id", profile.getOrganization().getId())
				.addParameter("prof_id", profile.getProfileType().getId());
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
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gravar)----*/
		if(Core.isInt(model.getId()) && Core.isNotNull(model.getType())){
			
			CheckBoxHelper cb = Core.extractCheckBox(Core.getParamArray("p_transacao_fk"), Core.getParamArray("p_transacao_check_fk"));
			this.deleteOldTransactions(model,cb.getUncheckedIds());
			this.assocNewsTransactios(model, this.filterIds(model,cb.getChekedIds())); 
			
		}
		this.addQueryString("userEmail",Core.getParam("userEmail"));	
	 return this.forward("igrp","TransacaoOrganica","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionGestao_de_transacoes() throws IOException, IllegalArgumentException, IllegalAccessException{
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","Transaccao","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(gestao_de_transacoes)----*/
		 this.addQueryString("p_aplicacao",Core.getParam("p_aplicacao"));
		
		/*----#end-code----*/
		return this.redirect("igrp","Transaccao","index", this.queryString());	
	}
	
	public Response actionNovo_transacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		TransacaoOrganica model = new TransacaoOrganica();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  return this.forward("igrp","EditarTransacao","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/*----#start-code(novo_transacao)----*/
		
		this.addQueryString("novo_transa","novo_transa");
		
		/*----#end-code----*/
		return this.redirect("igrp","EditarTransacao","index", this.queryString());	
	}
	
		
		
/*----#start-code(custom_actions)----*/

	private User userAdmin = new User().getUserAdmin();
	private ProfileType profAdmin = new ProfileType().getProfileAdmin();
	static final String TRANS_USER = "TRANS_USER";
	static final String TRANS = "TRANS";
	private void deleteOldTransactions(TransacaoOrganica model,List<String> ids) {
		if(ids!=null && !ids.isEmpty()) {
           switch (model.getType()) {
              case "org":
                 this.deleteTransaction(ids, TRANS, model.getId(), this.profAdmin.getId(), this.userAdmin.getId());
                 List<ProfileType> profilesOfOrg = new ProfileType().find().andWhere("organization.id", "=", model.getId()).all();
                 for (ProfileType p : profilesOfOrg) {
                    this.deleteTransaction(ids, TRANS, p.getOrganization().getId(), p.getId(), this.userAdmin.getId());
                 }
                 break;
              case "perfil":
                 ProfileType pt = new ProfileType().findOne(model.getId());
                 this.deleteTransaction(ids, TRANS, pt.getOrganization().getId(), pt.getId(), this.userAdmin.getId());
                 break;
              case "user":

                 this.deleteTransaction(ids, TRANS_USER, Core.getParamInt("org_id"), Core.getParamInt("prof_id"), Core.getParamInt("user_id"));
                 break;
           }
		}
	}	

	private void deleteTransaction(List<String> ids, String type,int org_id,int prof_id,int user_id) {
		for(String id:ids) {
			ResultSet r = Core.delete(ConfigDBIGRP.FILE_NAME_HIBERNATE_IGRP_CONFIG,"tbl_profile")
					.where()
					.andWhere("type", "=", type)
					.andWhere("type_fk", "=", Core.toInt(id))
					.andWhere("prof_type_fk", "=",prof_id)
					.andWhere("user_fk", "=",user_id)
					.andWhere("org_fk", "=", org_id)
					.execute();	
			if(r!=null && r.hasError()) {
				Core.setMessageError(r.getError());
				break;
			}
		}
	}

	private List<String> filterIds(TransacaoOrganica model,List<String> chekedIds){
		List<Profile> profiles = null;
       switch (model.getType()) {
          case "org":
             profiles = new Profile().find()
                     .andWhere("organization", "=", model.getId())
                     .andWhere("profileType", "=", this.profAdmin.getId())
                     .andWhere("type", "=", TRANS)
                     .andWhere("user", "=", this.userAdmin.getId())
                     .all();
             break;
          case "perfil":
             ProfileType pt = new ProfileType().findOne(model.getId());
             profiles = new Profile().find()
                     .andWhere("organization", "=", pt.getOrganization().getId())
                     .andWhere("profileType", "=", pt.getId())
                     .andWhere("type", "=", TRANS)
                     .andWhere("user", "=", this.userAdmin.getId())
                     .all();
             break;
          case "user":
             profiles = new Profile().find()
                     .andWhere("organization", "=", Core.getParamInt("org_id"))
                     .andWhere("profileType", "=", Core.getParamInt("prof_id"))
                     .andWhere("type", "=", TRANS_USER)
                     .andWhere("user", "=", Core.getParamInt("user_id"))
                     .all();
             break;
       }
		List<Integer> ids = profiles!=null?profiles.stream().map(Profile::getType_fk).collect(Collectors.toList()):null;
		return chekedIds.stream().filter(m->ids!=null && !ids.contains(Core.toInt(m))).collect(Collectors.toList());
	}
	
	private void assocNewsTransactios(TransacaoOrganica model,List<String> ids) {	
		if(!ids.isEmpty()){
			List<ProfileType> list = null;
            boolean sucess=true;
			for(String x:ids){
				Profile prof = new Profile();
				prof.setUser(userAdmin);
				prof.setType(TRANS);
				prof.setType_fk(Integer.parseInt(x));
               switch (model.getType()) {
                  case "org":
                     Organization auxOrg = new Organization().findOne(model.getId());
                     prof.setOrganization(auxOrg);
                     prof.setProfileType(profAdmin);
                     list = new ProfileType().find().andWhere("organization.id", "=", auxOrg.getId()).all();
                     if (list != null && !list.isEmpty()) {
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
                        pAux2.setType(TRANS);
                        pAux2.setType_fk(Integer.parseInt(x));
                        pAux2.setOrganization(auxOrg);
                        pAux2.setProfileType(pAux);
                        pAux2.insert();
                     }
                     break;
                  case "perfil":
                     ProfileType p = new ProfileType().findOne(model.getId());
                     prof.setOrganization(p.getOrganization());
                     prof.setProfileType(p);
                     break;
                  case "user":
                     prof.setType(TRANS_USER);
                     prof.setOrganization(new Organization().findOne(Core.getParamInt("org_id")));
                     prof.setUser(new User().findOne(Core.getParamInt("user_id")));
                     prof.setProfileType(new ProfileType().findOne(Core.getParamInt("prof_id")));
                     break;
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
	
	
	private void sharesTransactions(ArrayList<TransacaoOrganica.Table_1> data, TransacaoOrganica model) {
		
		String type = model.getType(); 
		
		List<Share> sharesTransactions = null;
		
		
		try {
			if(type.equals("org")){
				
				Organization org = Core.findOrganizationById(model.getId());
				sharesTransactions = new Share().find()
							.andWhere("type", "=", TipoPartilha.TRANSACTION.getCodigo())
							.andWhere("status", "=", 1)
							.andWhere("env.id", "=", org.getApplication().getId())
							.all(); 
					
					
				}else if(type.equals("perfil")){
					ProfileType p = new ProfileType().findOne(model.getId()); 
					if( p.getApplication() != null) { 
						sharesTransactions = new Share().find()
								.andWhere("type", "=", TipoPartilha.TRANSACTION.getCodigo())
								.andWhere("status", "=", 1)
								.andWhere("env.id", "=", p.getApplication().getId())
								.all(); 
					}else { 
						sharesTransactions = new Share().find()
								.andWhere("type", "=", TipoPartilha.TRANSACTION.getCodigo())
								.andWhere("status", "=", 1)
								.andWhere("env.id", "=", 1)
								.all(); 
					}
					
					
				}else if(type.equalsIgnoreCase("user")) {
					Profile profile = new Profile().findOne(model.getId());
					sharesTransactions = new Share().find()
							.andWhere("type", "=", TipoPartilha.TRANSACTION.getCodigo())
							.andWhere("status", "=", 1)
							.andWhere("env.id", "=", profile.getOrganization().getApplication().getId())
							.all(); 
					
				}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		if(sharesTransactions != null) {
			
			for(Share shareTransaction : sharesTransactions){
				boolean add2Table=true;
				try {
					TransacaoOrganica.Table_1 table = new TransacaoOrganica.Table_1();
					
					table.setTransacao(shareTransaction.getType_fk());
					
					Transaction t = new Transaction().findOne(Core.toInt("" + shareTransaction.getType_fk())); 
					
					
					table.setNome(t.getDescr() + " (" + t.getCode() + ")" + " [" + shareTransaction.getOwner().getDad()+ "]");
					
					
					if(type.equals("org")){
						
						Profile p_ = new Profile().find() 
								  .andWhere("type_fk", "=", shareTransaction.getType_fk()) 
								  .andWhere("type", "=", TRANS) 
								  .andWhere("organization.id", "=", model.getId())
								  .one(); 
						
						if(p_ != null){
							table.setTransacao_check(shareTransaction.getType_fk()); 
						}else{
							table.setTransacao_check(-1);
						}
						
					}else if(type.equals("perfil")){
						
						ProfileType p = new ProfileType().findOne(model.getId()); 
						
						if(p.getOrganization() != null) {
							
							Profile p_1 = new Profile().find() 
									  .andWhere("type_fk", "=", shareTransaction.getType_fk()) 
									  .andWhere("type", "=", TRANS) 
									  .andWhere("profileType.id", "=", 1) 
									  .andWhere("organization.id", "=", p.getOrganization().getId())
									  .one();
							
							if(p_1!=null) {
								Profile p_ = new Profile().find() 
										.andWhere("type_fk", "=", shareTransaction.getType_fk()) 
										.andWhere("type", "=", TRANS) 
										.andWhere("profileType.id", "=", p.getId()) 
										.andWhere("organization.id", "=", p.getOrganization().getId())
										.one();
								if(p_ != null){
									table.setTransacao_check(shareTransaction.getType_fk()); 
								}else{
									table.setTransacao_check(-1);
								}								
							}else
								add2Table=false;						

							
						}
						else {
							
							Profile p_ = new Profile().find() 
									  .andWhere("type_fk", "=", shareTransaction.getType_fk()) 
									  .andWhere("type", "=", TRANS) 
									  .andWhere("profileType.id", "=", p.getId()) 
									  .andWhere("organization.id", "=", 1)
									  .one();
							
							if(p_ != null){
								table.setTransacao_check(shareTransaction.getType_fk()); 
							}else{
								table.setTransacao_check(-1); 
							}
							
						}
					} 
					else if(type.equalsIgnoreCase("user")) {
						
						User user = Core.findUserByEmail(Core.getParam("userEmail"));
						Profile p = new Profile().findOne(model.getId());
						Profile p_1 = new Profile().find().andWhere("type_fk", "=", shareTransaction.getType_fk())
								.andWhere("type", "=", TRANS)
								.andWhere("profileType.id", "=", 1)
								.andWhere("organization.id", "=", p.getOrganization().getId())
								.one();

						if (p_1 != null) {
							Profile p_ = new Profile().find().andWhere("type_fk", "=", shareTransaction.getType_fk())
									.andWhere("type", "=", TRANS_USER)
									.andWhere("user.id", "=", user.getId())
									.andWhere("organization.id", "=", p.getOrganization().getId()).one();

							if (p_ != null) {
								table.setTransacao_check(shareTransaction.getType_fk());
							} else {
								table.setTransacao_check(-1);
							}
						} else
							add2Table = false;
						
					}
					if(add2Table)
						data.add(table);
					
				} catch (Exception ignored) {
				}
			} 
			
		}
		
	}
	
	
	/*----#end-code----*/
}
