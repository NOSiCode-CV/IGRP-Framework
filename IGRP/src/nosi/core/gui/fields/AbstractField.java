package nosi.core.gui.fields;

public abstract class AbstractField implements Field{

	private String tag_name;
	private String name;
	private String type;
	private String max_length;
	private String required;
	private String change;
	private Object value="";
	private boolean visible = true;
	
	public String getTagName() {
		return tag_name;
	}
	public void setTagName(String tag_name) {
		this.tag_name = tag_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	protected String getType() {
		return type;
	}
	protected void setType(String type) {
		this.type = type;
	}
	public String getMax_length() {
		return max_length;
	}
	public void setMaxLength(String max_length) {
		this.max_length = max_length;
	}
	public String getRequired() {
		return required;
	}
	public void setRequired(String required) {
		this.required = required;
	}
	public String getChange() {
		return change;
	}
	public void setChange(String change) {
		this.change = change;
	}
	public Object getValue() {
		return value;
	}
	public void setValue(Object value) {
		this.value = value;
	}	

	public void setValue(Object name, Object value) {
	}	
	
	public void setValue(int value) {
		this.value = value;
	}	
	public void setValue(float value) {
		this.value = value;
	}
	public void setValue(double value) {
		this.value = value;
	}
	public void setVisible(boolean visible){
		this.visible = visible;
	}
	public boolean getVisible(){
		return this.visible;
	}
}
