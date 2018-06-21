package nosi.webapps.igrp.pages.addfiletask;
import nosi.core.webapp.Model;
import nosi.core.webapp.databse.helpers.QueryHelper;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class Addfiletask extends Model{		
	
	@SeparatorList(name = Formlist_documento_task.class)
	private List<Formlist_documento_task> formlist_documento_task = new ArrayList<>();	
	public void setFormlist_documento_task(List<Formlist_documento_task> formlist_documento_task){
		this.formlist_documento_task = formlist_documento_task;
	}
	public List<Formlist_documento_task> getFormlist_documento_task(){
		return this.formlist_documento_task;
	}


	public static class Formlist_documento_task{
		private Pair formlist_documento_task_nome;
		private Pair formlist_documento_task_descricao;
		private Pair formlist_documento_task_obrigatoriedade;
		private Pair formlist_documento_task_documento;
		private Pair formlist_documento_task_mostrar;
		public void setFormlist_documento_task_nome(Pair formlist_documento_task_nome){
			this.formlist_documento_task_nome = formlist_documento_task_nome;
		}
		public Pair getFormlist_documento_task_nome(){
			return this.formlist_documento_task_nome;
		}

		public void setFormlist_documento_task_descricao(Pair formlist_documento_task_descricao){
			this.formlist_documento_task_descricao = formlist_documento_task_descricao;
		}
		public Pair getFormlist_documento_task_descricao(){
			return this.formlist_documento_task_descricao;
		}

		public void setFormlist_documento_task_obrigatoriedade(Pair formlist_documento_task_obrigatoriedade){
			this.formlist_documento_task_obrigatoriedade = formlist_documento_task_obrigatoriedade;
		}
		public Pair getFormlist_documento_task_obrigatoriedade(){
			return this.formlist_documento_task_obrigatoriedade;
		}

		public void setFormlist_documento_task_documento(Pair formlist_documento_task_documento){
			this.formlist_documento_task_documento = formlist_documento_task_documento;
		}
		public Pair getFormlist_documento_task_documento(){
			return this.formlist_documento_task_documento;
		}

		public void setFormlist_documento_task_mostrar(Pair formlist_documento_task_mostrar){
			this.formlist_documento_task_mostrar = formlist_documento_task_mostrar;
		}
		public Pair getFormlist_documento_task_mostrar(){
			return this.formlist_documento_task_mostrar;
		}

	}

	public void loadFormlist_documento_task(QueryHelper query) {
		this.setFormlist_documento_task(this.loadFormList(query,Formlist_documento_task.class));
	}

}
