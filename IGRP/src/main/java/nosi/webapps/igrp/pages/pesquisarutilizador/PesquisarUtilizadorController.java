package nosi.webapps.igrp.pages.pesquisarutilizador;

import nosi.core.webapp.Controller;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import java.util.*;
import nosi.core.config.ConfigCommonMainConstants;
import org.apache.commons.text.StringEscapeUtils;
import org.json.JSONObject;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Menu;
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.webapps.igrp.dao.Transaction;
import nosi.webapps.igrp.dao.User;

/*----#end-code----*/
		
public class PesquisarUtilizadorController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		var view = new PesquisarUtilizadorView();
		view.nome.setParam(true);
		view.tb_email.setParam(true);
		view.id.setParam(true);
		view.check_email_hidden.setParam(true);
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT '1' as ativo,'Amet unde voluptatem omnis elit deserunt lorem natus officia deserunt doloremque sit sed voluptatem' as nominho,'8' as range_1,'Perspiciatis iste officia accusantium anim laudantium unde accusantium omnis deserunt elit ut omnis' as nome,'Consectetur omnis stract rem consectetur adipiscing sed aperiam voluptatem unde dolor ut iste ut sed' as tb_email,'Voluptatem mollit omnis officia voluptatem aperiam' as perfile,'hidden-e8de_05e9' as id,'hidden-060b_1428' as check_email_hidden "));
		model.loadUtilizadores_resumo(Core.query(null,"SELECT 'Ut accusantium iste ipsum mollit ut aliqua ipsum sit amet deserunt aperiam deserunt mollit adipiscin' as estado_utilizador,'Elit labore stract voluptatem deserunt adipiscing perspiciatis laudantium sed perspiciatis labore aperiam laudantium unde mollit sed iste doloremque sit ipsum stract natus labore ipsum deserunt' as nome_utilizador,'Dolor elit lorem aliqua sed aliqua dolor ut sit adipiscing sed iste amet omnis doloremque anim iste' as email_utilizador,'Amet omnis officia anim elit a' as total_aplicacoes,'Lorem laudantium accusantium s' as total_organicas,'Sit iste anim sit natus elit o' as perfis_ativos,'Sed officia amet mollit volupt' as perfis_inativos,'Sed sit omnis stract sed anim perspiciatis sit labore dolor natus adipiscing sit totam aliqua aperiam sit omnis sit lorem adipiscing voluptatem sit sed laudantium' as acessos,'Ut aperiam elit aliqua labore iste anim lorem sit accusantium unde lorem rem laudantium stract ipsum sit ipsum elit dolor ipsum amet accusantium natus aperiam' as menus_fora_perfil,'Officia aperiam officia sit magna labore aperiam aliqua mollit amet accusantium unde officia dolor officia iste natus sit laudantium magna stract amet laudantium unde magna' as transacoes_fora_perfil "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.organica.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.perfil.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		//model.setDocumento(this.getConfig().getResolveUrl("tutorial","Listar_documentos","index&p_type=utilizador"));

		view.btn_editar.setVisible(Core.getCurrentUser().getUser_name().equalsIgnoreCase("igrpweb@nosi.cv"));
      
   		ArrayList<PesquisarUtilizador.Table_1> lista = new ArrayList<>();
		int idApp = Core.toInt(model.getAplicacao());
		int idOrg = Core.toInt(model.getOrganica());
		int idProf = Core.toInt(model.getPerfil());
		Map<Object, Object> listApps=new HashMap<>() ;
		if (Core.isHttpGet()) {
			model.setMaximo_linhas(DEFAULT_MAXIMUM_ROWS);
			String dad = Core.getCurrentDad();
			if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
				final Application application =Core.findApplicationByDad(dad);
				idApp = application.getId();
				model.setAplicacao(""+idApp);
				listApps.put(idApp, application.getName());
				view.aplicacao.propertie().add("disabled","true");
				Core.setAttribute("p_aplicacao",idApp);
			}else{
				listApps = new Application().getListApps();
				listApps.put(Core.findApplicationByDad("igrp_studio").getId(), "IGRP Studio");
			}
			view.aplicacao.setValue(listApps);
		}
		final Integer maximumRows = model.getMaximo_linhas();

		Profile prof = new Profile();
		List<Profile> profiles = null;

		ProfileType pp = Core.findProfileById(Core.getCurrentProfile());
		final String nome_filtro = Core.isNotNull(model.getNome_filt(),model.getNome_filt() + "%",null);

		if (pp != null && pp.getCode().equalsIgnoreCase("ADMIN")) {
			profiles = allWithOptionalLimit(prof.find().whereIn("type", PROF,PROF_DIS)
					.andWhere("user.name", "like", nome_filtro)
					.andWhere("user.user_name", "like", model.getUsername()+"%")
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : null)
					.andWhere("user.email", "=", model.getEmail()), maximumRows);
		} else {
			Application app = Core.getCurrentApp();
			profiles = allWithOptionalLimit(prof.find().whereIn("type", "in", PROF,PROF_DIS)
					.andWhere("user.name", "like", nome_filtro)
					.andWhere("user.user_name", "like", model.getUsername()+"%")
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : app.getId())
					.andWhere("user.email", "=", model.getEmail()), maximumRows);
		}

		if (profiles == null) {
			profiles = Collections.emptyList();
		}
		if (maximumRows != null && profiles.size() > maximumRows) {
			profiles = new ArrayList<>(profiles.subList(0, maximumRows));
			Core.setMessageWarning("A pesquisa atingiu o limite configurado de " + maximumRows
					+ " atribuições de perfil. Refine a pesquisa para obter um resumo completo.");
		}else if (Core.isHttpPost())
			Core.setMessageSuccess();

		AccessAudit accessAudit = new AccessAudit();
		List<Profile> overviewProfiles = profiles;
		if (model.getAuditar_acessos() == 1) {
			final boolean isAdminProfile = pp != null && pp.getCode().equalsIgnoreCase("ADMIN");
			final int effectiveAppId = isAdminProfile || idApp != 0 ? idApp : Core.getCurrentApp().getId();
			accessAudit = loadAccessAudit(profiles, effectiveAppId, idOrg, idProf);
			overviewProfiles = accessAudit.profileAssignments;
		}
		final AccessOverview accessOverview = buildAccessOverview(overviewProfiles, accessAudit);
		model.setResumo_utilizadores(String.valueOf(accessOverview.totalUsers));
		model.setResumo_inativos(String.valueOf(accessOverview.inactiveUsers));
		model.setResumo_perfis_ativos(String.valueOf(accessOverview.activeProfiles));
		model.setResumo_problemas(accessOverview.problemSummary());
		if (model.getAuditar_acessos() == 1) {
			final List<PesquisarUtilizador.Utilizadores_resumo> auditRows = model.getProblemas_apenas() == 1
					? accessOverview.problemRows : accessOverview.rows;
			model.setUtilizadores_resumo(auditRows);
			if (model.getProblemas_apenas() == 1) {
				profiles = profiles.stream()
						.filter(profile -> profile.getUser() == null
								|| accessOverview.problemUserIds.contains(profile.getUser().getId()))
						.toList();
			}
		}

		// Preenchendo a tabela
		for (Profile p : profiles) {
			if (p.getUser() == null || p.getProfileType() == null) {
				continue;
			}
			PesquisarUtilizador.Table_1 table1 = new PesquisarUtilizador.Table_1();
			int status = p.getUser().getStatus();
			table1.setAtivo(1);
			if(status == 0 || p.getType().equals(PROF_DIS)) {
				table1.setAtivo_check(0);
			}else {
				table1.setAtivo_check(table1.getAtivo());
			}
			table1.setTb_email(p.getUser().getEmail());
			table1.setCheck_email_hidden(p.getUser().getEmail());
			table1.setNome(p.getUser().getUser_name());
			table1.setNominho(p.getUser().getName());
			final Application profileApplication = p.getProfileType().getApplication();
			final Organization profileOrganization = p.getOrganization() != null
					? p.getOrganization() : p.getProfileType().getOrganization();
			table1.setPerfile((profileApplication != null ? profileApplication.getName() : "-") + "/"
					+ (profileOrganization != null ? profileOrganization.getName() : "-") + "/"
					+ p.getProfileType().getDescr());
			table1.setId("" + p.getId());

			lista.add(table1);
		}

		lista.sort(Comparator.comparing(PesquisarUtilizador.Table_1::getTb_email,
				Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER)));
		switch (this.getConfig().getAutenticationType()) {
		case "ldap":
			view.btn_adicionar_utilizador.setLink("igrp", "LdapUser", "index");
			break;
		case "db":
		default:
			view.btn_adicionar_utilizador.setLink("igrp", "PesquisarUtilizador", "adicionar_utilizador");
		}

		String aux = ConfigCommonMainConstants.IGRP_AUTHENTICATION_GOVCV_ENABLED.environmentValue();
		if ((aux != null && aux.equals("true"))) {
			view.btn_adicionar_utilizador.setVisible(false);	
		}


		//view.organica.setValue(new Organization().getListOrganizations(idApp));
		//view.perfil.setValue(new ProfileType().getListProfiles(idApp, idOrg));
		
		view.nome.setLabel("Username");
		view.nominho.setLabel("Nome");		
		
		view.table_1.addData(lista);
		view.btn_assiocar_etapa.setVisible(false);
		view.btn_pesquisar.setLink("index");
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionConvidar() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","NovoUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (convidar)  *//* End-Code-Block  */
		/*----#start-code(convidar)----*/
   
      // this.addQueryString("p_aplicacao",  model.getAplicacao());
        // this.addQueryString("p_organica",  model.getOrganica());
         //this.addQueryString("p_perfil",  model.getPerfil());
		if (Core.isNotNull(model.getEmail())) {
			User u = Core.findUserByEmail(model.getEmail());
			if (Core.isNotNull(u)) {
               	this.addQueryString("id", u.getId());
				return this.redirect("igrp", "NovoUtilizador", "index", this.queryString());
			}
		}     	
    
      
		/*----#end-code----*/
		return this.redirect("igrp","NovoUtilizador","index", this.queryString());	
	}
	
	public Response actionAdicionar_utilizador() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","RegistarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (adicionar_utilizador)  *//* End-Code-Block  */
		/*----#start-code(adicionar_utilizador)----*/

		/*----#end-code----*/
		return this.redirect("igrp","RegistarUtilizador","index", this.queryString());	
	}
	
	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","PesquisarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (pesquisar)  *//* End-Code-Block  */
		/*----#start-code(pesquisar)----*/
	
			
			return this.forward("igrp", "PesquisarUtilizador", "index");
	
	
		/*----#end-code----*/
			
	}
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","RegistarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (editar)  *//* End-Code-Block  */
		/*----#start-code(editar)----*/
		 
      if (Core.isNotNull(Core.getParam("p_tb_email"))) {
			User u = Core.findUserByEmail(Core.getParam("p_tb_email"));
			if (Core.isNotNull(u)) {
              this.addQueryString("p_id", u.getId());
				return this.redirect("igrp", "RegistarUtilizador", "editar", this.queryString());
			}
		}     	
      
		/*----#end-code----*/
		return this.redirect("igrp","RegistarUtilizador","index", this.queryString());	
	}
	
	public Response actionAssiocar_menu() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (assiocar_menu)  *//* End-Code-Block  */
		/*----#start-code(assiocar_menu)----*/
		int id=Core.getParamInt("p_id");
		this.addQueryString("p_id",id)
			.addQueryString("userEmail", Core.getParam("p_tb_email"))
			.addQueryString("p_type", "user")
			.addQueryString("env_fk",new Profile().findOne(id).getOrganization().getApplication().getId());
       return this.redirect("igrp","MenuOrganica","index", this.queryString());
		
		/*----#end-code----*/
			
	}
	
	public Response actionAssiocar_transacao() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (assiocar_transacao)  *//* End-Code-Block  */
		/*----#start-code(assiocar_transacao)----*/
		this.addQueryString("p_id",Core.getParamInt("p_id"))
			.addQueryString("userEmail", Core.getParam("p_tb_email"))
			.addQueryString("p_type", "user");		
      	return this.redirect("igrp","TransacaoOrganica","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionAssiocar_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","Dominio","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (assiocar_etapa)  *//* End-Code-Block  */
		/*----#start-code(assiocar_etapa)----*/
		Profile p = new Profile().findOne(Core.getParamInt("p_id"));
      	if(p!=null)
	          this.addQueryString("p_id",p.getProfileType().getId());
		this.addQueryString("type", "user").addQueryString("userEmail",Core.getParam("p_tb_email"));
      	return this.redirect("igrp","Etapaaccess","index", this.queryString());
		/*----#end-code----*/
			
	}
	
	public Response actionConvidar_user() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","NovoUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (convidar_user)  *//* End-Code-Block  */
		/*----#start-code(convidar_user)----*/
		Integer id = Core.getParamInt("p_id");		
		Profile p = new Profile().findOne(id);
	 	if(p!=null)
	          this.addQueryString("p_id",p.getProfileType().getId());
  		User u = Core.findUserByEmail(Core.getParam("tb_email"));
			if (u != null) 
			  this.addQueryString("id",u.getId());
   
		return this.forward("igrp","NovoUtilizador","index", this.queryString()); 
		/*----#end-code----*/
			
	}
	
	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		var model = new PesquisarUtilizador();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		  this.addQueryString("p_id","12"); //to send a query string in the URL
		  this.addQueryString("p_nome",Core.getParam("p_nome"));
		  this.addQueryString("p_tb_email",Core.getParam("p_tb_email"));
		  this.addQueryString("p_id",Core.getParam("p_id"));
		  this.addQueryString("p_check_email_hidden",Core.getParam("p_check_email_hidden"));
		  return this.forward("igrp","PesquisarUtilizador","index",this.queryString()); //if submit, loads the values
		  Use model.validate() to validate your model
		  ----#gen-example */
		/* Start-Code-Block (eliminar)  *//* End-Code-Block  */
		/*----#start-code(eliminar)----*/
		String id = Core.getParam("p_id");
		this.addQueryString("p_aplicacao",model.getAplicacao());
		this.addQueryString("target","_blank");
		if (id != null) {
			//Coloca inativo o perfil apagado
			Profile p = new Profile().findOne(id);
			p.setType("INATIVE_" + p.getType());
			p = p.update();

			if (!p.hasError()) {
				//  Count if there is no more profiles for this user, to inativate the invite
				final Long count = new Profile().find()
						.andWhere("type", "=", "PROF")
						.andWhere("organization.application.id", "=", p.getOrganization().getApplication().getId())
						//.andWhere("type_fk", "=", p.getOrganization().getApplication().getId())
						.andWhere("user.id", "=", p.getUser().getId())
						.getCount();
				if(count ==0){
					List<Profile> listDelEnv = new Profile().find()
							.andWhere("type", "=", "ENV")
							.andWhere("type_fk", "=", p.getOrganization().getApplication().getId())
							//.andWhere("organization.id", "=", p.getOrganization().getId())
							//	.andWhere("profileType.id", "=", p.getProfileType().getId())
							.andWhere("user.id", "=", p.getUser().getId())
							.all();
					if(listDelEnv!= null){
						for (Profile delEnv: listDelEnv) {
							delEnv.delete();
						}

					}
				}
				Core.setMessageSuccess();	
				return this.redirect("igrp", "PesquisarUtilizador", "index", this.queryString());
			}
		}      
		Core.setMessageError();     
		return this.forward("igrp", "PesquisarUtilizador", "index", this.queryString());
		/*----#end-code----*/
			
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	private static final int DEFAULT_MAXIMUM_ROWS = 100;
	private static final int BROAD_ACCESS_PROFILE_THRESHOLD = 10;
	private static final int BROAD_ACCESS_APPLICATION_THRESHOLD = 5;
	private static final int BROAD_ACCESS_ORGANIZATION_THRESHOLD = 5;
	private static final String PROF_DIS = "PROF_DIS"; //Profile disabled
	public static final String PROF = "PROF";
	private static final String MENU = "MEN";
	private static final String MENU_USER = "MEN_USER";
	private static final String TRANSACTION = "TRANS";
	private static final String TRANSACTION_USER = "TRANS_USER";

	private static List<Profile> allWithOptionalLimit(Profile query, Integer maximumRows) {
		return maximumRows == null ? query.orderBy("type").all() : query.orderBy("type").limit(maximumRows + 1).all();
	}

	private static AccessOverview buildAccessOverview(List<Profile> profiles, AccessAudit accessAudit) {
		final Map<Integer, UserAccess> users = new LinkedHashMap<>();
		int orphanProfiles = 0;
		int activeProfiles = 0;

		for (Profile profile : profiles) {
			if (profile == null || profile.getUser() == null) {
				orphanProfiles++;
				continue;
			}
			if (PROF.equals(profile.getType())) {
				activeProfiles++;
			}
			users.computeIfAbsent(profile.getUser().getId(), ignored -> new UserAccess(profile.getUser()))
					.add(profile);
		}
		for (UserAudit userAudit : accessAudit.users.values()) {
			users.computeIfAbsent(userAudit.user.getId(), ignored -> new UserAccess(userAudit.user))
					.addAudit(userAudit);
		}

		final AccessOverview result = new AccessOverview();
		result.totalUsers = users.size();
		result.activeProfiles = activeProfiles;
		result.orphanProfiles = orphanProfiles;
		for (UserAccess access : users.values()) {
			if (access.user.getStatus() == 0) {
				result.inactiveUsers++;
			}
			final PesquisarUtilizador.Utilizadores_resumo row = access.toRow();
			if (access.hasProblems()) {
				result.problemUserIds.add(access.user.getId());
				result.problemRows.add(row);
			}
			result.rows.add(row);
		}
		final Comparator<PesquisarUtilizador.Utilizadores_resumo> userOrder = Comparator
				.comparing(PesquisarUtilizador.Utilizadores_resumo::getEmail_utilizador,
						Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER));
		result.rows.sort(userOrder);
		result.problemRows.sort(userOrder);
		return result;
	}

	private static AccessAudit loadAccessAudit(List<Profile> userProfiles, int idApp, int idOrg, int idProf) {
		final AccessAudit result = new AccessAudit();
		final Set<Integer> auditedUserIds = userProfiles.stream()
				.filter(profile -> profile != null && profile.getProfileType() != null)
				.map(Profile::getUser)
				.filter(Objects::nonNull)
				.map(User::getId)
				.collect(java.util.stream.Collectors.toSet());
		if (auditedUserIds.isEmpty()) {
			return result;
		}

		List<Profile> auditedUserProfiles = new Profile().find().whereIn("type", PROF, PROF_DIS)
				.andWhere("user", "IN", auditedUserIds.toArray(Integer[]::new))
				.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
				.andWhere("profileType", "=", idProf != 0 ? idProf : null)
				.andWhere("profileType.application", "=", idApp != 0 ? idApp : null)
				.all();
		if (auditedUserProfiles == null) {
			auditedUserProfiles = Collections.emptyList();
		}
		result.profileAssignments = auditedUserProfiles;

		List<Profile> userPermissions = new Profile().find()
				.whereIn("type", MENU_USER, TRANSACTION_USER)
				.andWhere("user", "IN", auditedUserIds.toArray(Integer[]::new))
				.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
				.andWhere("profileType", "=", idProf != 0 ? idProf : null)
				.andWhere("profileType.application", "=", idApp != 0 ? idApp : null)
				.all();

		if (userPermissions == null) {
			userPermissions = Collections.emptyList();
		}

		if (userPermissions.isEmpty()) {
			return result;
		}

		final Set<Integer> menuIds = userPermissions.stream()
				.filter(profile -> MENU_USER.equals(profile.getType()))
				.map(Profile::getType_fk)
				.filter(Objects::nonNull)
				.collect(java.util.stream.Collectors.toSet());
		final Set<Integer> transactionIds = userPermissions.stream()
				.filter(profile -> TRANSACTION_USER.equals(profile.getType()))
				.map(Profile::getType_fk)
				.filter(Objects::nonNull)
				.collect(java.util.stream.Collectors.toSet());
		final Set<Integer> auditedPermissionIds = new HashSet<>(menuIds);
		auditedPermissionIds.addAll(transactionIds);
		List<Profile> normalPermissions = auditedPermissionIds.isEmpty()
				? Collections.emptyList()
				: new Profile().find().whereIn("type", MENU, TRANSACTION)
						.andWhere("type_fk", "IN", auditedPermissionIds.toArray(Integer[]::new))
						.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
						.andWhere("profileType", "=", idProf != 0 ? idProf : null)
						.andWhere("profileType.application", "=", idApp != 0 ? idApp : null)
						.all();
		if (normalPermissions == null) {
			normalPermissions = Collections.emptyList();
		}

		final Set<String> activeUserProfiles = auditedUserProfiles.stream()
				.filter(profile -> profile != null && PROF.equals(profile.getType()) && profile.getUser() != null)
				.map(PesquisarUtilizadorController::userProfileKey)
				.collect(java.util.stream.Collectors.toSet());
		final Set<String> disabledUserProfiles = auditedUserProfiles.stream()
				.filter(profile -> profile != null && PROF_DIS.equals(profile.getType()) && profile.getUser() != null)
				.map(PesquisarUtilizadorController::userProfileKey)
				.collect(java.util.stream.Collectors.toSet());
		final Set<String> inheritedPermissions = normalPermissions.stream()
				.filter(Objects::nonNull)
				.map(PesquisarUtilizadorController::permissionKey)
				.collect(java.util.stream.Collectors.toSet());

		final Map<Integer, Menu> menus = loadMenus(menuIds);
		final Map<Integer, Transaction> transactions = loadTransactions(transactionIds);
		for (Profile permission : userPermissions) {
			if (permission.getUser() == null) {
				continue;
			}
			final Menu menu = MENU_USER.equals(permission.getType())
					? menus.get(permission.getType_fk()) : null;
			final Transaction transaction = TRANSACTION_USER.equals(permission.getType())
					? transactions.get(permission.getType_fk()) : null;
			if ((menu != null && menu.getStatus() != 1)
					|| (transaction != null && transaction.getStatus() != 1)) {
				continue;
			}
			final String inheritedType = MENU_USER.equals(permission.getType()) ? MENU : TRANSACTION;
			final String profileKey = userProfileKey(permission);
			final boolean userHasActiveProfile = activeUserProfiles.contains(profileKey);
			if (!userHasActiveProfile && disabledUserProfiles.contains(profileKey)) {
				continue;
			}
			final boolean profileContainsPermission = inheritedPermissions.contains(
					permissionKey(inheritedType, permission));
			if (userHasActiveProfile && profileContainsPermission) {
				continue;
			}

			final UserAudit userAudit = result.users.computeIfAbsent(permission.getUser().getId(),
					ignored -> new UserAudit(permission.getUser()));
			final ProfileType permissionProfile = permission.getProfileType();
			if (permissionProfile != null && permissionProfile.getApplication() != null) {
				userAudit.applicationIds.add(permissionProfile.getApplication().getId());
			}
			if (permission.getOrganization() != null) {
				userAudit.organizationIds.add(permission.getOrganization().getId());
			}
			if (MENU_USER.equals(permission.getType())) {
				userAudit.menuExceptions.add(menuAuditLabel(permission, menu, userHasActiveProfile));
			} else {
				userAudit.transactionExceptions.add(transactionAuditLabel(permission, transaction,
						userHasActiveProfile));
			}
		}
		return result;
	}

	private static Map<Integer, Menu> loadMenus(Set<Integer> ids) {
		if (ids.isEmpty()) {
			return Collections.emptyMap();
		}
		final List<Menu> values = new Menu().find()
				.andWhere("id", "IN", ids.toArray(Integer[]::new)).all();
		return values == null ? Collections.emptyMap() : values.stream()
				.collect(java.util.stream.Collectors.toMap(Menu::getId, menu -> menu, (first, ignored) -> first));
	}

	private static Map<Integer, Transaction> loadTransactions(Set<Integer> ids) {
		if (ids.isEmpty()) {
			return Collections.emptyMap();
		}
		final List<Transaction> values = new Transaction().find()
				.andWhere("id", "IN", ids.toArray(Integer[]::new)).all();
		return values == null ? Collections.emptyMap() : values.stream()
				.collect(java.util.stream.Collectors.toMap(Transaction::getId, transaction -> transaction,
						(first, ignored) -> first));
	}

	private static String userProfileKey(Profile profile) {
		return id(profile.getUser()) + ":" + id(profile.getOrganization()) + ":" + id(profile.getProfileType());
	}

	private static String permissionKey(Profile profile) {
		return permissionKey(profile.getType(), profile);
	}

	private static String permissionKey(String type, Profile profile) {
		return type + ":" + profile.getType_fk() + ":" + id(profile.getOrganization()) + ":"
				+ id(profile.getProfileType());
	}

	private static int id(User value) {
		return value != null && value.getId() != null ? value.getId() : 0;
	}

	private static int id(Organization value) {
		return value != null && value.getId() != null ? value.getId() : 0;
	}

	private static int id(ProfileType value) {
		return value != null && value.getId() != null ? value.getId() : 0;
	}

	private static String menuAuditLabel(Profile permission, Menu menu, boolean userHasActiveProfile) {
		return auditContext(permission) + " / "
				+ escape(menu != null ? menu.getDescr() : "Menu #" + permission.getType_fk())
				+ missingProfileLabel(userHasActiveProfile);
	}

	private static String transactionAuditLabel(Profile permission, Transaction transaction,
			boolean userHasActiveProfile) {
		final String value = transaction != null
				? transaction.getCode() + " — " + transaction.getDescr()
				: "Transação #" + permission.getType_fk();
		return auditContext(permission) + " / " + escape(value) + missingProfileLabel(userHasActiveProfile);
	}

	private static String auditContext(Profile permission) {
		final ProfileType profileType = permission.getProfileType();
		final Application application = profileType != null ? profileType.getApplication() : null;
		return escape(application != null ? application.getName() : "Sem aplicação") + " / "
				+ escape(permission.getOrganization() != null ? permission.getOrganization().getName() : "Sem orgânica")
				+ " / " + escape(profileType != null ? profileType.getDescr() : "Sem perfil");
	}

	private static String missingProfileLabel(boolean userHasActiveProfile) {
		return userHasActiveProfile ? "" : " <span class=\"label label-danger\">Perfil não ativo</span>";
	}

	private static final class AccessAudit {
		private final Map<Integer, UserAudit> users = new LinkedHashMap<>();
		private List<Profile> profileAssignments = Collections.emptyList();
	}

	private static final class UserAudit {
		private final User user;
		private final List<String> menuExceptions = new ArrayList<>();
		private final List<String> transactionExceptions = new ArrayList<>();
		private final Set<Integer> applicationIds = new HashSet<>();
		private final Set<Integer> organizationIds = new HashSet<>();

		private UserAudit(User user) {
			this.user = user;
		}
	}

	private static final class AccessOverview {
		private int totalUsers;
		private int inactiveUsers;
		private int activeProfiles;
		private int orphanProfiles;
		private final Set<Integer> problemUserIds = new HashSet<>();
		private final List<PesquisarUtilizador.Utilizadores_resumo> rows = new ArrayList<>();
		private final List<PesquisarUtilizador.Utilizadores_resumo> problemRows = new ArrayList<>();

		private String problemSummary() {
			if (orphanProfiles == 0) {
				return String.valueOf(problemUserIds.size());
			}
			return problemUserIds.size() + " + " + orphanProfiles + " órfão(s)";
		}
	}

	private static final class UserAccess {
		private final User user;
		private final List<Profile> profiles = new ArrayList<>();
		private final Set<Integer> applications = new HashSet<>();
		private final Set<Integer> organizations = new HashSet<>();
		private final Set<String> warnings = new LinkedHashSet<>();
		private final List<String> menuExceptions = new ArrayList<>();
		private final List<String> transactionExceptions = new ArrayList<>();
		private int activeProfiles;
		private int disabledProfiles;

		private UserAccess(User user) {
			this.user = user;
		}

		private void add(Profile profile) {
			profiles.add(profile);
			final ProfileType profileType = profile.getProfileType();
			final Application application = profileType != null ? profileType.getApplication() : null;
			final Organization organization = profile.getOrganization() != null
					? profile.getOrganization()
					: profileType != null ? profileType.getOrganization() : null;

			if (application != null) {
				applications.add(application.getId());
				if (application.getStatus() != 1) {
					warnings.add("Aplicação inativa");
				}
			}
			if (organization != null) {
				organizations.add(organization.getId());
				if (organization.getStatus() != 1) {
					warnings.add("Orgânica inativa");
				}
			}
			if (profileType == null) {
				warnings.add("Perfil inválido");
			} else if (profileType.getStatus() != 1) {
				warnings.add("Tipo de perfil inativo");
			}

			if (PROF.equals(profile.getType())) {
				activeProfiles++;
				if (user.getStatus() == 0) {
					warnings.add("Utilizador inativo com acesso ativo");
				}
			} else if (PROF_DIS.equals(profile.getType())) {
				disabledProfiles++;
			}
		}

		private void addAudit(UserAudit audit) {
			applications.addAll(audit.applicationIds);
			organizations.addAll(audit.organizationIds);
			menuExceptions.addAll(audit.menuExceptions);
			transactionExceptions.addAll(audit.transactionExceptions);
			if (!menuExceptions.isEmpty()) {
				warnings.add("Menu utilizador adicionais");
			}
			if (!transactionExceptions.isEmpty()) {
				warnings.add("Transações utilizador adicionais");
			}
		}

		private boolean hasProblems() {
			return !warnings.isEmpty()
					|| profiles.size() > BROAD_ACCESS_PROFILE_THRESHOLD
					|| applications.size() > BROAD_ACCESS_APPLICATION_THRESHOLD
					|| organizations.size() > BROAD_ACCESS_ORGANIZATION_THRESHOLD;
		}

		private PesquisarUtilizador.Utilizadores_resumo toRow() {
			if (profiles.size() > BROAD_ACCESS_PROFILE_THRESHOLD
					|| applications.size() > BROAD_ACCESS_APPLICATION_THRESHOLD
					|| organizations.size() > BROAD_ACCESS_ORGANIZATION_THRESHOLD) {
				warnings.add("Acesso muito abrangente");
			}

			final PesquisarUtilizador.Utilizadores_resumo row = new PesquisarUtilizador.Utilizadores_resumo();
			row.setEstado_utilizador(user.getStatus() == 0
					? "<span class=\"label label-danger\">Inativo</span>"
					: "<span class=\"label label-success\">Ativo</span>");
			row.setNome_utilizador(user.getName());
			row.setEmail_utilizador(user.getEmail());
			row.setTotal_aplicacoes(String.valueOf(applications.size()));
			row.setTotal_organicas(String.valueOf(organizations.size()));
			row.setPerfis_ativos(String.valueOf(activeProfiles));
			row.setPerfis_inativos(String.valueOf(disabledProfiles));
			row.setAcessos(renderAccessDetails());
			row.setMenus_fora_perfil(renderAuditDetails(menuExceptions,
					"menu adicional", "menus adicionais"));
			row.setTransacoes_fora_perfil(renderAuditDetails(transactionExceptions,
					"transação adicional", "transações adicionais"));
			return row;
		}

		private String renderAccessDetails() {
			final List<String> assignments = profiles.stream()
					.map(UserAccess::assignmentLabel)
					.sorted(String.CASE_INSENSITIVE_ORDER)
					.toList();
			if (assignments.isEmpty()) {
				return "<span class=\"label label-default\">Sem perfis ativos</span>";
			}
			final String assignmentLabel = assignments.size() == 1 ? " atribuição" : " atribuições";
			return "<details class=\"access-details\"><summary>" + assignments.size()
					+ assignmentLabel + "</summary><ul><li>"
					+ String.join("</li><li>", assignments)
					+ "</li></ul></details>";
		}

		private static String renderAuditDetails(List<String> exceptions, String singularLabel,
				String pluralLabel) {
			if (exceptions.isEmpty()) {
				return "<span class=\"label label-success\">OK</span>";
			}
			final List<String> sortedExceptions = exceptions.stream()
					.distinct()
					.sorted(String.CASE_INSENSITIVE_ORDER)
					.toList();
			final String label = sortedExceptions.size() == 1 ? singularLabel : pluralLabel;
			return "<details class=\"access-details access-audit-details\"><summary>"
					+ sortedExceptions.size() + " " + label + "</summary><ul><li>"
					+ String.join("</li><li>", sortedExceptions) + "</li></ul></details>";
		}

		private static String assignmentLabel(Profile profile) {
			final ProfileType profileType = profile.getProfileType();
			final Application application = profileType != null ? profileType.getApplication() : null;
			final Organization organization = profile.getOrganization() != null
					? profile.getOrganization()
					: profileType != null ? profileType.getOrganization() : null;
			final String status = PROF.equals(profile.getType()) ? "Ativo" : "Desativado";
			return escape(application != null ? application.getName() : "Sem aplicação") + " / "
					+ escape(organization != null ? organization.getName() : "Sem orgânica") + " / "
					+ escape(profileType != null ? profileType.getDescr() : "Sem perfil")
					+ " <span class=\"label " + (PROF.equals(profile.getType()) ? "label-success" : "label-default")
					+ "\">" + status + "</span>";
		}
	}

	private static String escape(String value) {
		return StringEscapeUtils.escapeHtml4(value == null ? "" : value);
	}
    public Response actionChangeStatus(){
    	      this.format = Response.FORMAT_JSON;
    	      String email = Core.getParam(new PesquisarUtilizadorView().check_email_hidden.getParamTag());
    	      String status = Core.getParam("p_ativo_check");
			  Integer id = Core.getParamInt("p_id");
    	      boolean response = false;
    	      try {
				  Profile p = new Profile().findOne(id);
				  if(p != null) {
					  p.setType(status.equals("true")?PROF:PROF_DIS);
					  p.update();
				  }
    	          if(status.equals("true") && email != null) {
    	              User u =Core.findUserByEmail(email);
    	              if(u != null && u.getStatus()==0) {
    	                  u.setStatus(1);
    	                  u = u.update();
    	                  if(!u.hasError())
    	                      response = true;
    	              }
    	          }
    	      }catch(Exception ignored) {   
    	      }
    	
			  JSONObject json = new JSONObject();
    	      json.put("status", response);     
    	
    	      return this.renderView(json.toString());
		}
	public Response actionOrganica() {
		this.format = Response.FORMAT_XML;
		return this.renderView(Core.remoteComboBoxXml(
				new Organization().getListOrganizations(
						Core.getParamInt("p_aplicacao")),
				new PesquisarUtilizadorView().organica,null));
	}
	public Response actionPerfil() {
		this.format = Response.FORMAT_XML;
		return this.renderView(Core.remoteComboBoxXml(
				new ProfileType().getListProfiles(
						Core.getParamInt("p_aplicacao"),
						Core.getParamInt("p_organica")),
				new PesquisarUtilizadorView().perfil,
				null));
	}

	/*----#end-code----*/
}
