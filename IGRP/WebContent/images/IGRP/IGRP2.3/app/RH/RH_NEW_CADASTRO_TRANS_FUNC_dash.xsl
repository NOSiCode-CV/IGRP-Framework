<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
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
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/sectionheader_1">
                                                                            <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                                                <h2>
                                                                                    <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                                                </h2>
                                                                            </section>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/toolsbar_1">
                                                                            <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                                                <div class="btns-holder   pull-right" role="group">
                                                                                    <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                                        <xsl:with-param name="vertical" select="'true'"/>
                                                                                    </xsl:apply-templates>
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_1">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                                                <xsl:call-template name="box-header">
                                                                                    <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                </xsl:call-template>
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                                        <xsl:if test="rows/content/form_1/fields/nome">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="nome" item-type="text">
                                                                                                <label for="{rows/content/form_1/fields/nome/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" readonly="readonly" maxlength="100" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_2">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                                                <xsl:call-template name="box-header">
                                                                                    <xsl:with-param name="title" select="rows/content/form_2/@title"/>
                                                                                    <xsl:with-param name="collapsible" select="'true'"/>
                                                                                </xsl:call-template>
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                                        <xsl:if test="rows/content/form_2/fields/centro_custo">
                                                                                            <div class="form-group col-md-6  gen-fields-holder" item-name="centro_custo" item-type="lookup">
                                                                                                <label for="{rows/content/form_2/fields/centro_custo/@name}">
                                                                                                    <xsl:value-of select="rows/content/form_2/fields/centro_custo/label"/>
                                                                                                </label>
                                                                                                <div class="input-group">
                                                                                                    <input type="text" value="{rows/content/form_2/fields/centro_custo/value}" class="form-control gen-lookup " id="form_2_centro_custo" name="{rows/content/form_2/fields/centro_custo/@name}" readonly="readonly" maxlength="100"/>
                                                                                                    <xsl:call-template name="lookup-tool">
                                                                                                        <xsl:with-param name="page" select="rows/page"/>
                                                                                                        <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                                        <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                                        <xsl:with-param name="name" select="rows/content/form_2/fields/centro_custo/@name"/>
                                                                                                        <xsl:with-param name="js_lookup" select="rows/content/form_2/fields/centro_custo/lookup"/>
                                                                                                        <xsl:with-param name="input-id" select="'form_2_centro_custo'"/>
                                                                                                        <xsl:with-param name="btnClass" select="'default'"/>
                                                                                                    </xsl:call-template>
                                                                                                </div>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
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
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492437038061"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492437038061"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492437038061"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492437038061"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492437038061"/>
</xsl:stylesheet>