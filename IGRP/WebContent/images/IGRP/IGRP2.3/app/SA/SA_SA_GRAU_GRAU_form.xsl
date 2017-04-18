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
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
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
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/toll_opera">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toll_opera">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toll_opera" mode="gen-buttons">
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
                                                                <xsl:if test="rows/content/form_1/fields/aplicacao">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}" required="required">
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
                                                                <xsl:if test="rows/content/form_1/fields/organica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="organica" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/organica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_organica" name="{rows/content/form_1/fields/organica/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/organica/list/option">
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
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control" id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" required="required" maxlength="50"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/imagem">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="imagem" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/imagem/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/imagem/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-success file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/imagem/@name}" name="{rows/content/form_1/fields/imagem/@name}" value="{rows/content/form_1/fields/imagem/value}" class="transparent" type="file" multiple=""/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/link">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="link" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/link/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/link/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/link/value}" class="form-control" id="{rows/content/form_1/fields/link/@name}" name="{rows/content/form_1/fields/link/@name}" maxlength="4000"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/estado">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="estado" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/estado/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/estado/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_estado" name="{rows/content/form_1/fields/estado/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/estado/list/option">
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
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/sep_associar_motivo_">
                                                    <div class="box gen-container-item " gen-class="" item-name="sep_associar_motivo_">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/sep_associar_motivo_/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="sep_associar_motivo_" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_associar_motivo_/fields"/>
                                                                    <xsl:if test="rows/content/sep_associar_motivo_/fields/motivo">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="motivo" item-type="select">
                                                                            <label for="{rows/content/sep_associar_motivo_/fields/motivo/@name}">
                                                                                <xsl:value-of select="rows/content/sep_associar_motivo_/fields/motivo/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_associar_motivo__motivo" name="{rows/content/sep_associar_motivo_/fields/motivo/@name}">
                                                                                <xsl:for-each select="rows/content/sep_associar_motivo_/fields/motivo/list/option">
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
                                                                    <xsl:if test="rows/content/sep_associar_motivo_/fields/ordem_mot">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="ordem_mot" item-type="number">
                                                                            <label for="{rows/content/sep_associar_motivo_/fields/ordem_mot/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_associar_motivo_/fields/ordem_mot/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_associar_motivo_/fields/ordem_mot/value}" class="form-control" id="{rows/content/sep_associar_motivo_/fields/ordem_mot/@name}" name="{rows/content/sep_associar_motivo_/fields/ordem_mot/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_associar_motivo_/fields/pontuacao_mot">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="pontuacao_mot" item-type="number">
                                                                            <label for="{rows/content/sep_associar_motivo_/fields/pontuacao_mot/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_associar_motivo_/fields/pontuacao_mot/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_associar_motivo_/fields/pontuacao_mot/value}" class="form-control" id="{rows/content/sep_associar_motivo_/fields/pontuacao_mot/@name}" name="{rows/content/sep_associar_motivo_/fields/pontuacao_mot/@name}" maxlength="30"></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_associar_motivo_/fields/estado_motivo">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_motivo" item-type="select">
                                                                            <label for="{rows/content/sep_associar_motivo_/fields/estado_motivo/@name}">
                                                                                <xsl:value-of select="rows/content/sep_associar_motivo_/fields/estado_motivo/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_associar_motivo__estado_motivo" name="{rows/content/sep_associar_motivo_/fields/estado_motivo/@name}">
                                                                                <xsl:for-each select="rows/content/sep_associar_motivo_/fields/estado_motivo/list/option">
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
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_sep_associar_motivo_" id="sep_associar_motivo_" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_associar_motivo_/fields/motivo">
                                                                                <xsl:if test="not(motivo/@visible)">
                                                                                    <th align="" item-name="motivo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_associar_motivo_/fields/motivo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_associar_motivo_/fields/ordem_mot">
                                                                                <xsl:if test="not(ordem_mot/@visible)">
                                                                                    <th align="" item-name="ordem_mot">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_associar_motivo_/fields/ordem_mot/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_associar_motivo_/fields/pontuacao_mot">
                                                                                <xsl:if test="not(pontuacao_mot/@visible)">
                                                                                    <th align="" item-name="pontuacao_mot">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_associar_motivo_/fields/pontuacao_mot/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_associar_motivo_/fields/estado_motivo">
                                                                                <xsl:if test="not(estado_motivo/@visible)">
                                                                                    <th align="" item-name="estado_motivo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_associar_motivo_/fields/estado_motivo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <th class="table-btn">
                                                                                <a class="table-row-add btn btn-link">
                                                                                    <i class="fa fa-plus"/>
                                                                                </a>
                                                                            </th>
                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                        <xsl:for-each select="rows/content/sep_associar_motivo_/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_associar_motivo__id" value="{sep_associar_motivo__id}"/>
                                                                                <input type="hidden" name="p_id_motivo_fk" value="{id_motivo}"/>
                                                                                <input type="hidden" name="p_id_motivo_fk_desc" value="{id_motivo_desc}"/>
                                                                                <xsl:if test="motivo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(motivo/@visible)">
                                                                                            <td field="motivo" data-row="{position()}" data-title="{../../../fields/motivo/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="motivo_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_motivo_fk" value="{motivo}"/>
                                                                                                <input type="hidden" name="p_motivo_fk_desc" value="{motivo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_motivo_fk" value="{motivo}"/>
                                                                                            <input type="hidden" name="p_motivo_fk_desc" value="{motivo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="ordem_mot">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(ordem_mot/@visible)">
                                                                                            <td field="ordem_mot" data-row="{position()}" data-title="{../../../fields/ordem_mot/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="ordem_mot_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_ordem_mot_fk" value="{ordem_mot}"/>
                                                                                                <input type="hidden" name="p_ordem_mot_fk_desc" value="{ordem_mot_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_ordem_mot_fk" value="{ordem_mot}"/>
                                                                                            <input type="hidden" name="p_ordem_mot_fk_desc" value="{ordem_mot_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="pontuacao_mot">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(pontuacao_mot/@visible)">
                                                                                            <td field="pontuacao_mot" data-row="{position()}" data-title="{../../../fields/pontuacao_mot/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="pontuacao_mot_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_pontuacao_mot_fk" value="{pontuacao_mot}"/>
                                                                                                <input type="hidden" name="p_pontuacao_mot_fk_desc" value="{pontuacao_mot_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_pontuacao_mot_fk" value="{pontuacao_mot}"/>
                                                                                            <input type="hidden" name="p_pontuacao_mot_fk_desc" value="{pontuacao_mot_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="estado_motivo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(estado_motivo/@visible)">
                                                                                            <td field="estado_motivo" data-row="{position()}" data-title="{../../../fields/estado_motivo/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="estado_motivo_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_estado_motivo_fk" value="{estado_motivo}"/>
                                                                                                <input type="hidden" name="p_estado_motivo_fk_desc" value="{estado_motivo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_estado_motivo_fk" value="{estado_motivo}"/>
                                                                                            <input type="hidden" name="p_estado_motivo_fk_desc" value="{estado_motivo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_associar_motivo_">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_associar_motivo_">
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1487338960961"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1487338960961"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1487338960961"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1487338960961"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1487338960961"/>
</xsl:stylesheet>