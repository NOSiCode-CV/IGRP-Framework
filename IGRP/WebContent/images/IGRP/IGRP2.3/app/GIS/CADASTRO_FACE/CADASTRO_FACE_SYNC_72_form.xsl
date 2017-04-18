<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="utf-8" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- SELECT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/select2/select2.min.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/plugins/select2/select2.style.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_1/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="nome">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" class="form-control" name="{rows/content/form_1/fields/nome/@name}" value="{rows/content/form_1/fields/nome/value}" id="{rows/content/form_1/fields/nome/@name}" maxlength="200" required="required"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/mac">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="mac">
                                                                        <label for="{rows/content/form_1/fields/mac/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/mac/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" class="form-control" name="{rows/content/form_1/fields/mac/@name}" value="{rows/content/form_1/fields/mac/value}" id="{rows/content/form_1/fields/mac/@name}" maxlength="200" required="required"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ambiente">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="ambiente">
                                                                        <label for="{rows/content/form_1/fields/ambiente/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/ambiente/label" />
                                                                        </label>
                                                                        <select class="form-control select2 " name="{rows/content/form_1/fields/ambiente/@name}" id="form_1_ambiente" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/ambiente/list/option">
                                                                                <option label="{text}" value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/version">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-type="text" item-name="version">
                                                                        <label for="{rows/content/form_1/fields/version/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/version/label" />
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" class="form-control" name="{rows/content/form_1/fields/version/@name}" value="{rows/content/form_1/fields/version/value}" id="{rows/content/form_1/fields/version/@name}" maxlength="20" required="required"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/status">
                                                                    <div class="col-md-3  gen-fields-holder" item-type="checkbox" item-name="status">
                                                                        <div class="form-group">
                                                                            <div class="checkbox form-check-offset">
                                                                                <label>
                                                                                    <input type="checkbox" class="checkbox" label="{rows/content/form_1/fields/status/label}" name="{rows/content/form_1/fields/status/@name}" value="1">
                                                                                        <xsl:if test="rows/content/form_1/fields/status/value = '1'">
                                                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                        </xsl:if>
                                                                                    </input>
                                                                                    <span>
                                                                                        <xsl:value-of select="rows/content/form_1/fields/status/label" />
                                                                                    </span>
                                                                                </label>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js" />
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1483619072371" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1483619072371" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1483619072371" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1483619072371" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1483619072371" />
</xsl:stylesheet>