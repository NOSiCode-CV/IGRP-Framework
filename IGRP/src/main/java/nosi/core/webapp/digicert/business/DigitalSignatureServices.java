package nosi.core.webapp.digicert.business;

import java.io.IOException;

import javax.servlet.http.Part;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import nosi.core.webapp.Core;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.digicert.Validation;
import nosi.core.webapp.helpers.FileHelper;
import nosi.core.webapp.helpers.Route;
import nosi.core.xml.DomXML;
import nosi.webapps.igrp.dao.CertificatedSignatures;
import nosi.webapps.igrp_digisign.pages.signform.SignFormController.SignedResult;

/**
 * frant
 * 03/11/2022
 */
public class DigitalSignatureServices {
	//private CertSigners s;
	
	private static Logger log = LogManager.getLogger(DigitalSignatureServices.class);
	private static String paramName = "p_fwl_signedresult";
	
	public DigitalSignatureServices() {
		// TODO Auto-generated constructor stub
		//s = new CertSigners();
	}

	public static String saveSignatureNGetUuid() throws Exception {		
		Part file = Igrp.getInstance().getRequest().getPart(paramName);		
		if (file != null) {			
			String xml = FileHelper.convertToString(file);
			//log.info("[xml=]"+xml);
				
			DomXML domXml = new DomXML(xml);		
			
			SignedResult result = new SignedResult();
			
			result.setSignerdata(domXml.getDocument().getElementsByTagName("signerdata").item(0).getTextContent());
			result.setSignerkey(domXml.getDocument().getElementsByTagName("signerkey").item(0).getTextContent());
			
			CertificatedSignatures s = new CertificatedSignatures();
			
			s.setData(result.getSignerdata());
			s.setCertificate(result.getSignerkey());
			
			s.insert();
			
			log.info("[uuid=]"+s.getUuid().toString());
			return s.getUuid().toString();
		}else
			return null;
	}
	
	public String verifySignatureByUuid(String uuid) {
		if (uuid != null ) {
			CertificatedSignatures s = new CertificatedSignatures().find().where("uuid", "=", uuid).one();
			
			if(Core.isNotNullOrZero(s))
				return Validation.verifySignature(s.getData(), s.getDataHash(), s.getCertificate());
			else
				return null;
		}else			
			return null;
	}
	
	public String getLinkFileSingnedByUuid(String uuid) {
		if (uuid != null ) {
			CertificatedSignatures s = new CertificatedSignatures().find().where("uuid", "=", uuid).one();
			
			if(Core.isNotNullOrZero(s))
				return Core.getLinkFileByUuid(s.getFileId());
			else
				return null;
		}else			
			return null;
	}
	
	public static String getLinkSignedDataByUuid(String uuid) {
		if (Core.isNull(uuid))
			return "";
		if (uuid.startsWith("webapps"))
			return uuid;
		if (Igrp.getInstance().getUser() != null && Igrp.getInstance().getUser().isAuthenticated()) {
			return Route.getResolveUrl("igrp", "File", "get-file&uuid=" + uuid);
		} else
			return Route.getResolveUrl("igrp", "File", "getPublicFile&uuid=" + uuid);

	}

	public CertificatedSignatures getSignedByUuid(String uuid) {
		// TODO Auto-generated method stub
		
		if(Core.isNotNullOrZero(uuid)) {
			CertificatedSignatures cs = new CertificatedSignatures();
			cs.findOne(uuid);
			
			return cs;
		}else
			return null;
	}

}
