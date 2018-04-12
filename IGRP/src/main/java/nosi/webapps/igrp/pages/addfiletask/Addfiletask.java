package nosi.webapps.igrp.pages.addfiletask;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import java.sql.Date;
import nosi.core.webapp.RParam;
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
		private Pair nome;
		private Pair descricao;
		private Pair obrigatoriedade;
		private Pair documento;
		private Pair mostrar;
		public void setNome(Pair nome){
			this.nome = nome;
		}
		public Pair getNome(){
			return this.nome;
		}

		public void setDescricao(Pair descricao){
			this.descricao = descricao;
		}
		public Pair getDescricao(){
			return this.descricao;
		}

		public void setObrigatoriedade(Pair obrigatoriedade){
			this.obrigatoriedade = obrigatoriedade;
		}
		public Pair getObrigatoriedade(){
			return this.obrigatoriedade;
		}

		public void setDocumento(Pair documento){
			this.documento = documento;
		}
		public Pair getDocumento(){
			return this.documento;
		}

		public void setMostrar(Pair mostrar){
			this.mostrar = mostrar;
		}
		public Pair getMostrar(){
			return this.mostrar;
		}

	}

	public void loadFormlist_documento_task(QueryHelper query) {
		this.setFormlist_documento_task(this.loadFormList(query,Formlist_documento_task.class));
	}

}
