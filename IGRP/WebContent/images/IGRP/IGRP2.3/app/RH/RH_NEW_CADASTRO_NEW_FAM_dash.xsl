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
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="nome" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control gen-lookup " id="form_1_nome" name="{rows/content/form_1/fields/nome/@name}" maxlength="100"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/nome/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/nome/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_nome'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/sexo">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="sexo" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/sexo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/sexo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_sexo" name="{rows/content/form_1/fields/sexo/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/sexo/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/data_de_nascimento">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_de_nascimento" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_de_nascimento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_de_nascimento/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_de_nascimento/value}" class="form-control gen-date " id="form_1-data_de_nascimento" name="{rows/content/form_1/fields/data_de_nascimento/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/grau_de_parentesco">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="grau_de_parentesco" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/grau_de_parentesco/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/grau_de_parentesco/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_grau_de_parentesco" name="{rows/content/form_1/fields/grau_de_parentesco/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/grau_de_parentesco/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/dependente">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="dependente" item-type="radiolist">
                                                                        <div class="form-group">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/dependente/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/dependente/list/option">
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                                                            <xsl:if test="@selected='true'">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </xsl:for-each>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/agregados">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="agregados" item-type="radiolist">
                                                                        <div class="form-group">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/agregados/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/agregados/list/option">
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
                                                                                            <xsl:if test="@selected='true'">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                        <span>
                                                                                            <xsl:value-of select="text"/>
                                                                                        </span>
                                                                                    </label>
                                                                                </div>
                                                                            </xsl:for-each>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_de_documento">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_de_documento" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo_de_documento/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_de_documento/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_de_documento" name="{rows/content/form_1/fields/tipo_de_documento/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_de_documento/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/numero_de_documento">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="numero_de_documento" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/numero_de_documento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/numero_de_documento/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/numero_de_documento/value}" class="form-control " id="{rows/content/form_1/fields/numero_de_documento/@name}" name="{rows/content/form_1/fields/numero_de_documento/@name}" maxlength="15" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/nome_do_ficheiro">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="nome_do_ficheiro" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/nome_do_ficheiro/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome_do_ficheiro/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-primary file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/nome_do_ficheiro/@name}" name="{rows/content/form_1/fields/nome_do_ficheiro/@name}" value="{rows/content/form_1/fields/nome_do_ficheiro/value}" class="transparent" type="file" accept="file_extension"/>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492089768548"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492089768548"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492089768548"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492089768548"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492089768549"/>
</xsl:stylesheet>