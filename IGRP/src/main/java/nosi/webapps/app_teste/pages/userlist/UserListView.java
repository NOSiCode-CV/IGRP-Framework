package nosi.webapps.app_teste.pages.userlist;

import nosi.core.webapp.Model;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;
import static nosi.core.i18n.Translator.gt;
import nosi.core.config.Config;

public class UserListView extends View {

	public Field nome;
	public Field morada;
	public Field contacto;
	public Field id_user;
	public Field file_num;
	public IGRPTable table_1;

	public IGRPToolsBar toolsbar_1;
	public IGRPButton btn_new;
	public IGRPButton btn_update;
	public IGRPButton btn_delete;
	public IGRPButton btn_ver_perfil;

	public UserListView(){

		this.setPageTitle("Lista de Utentes");
			
		table_1 = new IGRPTable("table_1","Lista de Utentes");

		nome = new TextField(model,"nome");
		nome.setLabel(gt("Nome"));
		nome.propertie().add("name","p_nome").add("type","text").add("maxlength","2147483647");
		
		morada = new TextField(model,"morada");
		morada.setLabel(gt("Morada"));
		morada.propertie().add("name","p_morada").add("type","text").add("maxlength","2147483647");
		
		contacto = new NumberField(model,"contacto");
		contacto.setLabel(gt("Contacto"));
		contacto.propertie().add("name","p_contacto").add("type","number").add("min","").add("max","").add("maxlength","30").add("total_footer","false").add("java-type","");
		
		id_user = new HiddenField(model,"id_user");
		id_user.setLabel(gt(""));
		id_user.propertie().add("name","p_id_user").add("type","hidden").add("java-type","int").add("maxlength","30").add("tag","id_user");
		
		file_num = new HiddenField(model,"file_num");
		file_num.setLabel(gt(""));
		file_num.propertie().add("name","p_file_num").add("type","hidden").add("maxlength","30").add("java-type","String").add("tag","file_num");
		

		toolsbar_1 = new IGRPToolsBar("toolsbar_1");

		btn_new = new IGRPButton("New","app_teste","UserList","new","modal|refresh","success|fa-plus","","");
		btn_new.propertie.add("type","specific").add("rel","new");

		btn_update = new IGRPButton("Update","app_teste","UserList","update","mpsubmit|refresh","warning|fa-pencil","","");
		btn_update.propertie.add("type","specific").add("rel","update");

		btn_delete = new IGRPButton("Delete","app_teste","UserList","delete","confirm","danger|fa-trash","","");
		btn_delete.propertie.add("type","specific").add("rel","delete");

		btn_ver_perfil = new IGRPButton("Ver Perfil","app_teste","UserList","ver_perfil","submit","primary|fa-user","","");
		btn_ver_perfil.propertie.add("type","specific").add("rel","ver_perfil");

		
	}
		
	@Override
	public void render(){
		

		table_1.addField(nome);
		table_1.addField(morada);
		table_1.addField(contacto);
		table_1.addField(id_user);
		table_1.addField(file_num);

		toolsbar_1.addButton(btn_new);
		table_1.addButton(btn_update);
		table_1.addButton(btn_delete);
		table_1.addButton(btn_ver_perfil);
		this.addToPage(table_1);
		this.addToPage(toolsbar_1);
	}
		
	@Override
	public void setModel(Model model) {
		
		nome.setValue(model);
		morada.setValue(model);
		contacto.setValue(model);
		id_user.setValue(model);
		file_num.setValue(model);	

		table_1.loadModel(((UserList) model).getTable_1());
		}
}
