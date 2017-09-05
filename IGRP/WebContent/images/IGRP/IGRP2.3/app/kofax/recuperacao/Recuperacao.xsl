<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- IMG CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/croppie/croppie.css"/>
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
                                    <div class="row" id="row-cc8ba9c0">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/adicionar_ficheiro">
                                                                    <div class="box-head subtitle gen-fields-holder" text-color="1">
                                                                        <span>
                                                                            <xsl:value-of select="rows/content/form_1/fields/adicionar_ficheiro/label"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/imagem">
                                                                    <div class="col-sm-12  holder-croppie gen-fields-holder" item-name="imagem">
                                                                        <div class="row">
                                                                            <img src="{rows/content/form_1/fields/imagem/value}" data-label="{rows/content/form_1/fields/imagem/label}" name="imagem" id="id-imagem" width="500" height="400" class=" croppie"/>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/identificacao">
                                                                    <div class="box-head subtitle gen-fields-holder" text-color="1">
                                                                        <span>
                                                                            <xsl:value-of select="rows/content/form_1/fields/identificacao/label"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_objeto">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_objeto" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/tipo_objeto/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_objeto/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_tipo_objeto" name="{rows/content/form_1/fields/tipo_objeto/@name}" required="required">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tipo_objeto"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_objeto/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/n_do_negocio">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="n_do_negocio" item-type="number" required="required">
                                                                        <label for="{rows/content/form_1/fields/n_do_negocio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/n_do_negocio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/n_do_negocio/value}" class="form-control " id="{rows/content/form_1/fields/n_do_negocio/@name}" name="{rows/content/form_1/fields/n_do_negocio/@name}" required="required" min="" max="" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/n_do_negocio"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/n_de_processo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="n_de_processo" item-type="number" required="required">
                                                                        <label for="{rows/content/form_1/fields/n_de_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/n_de_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/n_de_processo/value}" class="form-control " id="{rows/content/form_1/fields/n_de_processo/@name}" name="{rows/content/form_1/fields/n_de_processo/@name}" required="required" min="" max="" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/n_de_processo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_de_registo">
                                                                    <div class="form-group col-sm-3  gen-fields-holder" item-name="data_de_registo" item-type="date" required="required">
                                                                        <label for="{rows/content/form_1/fields/data_de_registo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_de_registo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_de_registo/value}" class="form-control gen-date " id="form_1-data_de_registo" name="{rows/content/form_1/fields/data_de_registo/@name}" required="required" format="IGRP_datePicker" maxlength="30">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/form_1/fields/data_de_registo"/>
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
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="nome" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control " id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/nome"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_documento">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_documento" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/tipo_documento/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_documento/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_documento" name="{rows/content/form_1/fields/tipo_documento/@name}">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/tipo_documento"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_documento/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/n_de_documento">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="n_de_documento" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/n_de_documento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/n_de_documento/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/n_de_documento/value}" class="form-control " id="{rows/content/form_1/fields/n_de_documento/@name}" name="{rows/content/form_1/fields/n_de_documento/@name}" min="" max="" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/n_de_documento"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/localizacao_fisica">
                                                                    <div class="box-head subtitle gen-fields-holder" text-color="1">
                                                                        <span>
                                                                            <xsl:value-of select="rows/content/form_1/fields/localizacao_fisica/label"/>
                                                                        </span>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/estante">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="estante" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/estante/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/estante/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/estante/value}" class="form-control " id="{rows/content/form_1/fields/estante/@name}" name="{rows/content/form_1/fields/estante/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/estante"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/pasta">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="pasta" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/pasta/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/pasta/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/pasta/value}" class="form-control " id="{rows/content/form_1/fields/pasta/@name}" name="{rows/content/form_1/fields/pasta/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/pasta"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/livro">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="livro" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/livro/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/livro/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/livro/value}" class="form-control " id="{rows/content/form_1/fields/livro/@name}" name="{rows/content/form_1/fields/livro/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/livro"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/folha">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="folha" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/folha/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/folha/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/folha/value}" class="form-control " id="{rows/content/form_1/fields/folha/@name}" name="{rows/content/form_1/fields/folha/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/folha"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/separatorlist_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/informacoes_adicionais">
                                                                        <div class="box-head subtitle gen-fields-holder" text-color="1">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/informacoes_adicionais/label"/>
                                                                            </span>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/campo">
                                                                        <div class="col-sm-6 form-group  gen-fields-holder" item-name="campo" item-type="select" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/campo/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/campo/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_campo" name="{rows/content/separatorlist_1/fields/campo/@name}" required="required">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/campo"/>
                                                                                </xsl:call-template>
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/campo/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/valor">
                                                                        <div class="form-group col-sm-6  gen-fields-holder" item-name="valor" item-type="textarea" required="required">
                                                                            <label for="{rows/content/separatorlist_1/fields/valor/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/valor/label"/>
                                                                            </label>
                                                                            <textarea name="{rows/content/separatorlist_1/fields/valor/@name}" required="required" class="textarea form-control " maxlength="30">
                                                                                <xsl:call-template name="setAttributes">
                                                                                    <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/valor"/>
                                                                                </xsl:call-template>
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/valor/value"/>
                                                                            </textarea>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/campo">
                                                                                <xsl:if test="not(rows/content/separatorlist_1/fields/campo/@visible)">
                                                                                    <th align="" item-name="campo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/campo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/valor">
                                                                                <xsl:if test="not(rows/content/separatorlist_1/fields/valor/@visible)">
                                                                                    <th align="" item-name="valor">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/valor/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                                                                                    <i class="fa fa-plus"/>
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                                                <xsl:if test="campo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(campo/@visible)">
                                                                                            <td field="campo" data-row="{position()}" data-title="{../../../fields/campo/label}" class="select" item-name="campo">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="campo_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                                                                                <input type="hidden" name="p_campo_fk_desc" value="{campo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_campo_fk" value="{campo}"/>
                                                                                            <input type="hidden" name="p_campo_fk_desc" value="{campo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="valor">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(valor/@visible)">
                                                                                            <td field="valor" data-row="{position()}" data-title="{../../../fields/valor/label}" class="textarea" item-name="valor">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="valor_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_valor_fk" value="{valor}"/>
                                                                                                <input type="hidden" name="p_valor_fk_desc" value="{valor_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_valor_fk" value="{valor}"/>
                                                                                            <input type="hidden" name="p_valor_fk_desc" value="{valor_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="separatorlist_1">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="separatorlist_1">
                                                                                            <i class="fa fa-times"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </tr>
                                                                        </xsl:for-each>
                                                                    </tbody>
                                                                </table>
                                                            </div>
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <!-- IMG JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/croppie/croppie.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/croppie/croppie.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1504615691898"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1504615691898"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1504615691898"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1504615691898"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1504615691898"/>
</xsl:stylesheet>
