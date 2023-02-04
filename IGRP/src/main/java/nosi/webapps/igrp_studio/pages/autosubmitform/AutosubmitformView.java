package nosi.webapps.igrp_studio.pages.autosubmitform;

import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Model;
import nosi.core.webapp.View;

import java.util.Map;

import nosi.core.gui.components.*;
import nosi.core.gui.fields.Field;
import nosi.core.gui.fields.HiddenField;

public class AutosubmitformView extends View {

	public IGRPForm form_1;

	public AutosubmitformView() {

		this.setPageTitle("AutoSubmitForm");

		form_1 = new IGRPForm("form_1", "");

	}

	@Override
	public void render() {

		this.addToPage(form_1);
	}

	@Override
	public void setModel(Model model) {

	}

	public void createHiddenFields(final Map<String, String> hiddenFields) {
		hiddenFields.forEach((k, v) -> {
			Field posturl = new HiddenField(k);
			posturl.propertie().add("name", String.format("p_%s", k)).add("type", "hidden").add("maxlength", "250")
					.add("java-type", "").add("tooltip", "false").add("disable_copy_paste", "false")
					.add("tag", k);
			posturl.setValue(v);
			form_1.addField(posturl);
		});
		String warName = Core.getDeployedWarName();
		this.getPage().setLinkXsl(String.format("/%s/images/IGRP/IGRP2.3/app/igrp_studio/autosubmitform/Autosubmitform.xsl", warName));
	}
}
