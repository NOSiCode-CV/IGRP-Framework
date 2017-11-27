
package nosi.webapps.igrp.pages.gestaodeacesso;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import nosi.core.webapp.Core;
import static nosi.core.i18n.Translator.gt;
import nosi.core.webapp.Response;
import nosi.core.webapp.Igrp;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.Organization;
import java.util.List;
import java.util.ArrayList;
/*----#END-PRESERVED-AREA----*/

public class GestaodeacessoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
      Gestaodeacesso model = new Gestaodeacesso();

      	List<Gestaodeacesso.Org_table> data = new ArrayList<>();
      	String ichange = Igrp.getInstance().getRequest().getParameter("ichange");
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
          	if(ichange.equalsIgnoreCase("p_aplicacao") && model.getAplicacao()!=null && !model.getAplicacao().equals("")){
              for(Organization org:new Organization().find().andWhere("application","=",Integer.parseInt(model.getAplicacao())).all()){
                Gestaodeacesso.Org_table table = new Gestaodeacesso.Org_table();
                table.setOrg_nome(org.getName());
                table.setEstado(org.getStatus()==1?"Ativo":"INATIVO");
                table.setAidicionar_perfil("igrp","NovoPerfil","index&amp;id_app="+org.getApplication().getId()+"&amp;id_org="+org.getId()+"&amp;target=_blank");
                table.setAidicionar_perfil_desc("Adicionar Perfil");
                table.setMostrar_perfis("igrp","pesquisar-perfil","index&amp;id_app="+org.getApplication().getId()+"&amp;id_org="+org.getId()+"&amp;target=_blank");
                table.setMostrar_perfis_desc("Mostrar Perfil");
                data.add(table);
              }
            }
		}
		GestaodeacessoView view = new GestaodeacessoView(model);
      	view.aplicacao.setValue(new Application().getListApps());
        view.org_table.addData(data);
      	
      	if(ichange!=null && ichange.equalsIgnoreCase("p_aplicacao") && model.getAplicacao()!=null && !model.getAplicacao().equals("")){
          view.btn_adicionar_organica.setPage("NovaOrganica");
          view.btn_adicionar_organica.setLink("index&target=_blank&id_app="+model.getAplicacao());
      	}
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}


	public Response actionAdicionar_organica() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(ADICIONAR_ORGANICA)----*/
		return this.redirect("igrp","NovaOrganica","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(EDITAR)----*/
		return this.redirect("igrp","gestaodeacesso","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionMenu() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(MENU)----*/
		return this.redirect("igrp","gestaodeacesso","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionTransaction() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(TRANSACTION)----*/
		return this.redirect("igrp","gestaodeacesso","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionEliminar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(ELIMINAR)----*/
		return this.redirect("igrp","gestaodeacesso","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionButton_1() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(BUTTON_1)----*/
		Gestaodeacesso model = new Gestaodeacesso();
		if(Igrp.getMethod().equalsIgnoreCase("post")){
			model.load();
			/*if(/* Your code condition *//*){
				Core.setMessageSuccess(gt("Mesagem de Sucesso"));
			 }else{
				Core.setMessageError(gt("Mesagem de Erro"));
			 return this.forward("igrp","Gestaodeacesso","index");
			}*/
		}
		return this.redirect("igrp","Gestaodeacesso","index");
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	
	/*----#END-PRESERVED-AREA----*/
}
