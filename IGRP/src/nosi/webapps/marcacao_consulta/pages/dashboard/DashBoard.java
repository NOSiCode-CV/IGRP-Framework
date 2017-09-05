/*---------------------- Create Model ----------------------*/
package nosi.webapps.marcacao_consulta.pages.dashboard;
import nosi.core.webapp.Model;
import java.util.ArrayList;

public class DashBoard extends Model{		

	private ArrayList<Chart_1> chart_1 = new ArrayList<>();
	public void setChart_1(ArrayList<Chart_1> chart_1){
		this.chart_1 = chart_1;
	}
	public ArrayList<Chart_1> getchart_1(){
		return this.chart_1;
	}

	private ArrayList<Chart_2> chart_2 = new ArrayList<>();
	public void setChart_2(ArrayList<Chart_2> chart_2){
		this.chart_2 = chart_2;
	}
	public ArrayList<Chart_2> getchart_2(){
		return this.chart_2;
	}


	public class Chart_1{
		private int Ano;
		private int homem;
		private int mulher;
		
		public void setAno(int Ano){
			this.Ano = Ano;
		}
		public int getAno(){
			return this.Ano;
		}
		public int getHomem() {
			return homem;
		}
		public void setHomem(int homem) {
			this.homem = homem;
		}
		public int getMulher() {
			return mulher;
		}
		public void setMulher(int mulher) {
			this.mulher = mulher;
		}
	}
	public class Chart_2{
		private int Ano;
		private int homem;
		private int mulher;
		
		public void setAno(int Ano){
			this.Ano = Ano;
		}
		public int getAno(){
			return this.Ano;
		}
		public int getHomem() {
			return homem;
		}
		public void setHomem(int homem) {
			this.homem = homem;
		}
		public int getMulher() {
			return mulher;
		}
		public void setMulher(int mulher) {
			this.mulher = mulher;
		}
	}
}
/*-------------------------*/