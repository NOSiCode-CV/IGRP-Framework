package nosi.webapps.igrp.dao;
/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */
import java.io.Serializable;
import java.util.List;
import java.util.Objects;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.FetchType;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Query;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import nosi.base.ActiveRecord.BaseActiveRecord;
import nosi.core.webapp.Igrp;
import nosi.core.webapp.helpers.Permission;


@Entity
@Table(name="tbl_profile",uniqueConstraints={
	    @UniqueConstraint(name="PROFILE_UNIQUE_FK",columnNames = {"type", "type_fk","user_fk","org_fk","prof_type_fk"})
	})
public class Profile extends BaseActiveRecord<Profile> implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -3033627274691354839L;
	/**
	 * 
	 */
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Column(nullable=false)
	private Integer type_fk;
	@Column(nullable=false)
	private String type;
	@ManyToOne(cascade=CascadeType.REMOVE,fetch = FetchType.EAGER)
	@JoinColumn(name="prof_type_fk",foreignKey=@ForeignKey(name="PROFILE_PROF_TYPE_FK"),nullable=false)
	private ProfileType profileType;
	@ManyToOne(cascade=CascadeType.REMOVE,fetch = FetchType.EAGER)
	@JoinColumn(name="user_fk",foreignKey=@ForeignKey(name="PROFILE_USER_FK"),nullable=false)
	private User user;
	@ManyToOne(cascade=CascadeType.REMOVE,fetch = FetchType.EAGER)
	@JoinColumn(name="org_fk",foreignKey=@ForeignKey(name="PROFILE_ORGANIZATION_FK"),nullable=false)
	private Organization organization;
	
	@Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Profile that = (Profile) o;
        return Objects.equals(this.user, that.getUser()) && Objects.equals(this.organization, that.getOrganization()) && Objects.equals(this.profileType, that.getProfileType()) && Objects.equals(this.type, that.getType()) && Objects.equals(this.type_fk, that.getType_fk());
    }

    @Override
    public int hashCode() {
        return Objects.hash(this.user,this.organization,this.profileType,this.type,this.type_fk);
    }
    
	public Profile(){}
	
	public Profile(Integer type_fk, String type, ProfileType profileType, User user, Organization organization) {
		super();
		this.type_fk = type_fk;
		this.type = type;
		this.profileType = profileType;
		this.user = user;
		this.organization = organization;
	}
	
	public Integer getType_fk() {
		return type_fk;
	}
	public void setType_fk(Integer type_fk) {
		this.type_fk = type_fk;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ProfileType getProfileType() {
		return profileType;
	}
	public void setProfileType(ProfileType profileType) {
		this.profileType = profileType;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Organization getOrganization() {
		return organization;
	}
	public void setOrganization(Organization organization) {
		this.organization = organization;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Profile getByUserPerfil(int id_user, int id_app) {
		return this.findOne(this.getCriteria().where(
				this.getBuilder().equal(this.getRoot().get("type"), "PROF"),
				this.getBuilder().equal(this.getRoot().get("user"), id_user),
				this.getBuilder().equal(this.getRoot().join("profileType").get("application"), id_app)
		));
	}

	public Profile getByUser(Integer id) {
		return this.findOne(this.getCriteria().where(
					this.getBuilder().equal(this.getRoot().get("type"), "PROF"),
					this.getBuilder().equal(this.getRoot().get("user"),id)
				));
	}
	
	public List<Profile> getMyPerfile() {
		List<Profile> list = this.findAll(this.getCriteria().where(
					this.getBuilder().equal(this.getRoot().get("type"), "PROF"),
					this.getBuilder().equal(this.getRoot().get("user"),Igrp.getInstance().getUser().getIdentity().getIdentityId()),
					this.getBuilder().equal(this.getRoot().join("profileType").join("application").get("dad"),Permission.getCurrentEnv())
				));
		return list;
	}

	public boolean isInsertedPerfMen() {
		Profile p = new Profile();
		p = p.findOne(p.getCriteria().where(
					p.getBuilder().equal(p.getRoot().get("type"), "MEN"),
					p.getBuilder().equal(p.getRoot().get("type_fk"), this.getType_fk()),
					p.getBuilder().equal(p.getRoot().get("organization"), this.getOrganization()!=null?this.getOrganization().getId():1),
					p.getBuilder().equal(p.getRoot().get("profileType"),this.getProfileType().getId())
				));
		return p!=null && p.getProfileType()!=null;
	}

	public boolean isInsertedOrgMen() {
		Profile p = new Profile();
		p = p.findOne(p.getCriteria().where(
					p.getBuilder().equal(p.getRoot().get("type"), "MEN"),
					p.getBuilder().equal(p.getRoot().get("type_fk"), this.getType_fk()),
					p.getBuilder().equal(p.getRoot().get("organization"), this.getOrganization().getId())
				));
		return p!=null && p.getOrganization()!=null;
	}

	public void deleteAllProfile() {
		EntityManager em = this.getEntityManagerFactory().createEntityManager();
		EntityTransaction t =  em.getTransaction();
		t.begin();
		Query q = em.createNativeQuery("DELETE FROM tbl_profile where "
				+ "prof_type_fk = ? "
				+ "and user_fk =? "
				+ "and type =? "
				+ "and org_fk =?");
		q.setParameter(1, this.getProfileType().getId());
		q.setParameter(2, this.getUser().getId());
		q.setParameter(3, this.type  );
		q.setParameter(4, this.getOrganization().getId());
		q.executeUpdate();
		t.commit();
		em.close();
	}

	public boolean isInsertedOrgTrans() {
		Profile p = new Profile();
		p = p.findOne(p.getCriteria().where(
					p.getBuilder().equal(p.getRoot().get("type"), "TRANS"),
					p.getBuilder().equal(p.getRoot().get("type_fk"), this.getType_fk()),
					p.getBuilder().equal(p.getRoot().get("organization"), this.getOrganization().getId())
				));
		return p!=null && p.getOrganization()!=null;
	}

	public boolean isInsertedPerfTrans() {
		Profile p = new Profile();
		p = p.findOne(p.getCriteria().where(
					p.getBuilder().equal(p.getRoot().get("type"), "TRANS"),
					p.getBuilder().equal(p.getRoot().get("type_fk"), this.getType_fk()),
					p.getBuilder().equal(p.getRoot().get("organization"), this.getOrganization()!=null?this.getOrganization().getId():1),
					p.getBuilder().equal(p.getRoot().get("profileType"),this.getProfileType().getId())
				));
		return p!=null && p.getProfileType()!=null;
	}
}
