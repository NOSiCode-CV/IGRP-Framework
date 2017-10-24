package nosi.core.webapp;
/**
 * @author: Emanuel Pereira
 * 18 Oct 2017
 */

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import nosi.core.config.Config;
import nosi.core.config.Connection;

public class DBQuery{

	private boolean isError;
	private String error;
	private ResultSetMetaData metadata;
	private ResultSet resultSet;
	private PreparedStatement ps;
	
	public ResultSetMetaData getMetadata() {
		return metadata;
	}
	public void setResultSet(ResultSet resultSet, PreparedStatement ps) {
		this.resultSet = resultSet;
		this.ps = ps;
	}
	public void setMetadata(ResultSetMetaData metadata) {
		this.metadata = metadata;
	}
	public ResultSet getResultSet() {
		return resultSet;
	}
	public boolean isError() {
		return isError;
	}
	public void setError(boolean isError) {
		this.isError = isError;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	
	public List<String> getColumns(){
		List<String> column = new ArrayList<>();
		if(this.getMetadata()!=null){
			try {
				for(int j=1;j<=this.getMetadata().getColumnCount();j++){
					column.add(this.getMetadata().getColumnName(j));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return column;
	}
	
	public void close(){
		try {
			if(this.getResultSet()!=null && !this.getResultSet().isClosed()){
				this.ps.close();
				this.getResultSet().close();
			}
		} catch (SQLException e) {
		}
	}
	

	public DBQuery query(String connectionName,String sql){
		DBQuery q = new DBQuery();
		java.sql.Connection conn = Connection.getConnection(connectionName);
		try {
			java.sql.PreparedStatement ps = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE);
			ResultSet rs = ps.executeQuery();
			q.setResultSet(rs,ps);
			q.setMetadata(rs.getMetaData());
		} catch (SQLException e) {
			q.setError(e.getMessage());
			q.setError(true);
			q.close();
		}
		return q; 
	}
	
	public DBQuery query(String sql){
		return this.query(Config.getBaseConnection(), sql);
	}
}
