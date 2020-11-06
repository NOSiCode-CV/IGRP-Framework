package nosi.core.webapp.activit.rest.entities;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Emanuel
 * 18 Jan 2018
 */
public class CustomVariableIGRP implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<Rows> rows;

	public CustomVariableIGRP() {
		this.rows = new ArrayList<>();
	}
    public List<Rows> getRows (){
        return rows;
    }

    public void setRows (List<Rows> rows){
        this.rows = rows;
    }

    public void add(Rows row) {
    	this.rows.add(row);
    }
    
    @Override
    public String toString()
    {
        return "CustomVariableIGRP [rows = "+rows+"]";
    }
}
