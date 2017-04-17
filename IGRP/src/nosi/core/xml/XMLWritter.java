/**
 * @author: Emanuel Pereira
 *
 * Description: class to build xml 
 */
package nosi.core.xml;

import java.util.ArrayList;
import java.util.HashMap;

public class XMLWritter {
		protected ArrayList<String> listXml;
		private HashMap<String, Boolean> countAttr;
		private StringBuilder xmlConstruct;
	    private static String lineSeparator=System.getProperty("line.separator", "\n");
	    private String identityString="	";
	    
		public XMLWritter(String rootElement, String xslPath, String contentType){
			this();
			this.xmlConstruct.append("<?xml-stylesheet href=\""+xslPath+"\" type=\"text/xsl\"?>");
			this.xmlConstruct.append(lineSeparator);
			this.startElement(rootElement);
			this.closeLarger();
			this.xmlConstruct.append(lineSeparator);
		}

		public XMLWritter(){
			this.listXml = new ArrayList<>();
			this.countAttr = new HashMap<String, Boolean>();
			this.xmlConstruct = new StringBuilder();
		}
		
		public void startElement(String tag){
			this.closeLarger();
			this.countAttr.put(tag,true);
			if(this.listXml.size()>0){
				this.xmlConstruct.append(lineSeparator);
				this.xmlConstruct.append(identityString);
			}
			this.xmlConstruct.append("<"+tag);
			this.listXml.add(tag);
		}

		public void text(String text){
			this.closeLarger();
			this.xmlConstruct.append(text);
		}
		
		public void emptyTag (String tag) {
			this.xmlConstruct.append("<"+tag+" />");
		}

		public void writeAttribute(String key,String value){
			this.xmlConstruct.append(" "+key+"=\""+value+"\"");
		}

		public void setElement(String tag,String value){
			this.startElement(tag);
			this.text(value);
			this.countAttr.put(tag,false);
			this.endElement();
		}

		private void closeLarger(){
			try{
				String key = this.listXml.get(this.listXml.size()-1);
				if(this.countAttr.get(key).booleanValue()==true){
					this.xmlConstruct.append(">");
					this.countAttr.remove(key);
				}
			}catch(Exception e){}
		}

		public void endElement(){
			try{
				int index = this.listXml.size()-1;
				String tag = this.listXml.get(index);
				this.closeLarger();
				this.xmlConstruct.append("</"+tag+">");
				this.xmlConstruct.append(lineSeparator);
				this.listXml.remove(index);
			}catch(Exception e){}
		}

		public void addXml(String xml){
			this.xmlConstruct.append(xml);
		}
		
		public String getXml(){
			if(this.listXml.size()>0){
				for(int i=this.listXml.size()-1;i>=0;i--){
					this.xmlConstruct.append(lineSeparator+"</"+this.listXml.get(i).toString()+">");
				}
				this.listXml = null;
				this.countAttr = null;
			}
			return this.xmlConstruct.toString();
		}
		
		@Override
		public String toString() {
			// TODO Auto-generated method stub
			return this.getXml();
		}

}
