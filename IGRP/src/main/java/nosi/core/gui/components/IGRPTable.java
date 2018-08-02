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
import java.util.HashMap;
import java.util.List;
import java.util.Properties;
import java.util.Map.Entry;
import nosi.core.gui.fields.CheckBoxField;
import nosi.core.gui.fields.CheckBoxListField;
import nosi.core.gui.fields.ColorField;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.HiddenField;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.gui.fields.FieldProperties;
import java.util.Map;
 
public class IGRPTable extends IGRPComponent{

	
	protected ArrayList<Field> fields;
	private IGRPContextMenu contextmenu;
	protected float version = (float) 2.3;
	protected ArrayList<IGRPButton> buttons;
	protected List<?> data;
	protected String rows = "";
	protected List<?> modelList;
	private List<Properties> legend_color = new ArrayList<>();
	private Map<Object,Map <String, String> > legend_colors = new HashMap<>();
	
	public IGRPTable(String tag_name,String title) {
		super(tag_name,title);
		this.fields = new ArrayList<>();
		this.buttons = new ArrayList<>();
		this.properties.put("type", "table");
		this.properties.put("xml-type", "table");
		this.properties.put("structure", "fields");
		this.contextmenu = new IGRPContextMenu();
		this.contextmenu.setClassName(this);
		this.createParamsLookup();
	}	
	
	private void createParamsLookup() {
		String forLookup = Igrp.getInstance().getRequest().getParameter("forLookup");
		if(Core.isNotNull(forLookup)){
			Enumeration<String> params = Igrp.getInstance().getRequest().getParameterNames();
			while(params.hasMoreElements()){
				String param=params.nextElement();
				if(!param.equalsIgnoreCase("r") && !param.equalsIgnoreCase("forLookup")){
					String name = Igrp.getInstance().getRequest().getParameter(param);
					if(name!=null && !name.equals("")){
						Field f = new HiddenField(this,param);
						f.setName(param);
						f.setValue(name);
						f.setParam(true);
						f.propertie().add("isLookup", "true");
						f.setVisible(false);
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
						if(this.modelList != null)
							this.genRowsWithSql();
						else
							this.genRows();
					this.xml.endElement();//end tag value
				this.genLegendColor();
				this.contextmenu.setButtons(this.buttons);
				this.xml.addXml(this.contextmenu.toXmlTools());
				this.xml.endElement();//end tag table
			}else if(this.version == (float) 2.1){
				GenXMLField.toXmlV21(this.xml,this.fields);
				this.xml.startElement("value");
					if(this.modelList != null)
						this.genRowsWithSql();
					else
						this.genRows();
				this.xml.endElement();//end tag value
				this.genLegendColor();
				this.contextmenu.setButtons(this.buttons);
				this.xml.addXml(this.contextmenu.toXmlTools());
			}
		this.xml.endElement();
		String aux = this.xml.toString();
		System.out.println(aux);
		return aux;
	}

	public void setLegendColors(Map<Object, Map<String, String>> colors) {
		this.legend_colors = colors;
	}
	
	private void genLegendColor() {
		if(this.fields.stream().filter(f->f instanceof ColorField).count() > 0 && this.legend_colors.size() > 0){
			this.xml.startElement("legend_color");
			//this.xml.setElement("title", gt("Legenda"));
			this.legend_colors.entrySet().stream().forEach(l->{
				for(Entry<String, String> p : l.getValue().entrySet()) {
		          this.xml.startElement("item");
		          	this.xml.setElement("label", p.getValue().toString());
		          	this.xml.setElement("value", l.getKey().toString());
		          	this.xml.setElement("color", p.getKey().toString());
		          this.xml.endElement();
		        }
			});
			this.xml.endElement();
		}
		/*if(this.fields.stream().filter(f->f instanceof ColorField).count() > 0 && this.legend_color.size() > 0){
			this.xml.startElement("legend_color");
			//this.xml.setElement("title", gt("Legenda"));
			this.legend_color.stream().forEach(l->{
				for(Entry<Object, Object> p : l.entrySet()) {
		          this.xml.startElement("item");
		          	this.xml.setElement("label", p.getKey().toString());
		          	this.xml.setElement("value", p.getValue().toString());
		          this.xml.endElement();
		        }
			});
			this.xml.endElement();
		}*/
	}

	private void genRowsWithSql() {
		for(Object l:this.modelList) {
			this.xml.startElement("row");
			this.xml.startElement("context-menu");
			for(Field field:this.fields){
				if(field.isParam()){
					String value= IgrpHelper.getValue(l,  field.propertie().getProperty("isLookup")=="true"  ? field.getValue().toString() : field.getName().toLowerCase());
					if(Core.isNull(value))
						value= IgrpHelper.getValue(l, "p_"+field.getName().toLowerCase());
					this.xml.setElement("param", field.propertie().getProperty("name")+"="+ value);
				}
			}
			this.xml.endElement();			
			for(Field field:this.fields){
				if(field.isVisible()) {
					String value= IgrpHelper.getValue(l, field.getName().toLowerCase());
					if(Core.isNull(value))
						value= IgrpHelper.getValue(l, "p_"+field.getName().toLowerCase());	
					this.xml.startElement(field.getTagName().replace("p_", ""));
					this.xml.writeAttribute("name", field.getName().startsWith("p_")?field.getName():"p_"+field.getName());
					this.xml.text(value);
					this.xml.endElement();
				}
			}
			this.xml.endElement();
		}
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
							this.xml.setElement("param", field.propertie().getProperty("name")+"="+value);
					}
				}
				if(obj instanceof IGRPTable.Table && ((IGRPTable.Table)obj).getHiddenButtons()!=null) {
					this.xml.startElement("param");
					for(IGRPButton button:((IGRPTable.Table)obj).getHiddenButtons()) {
						this.xml.text("ctx_hidden="+button.getProperties().getProperty("rel")+",");
					}			
					this.xml.endElement();		
				}
				this.xml.endElement();
				for(Field field:this.fields){
					if(field.isVisible()) {
						this.xml.startElement(field.getTagName());
						this.xml.writeAttribute("name", field.propertie().getProperty("name"));
						String val = IgrpHelper.getValue(obj, field.getName());
						if(val==null || val.equals("")){
							val = field.getValue()!=null?field.getValue().toString():"";
						}
						this.xml.text(val);
						this.xml.endElement();
						String sufix = "_desc";
						if(field instanceof CheckBoxField || field instanceof CheckBoxListField){
							sufix = "_check";
						}
						this.xml.startElement(field.getTagName()+sufix);
						this.xml.writeAttribute("name", field.propertie().getProperty("name")+sufix);
						String val1 = IgrpHelper.getValue(obj, field.getName()+sufix);
						if(val1==null || val1.equals("")){						
							val1 = field.getValue() != null ? field.getValue().toString() : "";						
						}
						this.xml.text(val1);
						this.xml.endElement();
					}
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
				if(!this.rows.equals("")){
					this.xml.addXml(this.rows);
				}
			this.xml.endElement();
		this.xml.endElement();
		return this.xml.toString();
	}

	public IGRPTable addLegendColor(String label,String value) {
		Properties p = new Properties();
		p.put(label, value); 
		this.legend_color.add(p);
		return this;
	}

	public void loadModel(List<?> modelList) {
		this.modelList = modelList;
		//this.data = modelList;
	}
	
	
	public static class Table{
		private IGRPButton[] buttons;
		
		public void hiddenButton(IGRPButton...buttons) {
			this.buttons = buttons;
		}
		
		public IGRPButton[] getHiddenButtons() {
			return this.buttons;
		}
	}
}
