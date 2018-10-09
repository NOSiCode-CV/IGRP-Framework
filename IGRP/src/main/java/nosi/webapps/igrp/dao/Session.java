package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.servlet.http.HttpServletRequest;

import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.Igrp;


@Entity
@Table(name="tbl_session")
public class Session extends BaseActiveRecord<Session> implements Serializable{
	  
	/**
	 * 
	 */
	private static final long serialVersionUID = 5383008060171825399L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String sessionId;
	private Long startTime;
	private Long endTime;
	private String ipAddress;
	private String userName;
	private String target;
	private int https; // boolean 0 or 1
	private String sessionOldId;
	private String host;
	private String hostName;
	private String mediaType;
	
	private String url;
	
	@ManyToOne
	@JoinColumn(name="user_fk",foreignKey=@ForeignKey(name="SESSION_USER_FK"))
	private User user;
	
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="env_fk",foreignKey=@ForeignKey(name="SESSION_ENV_FK"),nullable=false)
	private Application application;
	
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="prof_type_fk",foreignKey=@ForeignKey(name="SESSION_PROF_TYPE_FK"),nullable=false)
	private ProfileType profileType;
	
	@ManyToOne(cascade=CascadeType.REMOVE)
	@JoinColumn(name="org_fk",foreignKey=@ForeignKey(name="SESSION_ORGANIZATION_FK"),nullable=true)
	private Organization organization;

	public Session(){}
	
	public Session(String sessionId, Long startTime, Long endTime, String ipAddress, String userName,
			String target, int https, String sessionOldId, String host, String hostName, String mediaType, User user,
			Application application, ProfileType profileType, Organization organization) {
		super();
		this.sessionId = sessionId;
		this.startTime = startTime;
		this.endTime = endTime;
		this.ipAddress = ipAddress;
		this.userName = userName;
		this.target = target;
		this.https = https;
		this.sessionOldId = sessionOldId;
		this.host = host;
		this.hostName = hostName;
		this.mediaType = mediaType;
		this.user = user;
		this.application = application;
		this.profileType = profileType;
		this.organization = organization;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public Long getStartTime() {
		return startTime;
	}

	public void setStartTime(Long startTime) {
		this.startTime = startTime;
	}

	public Long getEndTime() {
		return endTime;
	}

	public void setEndTime(Long endTime) {
		this.endTime = endTime;
	}

	public String getIpAddress() {
		return ipAddress;
	}

	public void setIpAddress(String ipAddress) {
		this.ipAddress = ipAddress;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public int getHttps() {
		return https;
	}

	public void setHttps(int https) {
		this.https = https;
	}

	public String getSessionOldId() {
		return sessionOldId;
	}

	public void setSessionOldId(String sessionOldId) {
		this.sessionOldId = sessionOldId;
	}

	public String getHost() {
		return host;
	}

	public void setHost(String host) {
		this.host = host;
	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getMediaType() {
		return mediaType;
	}

	public void setMediaType(String mediaType) {
		this.mediaType = mediaType;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public ProfileType getProfileType() {
		return profileType;
	}

	public void setProfileType(ProfileType profileType) {
		this.profileType = profileType;
	}

	public Organization getOrganization() {
		return organization;
	}

	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	
	private String getClientIpAddr() {  // For HProxy server purpose ... 
		HttpServletRequest request = Igrp.getInstance().getRequest();
        String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }  
       
        return ip;  
	}

	public static boolean afterLogin(Profile profile) {
		Session currentSession = new Session();
		currentSession.setUser(new User().findOne(Igrp.getInstance().getUser().getIdentity().getIdentityId()));
		User user = ((User)Igrp.getInstance().getUser().getIdentity());
		
		currentSession.setOrganization(profile.getOrganization());
		currentSession.setProfileType(profile.getProfileType());
		try {
			currentSession.setApplication(new Application().findOne(user.getAplicacao().getId()));
		}catch(Exception e) {
			currentSession.setApplication(profile.getOrganization().getApplication());
			//e.printStackTrace();
		}
		
		currentSession.setIpAddress(currentSession.getClientIpAddr());
		currentSession.setSessionId(Igrp.getInstance().getRequest().getRequestedSessionId());
		currentSession.setUserName(user.getUser_name());
		currentSession.setHttps( Igrp.getInstance().getRequest().isSecure() ? 1 : 0);
		currentSession.setHost(Igrp.getInstance().getRequest().getRemoteHost());
		currentSession.setHostName(Igrp.getInstance().getRequest().getRemoteHost());
		currentSession.setSessionOldId(Igrp.getInstance().getRequest().getRequestedSessionId());
		currentSession.setMediaType("WEB");
		currentSession.setTarget("_blank");
		long time = System.currentTimeMillis();
		currentSession.setStartTime(time);
		currentSession.setEndTime(time + 30*60); // add 30 min. 
		currentSession.setUrl(Igrp.getInstance().getRequest().getRequestURL().toString());
		currentSession = currentSession.insert();
		return currentSession!=null;
	}

	public static boolean afterLogout(String currentSessionId) {
		Session session = new Session().find().andWhere("sessionId", "=", currentSessionId).one();
		if(session!=null){session.setEndTime(System.currentTimeMillis());}
		return session!=null && session.getApplication()!=null && session.update()!=null;
	}

	@Override
	public String toString() {
		return "Session [id=" + id + ", sessionId=" + sessionId + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", ipAddress=" + ipAddress + ", userName=" + userName + ", target=" + target + ", https=" + https
				+ ", sessionOldId=" + sessionOldId + ", host=" + host + ", hostName=" + hostName + ", mediaType="
				+ mediaType + ", url=" + url + ", user=" + user + ", application=" + application + ", profileType="
				+ profileType + ", organization=" + organization + "]";
	}
	
}