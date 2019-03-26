package nosi.core.webapp.bpmn;

import java.util.ArrayList;
import java.util.List;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.gui.components.IGRPTable.Table;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.webapp.SeparatorList;

/**
 * Emanuel 26 Mar 2019
 */
public class FormlistDocument extends Model {

	@SeparatorList(name = Formlist_documento_task.class)
	private List<Formlist_documento_task> formlist_documento_task = new ArrayList<>();

	public void setFormlist_documento_task(List<Formlist_documento_task> formlist_documento_task) {
		this.formlist_documento_task = formlist_documento_task;
	}

	public List<Formlist_documento_task> getFormlist_documento_task() {
		return this.formlist_documento_task;
	}

	@RParam(rParamName = "p_formlist_documento_task_id")
	private String[] p_formlist_documento_task_id;
	@RParam(rParamName = "p_formlist_documento_task_del")
	private String[] p_formlist_documento_task_del;

	public void setP_formlist_documento_task_id(String[] p_formlist_documento_task_id) {
		this.p_formlist_documento_task_id = p_formlist_documento_task_id;
	}

	public String[] getP_formlist_documento_task_id() {
		return this.p_formlist_documento_task_id;
	}

	public void setP_formlist_documento_task_del(String[] p_formlist_documento_task_del) {
		this.p_formlist_documento_task_del = p_formlist_documento_task_del;
	}

	public String[] getP_formlist_documento_task_del() {
		return this.p_formlist_documento_task_del;
	}

	public static class Formlist_documento_task extends Table {

		private Pair formlist_documento_id_tp_doc;
		private Pair formlist_documento_task_nome;
		private Pair formlist_documento_task_descricao;
		private Pair formlist_documento_task_obrigatoriedade;
		private Pair formlist_documento_task_documento;
		private Pair formlist_documento_task_mostrar;
		private Pair formlist_documento_user;
		private Pair formlist_documento_doc_id;

		public Pair getFormlist_documento_id_tp_doc() {
			return formlist_documento_id_tp_doc;
		}

		public void setFormlist_documento_id_tp_doc(Pair formlist_documento_id_tp_doc) {
			this.formlist_documento_id_tp_doc = formlist_documento_id_tp_doc;
		}

		public void setFormlist_documento_task_nome(Pair formlist_documento_task_nome) {
			this.formlist_documento_task_nome = formlist_documento_task_nome;
		}

		public Pair getFormlist_documento_task_nome() {
			return this.formlist_documento_task_nome;
		}

		public void setFormlist_documento_task_descricao(Pair formlist_documento_task_descricao) {
			this.formlist_documento_task_descricao = formlist_documento_task_descricao;
		}

		public Pair getFormlist_documento_task_descricao() {
			return this.formlist_documento_task_descricao;
		}

		public void setFormlist_documento_task_obrigatoriedade(Pair formlist_documento_task_obrigatoriedade) {
			this.formlist_documento_task_obrigatoriedade = formlist_documento_task_obrigatoriedade;
		}

		public Pair getFormlist_documento_task_obrigatoriedade() {
			return this.formlist_documento_task_obrigatoriedade;
		}

		public void setFormlist_documento_task_documento(Pair formlist_documento_task_documento) {
			this.formlist_documento_task_documento = formlist_documento_task_documento;
		}

		public Pair getFormlist_documento_task_documento() {
			return this.formlist_documento_task_documento;
		}

		public void setFormlist_documento_task_mostrar(Pair formlist_documento_task_mostrar) {
			this.formlist_documento_task_mostrar = formlist_documento_task_mostrar;
		}

		public Pair getFormlist_documento_task_mostrar() {
			return this.formlist_documento_task_mostrar;
		}

		public Pair getFormlist_documento_user() {
			return formlist_documento_user;
		}

		public void setFormlist_documento_user(Pair formlist_documento_user) {
			this.formlist_documento_user = formlist_documento_user;
		}

		public Pair getFormlist_documento_doc_id() {
			return formlist_documento_doc_id;
		}

		public void setFormlist_documento_doc_id(Pair formlist_documento_doc_id) {
			this.formlist_documento_doc_id = formlist_documento_doc_id;
		}

		@Override
		public String toString() {
			return "Formlist_documento_task [formlist_documento_id_tp_doc=" + formlist_documento_id_tp_doc
					+ ", formlist_documento_task_nome=" + formlist_documento_task_nome
					+ ", formlist_documento_task_descricao=" + formlist_documento_task_descricao
					+ ", formlist_documento_task_obrigatoriedade=" + formlist_documento_task_obrigatoriedade
					+ ", formlist_documento_task_documento=" + formlist_documento_task_documento
					+ ", formlist_documento_task_mostrar=" + formlist_documento_task_mostrar
					+ ", formlist_documento_user=" + formlist_documento_user + ", formlist_documento_doc_id="
					+ formlist_documento_doc_id + "]";
		}

	}
}
