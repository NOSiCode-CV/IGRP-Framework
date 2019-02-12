package nosi.webapps.igrp_studio.pages.pesquisa_geografia;

import nosi.core.webapp.Controller;
import nosi.core.webapp.databse.helpers.ResultSet;
import nosi.core.webapp.databse.helpers.QueryInterface;
import java.io.IOException;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
/*----#start-code(packages_import)----*/
import nosi.core.config.Config;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Properties;
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
		model.setTreemenu_1(this.chamarServico("0"));
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionRemote_Treemenu_1() throws IOException, IllegalArgumentException, IllegalAccessException{
		String p_id = Core.getParam("p_id");
		String p_active = Core.getParam("p_active");
		Pesquisa_geografia model = new Pesquisa_geografia();
		//programming your save edit calendar
		Response response = new Response();
		response.setContentType(Response.FORMAT_XML);
		response.setContent("your message");
		return response;
		
	}
	
/*----#start-code(custom_actions)----*/
	public String getXml(String id,String desc_menu, String id_par, String child) {
		String xml =	"<row>" + 
						"<context-menu>"+
						"<param>p_geografia="+ desc_menu +"</param>"
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
	public List<Pesquisa_geografia.Treemenu_1>  chamarServico(String id) throws IOException {
		Properties setting = this.loadConfig("common", "main.xml");
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
	
	private Properties loadConfig(String filePath, String fileName) {
		String path = new Config().getBasePathConfig() + File.separator + filePath;
		File file = new File(getClass().getClassLoader().getResource(path + File.separator + fileName).getPath().replaceAll("%20", " "));
		FileInputStream fis = null;
		Properties props = new Properties();
		try {
			fis = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			fis = null;	
		}
		try {
			props.loadFromXML(fis);
		} catch (IOException e) {
			e.printStackTrace();
		}finally{
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return props;
	}
	
	
/*----#end-code----*/
}
