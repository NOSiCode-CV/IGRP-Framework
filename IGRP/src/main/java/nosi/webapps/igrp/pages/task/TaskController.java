package nosi.webapps.igrp.pages.task;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import nosi.core.webapp.Core;//
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/
import java.util.List;
import java.util.Map;

import nosi.core.webapp.activit.rest.business.ProcessDefinitionIGRP;
import nosi.core.webapp.activit.rest.services.TaskServiceRest;
import nosi.webapps.igrp.dao.Action;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.TaskComponent;

import java.util.ArrayList;

/*----#end-code----*/
		
public class TaskController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		Task model = new Task();
		model.load();
		TaskView view = new TaskView();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		model.loadTable_1(Core.query(null,"SELECT 'Sed dolor sed magna elit' as descricao,'Sit doloremque perspiciatis dolor perspiciatis' as ordem "));
		view.aplicacao.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		view.processo.setQuery(Core.query(null,"SELECT 'id' as ID,'name' as NAME "));
		  ----#gen-example */
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/
		view.aplicacao.setValue(Core.getListApps());
		String dad = Core.getCurrentDad();
		if (!"igrp".equalsIgnoreCase(dad) && !"igrp_studio".equalsIgnoreCase(dad)) {
			model.setAplicacao("" + (Core.findApplicationByDad(dad)).getId());
			view.aplicacao.propertie().add("disabled","true");
		}
		List<Task.Table_1> data = new ArrayList<>();
		if (Core.isNotNull(model.getAplicacao())) {
			Application app = new Application().findOne(Core.toInt(model.getAplicacao()));
			if (app != null) {
				view.processo.setValue(new ProcessDefinitionIGRP().mapToComboBoxByKey(app.getDad()));
				if(view.processo.getListOptions().size()==2) {
					view.processo.getListOptions().remove(null);
					model.setProcesso(view.processo.getListOptions().keySet().toString().replace("[", "").replace("]", ""));
				}
			}
			if (Core.isNotNull(model.getProcesso())) {
				List<Map<String, Object>> listTasC = new TaskComponent().find()
						.where("processId","=",model.getProcesso())
						.allColumns("id","ordem","taskId");
				new TaskServiceRest().getTasksByProcessKey(model.getProcesso(),app.getDad()).forEach(t -> {
					Task.Table_1 t1 = new Task.Table_1();
					t1.setTable_1_id(t.getId());
					t1.setDescricao(t.getName()+" ("+t.getId()+")");
					for (Map<String, Object> mapTasC : listTasC) {
						if(mapTasC.get("taskId").equals(t.getId()))
							t1.setOrdem(mapTasC.get("id")+"",mapTasC.get("ordem")+"");
					}
					data.add(t1);
				});
				// Sort
				data.sort((Task.Table_1 o1, Task.Table_1 o2) -> {
					if(Core.isNullMultiple(o1.getOrdem(),o2.getOrdem())) {
						return 0;
					}
				    final Integer io1 = Core.toInt(o1.getOrdem().getValue(),0);
				    final Integer io2 = Core.toInt(o2.getOrdem().getValue(),0);
				    return Integer.compare(io1, io2);
				});
			}
			model.setTable_1(data);
		}
		
		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);	
	}
	
	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		Task model = new Task();
		model.load();
		/*----#gen-example
		  EXAMPLES COPY/PASTE:
		  INFO: Core.query(null,... change 'null' to your db connection name, added in Application Builder.
		 this.addQueryString("p_id","12"); //to send a query string in the URL
		 return this.forward("igrp","task","index",this.queryString()); //if submit, loads the values  ----#gen-example */
		/*----#start-code(gravar)----*/
		short s=0;
		boolean nosucess=true;
		for (Task.Table_1 row : model.getTable_1()){
			s++;
			if(Core.isNotNullOrZero(row.getOrdem().getKey())){
				TaskComponent taskcomponent = new TaskComponent().findOne(row.getOrdem().getKey());
				taskcomponent.setOrdem(s);
				taskcomponent.setTaskId(row.getTable_1_id().getKey());
				nosucess=taskcomponent.update()==null;
			}else {
				nosucess=new TaskComponent(row.getTable_1_id().getKey(), model.getProcesso(), model.getAplicacao(), s, new Action().findOne(1), null).insert()==null;
					
			}
		}
		if(nosucess){
			Core.setMessageError();
			return this.forward("igrp","task","index",this.queryString());
		}
		Core.setMessageSuccess();
	
		/*----#end-code----*/
		
		return this.redirect("igrp","task","index", this.queryString());	
	}
	/* Start-Code-Block (custom-actions)  *//* End-Code-Block  */
/*----#start-code(custom_actions)----*/
	
	/*----#end-code----*/
}
