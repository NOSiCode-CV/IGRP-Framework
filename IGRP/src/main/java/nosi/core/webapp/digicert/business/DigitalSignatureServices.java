package nosi.core.webapp.digicert.business;

import java.io.IOException;
import java.util.UUID;

import jakarta.servlet.http.Part;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.digicert.Validation;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.xml.DomXML;
import nosi.webapps.igrp.dao.CertificatedSignatures;

/**
 * frant 03/11/2022
 */
public class DigitalSignatureServices {
	// private CertSigners s;

	private static Logger log = LogManager.getLogger(DigitalSignatureServices.class);
	private static String paramName = "p_fwl_signedresult";

	public DigitalSignatureServices() {
		// TODO Auto-generated constructor stub
		// s = new CertSigners();
	}

	public static String saveSignatureNGetUuid() throws Exception {
		Part file = Igrp.getInstance().getRequest().getPart(paramName);
		if (file != null) {
			String xml = FileHelper.convertToString(file);
			// log.info("[Content-type=]" + file.getContentType());
			// log.info("[Name=]" + file.getName());
			// log.info("[xml=]"+xml);

			DomXML domXml = new DomXML(xml);

			SignedResult result = new SignedResult();
			
			result.setMime_type(domXml.getDocument().getElementsByTagName("content_type").item(0).getTextContent());
			result.setName(domXml.getDocument().getElementsByTagName("content_name").item(0).getTextContent());
			result.setSignerdata(domXml.getDocument().getElementsByTagName("signerdata").item(0).getTextContent());
			result.setSignerkey(domXml.getDocument().getElementsByTagName("signerkey").item(0).getTextContent());

			
			return saveSignature(result).getUuid().toString();
		} else
			return null;
	}
	
	private static CertificatedSignatures saveSignature(SignedResult signed) {
		CertificatedSignatures s = new CertificatedSignatures();
		
		s.setName( signed.getName());
		s.setMime_type( signed.getMime_type());
		s.setData(signed.getSignerdata());
		s.setCertificate(signed.getSignerkey());

		s.insert();

		log.info("[uuid=]" + s.getUuid().toString());
		
		
		return s;
	}

	public String verifySignatureByUuid(String uuid) {
		if (uuid != null) {
			CertificatedSignatures s = new CertificatedSignatures().find().where("uuid", "=", uuid).one();

			if (Core.isNotNullOrZero(s))
				return Validation.verifySignature(s.getData(), s.getDataHash(), s.getCertificate());
			else
				return null;
		} else
			return null;
	}

	public CertificatedSignatures getSignedByUuid(String uuid) {
		// TODO Auto-generated method stub

		if (Core.isNotNullOrZero(uuid)) {
			CertificatedSignatures cs = new CertificatedSignatures();

			return cs.find().where("uuid", "=", UUID.fromString(uuid)).one();

		} else
			return null;
	}

}
