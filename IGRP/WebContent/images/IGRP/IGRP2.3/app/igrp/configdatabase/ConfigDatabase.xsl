<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
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
                                    <div class="row " id="row-6ad59d4d">
                                        <div class="gen-column col-sm-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-112" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/sectionheader/sectionheader.html" gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-sm-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-128" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/toolsbar/toolsbar.html" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-c71a43fa">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-93" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/form/form.html" gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/nome_de_conexao">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="nome_de_conexao" item-type="text" required="required" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-92" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/form/field.html">
                                                                        <label for="{rows/content/form_1/fields/nome_de_conexao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome_de_conexao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome_de_conexao/value}" class="form-control " id="{rows/content/form_1/fields/nome_de_conexao/@name}" name="{rows/content/form_1/fields/nome_de_conexao/@name}" required="required" maxlength="30" placeholder="Ex: DEVNOSI">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/nome_de_conexao"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/aplicacao">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select" required="required" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-185" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/fields/select/templates/select.form.html">
                                                                        <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}" required="required">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/aplicacao"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/tipo_base_dados">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_base_dados" item-type="select" required="required" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-185" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/fields/select/templates/select.form.html">
                                                                        <label for="{rows/content/form_1/fields/tipo_base_dados/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_base_dados/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_tipo_base_dados" name="{rows/content/form_1/fields/tipo_base_dados/@name}" required="required">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tipo_base_dados"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_base_dados/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/config">
                                                                    <div class="box-head subtitle gen-fields-holder" text-color="1" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-187" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/fields/separator/templates/separator.form.html">
                                                                        <span>
                                                                            <xsl:value-of select="rows/content/form_1/fields/config/label"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/hostname">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="hostname" item-type="text" required="required" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-92" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/form/field.html">
                                                                        <label for="{rows/content/form_1/fields/hostname/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/hostname/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/hostname/value}" class="form-control " id="{rows/content/form_1/fields/hostname/@name}" name="{rows/content/form_1/fields/hostname/@name}" required="required" maxlength="100" placeholder="Ex: nosidev02.gov.cv">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/hostname"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/port">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="port" item-type="number" required="required" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-172" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/fields/number/templates/number.form.html">
                                                                        <label for="{rows/content/form_1/fields/port/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/port/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/port/value}" class="form-control " id="{rows/content/form_1/fields/port/@name}" name="{rows/content/form_1/fields/port/@name}" required="required" min="" max="" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/port"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/username">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="username" item-type="text" required="required" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-92" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/form/field.html">
                                                                        <label for="{rows/content/form_1/fields/username/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/username/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/username/value}" class="form-control " id="{rows/content/form_1/fields/username/@name}" name="{rows/content/form_1/fields/username/@name}" required="required" maxlength="80" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/username"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/password">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="password" item-type="password" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-92" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/form/field.html">
                                                                        <label for="{rows/content/form_1/fields/password/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/password/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="password" value="{rows/content/form_1/fields/password/value}" class="form-control " id="{rows/content/form_1/fields/password/@name}" name="{rows/content/form_1/fields/password/@name}" maxlength="80" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/password"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nome_de_bade_dados">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="nome_de_bade_dados" item-type="text" required="required" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-92" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/form/field.html">
                                                                        <label for="{rows/content/form_1/fields/nome_de_bade_dados/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome_de_bade_dados/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome_de_bade_dados/value}" class="form-control " id="{rows/content/form_1/fields/nome_de_bade_dados/@name}" name="{rows/content/form_1/fields/nome_de_bade_dados/@name}" required="required" maxlength="50" placeholder="Ex: devnosi.gov.cv">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/nome_de_bade_dados"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/paragraph_1">
                                                    <div class="box gen-container-item " data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-109" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/paragraph/paragraph.html" gen-class="" item-name="paragraph_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/paragraph_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                            <xsl:with-param name="collapsed" select="'false'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <p>
                                                                <xsl:value-of select="rows/content/paragraph_1/fields/paragraph_1_text/value"/>
                                                            </p>
                                                        </div>
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1516193452473"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1516193452473"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1516193452473"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1516193452473"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1516193452473"/>
</xsl:stylesheet>
