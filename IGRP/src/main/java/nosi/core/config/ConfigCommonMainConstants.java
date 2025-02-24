package nosi.core.config;

import java.util.Arrays;
import java.util.List;
import java.util.Properties;

/**
 * Iekiny Marcel
 * Sep 10, 2020
 */
public enum ConfigCommonMainConstants {

    // IGRP_ENV_VARIABLE_SCAN is a variable used to activate environment variable scanning, possible values: true or false. If not specified igrp will assume is false

    IGRP_ENV_DEV("dev", "dev"),
    IGRP_ENV_TEST("test", "test"),
    IGRP_ENV_STA("sta", "sta"),
    IGRP_ENV_PROD("prod", "prod"),

    IGRP_AUTHENTICATION_TYPE_DATABASE("db", "db"),
    IGRP_AUTHENTICATION_TYPE_LDAP("ldap", "ldap"),
    IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID("oauth2-openid", "oauth2-openid"),

    IGRP_ENV("igrp.env", System.getenv("IGRP_ENV")),

    IGRP_WORKSPACE("igrp.workspace", System.getenv("IGRP_WORKSPACE")),

    IGRP_AUTHENTICATION_TYPE("igrp.authentication_type", System.getenv("IGRP_AUTHENTICATION_TYPE")),

    IGRP_PASSWORD_RECOVERY("igrp.pwdRecover", System.getenv("IGRP_PASSWORD_RECOVERY")),

    IGRP_AUTHENTICATION_GOVCV_ENABLED("igrp.authentication.govcv.enbaled", System.getenv("IGRP_AUTHENTICATION_GOVCV_ENABLED")),

    IDS_AUTENTIKA_ENABLED("ids.autentika.enabled", System.getenv("IDS_AUTENTIKA_ENABLED")),
    IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL("ids.autentika.RemoteUserStoreManagerService-wsdl-url", System.getenv("IDS_AUTENTIKA_REMOTE_USER_STORE_MANAGER_SERVICE_WSDL_URL")),
    IDS_AUTENTIKA_ADMIN_USN("ids.autentika.admin-usn", System.getenv("IDS_AUTENTIKA_ADMIN_USN")),
    IDS_AUTENTIKA_ADMIN_PWD("ids.autentika.admin-pwd", System.getenv("IDS_AUTENTIKA_ADMIN_PWD")),
    IDS_OAUTH2_OPENID_CLIENT_ID("ids.oauth2-openid.client_id", System.getenv("IDS_OAUTH2_OPENID_CLIENT_ID")),
    IDS_OAUTH2_OPENID_CLIENT_SECRET("ids.oauth2-openid.client_secret", System.getenv("IDS_OAUTH2_OPENID_CLIENT_SECRET")),
    IDS_OAUTH2_OPENID_ENDPOINT_TOKEN("ids.oauth2-openid.endpoint.token", System.getenv("IDS_OAUTH2_OPENID_ENDPOINT_TOKEN")),
    IDS_OAUTH2_OPENID_ENDPOINT_USER("ids.oauth2-openid.endpoint.user", System.getenv("IDS_OAUTH2_OPENID_ENDPOINT_USER")),
    IDS_OAUTH2_OPENID_ENDPOINT_AUTHORIZE("ids.oauth2-openid.endpoint.authorize", System.getenv("IDS_OAUTH2_OPENID_ENDPOINT_AUTHORIZE")),
    IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI("ids.oauth2-openid.endpoint.redirect_uri", System.getenv("IDS_OAUTH2_OPENID_ENDPOINT_REDIRECT_URI")),
    IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT("ids.oauth2-openid.endpoint.logout", System.getenv("IDS_OAUTH2_OPENID_ENDPOINT_LOGOUT")),

    LDAP_AD_URL("ldap.ad.url", System.getenv("LDAP_AD_URL")),
    LDAP_AD_USERNAME("ldap.ad.username", System.getenv("LDAP_AD_USERNAME")),
    LDAP_AD_PASSWORD("ldap.ad.password", System.getenv("LDAP_AD_PASSWORD")),
    LDAP_AD_BASE("ldap.ad.base", System.getenv("LDAP_AD_BASE")),
    LDAP_AD_AUTHENTICATION_FILTER("ldap.ad.authentication_filter", System.getenv("LDAP_AD_AUTHENTICATION_FILTER")),
    LDAP_AD_ENTRY_DN("ldap.ad.entryDN", System.getenv("LDAP_AD_ENTRY_DN")),

    KRIOL_ADD_ROLE_USER("kriol.addrole.user", System.getenv("KRIOL_ADD_ROLE_USER")),

