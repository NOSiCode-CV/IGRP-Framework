package nosi.core.gui.page;

import java.util.ArrayList;

import nosi.core.gui.fields.Field;

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
		if(this.fields.size() > 0){
			for (Field field:this.fields) {
				if(field.getVisible()){
					System.out.print(field.getName()+" : ");
					System.out.println(field.getValue());
				}
			}
		}
	}
}

