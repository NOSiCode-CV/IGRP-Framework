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
                                                                <xsl:if test="rows/content/form_1/fields/centro_custo">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="centro_custo" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/centro_custo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/centro_custo/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/centro_custo/value}" class="form-control gen-lookup " id="form_1_centro_custo" name="{rows/content/form_1/fields/centro_custo/@name}" required="required" maxlength="100"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/centro_custo/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/centro_custo/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_centro_custo'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/dirgeraldirservico">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="dirgeraldirservico" item-type="lookup" required="required">
                                                                        <label for="{rows/content/form_1/fields/dirgeraldirservico/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/dirgeraldirservico/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/dirgeraldirservico/value}" class="form-control gen-lookup " id="form_1_dirgeraldirservico" name="{rows/content/form_1/fields/dirgeraldirservico/@name}" required="required" maxlength="100"/>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/dirgeraldirservico/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/dirgeraldirservico/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_dirgeraldirservico'"/>
                                                                                <xsl:with-param name="btnClass" select="'default'"/>
                                                                            </xsl:call-template>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/situacao_juridica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="situacao_juridica" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/situacao_juridica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/situacao_juridica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_situacao_juridica" name="{rows/content/form_1/fields/situacao_juridica/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/situacao_juridica/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/quadro">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="quadro" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/quadro/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/quadro/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_quadro" name="{rows/content/form_1/fields/quadro/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/quadro/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/escalao">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="escalao" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/escalao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/escalao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_escalao" name="{rows/content/form_1/fields/escalao/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/escalao/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/cargo">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="cargo" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/cargo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/cargo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_cargo" name="{rows/content/form_1/fields/cargo/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/cargo/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/orcamento">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="orcamento" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/orcamento/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/orcamento/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_orcamento" name="{rows/content/form_1/fields/orcamento/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/orcamento/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/financiador">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="financiador" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/financiador/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/financiador/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_financiador" name="{rows/content/form_1/fields/financiador/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/financiador/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/valor_salario_pcss">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="valor_salario_pcss" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/valor_salario_pcss/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/valor_salario_pcss/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/valor_salario_pcss/value}" class="form-control " id="{rows/content/form_1/fields/valor_salario_pcss/@name}" name="{rows/content/form_1/fields/valor_salario_pcss/@name}" readonly="readonly" maxlength="10" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio_funcao">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_inicio_funcao" item-type="date" required="required">
                                                                        <label for="{rows/content/form_1/fields/data_inicio_funcao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio_funcao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_inicio_funcao/value}" class="form-control gen-date " id="form_1-data_inicio_funcao" name="{rows/content/form_1/fields/data_inicio_funcao/@name}" required="required" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ultimo_vinculo">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="ultimo_vinculo" item-type="radiolist" required="required">
                                                                        <div class="form-group">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/ultimo_vinculo/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/ultimo_vinculo/list/option">
                                                                                <div class="radio">
                                                                                    <label>
                                                                                        <input required="required" type="radio" name="{../../@name}" value="{value}" class="radiolist " label="{text}">
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
                                                                <xsl:if test="rows/content/form_1/fields/suporte_documental">
                                                                    <div class="col-md-3  gen-fields-holder" item-name="suporte_documental" item-type="radiolist">
                                                                        <div class="form-group">
                                                                            <label>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/suporte_documental/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <xsl:for-each select="rows/content/form_1/fields/suporte_documental/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/justificacao_quando_sem_documento">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="justificacao_quando_sem_documento" item-type="textarea">
                                                                        <label for="{rows/content/form_1/fields/justificacao_quando_sem_documento/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/justificacao_quando_sem_documento/label"/>
                                                                        </label>
                                                                        <textarea name="{rows/content/form_1/fields/justificacao_quando_sem_documento/@name}" class="textarea form-control " maxlength="300">
                                                                            <xsl:value-of select="rows/content/form_1/fields/justificacao_quando_sem_documento/value"/>
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492436574875"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492436574875"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492436574875"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492436574875"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492436574875"/>
</xsl:stylesheet>