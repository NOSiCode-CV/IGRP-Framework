package nosi.webapps.igrp.dao;

import javax.persistence.*;

import nosi.core.webapp.Core;

import java.io.Serializable;
import java.math.BigInteger;

/**
 * @author: Emanuel Pereira
 * 29 Jun 2017
 */

@Entity
@Table(name = "tbl_transaction")
public class Transaction extends IGRPBaseActiveRecord<Transaction> implements Serializable {

    private static final long serialVersionUID = 2765636370127502462L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(nullable = false)
    private String code;
    @Column(nullable = false)
    private String descr;
    private int status;
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "env_fk", foreignKey = @ForeignKey(name = "TRANSACTION_SOURCE_ENV_FK"), nullable = false)
    private Application application;
    @Transient
    private boolean isInserted;

    private Integer external; // null|0 -> default; 1 -> Transaction from GlobalAcl

    public Transaction() {
    }

    public Transaction(String code, String descr, int status, Application application) {
        super();
        this.code = code;
        this.descr = descr;
        this.status = status;
        this.application = application;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescr() {
        return descr;
    }

    public void setDescr(String descr) {
        this.descr = descr;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Application getApplication() {
        return application;
    }

    public void setApplication(Application application) {
        this.application = application;
    }

    public boolean isInserted() {
        return isInserted;
    }

    public void setInserted(boolean isInserted) {
        this.isInserted = isInserted;
    }

    public Integer getExternal() {
        return external;
    }

    public void setExternal(Integer external) {
        this.external = external;
    }

    public boolean getPermission(String transaction) {
        final String sqlByProfile = "SELECT count(T.id) as total FROM tbl_transaction T,tbl_profile P"
                + "	WHERE (T.id = P.type_fk"
                + " AND T.code=:code"
                + " AND T.status=1"
                + "	AND P.type=:type"
                + " AND P.prof_type_fk=:prof_type_fk"
                + " AND P.org_fk=:org_fk) "
                + " OR (T.id = P.type_fk "
                + "	AND P.type=:type_user"
                + " AND P.user_fk=:user_fk"
                + " AND T.code=:code"
                + " AND T.status=1"
                + " AND P.prof_type_fk=:prof_type_fk"
                + " AND P.org_fk=:org_fk"
                + " )";

        final Integer currentProfile = Core.getCurrentProfile();
        final Integer currentOrganization = Core.getCurrentOrganization();
        final User currentUser = Core.getCurrentUser();

        return Core.query(this.getConnectionName(), sqlByProfile)
                .addString("type", "TRANS")
                .addInt("prof_type_fk", currentProfile)
                .addInt("org_fk", currentOrganization)
                .addString("code", transaction)
                .addString("type_user", "TRANS_USER")
                .addInt("user_fk", (null != currentUser ? currentUser.getId() : -1))
                .addString("code", transaction)
                .addInt("prof_type_fk", currentProfile)
                .addInt("org_fk", currentOrganization)
                .getSingleResult().get("total", BigInteger.class).longValue() > 0;
    }
}