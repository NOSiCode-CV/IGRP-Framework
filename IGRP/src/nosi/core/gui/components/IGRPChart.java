package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * May 10, 2017
 *
 * Description: class to generate xml of chart
 */
/*
 * 
<chart_1 type="chart" xml-type="chart" title="Chart" gen-type="container" gen-group="">
<caption/>
<chart_type>line</chart_type>
<xaxys>Eixo de X</xaxys>
<yaxys>Eixo de Y</yaxys>
<url>#</url>
<label>
    <col>Ano</col>
    <col>X1</col>
    <col>X2</col>
    <col>X3</col>
    <col>X4</col>
</label>
<value>
    <row>
        <col>2010</col>
        <col>265</col>
        <col>658</col>
        <col>498</col>
        <col>698</col>
    </row>
</value>
<colors>
    <col>#bdd2a7</col>
    <col>#1a49bc</col>
    <col>#290f60</col>
    <col>#c4aacf</col>
</colors>
</chart_1>
*/
import nosi.core.gui.fields.GenXMLField;
import nosi.core.gui.fields.TextField;
import nosi.core.webapp.helpers.IgrpHelper;
import java.util.ArrayList;
import java.util.List;
import nosi.core.gui.fields.Field;

public class IGRPChart extends IGRPComponent{
	private List<?> data;
	protected ArrayList<Field> fields;
	private String caption;
	private String chart_type;
	private String xaxys;
	private String yaxys;
	private String url;
	private ArrayList<String> colors;
	
	public IGRPChart(String tag_name,String title) {
		super(tag_name);
		this.fields = new ArrayList<>();
		this.colors = new ArrayList<>();
		this.properties.put("type", "chart");
		this.properties.put("structure", "graphic");
		this.properties.put("title",title);
	}
	
	
	public String getCaption() {
		return caption;
	}
	public void setCaption(String caption) {
		this.caption = caption;
	}
	public String getChart_type() {
		return chart_type;
	}
	public void setChart_type(String chart_type) {
		this.chart_type = chart_type;
	}
	public String getXaxys() {
		return xaxys;
	}
	public void setXaxys(String xaxys) {
		this.xaxys = xaxys;
	}
	public String getYaxys() {
		return yaxys;
	}
	public void setYaxys(String yaxys) {
		this.yaxys = yaxys;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}

	public IGRPChart addColor(String color){
		this.colors.add(color);
		return this;
	}
	
	public String toString(){
		this.setField();
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, this.properties);
		this.xml.setElement("caption", this.getCaption());
		this.xml.setElement("chart_type", this.getChart_type());
		this.xml.setElement("xaxys", this.getXaxys());
		this.xml.setElement("yaxys", this.getYaxys());
		this.xml.setElement("url", this.getUrl());
		if(this.fields.size() > 0){
			this.xml.startElement("label");
				for(Field field:this.fields){
					this.xml.setElement("col", field.getTagName());
				}
			this.xml.endElement();
		}
		this.genRows();
		this.genColors();
		this.xml.endElement();
		return this.xml.toString();
	}
	
	private void genColors() {
		this.xml.startElement("colors");
		if(this.colors.size() > 0 ){
			for(String color:this.colors){
				this.xml.setElement("col", color);
			}
		}
		this.xml.endElement();
	}


	public void addData(List<?> data){
		this.data = data;
	}
	
	private void setField(){
		if(this.data != null && this.data.size() > 0 ){
			java.lang.reflect.Field[] fields_ = this.data.get(0).getClass().getDeclaredFields();
			for(java.lang.reflect.Field f:fields_){
				if(f.getName() !="this$0"){
					Field ff = new TextField(this.data.get(0).getClass(), f.getName());
					this.fields.add(ff);
				}
			}
		}
	}
	
	private void genRows(){
		this.xml.startElement("value");
		if(this.data != null && this.data.size() > 0 ){
			for(Object obj:this.data){
				this.xml.startElement("row");
				for(Field field:this.fields){
					this.xml.startElement("col");
					this.xml.text(IgrpHelper.getValue(obj, field.getTagName()));
					this.xml.endElement();
				}
				this.xml.endElement();
			}
		}
		this.xml.endElement();
	}

}
