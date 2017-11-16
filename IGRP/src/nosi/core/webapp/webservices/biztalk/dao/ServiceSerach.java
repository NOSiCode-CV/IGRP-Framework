package nosi.core.webapp.webservices.biztalk.dao;

import java.util.List;

/**
 * @author: Emanuel Pereira
 * 15 Nov 2017
 */
public interface ServiceSerach {

	public List<?> getRowList();
	public String getClientID();
	public String getTransactionID();
	public String getServiceID();
}
