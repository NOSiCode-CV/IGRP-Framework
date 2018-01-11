package nosi.core.gui.fields;

public class FieldProperties extends java.util.Properties{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 4345505209271900756L;

	public FieldProperties() {
		super();
	}	
	
	public FieldProperties add(Object key,Object value){
		this.put(key, value);
		return this;
	}
}
