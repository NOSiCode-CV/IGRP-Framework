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
                <!-- COLOR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
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
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder  pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
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
                                                                <xsl:if test="rows/content/form_1/fields/nome">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/nome/value}" class="form-control" id="{rows/content/form_1/fields/nome/@name}" name="{rows/content/form_1/fields/nome/@name}" required="required" maxlength="300" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/codigo">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="codigo" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/codigo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/codigo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/codigo/value}" class="form-control" id="{rows/content/form_1/fields/codigo/@name}" name="{rows/content/form_1/fields/codigo/@name}" required="required" maxlength="50" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/titulo">
                                                                    <div class="form-group col-md-5   gen-fields-holder" item-name="titulo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/titulo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/titulo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/titulo/value}" class="form-control" id="{rows/content/form_1/fields/titulo/@name}" name="{rows/content/form_1/fields/titulo/@name}" maxlength="300" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/id_requisito">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="id_requisito" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/id_requisito/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/id_requisito/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_id_requisito" name="{rows/content/form_1/fields/id_requisito/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/id_requisito/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/imagem_fundo">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="imagem_fundo" item-type="file">
                                                                        <label for="{rows/content/form_1/fields/imagem_fundo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/imagem_fundo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" class="form-control not-form" readonly=""/>
                                                                            <span class="input-group-btn">
                                                                                <span class="btn btn-success file-btn-holder">
                                                                                    <i class="fa fa-upload"/>
                                                                                    <input id="{rows/content/form_1/fields/imagem_fundo/@name}" name="{rows/content/form_1/fields/imagem_fundo/@name}" value="{rows/content/form_1/fields/imagem_fundo/value}" class="transparent" type="file" multiple=""/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/ver_imagem">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="ver_imagem" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/ver_imagem/value}" class="link btn btn-link form-link" target="_blank">
                                                                            <i class="fa fa-link"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/ver_imagem/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/cor_cabecalho">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="cor_cabecalho" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/cor_cabecalho/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/cor_cabecalho/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_cor_cabecalho_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/cor_cabecalho/value}" format="hex" class="form-control" id="form_1_cor_cabecalho" name="{rows/content/form_1/fields/cor_cabecalho/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/posicao_destaque">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="posicao_destaque" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/posicao_destaque/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/posicao_destaque/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_posicao_destaque_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/posicao_destaque/value}" format="hex" class="form-control" id="form_1_posicao_destaque" name="{rows/content/form_1/fields/posicao_destaque/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/posicao_1">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="posicao_1" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/posicao_1/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/posicao_1/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_posicao_1_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/posicao_1/value}" format="hex" class="form-control" id="form_1_posicao_1" name="{rows/content/form_1/fields/posicao_1/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/posicao_2">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="posicao_2" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/posicao_2/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/posicao_2/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_posicao_2_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/posicao_2/value}" format="hex" class="form-control" id="form_1_posicao_2" name="{rows/content/form_1/fields/posicao_2/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/posicao_3">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="posicao_3" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/posicao_3/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/posicao_3/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_posicao_3_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/posicao_3/value}" format="hex" class="form-control" id="form_1_posicao_3" name="{rows/content/form_1/fields/posicao_3/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/sep_logo_id">
                                                    <div class="box gen-container-item " gen-class="" item-name="sep_logo_id">
                                                        <div class="box-body IGRP-separatorlist" tag="sep_logo_id" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_logo_id/fields"/>
                                                                    <xsl:if test="rows/content/sep_logo_id/fields/logotipo">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="logotipo" item-type="file">
                                                                            <label for="{rows/content/sep_logo_id/fields/logotipo/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_logo_id/fields/logotipo/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" class="form-control not-form" readonly=""/>
                                                                                <span class="input-group-btn">
                                                                                    <span class="btn btn-success file-btn-holder">
                                                                                        <i class="fa fa-upload"/>
                                                                                        <input id="{rows/content/sep_logo_id/fields/logotipo/@name}" name="{rows/content/sep_logo_id/fields/logotipo/@name}" value="{rows/content/sep_logo_id/fields/logotipo/value}" class="transparent" type="file" multiple=""/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_logo_id/fields/ordem">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="ordem" item-type="number">
                                                                            <label for="{rows/content/sep_logo_id/fields/ordem/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_logo_id/fields/ordem/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_logo_id/fields/ordem/value}" class="form-control" id="{rows/content/sep_logo_id/fields/ordem/@name}" name="{rows/content/sep_logo_id/fields/ordem/@name}" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_sep_logo_id" id="sep_logo_id" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_logo_id/fields/logotipo">
                                                                                <xsl:if test="not(logotipo/@visible)">
                                                                                    <th align="" item-name="logotipo">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_logo_id/fields/logotipo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_logo_id/fields/ordem">
                                                                                <xsl:if test="not(ordem/@visible)">
                                                                                    <th align="" item-name="ordem">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_logo_id/fields/ordem/label"/>
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
                                                                        <xsl:for-each select="rows/content/sep_logo_id/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_logo_id_id" value="{sep_logo_id_id}"/>
                                                                                <xsl:if test="logotipo">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(logotipo/@visible)">
                                                                                            <td data-row="{position()}" data-title="{../../fields/logotipo/label}" class="file">
                                                                                                <xsl:choose>
                                                                                                    <xsl:when test="logotipo != ''">
                                                                                                        <a href="{logotipo}" class="link bClick" target="_blank" name="logotipo">
                                                                                                            <xsl:value-of select="logotipo_desc"/>
                                                                                                        </a>
                                                                                                    </xsl:when>
                                                                                                    <xsl:otherwise>
                                                                                                        <xsl:value-of select="logotipo_desc"/>
                                                                                                    </xsl:otherwise>
                                                                                                </xsl:choose>
                                                                                                <input type="hidden" name="p_logotipo_fk" value="{logotipo}"/>
                                                                                                <input type="hidden" name="p_logotipo_fk_desc" value="{logotipo_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_logotipo_fk" value="{logotipo}"/>
                                                                                            <input type="hidden" name="p_logotipo_fk_desc" value="{logotipo_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="ordem">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(ordem/@visible)">
                                                                                            <td field="ordem" data-row="{position()}" data-title="{../../../fields/ordem/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="ordem_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_ordem_fk" value="{ordem}"/>
                                                                                                <input type="hidden" name="p_ordem_fk_desc" value="{ordem_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_ordem_fk" value="{ordem}"/>
                                                                                            <input type="hidden" name="p_ordem_fk_desc" value="{ordem_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_logo_id">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_logo_id">
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
                                                <xsl:if test="rows/content/organica_sep">
                                                    <div class="box gen-container-item " gen-class="" item-name="organica_sep">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/organica_sep/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="organica_sep" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/organica_sep/fields"/>
                                                                    <xsl:if test="rows/content/organica_sep/fields/organica">
                                                                        <div class="col-md-5 form-group  gen-fields-holder" item-name="organica" item-type="select" required="required">
                                                                            <label for="{rows/content/organica_sep/fields/organica/@name}">
                                                                                <xsl:value-of select="rows/content/organica_sep/fields/organica/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="organica_sep_organica" name="{rows/content/organica_sep/fields/organica/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/organica_sep/fields/organica/list/option">
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
                                                                <table rel="T_organica_sep" id="organica_sep" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/organica_sep/fields/organica">
                                                                                <xsl:if test="not(organica/@visible)">
                                                                                    <th align="" item-name="organica">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/organica_sep/fields/organica/label"/>
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
                                                                        <xsl:for-each select="rows/content/organica_sep/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_organica_sep_id" value="{organica_sep_id}"/>
                                                                                <xsl:if test="organica">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(organica/@visible)">
                                                                                            <td field="organica" data-row="{position()}" data-title="{../../../fields/organica/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="organica_desc" disable-output-escaping="yes"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_organica_fk" value="{organica}"/>
                                                                                                <input type="hidden" name="p_organica_fk_desc" value="{organica_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_organica_fk" value="{organica}"/>
                                                                                            <input type="hidden" name="p_organica_fk_desc" value="{organica_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="organica_sep">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="organica_sep">
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
                <!-- COLOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488978994946"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488978994946"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488978994946"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488978994946"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488978994946"/>
</xsl:stylesheet>