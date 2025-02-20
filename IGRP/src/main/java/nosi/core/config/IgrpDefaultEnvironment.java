package nosi.core.config;

public enum IgrpDefaultEnvironment {

    IGRP_ENV_DEV("dev"),
    IGRP_ENV_TEST("test"),
    IGRP_ENV_STA("sta"),
    IGRP_ENV_PROD("prod");

    private String value;

    IgrpDefaultEnvironment(String value) {
        this.value = value;
    }

    public String value() {
        return value;
    }
}
