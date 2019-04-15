package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import nosi.core.webapp.Controller;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Properties;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import nosi.core.webapp.webservices.rest.ConsumeJson;

/*----#end-code----*/
		
public class Pesquisa_geografiaController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException, JSONException{
		Pesquisa_geografia model = new Pesquisa_geografia();
		model.load();
		Pesquisa_geografiaView view = new Pesquisa_geografiaView();
		/*----#start-code(index)----*/
		
		String id = Core.getParam("p_fwl_id");
		model.setTreemenu_1(this.chamarServico(Core.isNotNull(id)?id:"238"));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionRemote_treemenu_1(String p_id) throws IOException, IllegalArgumentException, IllegalAccessException, JSONException{
		String id = Core.getParam("p_id");
		String jsonLookup = Core.getParam("jsonLookup");
		
		//String[] par = Core.getParam("p_ctx_param").split(",");
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>" 
		+ " <treemenu_1> "
				+ "<table>"
				+ "<value>";
		if(Core.isNotNull(jsonLookup)) {
			try {
				jsonLookup = URLDecoder.decode(jsonLookup, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			Properties params = (Properties) Core.fromJson(jsonLookup,Properties.class);			
		
		List<Pesquisa_geografia.Treemenu_1> lista = chamarServico(id);
		
		for(Pesquisa_geografia.Treemenu_1 li : lista) {			
			params.entrySet().forEach(p1->{
				if(p1.getValue().equals("treemenu_1_tmid"))
					id_geo=p1.getKey().toString();
				else if (p1.getValue().equals("treemenu_1_link_desc"))
					des_geo=p1.getKey().toString();
//				else if (p1.getValue().equals("treemenu_1_link"))
//					ds_geo=p1.getKey().toString();
				
			});
			xml += getXml(li.getTreemenu_1_tmid()+"", li.getTreemenu_1_link_desc(),id, li.getTreemenu_1_child(),des_geo,id_geo);			
		
		}
		}
		xml +=  "</value>"
				+ "</table>"
				+ "</treemenu_1>";
		return this.renderView(xml);
	}
	
/*----#start-code(custom_actions)----*/

 String  des_geo ="p_geografia_des";
 String id_geo = "p_geografia_id";
	
 public List<Pesquisa_geografia.Treemenu_1>  chamarServico(String id) throws IOException, JSONException {
		Properties setting = this.configApp.loadConfig("common", "main.xml");
		String url = setting.getProperty("link.rest.pesquisa_geografia")+"?id="+id;
		String authorization = setting.getProperty("authorization.rest.pesquisa_geografia");
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
		 list_geo.sort(Comparator.comparing(Pesquisa_geografia.Treemenu_1::getTreemenu_1_link_desc));
		return list_geo;
	}	
 
 public String getXml(String id,String desc_menu, String id_par, String child, String des_geo,String id_geo) {
		
		String xml =	"<row>" + 
						"<context-menu>"+
						"<param>"+des_geo+"="+ desc_menu +"</param>"+
						"<param>"+id_geo+"="+ id +"</param>"
						+ "</context-menu>"+
							"<treemenu_1_link_desc>" + desc_menu + "</treemenu_1_link_desc>" + 
							"<treemenu_1_tmid>"+ id + "</treemenu_1_tmid>" +
							"<treemenu_1_parent>"+ id_par +"</treemenu_1_parent>" + 
							"<treemenu_1_icon/>" + 
							"<treemenu_1_child>" + child +"</treemenu_1_child>" + 
							"<treemenu_1_active/>" + 
						"</row>";
		return xml;
	}
	
	
/*----#end-code----*/
}
