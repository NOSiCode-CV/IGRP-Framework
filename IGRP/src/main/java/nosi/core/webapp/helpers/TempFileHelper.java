package nosi.core.webapp.helpers;

import nosi.core.webapp.Core;
import nosi.core.webapp.uploadfile.UploadFile;
import nosi.webapps.igrp.dao.TempFile;

/**
 * joao.augoncalves 15/07/2019
 */
public class TempFileHelper {
	
	public static String saveTempFile(UploadFile uploadFile) {
		if(Core.isNotNull(uploadFile)) {			
			TempFile tempFile = new TempFile();
			boolean updated = Core.isNotNull(uploadFile.getId()) && !uploadFile.getId().equals("-1");
			if(updated) {
				tempFile = tempFile.findOne(uploadFile.getId());
			}
			tempFile.setMime_type(uploadFile.getContentType());
			tempFile.setContent(uploadFile.getBytes());
			tempFile.setName(uploadFile.getSubmittedFileName());
			tempFile.setSize(uploadFile.getSize());
			tempFile.setDate_created(Core.getCurrentDateUtil());
			if(updated) {
				tempFile.update();
			}else {
				tempFile.setUuid(Core.getUUID());
				tempFile = tempFile.insert();
			}
			return tempFile!=null?tempFile.getUuid():null;
		}
		return null;
	}

	public static void deleteTempFile(String id) {
		TempFile tempFile = new TempFile().findOne(id);
		if(tempFile!=null) {
			tempFile.delete();
		}
	}
	

	public static TempFile getTempFile(String p_uuid) {
		if(Core.isNotNull(p_uuid)) {
			return new TempFile().findOne(p_uuid);
		}
		return null;
	}
	
}