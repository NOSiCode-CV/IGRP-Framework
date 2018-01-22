package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 19, 2017
 *
 * Description: class to generate xml of Video
 */
/*
<video_1 type="video" xml-type="video" gen-type="container" gen-group="">
    <fields>
        <video_1_text type="text" name="p_video_1_text" persist="true" maxlength="4000">
            <value>
                <![CDATA[https://www.youtube.com/embed/Viz9FefXZYg]]>
            </value>
        </video_1_text>
    </fields>
</video_1>
 */
import nosi.core.gui.fields.Field;

public class IGRPVideo extends IGRPForm {


	public IGRPVideo(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "video");
		this.properties.put("xml-type", "video");
	}
	
	public IGRPVideo(String tag_name) {
		this(tag_name,"");
	}
	
	@Override
	public void addField(Field field){
		field.setValue(field.getValue());
		this.fields.add(field);
	}
}
