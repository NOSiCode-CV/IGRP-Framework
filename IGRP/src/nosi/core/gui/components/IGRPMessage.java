package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of Messages
 */
/*
 * <messages>
 * 		<message type="success">Sucess</message>
 * 		...
 * </messages>
 */
import nosi.core.xml.XMLWritter;
import nosi.core.webapp.FlashMessage;

public class IGRPMessage {
	
	private XMLWritter result;
	
	public IGRPMessage(){
		this.result = new XMLWritter();
		FlashMessage flashMessage = new FlashMessage();
		this.result.startElement("messages");
		// Success
		for(String msg : flashMessage.getMessages("success")){
			this.result.startElement("message");
			this.result.writeAttribute("type", "success");
			this.result.text(msg);
			this.result.endElement();
		}
		
		// Error
		for(String msg : flashMessage.getMessages("error")){
			this.result.startElement("message");
			this.result.writeAttribute("type", "error");
			this.result.text(msg);
			this.result.endElement();
		}
		
		// Info
		for(String msg : flashMessage.getMessages("info")){
			this.result.startElement("message");
			this.result.writeAttribute("type", "info");
			this.result.text(msg);
			this.result.endElement();
		}
		
		// Warning
		for(String msg : flashMessage.getMessages("warning")){
			this.result.startElement("message");
			this.result.writeAttribute("type", "warning");
			this.result.text(msg);
			this.result.endElement();
		}
		
		this.result.endElement();
	}
	
	@Override
	public String toString() {
		return result.toString();
	}
	
}
