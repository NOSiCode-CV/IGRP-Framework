package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/

import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import nosi.core.webapp.webservices.rest.ConsumeJson;

/*----#end-code----*/
		
public class Pesquisa_geografiaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Pesquisa_geografia model = new Pesquisa_geografia();
		model.load();
		Pesquisa_geografiaView view = new Pesquisa_geografiaView();
		/*----#start-code(index)----*/
		model.setTreemenu_1(chamarServico("0"));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionRemotetreemenu_1(String p_id) throws IOException, IllegalArgumentException, IllegalAccessException{
		String id = Core.getParam("p_id");
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
		+ " <treemenu_1> "
				+ "<table>"
				+ "<value>";
		List<Pesquisa_geografia.Treemenu_1> lista = chamarServico(id);
		for(Pesquisa_geografia.Treemenu_1 li : lista) {
			xml += getXml(li.getTreemenu_1_tmid()+"", li.getTreemenu_1_link_desc(),id);
		}
		xml +=  "</value>"
				+ "</table>"
				+ "</treemenu_1>";
		return this.renderView(xml);
	}
	
/*----#start-code(custom_actions)----*/
	public String getXml(String id,String desc_menu, String id_par) {
		String xml =	"<row>" + 
							"<treemenu_1_link_desc>" + desc_menu + "</treemenu_1_link_desc>" + 
							"<treemenu_1_tmid>"+ id + "</treemenu_1_tmid>" +
							"<treemenu_1_parent>"+ id_par +"</treemenu_1_parent>" + 
							"<treemenu_1_icon/>" + 
							"<treemenu_1_child>1</treemenu_1_child>" + 
							"<treemenu_1_active/>" + 
						"</row>";
		
		return xml;
	}
	public List<Pesquisa_geografia.Treemenu_1>  chamarServico(String id) throws IOException {
		String url = "https://stage-pdex.gov.cv:8243/geografia/1.0.0/select_geo_by_id?id="+id;
		String authorization = "Bearer 18dacc19-f73b-3600-ab37-9fac8eb4f60f";
		ConsumeJson json_obj = new ConsumeJson();
		String json  = json_obj.getJsonFromUrl(url, authorization);
		List<Pesquisa_geografia.Treemenu_1> list_geo = new ArrayList<>();
		JSONObject obj = new JSONObject(json);
		JSONObject Entries = obj.getJSONObject("Entries");
		try {
			JSONArray Entry = Entries.getJSONArray("Entry");
			for(int i = 0; i < Entry.length(); i++) {
				JSONObject local = Entry.getJSONObject(i);
				Pesquisa_geografia.Treemenu_1 tab_geo = new Pesquisa_geografia.Treemenu_1();
				tab_geo.setTreemenu_1_tmid(local.getString("id"));
				tab_geo.setTreemenu_1_link_desc(local.getString("nome"));
				tab_geo.setTreemenu_1_child("1");
				list_geo.add(tab_geo);
			}
		}catch (Exception e) {
		}
		return list_geo;
	}
/*----#end-code----*/
}
