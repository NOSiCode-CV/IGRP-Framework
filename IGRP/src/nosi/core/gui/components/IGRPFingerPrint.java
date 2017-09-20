package nosi.core.gui.components;
/**
 * @author: Emanuel Pereira
 * 
 * Apr 17, 2017
 *
 * Description: class to generate xml of filter
 * 
 / * 
   <fingerprint_1 type="fingerprint" xml-type="fingerprint" title="Fingerprint" gen-type="container" gen-group="">
        <fields>
            <fp_link>
                <label>link</label>
                <value/>
            </fp_link>
            ...
        </fields>
   </fingerprint_1>
 */

public class IGRPFingerPrint extends IGRPForm {

	public IGRPFingerPrint(String tag_name,String title) {
		super(tag_name,title);
		this.properties.put("type", "fingerprint");
	}
	public IGRPFingerPrint(String tag_name) {
		this(tag_name,"");
	}
}
