package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of Table
 */
/*
 * /*Generate XML Table
 *<table_1 type="table" structure="fields">
    <fields>
        <number_1 name="p_number_1" type="number" align="left" lookup_parser="false">
            <label>Number</label>
        </number_1>
        ...
    </fields>
    <table>
        <value>
            <row>
                <context-menu>
                    <param>p1=linha1</param>
                    <param>p2=linha1</param>
                </context-menu>
                <number_1>527</number_1>
                <number_1_desc>527</number_1_desc>
                <text_1>Magna dolor labore ipsum totam</text_1>
                <text_1_desc>Magna dolor labore ipsum totam</text_1_desc>
            </row>
            ...
        </value>
        <context-menu>
            <item type="specific" code="" rel="button_1" class="default">
                <title>Button</title>
                <app/>
                <page/>
                <link/>
                <target>_blank</target>
                <img>fa-dot-circle-o</img>
            </item>
            ...
        </context-menu>
    </table>
</table_1>
 */
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.gui.fields.FieldProperties;

 
public class IGRPTable extends IGRPComponent{

	protected ArrayList<Field> fields;
	private IGRPContextMenu contextmenu;
	protected float version = (float) 2.3;
	protected ArrayList<IGRPButton> buttons;
	protected List<?> data;
	protected String rows = "";
	
	public IGRPTable(String tag_name,String title) {
		super(tag_name,title);
		this.fields = new ArrayList<>();
		this.buttons = new ArrayList<>();
		this.properties.put("type", "table");
		this.properties.put("structure", "fields");
		this.contextmenu = new IGRPContextMenu();
		this.contextmenu.setClassName(this);
		this.createParamsLookup();
	}	
	
	private void createParamsLookup() {
		String forLookup = Igrp.getInstance().getRequest().getParameter("forLookup");
		if(forLookup!=null && !forLookup.equals("")){
			Enumeration<String> params = Igrp.getInstance().getRequest().getParameterNames();
			while(params.hasMoreElements()){
				String param=params.nextElement();
				if(!param.equalsIgnoreCase("r") && !param.equalsIgnoreCase("forLookup")){
					String name = Igrp.getInstance().getRequest().getParameter(param);
					if(name!=null && !name.equals("")){
						Field f = new HiddenField(null, param);
						f.setValue(name);
						f.setParam(true);
						this.fields.add(f);
					}
				}
			}
		}
	}

	public IGRPTable(String tag_name){
		this(tag_name,"");
	}
	
	public IGRPTable(String tag_name,float version){
		this(tag_name);
		this.version = version;
		this.properties = new FieldProperties();
		this.properties.put("operation", "");
	}
	public void addField(Field field){
		this.fields.add(field);
	}
	
	public void addData(List<?> data){
		this.data = data;
	}
	
	public List<?> getData(){
		return this.data;
	}
	
	public void addButton(IGRPButton button){
		button.propertie.put("type", "form");
		this.buttons.add(button);
	}
			
	public String toString(){
		this.xml.startElement(this.tag_name);
			GenXMLField.writteAttributes(this.xml, properties);
			if(this.version > (float) 2.1){
				GenXMLField.toXml(this.xml,this.fields);
				this.xml.startElement("table");
					this.xml.startElement("value");
						this.genRows();
					this.xml.endElement();
				this.contextmenu.setButtons(this.buttons);
				this.xml.addXml(this.contextmenu.toXmlTools());
				this.xml.endElement();//end tag table
			}else if(this.version == (float) 2.1){
				GenXMLField.toXmlV21(this.xml,this.fields);
				this.xml.startElement("value");
					this.genRows();
				this.xml.endElement();//end tag value
				this.contextmenu.setButtons(this.buttons);
				this.xml.addXml(this.contextmenu.toXmlTools());
			}
		this.xml.endElement();
		return this.xml.toString();
	}

	protected void genRows() {
		if(this.data != null && this.data.size() > 0 && this.fields.size() > 0){
			for(Object obj:this.data){
				this.xml.startElement("row");
				this.xml.startElement("context-menu");
				for(Field field:this.fields){
					if(field.isParam()){
						String value = IgrpHelper.getValue(obj, field.getName());
						value = (value==null||value.equals(""))?IgrpHelper.getValue(obj, field.getValue().toString()).toString():value;
						value = (value==null||value.equals(""))?field.getValue().toString():value;
						if(value!=null && !value.equals(""))
							this.xml.setElement("param", field.getName()+"="+value);
					}
				}
				this.xml.endElement();
				for(Field field:this.fields){
					this.xml.startElement(field.getTagName());
					this.xml.writeAttribute("name", field.propertie().getProperty("name"));
					String val = IgrpHelper.getValue(obj, field.getName());
					if(val==null || val.equals("")){
						val = field.getValue().toString();
					}
					this.xml.text(val);
					this.xml.endElement();
					this.xml.startElement(field.getTagName()+"_desc");
					this.xml.writeAttribute("name", field.propertie().getProperty("name")+"_desc");
					String val1 = IgrpHelper.getValue(obj, field.getName()+"_desc");
					if(val1==null || val1.equals("")){
						val1 = field.getValue().toString();
					}
					this.xml.text(val1);
					this.xml.endElement();
				}
				this.xml.endElement();
			}
		}
		if(!this.rows.equals("")){
			this.xml.addXml(this.rows);
		}
	}

	public void addRowsXMl(String rows){
		this.rows = rows;
	}
	
	//Para formato de xml 2.1
	public String getDoc_list(){
		this.xml.startElement("table");
			this.xml.startElement("prm_doc_list");
				this.xml.writeAttribute("type", "separatordialog");
				this.xml.writeAttribute("container", "true");
				GenXMLField.toXmlV21(this.xml,this.fields);
			this.xml.endElement();
		this.xml.endElement();
		return this.xml.toString();
	}
}
