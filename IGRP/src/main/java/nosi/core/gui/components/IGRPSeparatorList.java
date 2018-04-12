package nosi.core.gui.components;

import nosi.core.gui.fields.CheckBoxField;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.RadioField;
import nosi.core.gui.fields.RadioListField;
import nosi.core.webapp.helpers.IgrpHelper;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of SeparatorList
 */
/*
 * /*Generate XML SeparatorList
 *<separatorlist_1 type="separatorlist" structure="fields">
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
</separatorlist_1>
 */
public class IGRPSeparatorList extends IGRPTable {

	public IGRPSeparatorList(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "separatorlist");
	}
	
	public IGRPSeparatorList(String tag_name) {
		this(tag_name,"");
	}
	
	
	public IGRPSeparatorList(String tag_name, Object model, String name) {
		this(tag_name,"");
		//
	}
	
	@Override
	protected void genRows() {
		if(this.data != null && this.data.size() > 0 && this.fields.size() > 0){
			
			int i = 0;
			
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
					String sufix = "_desc";
					if(field instanceof CheckBoxListField || field instanceof CheckBoxField || field instanceof RadioListField || field instanceof RadioField) {
						sufix = "_check";
					}
					this.xml.startElement(field.getTagName() + sufix);
					this.xml.writeAttribute("name", field.propertie().getProperty("name") + sufix);
					this.xml.text(aux[1]);
					this.xml.endElement();
					
					this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_fk"+ "\" type=\"hidden\" value=\"" + aux[0] + "\"></hidden>");
					this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_desc_fk"+ "\" type=\"hidden\" value=\"" + aux[1] + "\"></hidden>");
				}
				
				//this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + "p_" + "separatorlist_1" + "_id"+ "\" type=\"hidden\" value=\"" + (++i)  + "\"></hidden>");
				
				this.xml.endElement();
			}
		}
		if(!this.rows.equals("")){
			this.xml.addXml(this.rows);
		}
	}


	public String toString(){
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, properties);
		GenXMLField.toXml(this.xml,this.fields);
		this.xml.startElement("table");
			this.xml.startElement("value");
				this.genRows();
			this.xml.endElement();
		this.xml.endElement();
		this.xml.endElement();
		
		//System.out.println(this.xml.toString());
		
		return this.xml.toString();
	}
	
	public static class Pair{
		
		private String key;
		private String value;
		
		public Pair() {}
		
		public Pair(String key, String value) {
			this.key = key;
			this.value = value;
		}
		
		public String getKey() {
			return key;
		}
		public void setKey(String key) {
			this.key = key;
		}
		public String getValue() {
			return value;
		}
		public void setValue(String value) {
			this.value = value;
		}
		
		@Override
		public String toString() {
			return this.key + "_" + this.value;
		}
	}
}
