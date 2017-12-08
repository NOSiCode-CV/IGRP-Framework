package nosi.webapps.teste.pages.teste;
import nosi.core.config.Config;
import nosi.core.webapp.Model;
import nosi.core.webapp.RParam;
import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.SeparatorList;

public class Teste extends Model{		
	@RParam(rParamName = "p_nome")
	private String nome;
	@RParam(rParamName = "p_email")
	private String email;
	@RParam(rParamName = "p_nascimento")
	private String nascimento;
	
	public void setNome(String nome){
		this.nome = nome;
	}
	public String getNome(){
		return this.nome;
	}
	
	public void setEmail(String email){
		this.email = email;
	}
	public String getEmail(){
		return this.email;
	}
	
	public void setNascimento(String nascimento){
		this.nascimento = nascimento;
	}
	public String getNascimento(){
		return this.nascimento;
	}


}
