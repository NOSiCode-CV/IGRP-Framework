package nosi.webapps.igrp.pages.digitalsignature;

import nosi.core.webapp.Controller;//
import nosi.core.webapp.databse.helpers.ResultSet;//
import nosi.core.webapp.databse.helpers.QueryInterface;//
import java.io.IOException;//
import java.util.Base64;

import nosi.core.webapp.Core;//
import nosi.core.webapp.Igrp;
import nosi.core.webapp.Response;//
/* Start-Code-Block (import) */
/* End-Code-Block */
/*----#start-code(packages_import)----*/

import nosi.core.webapp.digicert.business.DigitalSignatureServices;
import nosi.core.webapp.helpers.Route;
import nosi.webapps.igrp.dao.CLob;
import nosi.webapps.igrp.dao.CertificatedSignatures;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/*----#end-code----*/

public class DigitalSignatureController extends Controller {
	public Response actionIndex() throws IOException, IllegalArgumentException, IllegalAccessException {
		DigitalSignature model = new DigitalSignature();
		model.load();
		DigitalSignatureView view = new DigitalSignatureView();
		/* Start-Code-Block (index) *//* End-Code-Block (index) */
		/*----#start-code(index)----*/

		/*----#end-code----*/
		view.setModel(model);
		return this.renderView(view);
	}
	/* Start-Code-Block (custom-actions) *//* End-Code-Block */
	/*----#start-code(custom_actions)----*/

	public Response actionSaveSignature() throws Exception {
		String xml = "<?xml version=\"1.0\" encoding=\"utf-8\"?>";

		xml = xml + "<signedUuid>" + DigitalSignatureServices.saveSignatureNGetUuid() + "</signedUuid>";

		log.info("[xml=]" + xml);

		return this.renderView(xml);
	}

	public Response actionDownloadCertificate() throws Exception {
		String uuid = Core.getParam("uuid");
		if (uuid != null) {
			DigitalSignatureServices ds = new DigitalSignatureServices();
			CertificatedSignatures cs = new CertificatedSignatures();

			cs = ds.getSignedByUuid(uuid);
			
			log.info("[Certificate=]"+cs.getCertificate());

			if (Core.isNotNullOrZero(cs))
				return this.xSend(Base64.getDecoder().decode(cs.getCertificate()), cs.getName(), cs.getMime_type(),
						false);
			else
				throw new Exception("Certificate not found.");
		} else
			throw new Exception("Certificate identifier not present.");

	}

	public Response actionDownloadData() throws Exception {
		String uuid = Core.getParam("uuid");
		if (uuid != null) {
			DigitalSignatureServices ds = new DigitalSignatureServices();
			CertificatedSignatures cs = new CertificatedSignatures();

			cs = ds.getSignedByUuid(uuid);

			if (Core.isNotNullOrZero(cs))
				return this.xSend(Base64.getDecoder().decode(cs.getData()),  cs.getName(), cs.getMime_type(), false);
			else
				throw new Exception("Page not found.");
		} else
			throw new Exception("Page identifier not present.");
	}

	

	private static Logger log = LogManager.getLogger(DigitalSignatureController.class);
	/*----#end-code----*/
}
