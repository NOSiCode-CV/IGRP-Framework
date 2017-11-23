
package nosi.webapps.sim_fin.pages.teste;
import nosi.core.webapp.View;
import nosi.core.gui.components.*;
import nosi.core.gui.fields.*;

public class TesteView extends View {
	
	
	public Field video_1_text;
	public Field paragraph_1_text;
	public IGRPVideo video_1;
	public IGRPParagraph paragraph_1;

	public TesteView(Teste model){
		this.setPageTitle("Teste");
			
		video_1 = new IGRPVideo("video_1","");
		paragraph_1 = new IGRPParagraph("paragraph_1","");
		video_1_text = new TextField(model,"video_1_text");
		video_1_text.setLabel("");
		
		video_1_text.setValue("https://www.youtube.com/embed/Viz9FefXZYg");
		video_1_text.propertie().add("type","text").add("name","p_video_1_text").add("persist","true").add("maxlength","4000");
		paragraph_1_text = new TextField(model,"paragraph_1_text");
		paragraph_1_text.setLabel("");
		
		paragraph_1_text.setValue("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmodtempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.");
		paragraph_1_text.propertie().add("type","text").add("name","p_paragraph_1_text").add("persist","true").add("maxlength","4000");

		
	}
		
	@Override
	public void render(){
		
		video_1.addField(video_1_text);

		paragraph_1.addField(paragraph_1_text);

		this.addToPage(video_1);
		this.addToPage(paragraph_1);
	}
}
