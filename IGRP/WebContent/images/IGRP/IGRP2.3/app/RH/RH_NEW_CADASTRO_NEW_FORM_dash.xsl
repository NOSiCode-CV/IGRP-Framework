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
                                                                <xsl:if test="rows/content/form_1/fields/pais">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="pais" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/pais/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/pais/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_pais" name="{rows/content/form_1/fields/pais/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/pais/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/tipo">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo" name="{rows/content/form_1/fields/tipo/@name}">
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
                                                                <xsl:if test="rows/content/form_1/fields/estabelecimento">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="estabelecimento" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/estabelecimento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/estabelecimento/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/estabelecimento/value}" class="form-control " id="{rows/content/form_1/fields/estabelecimento/@name}" name="{rows/content/form_1/fields/estabelecimento/@name}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/curso">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="curso" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/curso/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/curso/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_curso" name="{rows/content/form_1/fields/curso/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/curso/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/descricao">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="descricao" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/descricao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/descricao/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/descricao/@name}" class="textarea form-control " maxlength="300">
                                                                            <xsl:value-of select="rows/content/form_1/fields/descricao/value"/>
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/efeito">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="efeito" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/efeito/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/efeito/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_efeito" name="{rows/content/form_1/fields/efeito/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/efeito/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_inicio/value}" class="form-control gen-date " id="form_1-data_inicio" name="{rows/content/form_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_fim/value}" class="form-control gen-date " id="form_1-data_fim" name="{rows/content/form_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_de_duracao">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_de_duracao" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo_de_duracao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_de_duracao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_de_duracao" name="{rows/content/form_1/fields/tipo_de_duracao/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_de_duracao/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/duracao">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="duracao" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/duracao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/duracao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/duracao/value}" class="form-control " id="{rows/content/form_1/fields/duracao/@name}" name="{rows/content/form_1/fields/duracao/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/observacao">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="observacao" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/observacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/observacao/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/observacao/@name}" class="textarea form-control " maxlength="300">
                                                                            <xsl:value-of select="rows/content/form_1/fields/observacao/value"/>
                                                                        </textarea>
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492425675316"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492425675316"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492425675316"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492425675316"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492425675316"/>
</xsl:stylesheet>