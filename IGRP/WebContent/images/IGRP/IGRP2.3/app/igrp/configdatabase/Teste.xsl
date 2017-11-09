<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row row-msg">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-fc078d7f">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="nome" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" maxlength="60" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/nome"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/email_1">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="email_1" item-type="email">
                                                                        <label for="{rows/content/form_1/fields/email_1/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/email_1/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="email" value="{rows/content/form_1/fields/email_1/value}" class="form-control " id="{rows/content/form_1/fields/email_1/@name}" name="{rows/content/form_1/fields/email_1/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/email_1"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/file_1">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="file_1" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/file_1/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/file_1/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-default file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/file_1/@name}" name="{rows/content/form_1/fields/file_1/@name}" value="{rows/content/form_1/fields/file_1/value}" target-rend="" class="transparent " type="file" accept="">
                                                                                        <xsl:call-template name="setAttributes">
                                                                                            <xsl:with-param name="field" select="rows/content/form_1/fields/file_1"/>
                                                                                        </xsl:call-template>
                                                                                    </input>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/file_2">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="file_2" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/file_2/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/file_2/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-default file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/file_2/@name}" name="{rows/content/form_1/fields/file_2/@name}" value="{rows/content/form_1/fields/file_2/value}" target-rend="" class="transparent " type="file" multiple="multiple" accept="">
                                                                                        <xsl:call-template name="setAttributes">
                                                                                            <xsl:with-param name="field" select="rows/content/form_1/fields/file_2"/>
                                                                                        </xsl:call-template>
                                                                                    </input>
                                                                                </span>
                                                                            </span>
                                                                        </div>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1508891523479"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1508891523479"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1508891523479"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1508891523479"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1508891523480"/>
</xsl:stylesheet>
