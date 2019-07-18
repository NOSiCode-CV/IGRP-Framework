package nosi.core.gui.components;

import java.util.List;

import javax.servlet.http.Part;

import org.apache.commons.text.StringEscapeUtils;
import nosi.core.gui.fields.CheckBoxField;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.HiddenField;
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
	
	protected static final String SPLIT_SEQUENCE = "__IGRP__";

	public IGRPSeparatorList(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "separatorlist");
		this.addFormlist_1_id();
	}
	
	public IGRPSeparatorList(String tag_name) {
		this(tag_name,"");
	}

	
	public IGRPSeparatorList(String tag_name, Object model, String name) {
		this(tag_name,"");
		//
	}
	
	protected String[] rowId;
	
	public void loadModel(List<?> modelList, String[] rowId) {
		this.loadModel(modelList);
		this.rowId = rowId;
	}
	
	public void setRowsId(String []args) {
		this.rowId = args;
	}
	
	private void addFormlist_1_id() {
		Field formlist_1_id = new HiddenField(this.tag_name + "_id");
		formlist_1_id.setLabel("");
		formlist_1_id.propertie().add("name","p_" + this.tag_name + "_id")
								 .add("type","hidden")
								 .add("maxlength","50").add("java-type","")
								 .add("tag",this.tag_name + "_id")
								 .add("desc","true")
								 .add("hidden_formlist", "true");
		this.addField(formlist_1_id);
	}
	
	@Override
	protected void genRows() {
		
		int rowIndex = 1;
		
		this.data = this.modelList;
		
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
				
				for(Field field : this.fields){
					
					String val = IgrpHelper.getValue(obj, field.getName());
				
					if(field.getName().equals(this.tag_name + "_id")) {
						
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
					
					if((val==null || val.equals("")) && field.getValue() != null){
						val = field.getValue().toString();
					}
					
					this.xml.startElement(field.getTagName());
					this.xml.writeAttribute("name", field.propertie().getProperty("name"));
			
					if(val!= null) {
						String []aux = val.split(SPLIT_SEQUENCE); // this symbol underscore ... will be the reserved char 
						this.xml.text(aux.length > 0 ? aux[0] : "");
						this.xml.endElement();
						String sufix = "_desc";
						if(field instanceof CheckBoxListField || field instanceof CheckBoxField || field instanceof RadioListField || field instanceof RadioField) {
							sufix = "_check";
						}
						this.xml.startElement(field.getTagName() + sufix);
						this.xml.writeAttribute("name", field.propertie().getProperty("name") + sufix);
						this.xml.text(aux.length > 1 ? aux[1] : "");
						this.xml.endElement();
						
						this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_fk"+ "\" type=\"hidden\" value=\"" + StringEscapeUtils.escapeXml10(aux.length > 0 ? aux[0] : "") + "\"></hidden>");
						this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + field.propertie().getProperty("name") + "_desc_fk"+ "\" type=\"hidden\" value=\"" + StringEscapeUtils.escapeXml10(aux.length > 1 ? aux[1] : "") + "\"></hidden>");
					}
					//this.xml.addXml("<hidden tag=\"hidden_1\" name=\"" + "p_" + this.tag_name + "_id"+ "\" type=\"hidden\" value=\"" + StringEscapeUtils.escapeXml10(aux.length > 0 ? aux[0] : (rowId++) + "")  + "\"></hidden>");
					 
				}
				
				
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
		
		return this.xml.toString();
	}
	
	public void noEdit() {
		this.properties.add("noedit", "true");
	}
	public void noDelete() {
		this.properties.add("nodelete", "true");
	}
	public void noAdd() {
		this.properties.add("noadd", "true");
	}
	public static class Pair{
		
		private String key;
		private String value;
		private Part file;
		
		public Pair() {}
		
		public Pair(String key, String value) {
			this.key = key;
			this.value = value;
		}
		
		public Pair(String key, String value,Part file) {
			this.key = key;
			this.value = value;
			this.file = file;
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
		
		public Part getFile() {
			return file;
		}

		public void setFile(Part file) {
			this.file = file;
		}

		@Override
		public String toString() {
			return this.key + SPLIT_SEQUENCE + this.value;
		}
	}
}
