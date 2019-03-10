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
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import javax.persistence.Tuple;


public class IGRPChart extends IGRPComponent{
	private List<?> data;
	private String caption;
	private String chart_type;
	private String xaxys;
	private String yaxys;
	private String url;
	private List<String> colors;
	private BaseQueryInterface query;
	
	public IGRPChart(String tag_name,String title) {
		super(tag_name,title);
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
		try {
			this.genChart();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		this.xml.endElement();
		return this.xml.toString();
	}
	
	private void genChart() throws Exception {
		if(query!=null) {
			this.genChartWithQuery();
		}
		if(data != null) {
			this.genChartWithClass();
		}
	}
	
	private void genChartWithClass() {
		
	}
	
	private void genChartWithQuery() throws Exception {
		int columnSize = new DatabaseMetadaHelper().getCollumns(this.query.getConnectionName(),this.query.getParametersMap(), this.query.getSql()).size();
		if(columnSize >= 2 && columnSize<=3) {
			List<Tuple> list = this.query.getResultList();	
			Set<String> labels = new HashSet<>();
			Map<String,Double> valuesXY = new LinkedHashMap<>();
			list.stream().forEach(t->{
				try {
					labels.add(t.get(0)!=null?t.get(0).toString():"");
					String key = t.get(0)!=null?t.get(0).toString():"";
					double v = Core.toDouble(t.get(1)!=null?t.get(0).toString():"0.0");
					if(valuesXY.containsKey(key)) {
						v+=valuesXY.get(key);
					}
					valuesXY.put(key, v);
				}catch(IllegalArgumentException e) {
				}
			});	
			this.generateLabels(labels);
			if(columnSize==2)
				this.generateRowsValueXY(valuesXY);
			else if(columnSize==3)
				this.generateRowsValueXYZ(list);
		}else {
			throw new Exception("Invalid Query");
		}
	}
	
	private void generateRowsValueXYZ(List<Tuple> list) {
		Map<Map<String,String>,Double> result = new LinkedHashMap<>();
		Set<String> values1 = new HashSet<>(),values2 = new HashSet<>();
		list.stream().forEach(t->{
			values1.add(t.get(0)!=null?t.get(0).toString():"");
			values2.add(t.get(1)!=null?t.get(1).toString():"");
			Map<String, String> key = new LinkedHashMap<>();
			key.put(t.get(0)!=null?t.get(0).toString():"",t.get(1)!=null?t.get(1).toString():"");						
			double v = Core.toDouble(t.get(2)!=null?t.get(2).toString():"0.0");
			if(result.containsKey(key)) {
				v+=result.get(key);
				result.remove(key);
			}
			result.put(key ,v);
		});
		this.xml.startElement("value");
		values2.stream().forEach(v2->{
			this.xml.startElement("row");
			this.xml.setElement("col", v2);
			values1.stream().forEach(v1->{
				Map<String,String> key = new LinkedHashMap<>();
				key.put(v1, v2);
				if(result.containsKey(key)) {
					this.xml.setElement("col", result.get(key));
				}else {
					this.xml.setElement("col", "0");
				}
			});
			this.xml.endElement();
		});
		this.xml.endElement();
	}
	
	private void generateRowsValueXY(Map<String,Double> valuesXY) {
		this.xml.startElement("value");
		this.xml.startElement("row");
		this.xml.setElement("col"," ");
		valuesXY.entrySet().stream().forEach(t->{
			try {
				this.xml.setElement("col",t.getValue());
			}catch(IllegalArgumentException e) {
				this.xml.setElement("col","");
			}
		});	
		this.xml.endElement();
	}
	
	private void generateLabels(Set<String> labels) {
		this.xml.startElement("label");	
		this.xml.setElement("col"," ");
		labels.stream().forEach(l->{
			this.xml.setElement("col",l);
		});	
		this.xml.endElement();
	}
	
	public void loadQuery(BaseQueryInterface query) {
		this.query = query;
	}
	
}

