package nosi.base.ActiveRecord;

import java.lang.reflect.Field;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

/**
 * Emanuel
 * 15 Jan 2019
 */
public class ResolveColumnNameQuery {

	private Class<?> className;
	
	
	public ResolveColumnNameQuery(Class<?> className) {
		super();
		this.className = className;
	}


	public String resolveColumnName(String alias,String columnName) {
		String before=""; 	
		if(columnName.contains("(")) {
			before=columnName.substring(0,columnName.indexOf("(")+1);
			columnName=columnName.substring(columnName.indexOf("(")+1,columnName.indexOf(")"));
		}
		columnName = this.resoveName(columnName);
		if(columnName.contains("."))
			return before+columnName+(before.equals("")?"":")");
		return before+alias+"."+columnName+(before.equals("")?"":")");
	}
	

	private String resoveName(String name) {
		if(this.isObjectRelation(this.className,name)) {
			return name+this.getForeignKeyName(this.className,name);
		}
		return name;
	}

	private boolean isObjectRelation(Class<?> className,String name) {
		int end = name.indexOf(".");
		name = end!=-1?name.substring(0,end):name;//get first name. action.application return the action
		for(Field f:className.getDeclaredFields()) {
			if((f.isAnnotationPresent(ManyToOne.class) || f.isAnnotationPresent(OneToOne.class) || f.isAnnotationPresent(OneToMany.class))&& f.getName().compareTo(name)==0) {
				return true;
			}
		}
		return false;
	}

	public String removeAlias(String columnName) {
		if(columnName.contains(".")) {
			return columnName.replace(".", "_");
		}
		return columnName;
	}
	
	//return the foreignKey relationship
	private String getForeignKeyName(Class<?> className,String relationName) {
		int start = relationName.indexOf(".");
		String firstName = start!=-1?relationName.substring(0,start):relationName; 
		String secondName = start!=-1?relationName.substring(start+1):relationName;
		if(relationName.contains("."))
			return getForeignKeyName(this.getClassTypeByField(className,firstName),secondName);
		
		for(Field f:className.getDeclaredFields()){
			if((f.isAnnotationPresent(ManyToOne.class) || f.isAnnotationPresent(OneToOne.class) || f.isAnnotationPresent(OneToMany.class))&& f.getName().compareTo(relationName)==0) {
				for(Field fFk:f.getType().getDeclaredFields()) {
					if(fFk.isAnnotationPresent(Id.class)) {
						return "."+fFk.getName();
					}
				}
			}
		}
		return "";//Defualt ID
	}
	
	private Class<?> getClassTypeByField(Class<?> className,String fieldName){
		for(Field f:className.getDeclaredFields()){
			if(f.getName().compareTo(fieldName)==0) {
				return f.getType();
			}
		}
		return className;
	}
}
