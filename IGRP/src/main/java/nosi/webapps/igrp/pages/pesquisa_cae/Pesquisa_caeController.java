package nosi.webapps.igrp.pages.pesquisa_cae;

import java.io.IOException;
/*----#start-code(packages_import)----*/
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Properties;

import nosi.core.webapp.Controller;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.webapps.igrp.pages.pesquisa_cae.Pesquisa_cae.Treemenu_1;
import nosi.webapps.igrp.services.rest.pesquisa_cae.pojo.Cae;
import nosi.webapps.igrp.services.rest.pesquisa_cae.rest.PesquisaCae;

import java.util.ArrayList;
import java.util.Comparator;
import java.net.URLDecoder;


/*----#end-code----*/
		
public class Pesquisa_caeController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_cae model = new Pesquisa_cae();
		model.load();
		Pesquisa_caeView view = new Pesquisa_caeView();
		/*----#start-code(index)----*/
		
			List<Pesquisa_cae.Treemenu_1> treemenu_1 = this.pesquisaCae("1");
			
			model.setTreemenu_1(treemenu_1);

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	

	public Response actionRemote_treemenu_1() throws IOException, IllegalArgumentException, IllegalAccessException{
		String p_id = Core.getParam("p_id");
		String jsonLookup = Core.getParam("jsonLookup");
		StringBuilder xml = new StringBuilder("<?xml version=\"1.0\" encoding=\"utf-8\"?>"
                                              + " <treemenu_1> "
                                              + "<table>"
                                              + "<value>");
		
		if(Core.isNotNull(jsonLookup)) {
           jsonLookup = URLDecoder.decode(jsonLookup, StandardCharsets.UTF_8);
           Properties params = (Properties) Core.fromJson(jsonLookup,Properties.class);
			params.forEach((key, value) -> {
               if (value.equals("treemenu_1_tmid"))
                  id_cae = key.toString();
               else if (value.equals("treemenu_1_link_desc"))
                  des_cae = key.toString();
            });
		}
		List<Treemenu_1> lista = this.pesquisaCae(p_id);
		for(Pesquisa_cae.Treemenu_1 li : lista) {			
			
			xml.append(getXml(li.getTreemenu_1_tmid() + "", li.getTreemenu_1_link_desc(), p_id, li.getTreemenu_1_child(), des_cae, id_cae));
		}
		xml.append("</value>" + "</table>" + "</treemenu_1>");
		return this.renderView(xml.toString());
		
	}
	
/*----#start-code(custom_actions)----*/
	 String  des_cae ="p_cae_des";
	 String id_cae = "p_cae_id";

	private List<Treemenu_1> pesquisaCae(String id) {
		List<Pesquisa_cae.Treemenu_1> treemenu_1 = new ArrayList<>();
		List<Cae> caes = PesquisaCae.pesquisaCae(id);
		for(Cae cae:caes) {
			Treemenu_1 t1 = new Treemenu_1();
			t1.setTreemenu_1_tmid(""+cae.getId());
			t1.setTreemenu_1_link_desc(cae.getCodigo()+" - "+cae.getDescricao());
			t1.setTreemenu_1_child("1");
			treemenu_1.add(t1 );
		} 
		treemenu_1.sort(Comparator.comparing(Pesquisa_cae.Treemenu_1::getTreemenu_1_link_desc));
		return treemenu_1;
	}
	 public String getXml(String id,String desc_menu, String id_par, String child, String des_cae,String id_cae) {
		
		 int isPublic = Core.getParamInt("isPublic");
			String ParamisPublic="";
						if(isPublic==1) {
							ParamisPublic="<param>isPublic="+ isPublic + "</param>" ;
						}
		 
		 return	"<row>" +
							"<context-menu>"+
							"<param>"+des_cae+"="+ desc_menu +"</param>"+
							"<param>"+id_cae+"="+ id +"</param>"
							+ParamisPublic
							+ "</context-menu>"+
								"<treemenu_1_link_desc>" + desc_menu + "</treemenu_1_link_desc>" + 
								"<treemenu_1_tmid>"+ id + "</treemenu_1_tmid>" +
								"<treemenu_1_parent>"+ id_par +"</treemenu_1_parent>" + 
								"<treemenu_1_icon/>" + 
								"<treemenu_1_child>" + child +"</treemenu_1_child>" + 
								"<treemenu_1_active/>" + 
							"</row>";
	}
/*----#end-code----*/
}
