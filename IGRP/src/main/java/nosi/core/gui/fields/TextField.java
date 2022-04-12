package nosi.core.gui.fields;

/**
 * @author: Emanuel Pereira
 * <p>
 * Apr 13, 2017
 * <p>
 * Description: class to configure text field
 */
public class TextField extends AbstractField {

    public TextField(Object model, String name) {
        super();
        this.propertie.put("type", "text");
        this.setName(name);
        this.setTagName(name);
        this.propertie.put("name", "p_" + name);
        this.propertie.put("right", Boolean.FALSE);
        this.propertie.put("placeholder", "");
        this.propertie.put("disabled", Boolean.FALSE);
        this.propertie.put("readonly", Boolean.FALSE);
        this.propertie.put("change", Boolean.FALSE);
        this.propertie.put("required", Boolean.FALSE);
        this.propertie.put("maxlength", 30);
        this.setValue(model);
    }

}
