package nosi.core.dao;

import java.sql.SQLException;

/**
 * @author Marcel Iekiny
 * Apr 18, 2017
 */
public interface RowDataGateway { // Encapsulate the CRUD operations for all DAO classes
	
	public boolean insert(); // C
	public Object getOne(); //  R
	public boolean update(); // U
	public boolean delete(); // D
	
	public Object[] getAll(); //
	
}
