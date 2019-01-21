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
		columnName = this.resoveName(columnName);
		if(columnName.contains("."))
			return columnName;
		return alias+"."+columnName;
	}
	

	private String resoveName(String name) {
		if(this.isObjectRelation(name)) {
			return name+"."+this.getForeignKeyName(name);
		}
		return name;
	}

	private boolean isObjectRelation(String name) {
		name = name.substring(name.indexOf(".")+1);//get last name. action.application return the application
		for(Field f:this.className.getDeclaredFields()) {
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
	public String getForeignKeyName(String relationName) {
		for(Field f:this.className.getDeclaredFields()){
			if((f.isAnnotationPresent(ManyToOne.class) || f.isAnnotationPresent(OneToOne.class) || f.isAnnotationPresent(OneToMany.class))&& f.getName().compareTo(relationName)==0) {
				for(Field fFk:f.getType().getDeclaredFields()) {
					if(fFk.isAnnotationPresent(Id.class)) {
						return fFk.getName();
					}
				}
			}
		}
		return "id";//Defualt ID
	}
}
