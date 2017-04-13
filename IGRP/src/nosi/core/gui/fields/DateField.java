package nosi.core.gui.fields;

public class DateField extends TextField {

	public DateField(String name) {
		super(name);
		this.propertie.put("type","date");
		this.propertie.put("format", "IGRP_datePicker");
		this.propertie.put("class", "default");
	}

}
