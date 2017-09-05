/*-------------------------*/

/*Create Controller*/

package nosi.webapps.agenda.pages.pontoatendimento;
/*---- Import your packages here... ----*/
import nosi.core.webapp.Controller;
import nosi.core.config.Config;
import nosi.core.webapp.Igrp;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import nosi.core.webapp.Response;
import nosi.webapps.agenda.dao.Balcao;
import nosi.webapps.agenda.dao.Entidade;
import nosi.webapps.agenda.dao.ServBalcao;
import nosi.webapps.agenda.dao.Servicos;

/*---- End ----*/

public class PontoAtendimentoController extends Controller {		


	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/						
		PontoAtendimento model = new PontoAtendimento();
		String ichange = Igrp.getInstance().getRequest().getParameter("ichange");
		List<PontoAtendimento.Table_1> table1 = new ArrayList<>();
		List<PontoAtendimento.Table_2> table2 = new ArrayList<>();
		List<Integer> balcao_serv = new ArrayList<>();
		String id_balcao = Igrp.getInstance().getRequest().getParameter("p_id_balcao");
		String id_entidade = Igrp.getInstance().getRequest().getParameter("p_id_entidade");
		model.setEntidade(id_entidade);
		if(id_balcao!=null && !id_balcao.equals("")){
			Balcao b = Balcao.getBalcao(Integer.parseInt(id_balcao));
			if(b!=null){
				model.setConfirmacao_automatica(""+b.getConfirmacao());
				model.setEntidade(""+b.getId_entidade());
				model.setFuso_horario(b.getFusohorario());
				model.setHora_fim(b.getHr_fim());
				model.setHora_inicio(b.getHr_inicio());
				model.setLocalizacao(b.getLocalizacao());
				model.setN_de_servicos(""+b.getNr_servicos());
				model.setP_estado(b.getEstado());
				model.setPonto(b.getNome_balcao());
			}
			List<ServBalcao> list= Balcao.getAllServicos(Integer.parseInt(id_balcao));
			for(ServBalcao sb:list){
				balcao_serv.add(sb.getId_servico());
			}
		}
		boolean post = Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST");
		if((post && ichange!=null) || (id_balcao!=null && ichange!=null)){
			if(post){
				model.load();
			}
			if(model.getEntidade()!=null && !model.getEntidade().equals("")){
				List<Balcao> balcoes = Entidade.getAllBalcao(Integer.parseInt(model.getEntidade()));
				for(Balcao b:balcoes){
					PontoAtendimento.Table_1 t1 = new PontoAtendimento.Table_1();
					t1.setPonto_atendimento_desc(b.getNome_balcao());	
					t1.setPonto_atendimento("webapps?r=agenda/PontoAtendimento/index&amp;ichange=p_entidade&amp;p_id_balcao="+b.getId());
					t1.setP_id_balcao(""+b.getId());
					t1.setEstado_list(b.getEstado());					
					table1.add(t1);
				}	
			}
		}
		if(model.getEntidade()!=null && !model.getEntidade().equals("")){
			List<Servicos> servicos = Entidade.getAllServicos(Integer.parseInt(model.getEntidade()));
			for(Servicos s:servicos){
				PontoAtendimento.Table_2 t2 = new PontoAtendimento.Table_2();
				t2.setP_id_servico(""+s.getId());
				t2.setServicos(s.getNome_servico());
				t2.setId_servico_check(s.getId());
				if(balcao_serv!=null && balcao_serv.contains(s.getId()))
					t2.setId_servico_check_check(s.getId());
				table2.add(t2);
			}
		}
		PontoAtendimentoView view = new PontoAtendimentoView(model);		
		Map<Integer, String> sim_nao = new HashMap<Integer,String>();
		sim_nao.put(1, "Sim");
		sim_nao.put(0, "Não");
		Map<Integer,Integer> n_servicos = new HashMap<Integer,Integer>();
		n_servicos.put(2,2);
		n_servicos.put(3,3);
		n_servicos.put(4,4);
		n_servicos.put(5,5);
		n_servicos.put(6,6);
		Map<Integer,String> entidades = new HashMap<>();
		entidades.put(null, "--- Selecionar Entidade ---");
		List<Entidade> listE = Entidade.getAllEntidade();
		if(listE!=null){
			for(Entidade e:listE){
				entidades.put(e.getId(), e.getNome_entidade());
			}
		}
		view.entidade.setValue(entidades);
		view.n_de_servicos.setValue(n_servicos);
		view.confirmacao_automatica.setValue(sim_nao);
		view.n_de_servicos.setLabel("Nº de Serviço");
		view.localizacao.setLabel("Localização");
		view.horario_de_atendimento.setLabel("Horário Atendimento");
		view.fuso_horario.setLabel("Fuso Horário");
		view.confirmacao_automatica.setLabel("Confirmaço Automática");
		view.servicos.setLabel("Serviços");
		view.table_1.addData(table1);
		view.table_2.addData(table2);
		view.p_id_balcao.setParam(true);
		view.p_id_servico.setParam(true);
		view.fuso_horario.setValue(TimeZone.getDefault().toZoneId());
		if(id_balcao!=null && !id_balcao.equals("") && model.getEntidade()!=null && !model.getEntidade().equals("")){
			view.btn_gravar.setLink("editar&p_id_balcao="+id_balcao);
		}
		if(model.getEntidade()!=null && !model.getEntidade().equals("")){
			view.btn_novo.setLink("novo&p_id_entidade="+model.getEntidade());
		}
		return this.renderView(view);
					/*---- End ----*/
	}


	public Response actionGravar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/			
		PontoAtendimento model = new PontoAtendimento();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST")){
			model.load();
			String[] servicos = Igrp.getInstance().getRequest().getParameterValues("p_id_servico_fk");
			Balcao b = new Balcao();
			b.setConfirmacao(Integer.parseInt(model.getConfirmacao_automatica()));
			b.setEstado("ATIVO");
			b.setFusohorario(model.getFuso_horario());
			b.setHr_fim(model.getHora_fim());
			b.setHr_inicio(model.getHora_inicio());
			b.setId_entidade(Integer.parseInt(model.getEntidade()));
			b.setLocalizacao(model.getLocalizacao());
			b.setNome_balcao(model.getPonto());
			b.setNr_servicos(Integer.parseInt(model.getN_de_servicos()));
			b = Balcao.insert(b);
			if(b!=null){
				if(servicos!=null){
					for(String s:servicos){
						ServBalcao sb = new ServBalcao();
						sb.setEstado("ATIVO");
						sb.setId_balcao(b.getId());
						sb.setId_servico(Integer.parseInt(s));
						sb.setPorton(0);
						sb = ServBalcao.insert(sb);
					}
				}
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação Realizada com sucesso!");
			}
		}
		return this.redirect("agenda","PontoAtendimento","index&p_id_entidade="+model.getEntidade());
					/*---- End ----*/
	}
	

	public Response actionNovo() throws IOException{
		/*---- Insert your code here... ----*/	
		String id_entidade = Igrp.getInstance().getRequest().getParameter("p_id_entidade");	
		Config.target="_blank";
		return this.redirect("agenda","AddServicos","index&p_id_entidade="+(id_entidade!=null?id_entidade:""));
					/*---- End ----*/
	}
	

	public Response actionConfigurar() throws IOException{
		/*---- Insert your code here... ----*/						
		return this.redirect("agenda","AddServicos","index");
					/*---- End ----*/
	}
	

	public Response actionRemover() throws IOException{
		/*---- Insert your code here... ----*/		
		String id_balcao = Igrp.getInstance().getRequest().getParameter("p_id_balcao");	
		if(id_balcao!=null){
			Balcao b = Balcao.getBalcao(Integer.parseInt(id_balcao));
			if(b.getEstado().equals("ATIVO"))
				b.setEstado("INATIVO");
			else
				b.setEstado("ATIVO");
			int status = Balcao.update(b);
			if(status==200 || status==204){
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação Realizada com sucesso!");
			}else{
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}
		}
		return this.redirect("agenda","PontoAtendimento","index");
					/*---- End ----*/
	}
	

	public Response actionRequisitos() throws IOException{
		/*---- Insert your code here... ----*/
		Config.target="_blank";		
		String id = Igrp.getInstance().getRequest().getParameter("p_id_servico");					
		return this.redirect("agenda","Lista_req","index&p_id_servico="+id);
					/*---- End ----*/
	}
	

	public Response actionEliminar() throws IOException{
		/*---- Insert your code here... ----*/		
		String id = Igrp.getInstance().getRequest().getParameter("p_id_servico");
		if(id!=null){
			Servicos ser = Servicos.getServicoById(Integer.parseInt(id));
			if(ser.getEstado().equals("ATIVO"))
				ser.setEstado("INATIVO");
			else
				ser.setEstado("ATIVO");
			if(Servicos.update(ser) != null) {
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operacao efetuada com sucesso");
			}else {
				Igrp.getInstance().getFlashMessage().addMessage("error", "Operacao falhada");
			}
		}
		String id_entidade = Igrp.getInstance().getRequest().getParameter("p_id_entidade");
		return this.redirect("agenda","PontoAtendimento","index&p_id_entidade="+(id_entidade!=null?id_entidade:""));
					/*---- End ----*/
	}
	
	/*---- Insert your actions here... ----*/
	
	public Response actionEditar() throws IOException, IllegalArgumentException, IllegalAccessException{
		/*---- Insert your code here... ----*/		
		String id_balcao = Igrp.getInstance().getRequest().getParameter("p_id_balcao");	
		PontoAtendimento model = new PontoAtendimento();
		if(Igrp.getInstance().getRequest().getMethod().toUpperCase().equals("POST") && id_balcao!=null){
			model.load();
			String[] servicos = Igrp.getInstance().getRequest().getParameterValues("p_id_servico_fk");
			Balcao b = new Balcao();
			b.setConfirmacao(Integer.parseInt(model.getConfirmacao_automatica()));
			b.setEstado("ATIVO");
			b.setFusohorario(model.getFuso_horario());
			b.setHr_fim(model.getHora_fim());
			b.setHr_inicio(model.getHora_inicio());
			b.setId_entidade(Integer.parseInt(model.getEntidade()));
			b.setLocalizacao(model.getLocalizacao());
			b.setNome_balcao(model.getPonto());
			b.setNr_servicos(Integer.parseInt(model.getN_de_servicos()));
			b.setId(Integer.parseInt(id_balcao));
			int status = Balcao.update(b);
			if(status==200 || status==204){
				ServBalcao.updateStatus("INATIVO", Integer.parseInt(id_balcao));
				if(servicos!=null){
					for(String s:servicos){
						ServBalcao sb = ServBalcao.getServBalcao(Integer.parseInt(id_balcao), Integer.parseInt(s));
						if(sb.getId()!=null){
							sb.setEstado("ATIVO");
							ServBalcao.update(sb);
						}else{
							ServBalcao sb1 = new ServBalcao();
							sb1.setEstado("ATIVO");
							sb1.setId_balcao(b.getId());
							sb1.setId_servico(Integer.parseInt(s));
							sb1.setPorton(0);
							ServBalcao.insert(sb1);
						}
					}
				}
				Igrp.getInstance().getFlashMessage().addMessage("success", "Operação Realizada com sucesso!");
			}
		}
		return this.redirect("agenda","PontoAtendimento","index&p_id_entidade="+model.getEntidade());
					/*---- End ----*/
	}
	public Response actionEditarServico() throws IOException{
		/*---- Insert your code here... ----*/
		Config.target="_blank";		
		String id = Igrp.getInstance().getRequest().getParameter("p_id_servico");					
		return this.redirect("agenda","AddServicos","index&p_id="+id);
					/*---- End ----*/
	}
	/*---- End ----*/
}
