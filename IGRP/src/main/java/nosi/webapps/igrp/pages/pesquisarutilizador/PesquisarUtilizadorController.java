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
import nosi.webapps.igrp.dao.Organization;
import nosi.webapps.igrp.dao.Profile;
import nosi.webapps.igrp.dao.ProfileType;
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
		model.loadTable_1(Core.query(null,"SELECT '1' as ativo,'Omnis ut omnis sit magna labore mollit sit amet accusantium anim magna sit elit laudantium officia c' as nominho,'5' as range_1,'Natus ut officia totam anim aliqua sit adipiscing lorem adipiscing ut voluptatem lorem iste adipisci' as nome,'Doloremque amet officia mollit amet sed laudantium sit iste voluptatem unde anim voluptatem deserunt' as tb_email,'Sed lorem ipsum laudantium elit consectetur lorem' as perfile,'hidden-b3e1_a40d' as id,'hidden-e708_be5d' as check_email_hidden "));
		model.loadUtilizadores_resumo(Core.query(null,"SELECT 'Omnis sed elit aperiam stract deserunt voluptatem rem lorem unde natus officia unde stract lorem str' as estado_utilizador,'Ipsum accusantium stract mollit dolor deserunt ipsum totam dolor sed ipsum magna labore ipsum deserunt stract aliqua ipsum sed voluptatem sit elit ut aperiam sit' as nome_utilizador,'Labore doloremque mollit laudantium anim sed sit doloremque unde anim accusantium mollit laudantium' as username_utilizador,'Officia aliqua laudantium aperiam omnis lorem natus officia magna aliqua lorem labore deserunt magna' as email_utilizador,'Adipiscing aperiam rem sit und' as total_aplicacoes,'Doloremque laudantium natus ac' as total_organicas,'Elit aliqua dolor sit magna un' as perfis_ativos,'Rem amet doloremque deserunt s' as perfis_inativos,'Adipiscing accusantium deserunt doloremque deserunt consectetur accusantium aperiam consectetur totam laudantium natus lorem laudantium deserunt natus amet adipiscing unde voluptatem ipsum ut aperiam deserunt consectetur' as alertas,'Omnis amet adipiscing ut aliqua consectetur accusantium amet magna rem doloremque amet rem elit amet accusantium natus magna officia perspiciatis lorem labore adipiscing ut sit' as acessos "));
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

		Profile prof = new Profile();
		List<Profile> profiles = null;
		String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			idApp = (new Application().find().andWhere("dad", "=", dad).one()).getId();		
          model.setAplicacao(""+idApp);
          view.aplicacao.propertie().add("disabled","true");
          Core.setAttribute("p_aplicacao",idApp);
		}
		ProfileType pp = Core.findProfileById(Core.getCurrentProfile());
		final String nome_filtro = Core.isNotNull(model.getNome_filt(),model.getNome_filt() + "%",null);

		if (pp != null && pp.getCode().equalsIgnoreCase("ADMIN")) {
			profiles = prof.find().whereIn("type", PROF,PROF_DIS)
					.andWhere("user.name", "like", nome_filtro)
					.andWhere("user.user_name", "like", model.getUsername()+"%")
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : null)
					.andWhere("user.email", "=", model.getEmail())
					.limit(MAXIMUM_PROFILE_RECORDS + 1)
					.all();
		} else {
			Application app = Core.getCurrentApp();
			profiles = prof.find().whereIn("type", "in", PROF,PROF_DIS)
					.andWhere("user.name", "like", nome_filtro)
					.andWhere("user.user_name", "like", model.getUsername()+"%")
					.andWhere("organization", "=", idOrg != 0 ? idOrg : null)
					.andWhere("profileType", "=", idProf != 0 ? idProf : null)
					.andWhere("profileType.application", "=", idApp != 0 ? idApp : app.getId())
					.andWhere("user.email", "=", model.getEmail())
					.limit(MAXIMUM_PROFILE_RECORDS + 1)
					.all();
		}

		if (profiles == null) {
			profiles = Collections.emptyList();
		}
		if (profiles.size() > MAXIMUM_PROFILE_RECORDS) {
			profiles = new ArrayList<>(profiles.subList(0, MAXIMUM_PROFILE_RECORDS));
			Core.setMessageWarning("A pesquisa atingiu o limite máximo de " + MAXIMUM_PROFILE_RECORDS
					+ " atribuições de perfil. Refine a pesquisa para obter um resumo completo.");
		}

		final AccessOverview accessOverview = buildAccessOverview(profiles);
		model.setResumo_utilizadores(String.valueOf(accessOverview.totalUsers));
		model.setResumo_inativos(String.valueOf(accessOverview.inactiveUsers));
		model.setResumo_perfis_ativos(String.valueOf(accessOverview.activeProfiles));
		model.setResumo_problemas(accessOverview.problemSummary());
		model.setUtilizadores_resumo(model.getProblemas_apenas() == 1
				? accessOverview.problemRows : accessOverview.rows);
		if (model.getProblemas_apenas() == 1) {
			profiles = profiles.stream()
					.filter(profile -> profile.getUser() == null
							|| accessOverview.problemUserIds.contains(profile.getUser().getId()))
					.toList();
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

		lista.sort(Comparator
				.comparingInt(PesquisarUtilizador.Table_1::getAtivo_check)
				.reversed()
				.thenComparing(PesquisarUtilizador.Table_1::getNominho,
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

		final Map<Object, Object> listApps = new Application().getListApps();
		listApps.put(Core.findApplicationByDad("igrp_studio").getId(), "IGRP Studio");
		view.aplicacao.setValue(listApps);
		view.organica.setValue(new Organization().getListOrganizations(idApp));
		view.perfil.setValue(new ProfileType().getListProfiles(idApp, idOrg));
		
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
	private static final int MAXIMUM_PROFILE_RECORDS = 5000;
	private static final int BROAD_ACCESS_PROFILE_THRESHOLD = 10;
	private static final int BROAD_ACCESS_APPLICATION_THRESHOLD = 5;
	private static final int BROAD_ACCESS_ORGANIZATION_THRESHOLD = 5;
	private static final String PROF_DIS = "PROF_DIS"; //Profile disabled
	public static final String PROF = "PROF";

	private static AccessOverview buildAccessOverview(List<Profile> profiles) {
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
		result.rows.sort(Comparator.comparing(PesquisarUtilizador.Utilizadores_resumo::getNome_utilizador,
				Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER)));
		result.problemRows.sort(Comparator.comparing(PesquisarUtilizador.Utilizadores_resumo::getNome_utilizador,
				Comparator.nullsLast(String.CASE_INSENSITIVE_ORDER)));
		return result;
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
				warnings.add("Perfil desativado");
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
					? "<span class=\"label label-default\">Inativo</span>"
					: "<span class=\"label label-success\">Ativo</span>");
			row.setNome_utilizador(user.getName());
			row.setUsername_utilizador(user.getUser_name());
			row.setEmail_utilizador(user.getEmail());
			row.setTotal_aplicacoes(String.valueOf(applications.size()));
			row.setTotal_organicas(String.valueOf(organizations.size()));
			row.setPerfis_ativos(String.valueOf(activeProfiles));
			row.setPerfis_inativos(String.valueOf(disabledProfiles));
			row.setAlertas(warnings.isEmpty()
					? "<span class=\"label label-success\">Sem alertas</span>"
					: warnings.stream()
							.map(warning -> "<span class=\"label label-warning access-warning\">"
									+ escape(warning) + "</span>")
							.collect(java.util.stream.Collectors.joining(" ")));
			row.setAcessos(renderAccessDetails());
			return row;
		}

		private String renderAccessDetails() {
			final List<String> assignments = profiles.stream()
					.map(UserAccess::assignmentLabel)
					.sorted(String.CASE_INSENSITIVE_ORDER)
					.toList();
			return "<details class=\"access-details\"><summary>" + assignments.size()
					+ " atribuição(ões)</summary><ul><li>"
					+ String.join("</li><li>", assignments)
					+ "</li></ul></details>";
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