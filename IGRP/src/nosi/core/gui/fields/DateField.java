package nosi.core.gui.fields;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 13, 2017
 *
 * Description: class to configure date field
 */
public class DateField extends TextField {

	public DateField(String name) {
		super(name);
		this.propertie.put("type","date");
		this.propertie.put("format", "IGRP_datePicker");
		this.propertie.put("class", "default");
	}

}
