<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/name">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="name" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/name/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/name/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/name/value}" class="form-control" id="{rows/content/form_1/fields/name/@name}" name="{rows/content/form_1/fields/name/@name}" readonly="readonly" required="required" maxlength="200"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/user_register_id">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="user_register_id" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/user_register_id/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/user_register_id/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_user_register_id" name="{rows/content/form_1/fields/user_register_id/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/user_register_id/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/dt_register">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="dt_register" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/dt_register/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/dt_register/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/dt_register/value}" class="form-control gen-date" id="form_1-dt_register" name="{rows/content/form_1/fields/dt_register/@name}" required="required" format="IGRP_datePicker" maxlength="10"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/device_id">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="device_id" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/device_id/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/device_id/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_device_id" name="{rows/content/form_1/fields/device_id/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/device_id/list/option">
                                                                                <option value="{value}" label="{text}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text"/>
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1482925345660"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1482925345660"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1482925345660"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1482925345660"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1482925345660"/>
</xsl:stylesheet>