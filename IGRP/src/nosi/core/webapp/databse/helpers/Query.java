package nosi.core.webapp.databse.helpers;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.persistence.EntityManager;
import nosi.base.ActiveRecord.PersistenceUtils;
import nosi.core.config.Connection;

/**
 * Emanuel
 * 14 Dec 2017
 */
public class Query {

	public static List<?> queryToList(String connectionName,String sql){
		EntityManager em = PersistenceUtils.getSessionFactory(connectionName).createEntityManager();
		javax.persistence.Query q = em.createQuery(sql);
		List<?> list =  q.getResultList();
		em.close();
		return list;
	}
	
	public static List<Map<String,Object>> query(String connectionName,String sql){
		List<Map<String,Object>> list = new ArrayList<>();
		java.sql.Connection con = Connection.getConnection(connectionName);
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
		    rs = st.executeQuery();
		    ResultSetMetaData metaData = rs.getMetaData();
		    int columnsCount = metaData.getColumnCount();
		    while(rs.next()) {
		    	Map<String,Object> data = new HashMap<>();
			    for(int i=1;i<=columnsCount;i++) {
			    	data.put(metaData.getColumnName(i).toLowerCase(), rs.getObject(i));
			    }
			    list.add(data);
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		    try {
		    	if(st!=null)
		    		st.close();
		    	if(rs!=null)
		    		rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public static Map<Object,Object> queryToComboBox(String connectionName,String sql){
		Map<Object,Object> comboBox = new HashMap<>();
		java.sql.Connection con = Connection.getConnection(connectionName);
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			st = con.prepareStatement(sql);
		    rs = st.executeQuery();
		    while(rs.next()) {
		    	comboBox.put(rs.getObject(1), rs.getObject(2));
		    }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
		    try {
		    	if(st!=null)
		    		st.close();
		    	if(rs!=null)
		    		rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return comboBox;
	}

	public static Map<String, Object> queryOne(String connectionName, String sql) {
		List<Map<String, Object>> list = query(connectionName, sql);
		if(list!=null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
}
