/*---------------------- Create Model ----------------------*/
package nosi.webapps.agenda.pages.teste;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;
import java.util.ArrayList;
import java.util.List;

public class Teste extends Model{		

	@SeparatorList(name = Separatorlist_1.class)
	private List<Separatorlist_1> separatorlist_1 = new ArrayList<>();
	public void setSeparatorlist_1(List<Separatorlist_1> separatorlist_1){
		this.separatorlist_1 = separatorlist_1;
	}
	public List<Separatorlist_1> getseparatorlist_1(){
		return this.separatorlist_1;
	}

	@SeparatorList(name = Formlist_1.class)
	private List<Formlist_1> formlist_1 = new ArrayList<>();
	public void setFormlist_1(List<Formlist_1> formlist_1){
		this.formlist_1 = formlist_1;
	}
	public List<Formlist_1> getformlist_1(){
		return this.formlist_1;
	}


	public static class Separatorlist_1{
		private Pair text_1;
		private Pair number_1;
		public void setText_1(Pair text_1){
			this.text_1 = text_1;
		}
		public Pair getText_1(){
			return this.text_1;
		}

		public void setNumber_1(Pair number_1){
			this.number_1 = number_1;
		}
		public Pair getNumber_1(){
			return this.number_1;
		}

	}
	public static class Formlist_1{
		private Pair text_1;
		private Pair number_1;
		public void setText_1(Pair text_1){
			this.text_1 = text_1;
		}
		public Pair getText_1(){
			return this.text_1;
		}

		public void setNumber_1(Pair number_1){
			this.number_1 = number_1;
		}
		public Pair getNumber_1(){
			return this.number_1;
		}

	}
}
/*-------------------------*/