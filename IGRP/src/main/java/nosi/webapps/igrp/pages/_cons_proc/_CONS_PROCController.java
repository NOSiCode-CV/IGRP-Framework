
package nosi.webapps.igrp.pages._cons_proc;
/*----#START-PRESERVED-AREA(PACKAGES_IMPORT)----*/
import nosi.core.webapp.Controller;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import nosi.core.webapp.Core;
import nosi.core.webapp.Response;
import nosi.core.webapp.activit.rest.ProcessDefinitionService;
import nosi.core.webapp.activit.rest.TaskServiceQuery;
import nosi.webapps.igrp.dao.Application;
import nosi.webapps.igrp.dao.ProfileType;
import nosi.core.webapp.Igrp;

/*----#END-PRESERVED-AREA----*/

public class _CONS_PROCController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(INDEX)----*/
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		List<_CONS_PROC.Table_1> data = new ArrayList<>();
		if(Core.isNotNull(model.getAplicacao())){
			TaskServiceQuery taskS = new TaskServiceQuery();
			if(Core.isNotNull(model.getProc_tp_fk())){
				taskS.addFilter("processDefinitionId", model.getProc_tp_fk());
			}if(Core.isNotNull(model.getNum())){
				taskS.addFilter("processInstanceId", model.getNum());
			}
			if(Core.isNotNull(model.getUser_fk())){
				taskS.addFilter("taskAssignee", model.getUser_fk());
			}
			if(Core.isNotNull(model.getStatus())) {
				taskS.addFilter("finished", model.getStatus());
			}
			if(Core.isNotNull(model.getAplicacao())) {
				taskS.addFilter("tenantId", model.getAplicacao());
			}
			if(Core.isNotNull(model.getDt_ini())) {
				taskS.addFilter("taskCompletedAfter",Core.ToChar(Core.ToChar(model.getDt_ini(), "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
			}
			if(Core.isNotNull(model.getDt_fim())) {
				taskS.addFilter("taskCompletedBefore",Core.ToChar(Core.ToChar(model.getDt_fim(), "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
			}
			if(Core.isNotNull(model.getDt_ini()) && !Core.isNotNull(model.getDt_fim())) {
				taskS.addFilter("taskCompletedOn",Core.ToChar(Core.ToChar(model.getDt_ini(), "dd-MM-yyyy", "yyyy-MM-dd"), "yyyy-MM-dd'T'HH:mm:ss'Z'"));
			}
			for(TaskServiceQuery task:taskS.queryHistoryTask()) {
				_CONS_PROC.Table_1 t = new _CONS_PROC.Table_1();
				t.setNum_processo(task.getProcessInstanceId());
				t.setProcesso(task.getProcessDefinitionId());
				t.setEatapa(Core.isNotNull(task.getName())?task.getName():task.getTaskDefinitionKey());
				t.setDt_inicio_etapa(Core.ToChar(task.getStartTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setDt_fim_etapa(Core.ToChar(task.getEndTime(), "yyyy-MM-dd'T'HH:mm:ss","yyyy-MM-dd HH:mm:ss"));
				t.setUtilizador(task.getAssignee());
				t.setEstado(this.getStatusTask(task));
				t.setP_id_task(task.getId());
				data.add(t);
			}
		}
		_CONS_PROCView view = new _CONS_PROCView(model);
		
		view.aplicacao.setValue(new Application().getListApps());	
		view.organica.setValue(new ProfileType().getListProfiles(Core.toInt(model.getAplicacao())));
		view.area_fk.setVisible(false);
		view.organica.setVisible(false);
		Application app = new Application().findOne(Core.toInt(model.getAplicacao()));
		if(app!=null) {
			view.proc_tp_fk.setValue(new ProcessDefinitionService().mapToComboBox(app.getDad()));
		}
		view.requerente.setVisible(false);
		view.user_fk.setVisible(false);
		
		view.status.setValue(this.getStatus());
		view.btn_pesquisar.setLink("index");
		view.table_1.addData(data);
		view.p_id_task.setParam(true);
		
		view.table_1.addLegendColor("Não Iniciado", Core.getYellowColor());
		view.table_1.addLegendColor("Não Atribuido", Core.getBlueColor());
		view.table_1.addLegendColor("Terminado", Core.getPinkColor());
		return this.renderView(view);
		/*----#END-PRESERVED-AREA----*/
	}




	public Response actionPesquisar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(PESQUISAR)----*/
		_CONS_PROC model = new _CONS_PROC();
		model.load();
		
		return this.redirect("igrp","_CONS_PROC","index");
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionVer_etapa() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(VER_ETAPA)----*/
		String p_id_task = Igrp.getInstance().getRequest().getParameter("p_id_task");
		return this.redirect("igrp","Detalhes_tarefas","index&target=_blank&taskId="+p_id_task);
		/*----#END-PRESERVED-AREA----*/
	}
	

	public Response actionVer_processo() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*----#START-PRESERVED-AREA(VER_PROCESSO)----*/
		String p_id_task = Igrp.getInstance().getRequest().getParameter("p_id_task");
		return this.redirect("igrp","DetalhesProcesso","index&target=_blank&taskId="+p_id_task);
		/*----#END-PRESERVED-AREA----*/
	}
	
	/*----#START-PRESERVED-AREA(CUSTOM_ACTIONS)----*/
	private Map<String,String> getStatus() {
		Map<String,String> status = new HashMap<String,String>();
		status.put(null, "--- Selecionar Estado ---");
        status.put("false","Ativo");
        status.put("true","Terminado");
		return status;
	}
	private String getStatusTask(TaskServiceQuery task) {
		if(Core.isNotNull(task.getEndTime()))
			return "Terminado";//Core.getPinkColor();//Terminado
		if(Core.isNotNull(task.getAssignee()))
			return "Não iniciado";//Core.getYellowColor();//Não iniciado
		return "Não Atribuido";//Core.getBlueColor();//"Não Atribuido"
	}
	/*----#END-PRESERVED-AREA----*/
}
