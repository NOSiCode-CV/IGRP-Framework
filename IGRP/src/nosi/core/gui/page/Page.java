package nosi.core.gui.page;

import java.util.ArrayList;

import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.FieldXML;

public class Page {

	private ArrayList<Field> fields;
	
	public Page(){
		this.fields = new ArrayList<>();
	}
	
	public void addField(Field field){
		this.fields.add(field);
	}
	
	public ArrayList<Field> getFields(){
		return this.fields;
	}
	
	public void displayForm(){
		System.out.println(FieldXML.toString(this.fields));
		
	}
}