    MAIL_SMTP_HOST("mail.smtp.host", System.getenv("MAIL_SMTP_HOST")),
    MAIL_SMTP_SOCKET_FACTORY_PORT("mail.smtp.socketFactory.port", System.getenv("MAIL_SMTP_SOCKET_FACTORY_PORT")),
    MAIL_SMTP_SOCKET_FACTORY_CLASS("mail.smtp.socketFactory.class", System.getenv("MAIL_SMTP_SOCKET_FACTORY_CLASS")),
    MAIL_JAVA_NET_PREFER_IPV4STACK("java.net.preferIPv4Stack", System.getenv("MAIL_JAVA_NET_PREFER_IPV4STACK")),
    MAIL_SMTP_AUTH("mail.smtp.auth", System.getenv("MAIL_SMTP_AUTH")),
    MAIL_SMTP_PORT("mail.smtp.port", System.getenv("MAIL_SMTP_PORT")),
    MAIL_USER("mail.user", System.getenv("MAIL_USER")),
    MAIL_PASSWORD("mail.password", System.getenv("MAIL_PASSWORD")),

    IGRP_PDEX_APPCONFIG_URL("igrp.pdex.appconfig.url", System.getenv("IGRP_PDEX_APPCONFIG_URL")),
    IGRP_PDEX_APPCONFIG_TOKEN("igrp.pdex.appconfig.token", System.getenv("IGRP_PDEX_APPCONFIG_TOKEN")),
    IGRP_PDEX_PERMISSION_ACL_URL("igrp.pdex.permissionacl.url", System.getenv("IGRP_PDEX_PERMISSION_ACL_URL")),
    IGRP_PDEX_PERMISSION_ACL_TOKEN("igrp.pdex.permissionacl.token", System.getenv("IGRP_PDEX_PERMISSION_ACL_TOKEN")),

    IGRP_DATASOURCE_CONNECTION_NAME("igrp.datasource.connection-name", System.getenv("IGRP_DATASOURCE_CONNECTION_NAME")),

    IGRP_MODE_STANDALONE_ENABLED("igrp.mode.standalone.enabled", System.getenv("IGRP_MODE_STANDALONE_ENABLED")),
    IGRP_EMBEDDED_SERVER_SERVLET_CONTEXT_PATH("igrp.embedded.server.servlet.context-path", System.getenv("IGRP_EMBEDDED_SERVER_SERVLET_CONTEXT_PATH")),
    IGRP_EMBEDDED_SERVER_HTTP_PORT("igrp.embedded.server.http.port", System.getenv("IGRP_EMBEDDED_SERVER_HTTP_PORT")),

    IGRP_LOGIN_TEMPLATE("igrp.login.template", System.getenv("IGRP_LOGIN_TEMPLATE")),

    IGRP_SECRET_KEY("igrp.secret.key", System.getenv("IGRP_SECRET_KEY")),

    IGRP_SHOW_CONFIGURATION("IGRP_SHOW_CONFIGURATION", System.getenv("IGRP_SHOW_CONFIGURATION"));

    private final String value;
    private final String environmentValue;

    ConfigCommonMainConstants(String value, String environmentValue) {
        this.value = value;
        this.environmentValue = environmentValue;
    }

    public String value() {
        return value;
    }

    public String environmentValue(String defaultValue) {
        final var obj = environmentValue();
        return obj == null ? defaultValue : obj;
    }

    public String environmentValue() {
        if (IS_ENVIRONMENT_VARIABLE_SCAN_ACTIVE) {
            if (this.environmentValue != null)
                return this.environmentValue;
        }
        return mainXmlProperties.getProperty(this.value());
    }

    public static void printConfigurationsForDebugging() {

        final var showConfigurations = ConfigCommonMainConstants.IGRP_SHOW_CONFIGURATION.environmentValue() != null;
        if (showConfigurations) {

            final var constantsThatDoNotNeedPrint = List.of(
                    IGRP_ENV_DEV,
                    IGRP_ENV_TEST,
                    IGRP_ENV_STA,
                    IGRP_ENV_PROD,
                    IGRP_AUTHENTICATION_TYPE_DATABASE,
                    IGRP_AUTHENTICATION_TYPE_LDAP,
                    IGRP_AUTHENTICATION_TYPE_OAUTH2_OPENID
            );

            System.out.println("\n ---------------------------- ENVIRONMENT CONFIGURATIONS--------------------------------");

            Arrays.stream(ConfigCommonMainConstants.values())
                    .filter(obj -> !constantsThatDoNotNeedPrint.contains(obj))
                    .forEach(obj -> {
                        System.out.println("\nName: " + obj.name());
                        System.out.println("Code: " + obj.value());
                        System.out.println("Environment Value: " + obj.environmentValue());
                        System.out.println("---------------------------------");
                    });

            System.out.println("--------------------------------------- END ENVIRONMENT CONFIGURATIONS --------------------------------\n");
        }
    }

    private static final boolean IS_ENVIRONMENT_VARIABLE_SCAN_ACTIVE;

    public static boolean isEnvironmentVariableScanActive() {
        return IS_ENVIRONMENT_VARIABLE_SCAN_ACTIVE;
    }

    private static final Properties mainXmlProperties = ConfigApp.getInstance().getMainSettings();

    static {
        IS_ENVIRONMENT_VARIABLE_SCAN_ACTIVE = Boolean.parseBoolean(System.getenv("IGRP_ENV_VARIABLE_SCAN"));
    }
}
