package nosi.core.gui.components;

import nosi.core.gui.fields.Field;
import nosi.core.webapp.helpers.IgrpHelper;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of FormList
 */
/*
 * /*Generate XML Table
 *<formlist_1 type="formlist" structure="fields">
    <fields>
        <number_1 name="p_number_1" type="number" align="left" lookup_parser="false">
            <label>Number</label>
        </number_1>
        ...
    </fields>
    <table>
        <value>
            <row>
                <number_1>527</number_1>
                <number_1_desc>527</number_1_desc>
                <text_1>Magna dolor labore ipsum totam</text_1>
                <text_1_desc>Magna dolor labore ipsum totam</text_1_desc>
            </row>
            ...
        </value>
    </table>
</formlist_1>
 */
public class IGRPFormList extends IGRPSeparatorList {

	public IGRPFormList(String tag_name) {
		super(tag_name);
		this.properties.put("type", "formlist");
	}
	
	protected void genRows() {
		if(this.data != null && this.data.size() > 0 && this.fields.size() > 0){
			for(Object obj:this.data){
				this.xml.startElement("row");
				if(this.buttons.size() > 0){
					this.xml.startElement("context-menu");
					for(Field field:this.fields){
						if(field.isParam())
							this.xml.setElement("param", field.getName()+"="+IgrpHelper.getValue(obj, field.getName()));
					}
					this.xml.endElement();
				}
				for(Field field:this.fields){
					this.xml.startElement(field.getTagName());
					this.xml.writeAttribute("name", field.propertie().getProperty("name"));
					String val = IgrpHelper.getValue(obj, field.getName());
					if(val==null || val.equals("")){
						val = field.getValue().toString();
					}
					String []aux = val.split("_"); // this symbol underscore ... will be the reserved char
					this.xml.text(aux[0]);
					this.xml.endElement();
					
					this.xml.startElement(field.getTagName() + "_desc");
					this.xml.writeAttribute("name", field.propertie().getProperty("name") + "_desc");
					this.xml.text(aux[1]);
					this.xml.endElement();
					
					this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_fk"+ "\" type=\"hidden\" value=\"" + aux[0] + "\"></hidden>");
					this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_desc_fk"+ "\" type=\"hidden\" value=\"" + aux[1] + "\"></hidden>");
				}
				this.xml.endElement();
			}
		}else if(this.data==null){
				this.xml.startElement("row");
				for(Field field:this.fields){
					this.xml.startElement(field.getTagName());
					this.xml.writeAttribute("name", field.propertie().getProperty("name"));
					String val = IgrpHelper.getValue(null, field.getName());
					if(val==null || val.equals("")){
						val = field.getValue().toString();
					}
					this.xml.text("");
					this.xml.endElement();
					
					this.xml.startElement(field.getTagName() + "_desc");
					this.xml.writeAttribute("name", field.propertie().getProperty("name") + "_desc");
					this.xml.text("");
					this.xml.endElement();
					
					this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_fk"+ "\" type=\"hidden\" value=\"" + "\"></hidden>");
					this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_desc_fk"+ "\" type=\"hidden\" value=\""  + "\"></hidden>");
				}
				this.xml.endElement();
		}
		if(!this.rows.equals("")){
			this.xml.addXml(this.rows);
		}
	}
}
