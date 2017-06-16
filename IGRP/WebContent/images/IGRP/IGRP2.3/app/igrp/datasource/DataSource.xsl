<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/tipo">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="tipo" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/tipo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo" name="{rows/content/form_1/fields/tipo/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/aplicacao">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="aplicacao" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}">
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
                                                                <xsl:if test="rows/content/form_1/fields/area">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="area" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/area/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/area/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_area" name="{rows/content/form_1/fields/area/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/area/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/processo">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="processo" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/processo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/processo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_processo" name="{rows/content/form_1/fields/processo/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/processo/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/etapa">
                                                                    <div class="col-md-6 form-group  gen-fields-holder" item-name="etapa" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/etapa/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/etapa/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_etapa" name="{rows/content/form_1/fields/etapa/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/etapa/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/objecto">
                                                                    <div class="form-group col-md-6   gen-fields-holder" item-name="objecto" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/objecto/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/objecto/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/objecto/value}" class="form-control " id="{rows/content/form_1/fields/objecto/@name}" name="{rows/content/form_1/fields/objecto/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/pagina">
                                                                    <div class="form-group col-md-6  gen-fields-holder" item-name="pagina" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/pagina/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/pagina/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/pagina/value}" class="form-control gen-lookup " id="form_1_pagina" name="{rows/content/form_1/fields/pagina/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/pagina/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/pagina/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_pagina'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/query">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="query" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/query/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/query/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/query/@name}" class="textarea form-control " maxlength="30">
                                                                            <xsl:value-of select="rows/content/form_1/fields/query/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/servico">
                                                                    <div class="form-group col-md-6  gen-fields-holder" item-name="servico" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/servico/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/servico/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/servico/value}" class="form-control gen-lookup " id="form_1_servico" name="{rows/content/form_1/fields/servico/@name}" maxlength="30"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/servico/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/servico/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_servico'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-functions.tmpl.xsl?v=1497519849922"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-variables.tmpl.xsl?v=1497519849922"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1497519849922"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-utils.tmpl.xsl?v=1497519849922"/>
    <xsl:include href="/IGRP/images/IGRP/IGRP2.3/xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1497519849922"/>
</xsl:stylesheet>
