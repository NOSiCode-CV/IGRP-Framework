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
    ...
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
import nosi.core.webapp.DBQuery;
import nosi.core.webapp.FlashMessage;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.IgrpHelper;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
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
	private String sql;
	private DBQuery q;
	
	public IGRPChart(String tag_name,String title) {
		super(tag_name,title);
		this.fields = new ArrayList<>();
		this.colors = new ArrayList<>();
		this.properties.put("type", "chart");
		this.properties.put("xml-type", "chart");
		this.properties.put("gen-type", "container");
		this.properties.put("gen-group", "");
	}
	public IGRPChart(String tag_name) {
		this(tag_name,"");
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
		this.xml.startElement(this.tag_name);
		GenXMLField.writteAttributes(this.xml, this.properties);
		this.xml.setElement("caption", this.getCaption());
		this.xml.setElement("chart_type", this.getChart_type());
		this.xml.setElement("xaxys", this.getXaxys());
		this.xml.setElement("yaxys", this.getYaxys());
		this.xml.setElement("url", this.getUrl());
		this.genChart();
		this.genColors();
		this.xml.endElement();
		return this.xml.toString();
	}
	
	private void genChart() {
		if(this.getSqlQuery()!=null && !this.getSqlQuery().equals("")){
			this.genChartWithSql();
		}else{
			this.setField();
			this.genChartWithoutSql();
		}
	}
	
	//Gera xml de chart a partie de classes
	private void genChartWithoutSql() {
		if(this.fields.size() > 0){
			this.xml.startElement("label");
				for(Field field:this.fields){
					this.xml.setElement("col", field.getTagName());
				}
			this.xml.endElement();
		}
		this.genRows();
	}
	
	//Gera xml de chart a partir de query sql
	private void genChartWithSql() {
		if(this.q!=null && this.getSqlQuery()!=null && !this.getSqlQuery().equals("")){
			try {
					Map<String,Number> labels = new HashMap<>();	
					List<Item> itens = new ArrayList<>();
					this.xml.startElement("label");
						while(q.getResultSet().next()){
							Item item = null;
							if(q.getColumns().size() > 2){
								labels.put(q.getResultSet().getString(2),0);
								item = new Item(q.getResultSet().getString(1), q.getResultSet().getString(2),(Number) q.getResultSet().getObject(3));
							}else{
								labels.put(q.getResultSet().getString(1),0);
								item = new Item(q.getResultSet().getString(1), q.getResultSet().getString(1),(Number) q.getResultSet().getObject(2));
							}
							itens.add(item );
						}
						this.xml.emptyTag("col");
						for(Map.Entry<String, Number> l:labels.entrySet()){
							this.xml.setElement("col", l.getKey().toString());
						}
					this.xml.endElement();//End tag label
					this.xml.startElement("value");// Start tag value
						if(q.getColumns().size() > 2){	
							this.genRowsChart3d(itens,labels);
						}else{
							this.genRowsChart2d(itens,labels);
						}
					this.xml.endElement();//End tag value
				} catch (SQLException e) {
					e.printStackTrace();
				}
			q.close();
		}
	}
	
	private boolean validateSqlChart(int columnCount) {
		if(this.getChart_type().equalsIgnoreCase("pie") && columnCount!=2){
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING,this.properties.getProperty("title")+": O seu SQL deve conter apenas 2 campos");
			return false;
		}else if(!this.chart_type.equalsIgnoreCase("pie") && columnCount!=3){
			Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.WARNING,this.properties.getProperty("title")+": O seu SQL deve conter 3 campos");
			return false;
		}
		return true;
	}
	
	private void genRowsChart2d(List<Item> itens, Map<String, Number> labels) {
		this.xml.startElement("row");
		this.xml.emptyTag("col");
		for(Item item:itens){
			for(Map.Entry<String, Number> col:labels.entrySet()){
				if(col.getKey().equalsIgnoreCase(item.getEixoX()))
					this.xml.setElement("col",item.getValor());
			}
		}
		this.xml.endElement();//end tag row
	}
	
	private void genRowsChart3d(List<Item> itens, Map<String, Number> labels) {
		Map<String, Map<String,Number>> result = itens.stream().collect(
                		Collectors.groupingBy(Item::getEixoX,Collectors.toMap(Item::getEixoY, Item::getValor))
                );
		for(Map.Entry<String, Map<String,Number>> row:result.entrySet()){
			this.xml.startElement("row");
			this.xml.setElement("col", row.getKey().toString());
			for(Map.Entry<String, Number> col:labels.entrySet()){
				if(row.getValue().get(col.getKey())!=null)
					this.xml.setElement("col",row.getValue().get(col.getKey()));
				else
					this.xml.setElement("col", "0");
			}
			this.xml.endElement();//end tag row
		}
	}

	public class Item{
		private String eixoX;
		private String eixoY;
		private Number valor;
		
		public Item(String eixoX, String eixoY, Number valor) {
			super();
			this.eixoX = eixoX;
			this.eixoY = eixoY;
			this.valor = valor;
		}
		
		public String getEixoX() {
			return eixoX;
		}
		public void setEixoX(String eixoX) {
			this.eixoX = eixoX;
		}
		public String getEixoY() {
			return eixoY;
		}
		public void setEixoY(String eixoY) {
			this.eixoY = eixoY;
		}
		public Number getValor() {
			return valor;
		}
		public void setValor(Number valor) {
			this.valor = valor;
		}
	}
	
	public static Number addNumbers(Number a, Number b) {
	    if(a instanceof Double || b instanceof Double) {
	        return new Double(a.doubleValue() + b.doubleValue());
	    } else if(a instanceof Float || b instanceof Float) {
	        return new Float(a.floatValue() + b.floatValue());
	    } else if(a instanceof Long || b instanceof Long) {
	        return new Long(a.longValue() + b.longValue());
	    } else {
	        return new Integer(a.intValue() + b.intValue());
	    }
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

	public void setSqlQuery(String connectionName,String sql){
		this.connectionName = connectionName;
		this.setSqlQuery(sql);
	}
	
	public void setSqlQuery(String sql){
		this.sql = sql;
		this.q = new DBQuery();
		if(this.q!=null && this.getSqlQuery()!=null && !this.getSqlQuery().equals("")){
			this.q = this.q.query(this.getConnectionName(),this.getSqlQuery());
			if(this.q.isError()){
				Igrp.getInstance().getFlashMessage().addMessage(FlashMessage.ERROR,q.getError());
				this.sql = null;
			}
		}
		if(!this.validateSqlChart(q.getColumns().size())){
			this.sql = null;
		}
	}
	
	public String getSqlQuery(){
		return this.sql;
	}
}
