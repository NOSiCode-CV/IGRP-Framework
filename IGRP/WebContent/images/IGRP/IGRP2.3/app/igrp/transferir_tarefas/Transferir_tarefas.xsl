<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css?v={$version}"/>
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
                                    <div class="row" id="row-9e85444c">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/numero_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="numero_processo" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/numero_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/numero_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/numero_processo/value}" class="form-control " id="{rows/content/form_1/fields/numero_processo/@name}" name="{rows/content/form_1/fields/numero_processo/@name}" min="" max="" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/numero_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/codigo_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="codigo_processo" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/codigo_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/codigo_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/codigo_processo/value}" class="form-control " id="{rows/content/form_1/fields/codigo_processo/@name}" name="{rows/content/form_1/fields/codigo_processo/@name}" min="" max="" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/codigo_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="tipo_processo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/tipo_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/tipo_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/tipo_processo/value}" class="form-control " id="{rows/content/form_1/fields/tipo_processo/@name}" name="{rows/content/form_1/fields/tipo_processo/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tipo_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_criacao">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="data_criacao" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_criacao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_criacao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_criacao/value}" class="form-control gen-date " id="form_1-data_criacao" name="{rows/content/form_1/fields/data_criacao/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/data_criacao"/>
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_inicio/value}" class="form-control gen-date " id="form_1-data_inicio" name="{rows/content/form_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/data_inicio"/>
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_fim/value}" class="form-control gen-date " id="form_1-data_fim" name="{rows/content/form_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/data_fim"/>
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/criado_por_">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="criado_por_" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/criado_por_/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/criado_por_/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/criado_por_/value}" class="form-control " id="{rows/content/form_1/fields/criado_por_/@name}" name="{rows/content/form_1/fields/criado_por_/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/criado_por_"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/atribuido_por">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="atribuido_por" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/atribuido_por/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/atribuido_por/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/atribuido_por/value}" class="form-control " id="{rows/content/form_1/fields/atribuido_por/@name}" name="{rows/content/form_1/fields/atribuido_por/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/atribuido_por"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/utilizador_actual">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="utilizador_actual" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/utilizador_actual/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/utilizador_actual/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/utilizador_actual/value}" class="form-control " id="{rows/content/form_1/fields/utilizador_actual/@name}" name="{rows/content/form_1/fields/utilizador_actual/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/utilizador_actual"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/novo_utilizador">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="novo_utilizador" item-type="lookup">
                                                                        <label for="{rows/content/form_1/fields/novo_utilizador/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/novo_utilizador/label"/>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/novo_utilizador/value}" class="form-control gen-lookup " id="form_1_novo_utilizador" name="{rows/content/form_1/fields/novo_utilizador/@name}" maxlength="30">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/novo_utilizador"/>
                                                                                </xsl:call-template>
                                                                            </input>
                                                                            <xsl:call-template name="lookup-tool">
                                                                                <xsl:with-param name="page" select="rows/page"/>
                                                                                <xsl:with-param name="ad_hoc" select="'1'"/>
                                                                                <xsl:with-param name="action" select="'LOOKUP'"/>
                                                                                <xsl:with-param name="name" select="rows/content/form_1/fields/novo_utilizador/@name"/>
                                                                                <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/novo_utilizador/lookup"/>
                                                                                <xsl:with-param name="input-id" select="'form_1_novo_utilizador'"/>
                                                                                <xsl:with-param name="btnClass" select="'primary'"/>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js?v={$version}"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1506939583900"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1506939583900"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1506939583900"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1506939583900"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1506939583901"/>
</xsl:stylesheet>
