package nosi.core.webapp;

import java.io.Serial;
import java.util.Map;

import java.util.HashMap;
import java.io.Serializable;
import java.util.ArrayList;


/**
 * @author Marcel Iekiny
 * Apr 19, 2017
 */
public class FlashMessage implements Serializable{
	
	/**
	 * 
	 */
	@Serial
	private static final long serialVersionUID = 1L;

	private Message msgs;
	
	public static final String SUCCESS = "success";
	public static final String INFO_LINK = "info_link";
	public static final String ERROR = "error";
	public static final String WARNING = "warning";
	public static final String DEBUG = "debug";
	public static final String INFO = "info";
	public static final String MSG_ERROR = "<messages><message type=\"error\">Operação falhada!</message></messages>";
	public static final String MSG_SUCCESS = "<messages><message type=\"success\">Operação efetuada com sucesso!</message></messages>";
    public static final String WARNING_EXPORT_APP = "Esta aplicação não possui conteúdo suficiente para ser exportado";
    
	public static final String MESSAGE_SUCCESS = "Operação efetuada com sucesso!";
	public static final String MESSAGE_ERROR = "Falha ao tentar efetuar esta operação!";

	public static final String WARNING_EXPORT_PAGE = "Esta página não possui conteúdo suficiente para ser exportado.";
    public static final String WARNING_PAGE_INVALID = "Nome da página é inválida.";

	public static final String ERROR_IMPORT = "Ocorreu um erro ao importa o ficheiro";

	public static final String ERROR_COMPILED = "Erro de compilação";

	public static final String MESSAGE_ERROR_VALID_PAGE = "Nome da página é inválida";

	public static final String MSG_CONFIRM = "Deseja realmente realizar esta operação?";

	public static final String CONFIRM = "confirm";

	protected FlashMessage(){ // Make sure that this will be only invocate by the Igrp class 
		// "_flash" is the reserved name for messages in session
		if(Igrp.getInstance().getRequest().getSession() != null) {
			if(Igrp.getInstance().getRequest().getSession().getAttribute("_flash") == null){
				this.msgs = new Message();
				Igrp.getInstance().getRequest().getSession().setAttribute("_flash", this.msgs);
			}else
				this.msgs = (Message) Igrp.getInstance().getRequest().getSession().getAttribute("_flash");
		}
	}
	
	
	public FlashMessage addMessage(String name, String msg){
		this.msgs.addMessage(name, msg);
		// atualizar session  /* Sorry we dont need it */
		//Igrp.getInstance().getRequest().getSession().setAttribute("flash", this.msgs);
		return this;
	}
	
	public void setMessage(String name, String msg){
		this.msgs.setMessage(name, msg);
		// atualizar session /* Sorry we dont need it */
		//Igrp.getInstance().getRequest().getSession().setAttribute("flash", this.msgs);
	}
	
	public boolean hasMessage(String name){
		return this.msgs.hasMessage(name);
	}
	
	public String getMessagesAsString(String name){
		return this.msgs.getMessagesAsString(name);
	}
	
	public ArrayList<String> getMessages(String name){
		return this.msgs.getMessages(name);
	}

	// Please dont uncomment this method below ... (because it is only for test purpose)
	/*public Message getMessage(){
		return this.msgs;
	}*/
	
	private static class Message implements Serializable{ // inner/internal class for all message
		
		/**
		 * 
		 */
		@Serial
		private static final long serialVersionUID = 1L;
		private final Map<String, ArrayList<String>> msg;
		
		public Message(){
			this.msg = new HashMap<>();
			this.msg.put(FlashMessage.ERROR, new ArrayList<>());
			this.msg.put(FlashMessage.SUCCESS, new ArrayList<>());
			this.msg.put(FlashMessage.CONFIRM, new ArrayList<>());
			this.msg.put(FlashMessage.INFO, new ArrayList<>());
			this.msg.put(FlashMessage.WARNING, new ArrayList<>());
			this.msg.put(FlashMessage.DEBUG, new ArrayList<>());
			this.msg.put(FlashMessage.INFO_LINK, new ArrayList<>());
		}
		
		public void addMessage(String name, String msg){
			if(this.msg!=null && this.msg.containsKey(name))
				this.msg.get(name).add(msg);
			else
				this.setMessage(name, msg);
		}
		
		public void setMessage(String name, String msg){
			ArrayList<String> aux = new ArrayList<>();
			aux.add(msg);
			this.msg.put(name, aux);
		}
		
		public boolean hasMessage(String name){
			return this.msg.containsKey(name) && !this.msg.get(name).isEmpty();
		}

		public String getMessagesAsString(String name) { // return all specific message as a String
			StringBuilder result = new StringBuilder();
			if (this.msg.containsKey(name)) {
				for (String s : this.msg.get(name))
					result.append(s).append(" ");
			}
			this.msg.get(name).clear();
			return result.toString();
		}
		
		public ArrayList<String> getMessages(String name){
			ArrayList<String> result = new ArrayList<>(); // empty ArrayList for NullPointerException when return it ...
			if(this.msg.containsKey(name)){
				result = new ArrayList<>(this.msg.get(name)); // to make clone of collection
				this.msg.get(name).clear();
			}
			return result;
		}


		public void removeMsg(String name) {
			if (this.msg != null)
				this.msg.remove(name);
		}
	}

	public void removeMsg(String name) {
		this.msgs.removeMsg(name);
	}
}
