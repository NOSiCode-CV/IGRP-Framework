package nosi.core.gui.components;

import java.util.List;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;
import nosi.core.webapp.Core;
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

	private boolean startRow = true;
	
	public IGRPFormList(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "formlist");
	}
	
	public IGRPFormList(String tag_name) {
		this(tag_name,"");
	}
	
	protected void genRows() {
	
		int rowIndex = 1; 
		
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
					
					String val = IgrpHelper.getValue(obj, field.getName());
					
					if(field.getName().contains(this.tag_name)) {
						
						if(val != null && !val.isEmpty()) {
							this.xml.startElement(this.tag_name + "_id");
							String []aux = val.split(SPLIT_SEQUENCE);
							this.xml.text(aux != null && aux.length > 0 ? aux[0] : "");
							this.xml.endElement();
						}else {
							this.xml.startElement(this.tag_name + "_id");
							this.xml.text((rowIndex++) + "");
							this.xml.endElement();
						}
						
						continue;
					}
					
					this.genFields(obj,field);
				}
				this.xml.endElement();
			}
		}else if(this.data==null || this.data.size() == 0 && this.startRow){
			this.xml.startElement("row"); 
			for(Field field:this.fields){	
				this.genFields(null,field);		
			}
			this.xml.endElement();
		}		
		if(!this.rows.equals(""))
			this.xml.addXml(this.rows);		
	}
	
	private void genFields(Object obj,Field field) {		
		xml.startElement(field.getTagName());
		this.xml.writeAttribute("name", field.propertie().getProperty("name"));
		this.xml.writeAttribute("type",field.propertie().getProperty("type"));
		this.xml.writeAttribute("desc","true");
		String val = IgrpHelper.getValue(obj, field.getName());
		if((val==null || val.equals("")) && Core.isNotNull(field.getValue())){
			val = field.getValue().toString();
		}
		String []aux = val.split(SPLIT_SEQUENCE); // this symbol underscore ... will be the reserved char
		this.xml.text((aux.length>0?aux[0]:""));
		this.xml.endElement();
		if(!(field instanceof HiddenField)){
			this.xml.startElement(field.getTagName() + "_desc");
			this.xml.writeAttribute("name", field.propertie().getProperty("name") + "_desc");
			this.xml.text(aux.length > 1?aux[1]:"");
			this.xml.endElement();
		}
	}

	public void setStartRow(boolean isStartRow) {
		this.startRow = isStartRow;
	}
	
	public void loadModel(List<?> modelList) {
		this.data = modelList;
	}
}
