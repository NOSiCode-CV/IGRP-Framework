package nosi.core.config;

public enum IgrpAuthType {

    IGRP_AUTHENTICATION_TYPE_DATABASE("db"),
    IGRP_AUTHENTICATION_TYPE_LDAP("ldap"),
    IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID("oauth2-openid");

    private final String value;

    IgrpAuthType(String value) {
        this.value = value;
    }

    public String value() {
        return value;
    }
}
