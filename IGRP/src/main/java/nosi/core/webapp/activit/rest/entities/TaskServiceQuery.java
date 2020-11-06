package nosi.core.webapp.activit.rest.entities;

/**
 * Emanuel
 * 10 Jan 2018
 */
public class TaskServiceQuery extends TaskService  implements java.io.Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String startTime;
	private String endTime;
	private String claimTime;
	
	
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getClaimTime() {
		return claimTime;
	}
	public void setClaimTime(String claimTime) {
		this.claimTime = claimTime;
	}
	
	@Override
	public String toString() {
		return "TaskServiceQuery [startTime=" + startTime + ", endTime=" + endTime + ", claimTime=" + claimTime + "]";
	}
	
}
