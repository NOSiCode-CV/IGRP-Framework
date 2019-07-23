package nosi.core.webapp.helpers;

import java.io.IOException;
import java.util.Arrays;
import java.util.Optional;
import java.util.UUID;

import javax.servlet.http.Part;

import nosi.core.gui.components.IGRPSeparatorList.Pair;
import nosi.core.webapp.Core;
import nosi.webapps.igrp.dao.TempFile;

/**
 * joao.augoncalves 15/07/2019
 */
public class TempFileHelper {

	TempFile tempFile;

	public TempFileHelper() {
		tempFile = new TempFile();
	}

	public TempFileHelper(Part file) {
		if (file != null)
			this.createTempFiles(file);
	}

	public TempFileHelper(String url) {

	}

	public TempFile getTempFile() {
		return this.tempFile;
	}

	public void setTempFile(TempFile tempFiles) {
		this.tempFile = tempFiles;
	}

	private void createTempFiles(Part file) {
		if (file == null) {
			tempFile = null;
			return;
		}
		tempFile = new TempFile();
		tempFile.setUuid(UUID.randomUUID().toString());
		tempFile.setName(file.getSubmittedFileName());
		tempFile.setMime_type(file.getContentType());
		try {
			tempFile.setContent(FileHelper.convertInputStreamToByte(file.getInputStream()));
		} catch (IOException e) {
			tempFile = null;
			e.printStackTrace();
		}
	}

	public boolean removeTempFile() {
		if(this.tempFile.delete()) {
			this.tempFile = null;
			return true;
		}
		return false;
	}
	
	public boolean removeTempFile(String uuid) {
		return new TempFile().delete(uuid);
	}

	public String getUuidFromLink(String url) {
		Optional<String> uuidOptional = Arrays.stream(url.split("&")).filter(e -> e.startsWith("p_uuid=")).findFirst();
		return uuidOptional.isPresent()? uuidOptional.get().split("=")[1]:"";
	}
	
	public int saveOrUpdateFile(Pair separatorlist_id, Pair separatorlist_file, Pair separatorlist_igrp_id) {
		//Se se deseja salvar um arquivo novo(sem ter sido feito um forward)
		if(Core.isNotNullMultiple(separatorlist_file,separatorlist_file.getFile())) {
			//Se tem um separator_id então substituir o ficheiro
			if(Core.isNotNullMultiple(separatorlist_id, separatorlist_id.getKey())) {
				Integer igrp_id = Integer.valueOf(separatorlist_igrp_id.getKey());
				if(Core.updateFile(separatorlist_file.getFile(), separatorlist_file.getFile().getSubmittedFileName(),igrp_id))
					return igrp_id;
				Core.setMessageError("Não foi possível guardar o ficheiro " + separatorlist_file.getFile().getSubmittedFileName());
				return 0;
			}
			//senao inserir um novo
			return Core.saveFile(separatorlist_file.getFile());
		}
		//Se o arquivo já se encontrava na página após um forward
		//Capturar o uuid do link do ficheiro
		String uuid = new TempFileHelper().getUuidFromLink(separatorlist_file.getKey());
		//Se o uuid existe é porque este já tinha sido previamente salvo na tabela tbl_temp_files
		if(Core.isNotNull(uuid)) {
			TempFile tempFile = new TempFile().findOne(uuid);
			if(tempFile!=null) {
				int igrp_id = Core.saveFile(tempFile.getContent(), tempFile.getName(), tempFile.getMime_type());
				tempFile.delete();
				tempFile = null;
				return igrp_id;
			}
		}
		//Senão vamos ver o que fazer...
		Core.setMessageInfo("sep.getSeparatorlist_file_1().getKey() : " + separatorlist_file.getKey());
		Core.setMessageInfo("sep.getSeparatorlist_file_1().getValue() : " + separatorlist_file.getValue());
		return 0;
	}
	
}