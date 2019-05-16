package nosi.core.webapp.activit.rest.helpers;

import java.util.HashMap;
import java.util.Map;

import nosi.core.webapp.Core;

/**
 * Emanuel 15 May 2019
 */
public class StatusTask {

	public static String getStatusTask(String endTime, String assigne) {
		if (Core.isNotNull(endTime))
			return "Terminado";
		if (Core.isNotNull(assigne))
			return "Não Iniciado";
		return "Não Atribuido";
	}

	public static int getStatusTaskValue(String endTime, String assigne) {
		if (Core.isNotNull(endTime))
			return 1;// Terminado
		if (Core.isNotNull(assigne))
			return 3;// Não iniciado
		return 2;// "Não Atribuido"
	}

	public static Map<String, String> getStatus() {
		Map<String, String> status = new HashMap<String, String>();
		status.put(null, "--- Selecionar Estado ---");
		status.put("false", "Ativo");
		status.put("true", "Terminado");
		return status;
	}
}
