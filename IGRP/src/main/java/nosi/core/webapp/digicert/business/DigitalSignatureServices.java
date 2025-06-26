package nosi.core.webapp.digicert.business;

import java.util.UUID;

import jakarta.servlet.http.Part;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.digicert.Validation;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.DomXML;
import nosi.webapps.igrp.dao.CertificatedSignatures;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * frant 03/11/2022
 */
public class DigitalSignatureServices {

	private static final Logger log = LoggerFactory.getLogger(DigitalSignatureServices.class);

	public DigitalSignatureServices() {
	}

	public static String saveSignatureNGetUuid() throws Exception {
		String paramName = "p_fwl_signedresult";
		Part file = Igrp.getInstance().getRequest().getPart(paramName);
		if (file != null) {
			String xml = new FileHelper().convertToString(file);
			DomXML domXml = new DomXML(xml);
			SignedResult result = new SignedResult();
			
			result.setMime_type(domXml.getDocument().getElementsByTagName("content_type").item(0).getTextContent());
			result.setName(domXml.getDocument().getElementsByTagName("content_name").item(0).getTextContent());
			result.setSignerdata(domXml.getDocument().getElementsByTagName("signerdata").item(0).getTextContent());
			result.setSignerkey(domXml.getDocument().getElementsByTagName("signerkey").item(0).getTextContent());

			return saveSignature(result).getUuid().toString();
		}
		return null;
	}
	
	private static CertificatedSignatures saveSignature(SignedResult signed) {
		CertificatedSignatures s = new CertificatedSignatures();
		s.setName( signed.getName());
		s.setMime_type( signed.getMime_type());
		s.setData(signed.getSignerdata());
		s.setCertificate(signed.getSignerkey());
		s.insert();

		log.info("[uuid=] {}", s.getUuid().toString());

		return s;
	}

	public String verifySignatureByUuid(String uuid) {
		if (uuid != null) {
			CertificatedSignatures s = new CertificatedSignatures().find().where("uuid", "=", uuid).one();
			if (Core.isNotNullOrZero(s))
				return Validation.verifySignature(s.getData(), s.getDataHash(), s.getCertificate());
		}
		return null;
	}

	public CertificatedSignatures getSignedByUuid(String uuid) {
		if (Core.isNotNullOrZero(uuid)) {
			CertificatedSignatures cs = new CertificatedSignatures();
			return cs.find().where("uuid", "=", UUID.fromString(uuid)).one();
		}
		return null;
	}

}
