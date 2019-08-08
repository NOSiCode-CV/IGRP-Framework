package nosi.core.gui.components;

import java.util.List;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FileField;
import nosi.core.webapp.Core;
import nosi.core.webapp.helpers.IgrpHelper;
import nosi.core.webapp.helpers.TempFileHelper;
import nosi.webapps.igrp.dao.TempFile;

/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of FormList
 */
/*
 * /*Generate XML Table
 *<formlist_1 type="formlist" structure="fields">
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
</formlist_1>
 */
public class IGRPFormList extends IGRPSeparatorList {

	private boolean startRow = true;
	
	public IGRPFormList(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "formlist");
	}
	
	public IGRPFormList(String tag_name) {
		this(tag_name,"");
	}
	
	@Override
	protected void genRows() {
	
		int rowIndex = 1; 
		
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
				for(Field field:this.fields){					
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
					if (val != null) {
						String[] aux = val.split(SPLIT_SEQUENCE); // this symbol underscore ... will be the reserved										
						if (field instanceof FileField) {
							if(aux.length > 2) {//With temp file
								TempFile tempFile = TempFileHelper.getTempFile(aux[2]);
								if(tempFile!=null) {
									field.propertie().add(TEMP_VALUE, tempFile.getName());
								}else {
									field.propertie().remove(TEMP_VALUE);
								}
								this.genHiddenFieldFile(field, aux[2]);								
								this.genRowField(field, Core.getLinkTempFile(aux[2]),Core.gt(aux[1]));
							}else {
								this.genRowField(field, aux.length > 0 ? aux[0] : "", aux.length > 1 ? aux[1] : "");
							}
						}else {
							this.genRowField(field, aux.length > 0 ? aux[0] : "", aux.length > 1 ? aux[1] : "");
						}
					}
				}
				this.xml.endElement();
			}
		}else if(this.data==null || this.data.size() == 0 && this.startRow){
			this.xml.startElement("row");
			this.xml.writeAttribute("type", "start");
			for(Field field:this.fields){	
				String val = IgrpHelper.getValue(null, field.getName());
				this.genRowField(field,val,val);		
			}
			this.xml.endElement();
		}		
		if(!this.rows.equals(""))
			this.xml.addXml(this.rows);		
	}
	
	public void setStartRow(boolean isStartRow) {
		this.startRow = isStartRow;
	}
	
	@Override
	public void loadModel(List<?> modelList) {
		this.data = modelList;
	}
}
