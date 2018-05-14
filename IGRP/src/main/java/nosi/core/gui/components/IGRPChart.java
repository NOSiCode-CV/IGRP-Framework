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
import nosi.core.webapp.databse.helpers.BaseQueryInterface;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper;
import nosi.core.webapp.databse.helpers.DatabaseMetadaHelper.Column;
import java.util.ArrayList;
import java.util.List;
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
		this.genChart();
		this.xml.endElement();
		return this.xml.toString();
	}
	
	private void genChart() {
		if(query!=null) {
			this.genChartWithQuery();
		}
		if(data != null) {
			this.genChartWithClass();
		}
	}
	
	private void genChartWithClass() {
		
	}
	
	private void genChartWithQuery() {
		List<Column> columns = DatabaseMetadaHelper.getCollumns(query.getConnectionName(), query.getSql());
		this.xml.startElement("label");
		columns.stream().forEach(c->{
			this.xml.setElement("col", c.getName());
		});
		this.xml.endElement();
		this.xml.startElement("value");
		for(Tuple t:query.getResultList()) {
			this.xml.startElement("row");
			columns.stream().forEach(c->{
					try {
						this.xml.setElement("col",t.get(c.getName()));
					}catch(IllegalArgumentException e) {
						this.xml.setElement("col","");
					}
			});	
			this.xml.endElement();
		}
		this.xml.endElement();
	}
	
	public void loadQuery(BaseQueryInterface query) {
		this.query = query;
	}
}

