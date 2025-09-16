package nosi.core.gui.components;
import java.util.ArrayList;

import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;

import java.util.Set;
import javax.persistence.Tuple;

import nosi.core.gui.fields.GenXMLField;
import nosi.core.webapp.Core;
import nosi.core.webapp.databse.helpers.BaseQueryInterface;


public class IGRPChart extends IGRPComponent{
	private List<?> data;
	private String caption;
	private String chart_type;
	private String xaxys;
	private String yaxys;
	private String url;
	private final List<String> colors;
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
	
	@Override
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
			Core.log("ERROR:" + e.getLocalizedMessage());
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
		LinkedHashSet <String> labels = new LinkedHashSet<>();
		for(Object o:this.data) {
			if(o instanceof IGRPChart2D) {
				labels.add(((IGRPChart2D) o).getEixoX());
			}else if(o instanceof IGRPChart3D) {
				labels.add(((IGRPChart3D) o).getEixoX());
			}
		}
		this.generateLabels(labels);
		LinkedHashMap<String, Object> valuesXY = new LinkedHashMap<>();
		//LinkedHashMap<String,LinkedHashMap<String,Object>> valuesXYZ = new LinkedHashMap<>();		
		for(Object o:this.data) {
			if(o instanceof IGRPChart2D chart2d) {
               valuesXY.put(chart2d.getEixoX(), chart2d.getEixoY());
			}
//			else if(o instanceof IGRPChart3D chart3d) {
//               LinkedHashMap<String, Object> value = new LinkedHashMap<>();
//				value.put(chart3d.getEixoY(), ""+chart3d.getEixoZ());
//				valuesXYZ.put(chart3d.getEixoX(), value );
//			}
		}

		if(!valuesXY.isEmpty())
			this.generateRowsValueXY(valuesXY);
		else
			this.generateRowsValueXYZ();
	}
	

	private void generateRowsValueXYZ() {
		LinkedHashMap<LinkedHashMap<String,String>,Object> result = new LinkedHashMap<>();
		Set<String> values1 = new LinkedHashSet<>();
		Set<String> values2 = new LinkedHashSet<>();
		this.data.forEach(o->{
			IGRPChart3D chart3d = (IGRPChart3D)o;
			values1.add(chart3d.getEixoX()!=null?chart3d.getEixoX():"");
			values2.add(chart3d.getEixoY()!=null?chart3d.getEixoY():"");
			LinkedHashMap<String, String> key = new LinkedHashMap<>();
			key.put(chart3d.getEixoX()!=null?chart3d.getEixoX():"",chart3d.getEixoY()!=null?chart3d.getEixoY():"");						
			Object v = chart3d.getEixoZ();
			if(result.containsKey(key)) {
				v=result.get(key);
				result.remove(key);
			}
			result.put(key ,v);
		});
		this.xml.startElement("value");
		values2.forEach(v2->{
			this.xml.startElement("row");
			this.xml.setElement("col", v2);
			values1.forEach(v1->{
				LinkedHashMap<String,String> key = new LinkedHashMap<>();
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
	
	private void genChartWithQuery() throws Exception {
        List<Tuple> list = this.query.getResultList();
        if (list == null || list.isEmpty()) {
          return;
        }
        int columnSize = list.get(0).getElements().size();
        if (columnSize >= 2 && columnSize <= 3) {
            Set<String> labels = new LinkedHashSet<>();
            LinkedHashMap<String, Object> valuesXY = new LinkedHashMap<>();
            list.forEach(t -> {
                try {
                    labels.add(t.get(0) != null ? t.get(0).toString() : "");
                    String key = t.get(0) != null ? t.get(0).toString() : "";
                    Object v = Core.toDouble(t.get(1) != null ? t.get(1).toString() : "0");
                    if (valuesXY.containsKey(key)) {
                        v = valuesXY.get(key);
                    }
                    valuesXY.put(key, v);
                } catch (IllegalArgumentException e) {
                    Core.log("ERROR:" + e.getLocalizedMessage());
                }
            });
            this.generateLabels(labels);
            if (columnSize == 2)
                this.generateRowsValueXY(valuesXY);
            else this.generateRowsValueXYZ(list);
        } else {
            Core.setMessageError("Invalid Query");
            Core.log("Invalid Query not columnSize >= 2 && columnSize<=3: " + this.query.getSql());
            throw new Exception("Invalid Query");
        }
	}
	
	private void generateRowsValueXYZ(List<Tuple> list) {
		LinkedHashMap<LinkedHashMap<String,String>,Double> result = new LinkedHashMap<>();
		Set<String> values1 = new LinkedHashSet<>(),values2 = new LinkedHashSet<>();
		list.forEach(t->{
			values1.add(t.get(0)!=null?t.get(0).toString():"");
			values2.add(t.get(1)!=null?t.get(1).toString():"");
			LinkedHashMap<String, String> key = new LinkedHashMap<>();
			key.put(t.get(0)!=null?t.get(0).toString():"",t.get(1)!=null?t.get(1).toString():"");						
			double v = Core.toDouble(t.get(2) != null ? t.get(2).toString() : "0");
			if(result.containsKey(key)) {
				v += result.remove(key);
			}
			result.put(key, v);
		});
		this.xml.startElement("value");
		values2.forEach(v2->{
			this.xml.startElement("row");
			this.xml.setElement("col", v2);
			values1.forEach(v1->{
				LinkedHashMap<String,String> key = new LinkedHashMap<>();
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
	
	private void generateRowsValueXY(LinkedHashMap<String,Object> valuesXY) {
		this.xml.startElement("value");
		this.xml.startElement("row");
		this.xml.setElement("col"," ");
		valuesXY.forEach((key, value) -> {
           try {
              this.xml.setElement("col", value);
           } catch (IllegalArgumentException e) {
              this.xml.setElement("col", "");
           }
        });
		this.xml.endElement();
	}
	
	private void generateLabels(Set<String> labels) {
		this.xml.startElement("label");	
		this.xml.setElement("col"," ");
		labels.forEach(l-> this.xml.setElement("col",l));
		this.xml.endElement();
		generateColors(labels.size());
	}
	
	private void generateColors(int countlabels) {
		if(!colors.isEmpty() && countlabels>0) {
			this.xml.startElement("colors");			
			for(int i=0;i<countlabels/colors.size()+1;i++) {
				this.colors.forEach(l-> this.xml.setElement("col",l));
			}
			
			this.xml.endElement();
		}
		
	}
	
	public void loadQuery(BaseQueryInterface query) {
		this.query = query;
	}
	
	public void loadModel(List<?> modelList) {
		this.data = modelList;
	}
	
}

