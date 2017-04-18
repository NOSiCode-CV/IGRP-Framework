<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <!-- COLOR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
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
                                                <xsl:if test="rows/content/pag_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="pag_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/pag_title/fields/pag_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
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
                                                                <xsl:if test="rows/content/form_1/fields/objetivo">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="objetivo" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/objetivo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/objetivo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/objetivo/value}" class="form-control " id="{rows/content/form_1/fields/objetivo/@name}" name="{rows/content/form_1/fields/objetivo/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/descricao">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="descricao" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/descricao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/descricao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/descricao/value}" class="form-control " id="{rows/content/form_1/fields/descricao/@name}" name="{rows/content/form_1/fields/descricao/@name}" maxlength="500" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/grupo">
                                                                    <div class="col-md-4 form-group  gen-fields-holder" item-name="grupo" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/grupo/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/grupo/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_grupo" name="{rows/content/form_1/fields/grupo/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/grupo/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/pontos_de">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="pontos_de" item-type="number" required="required">
                                                                        <label for="{rows/content/form_1/fields/pontos_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/pontos_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/pontos_de/value}" class="form-control " id="{rows/content/form_1/fields/pontos_de/@name}" name="{rows/content/form_1/fields/pontos_de/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/pontos_ate">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="pontos_ate" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/pontos_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/pontos_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/pontos_ate/value}" class="form-control " id="{rows/content/form_1/fields/pontos_ate/@name}" name="{rows/content/form_1/fields/pontos_ate/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/cor">
                                                                    <div class="form-group col-md-4  gen-fields-holder" item-name="cor" item-type="color">
                                                                        <label for="{rows/content/form_1/fields/cor/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/cor/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group form-color-picker" id="form_1_cor_colorp">
                                                                            <input type="text" value="{rows/content/form_1/fields/cor/value}" format="hex" class="form-control" id="form_1_cor" name="{rows/content/form_1/fields/cor/@name}"/>
                                                                            <span class="input-group-addon">
                                                                                <i/>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/imagem">
                                                                    <div class="form-group col-md-4  gen-fields-holder" item-name="imagem" item-type="file">
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
                                                                <xsl:if test="rows/content/form_1/fields/ver_imagem">
                                                                    <div class="form-group col-md-4  gen-fields-holder" item-name="ver_imagem" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/ver_imagem/value}" class="link btn btn-success form-link" target="_blank">
                                                                            <i class="fa fa-eye"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/ver_imagem/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/estado">
                                                                    <div class="col-md-4 form-group  gen-fields-holder" item-name="estado" item-type="select" required="required">
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
                                                <xsl:if test="rows/content/sep_org">
                                                    <div class="box gen-container-item " gen-class="" item-name="sep_org">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/sep_org/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="sep_org" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_org/fields"/>
                                                                    <xsl:if test="rows/content/sep_org/fields/organica">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="organica" item-type="select" required="required">
                                                                            <label for="{rows/content/sep_org/fields/organica/@name}">
                                                                                <xsl:value-of select="rows/content/sep_org/fields/organica/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_org_organica" name="{rows/content/sep_org/fields/organica/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_org/fields/organica/list/option">
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
                                                                <table rel="T_sep_org" id="sep_org" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_org/fields/organica">
                                                                                <xsl:if test="not(organica/@visible)">
                                                                                    <th align="" item-name="organica">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_org/fields/organica/label"/>
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
                                                                        <xsl:for-each select="rows/content/sep_org/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_org_id" value="{sep_org_id}"/>
                                                                                <xsl:if test="organica">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(organica/@visible)">
                                                                                            <td field="organica" data-row="{position()}" data-title="{../../../fields/organica/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="organica_desc"/>
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
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_org">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_org">
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
                                                <xsl:if test="rows/content/sep_met">
                                                    <div class="box gen-container-item " gen-class="" item-name="sep_met">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/sep_met/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="sep_met" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/sep_met/fields"/>
                                                                    <xsl:if test="rows/content/sep_met/fields/tipo_de_metrica">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_de_metrica" item-type="select" required="required">
                                                                            <label for="{rows/content/sep_met/fields/tipo_de_metrica/@name}">
                                                                                <xsl:value-of select="rows/content/sep_met/fields/tipo_de_metrica/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_met_tipo_de_metrica" name="{rows/content/sep_met/fields/tipo_de_metrica/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_met/fields/tipo_de_metrica/list/option">
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
                                                                    <xsl:if test="rows/content/sep_met/fields/metricas">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="metricas" item-type="select" required="required">
                                                                            <label for="{rows/content/sep_met/fields/metricas/@name}">
                                                                                <xsl:value-of select="rows/content/sep_met/fields/metricas/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_met_metricas" name="{rows/content/sep_met/fields/metricas/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_met/fields/metricas/list/option">
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
                                                                    <xsl:if test="rows/content/sep_met/fields/pontos">
                                                                        <div class="form-group col-md-3   gen-fields-holder" item-name="pontos" item-type="number" required="required">
                                                                            <label for="{rows/content/sep_met/fields/pontos/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_met/fields/pontos/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="number" value="{rows/content/sep_met/fields/pontos/value}" class="form-control " id="{rows/content/sep_met/fields/pontos/@name}" name="{rows/content/sep_met/fields/pontos/@name}" required="required" maxlength="30" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_met/fields/estado_sep_org">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="estado_sep_org" item-type="select" required="required">
                                                                            <label for="{rows/content/sep_met/fields/estado_sep_org/@name}">
                                                                                <xsl:value-of select="rows/content/sep_met/fields/estado_sep_org/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="sep_met_estado_sep_org" name="{rows/content/sep_met/fields/estado_sep_org/@name}" required="required">
                                                                                <xsl:for-each select="rows/content/sep_met/fields/estado_sep_org/list/option">
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
                                                                    <xsl:if test="rows/content/sep_met/fields/date_de">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="date_de" item-type="date">
                                                                            <label for="{rows/content/sep_met/fields/date_de/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_met/fields/date_de/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_met/fields/date_de/value}" class="form-control gen-date " id="sep_met-date_de" name="{rows/content/sep_met/fields/date_de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/sep_met/fields/data_ate">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="data_ate" item-type="date">
                                                                            <label for="{rows/content/sep_met/fields/data_ate/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/sep_met/fields/data_ate/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/sep_met/fields/data_ate/value}" class="form-control gen-date " id="sep_met-data_ate" name="{rows/content/sep_met/fields/data_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_sep_met" id="sep_met" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/sep_met/fields/tipo_de_metrica">
                                                                                <xsl:if test="not(tipo_de_metrica/@visible)">
                                                                                    <th align="" item-name="tipo_de_metrica">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_met/fields/tipo_de_metrica/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_met/fields/metricas">
                                                                                <xsl:if test="not(metricas/@visible)">
                                                                                    <th align="" item-name="metricas">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_met/fields/metricas/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_met/fields/pontos">
                                                                                <xsl:if test="not(pontos/@visible)">
                                                                                    <th align="" item-name="pontos">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_met/fields/pontos/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_met/fields/estado_sep_org">
                                                                                <xsl:if test="not(estado_sep_org/@visible)">
                                                                                    <th align="" item-name="estado_sep_org">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_met/fields/estado_sep_org/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_met/fields/date_de">
                                                                                <xsl:if test="not(date_de/@visible)">
                                                                                    <th align="" item-name="date_de">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_met/fields/date_de/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/sep_met/fields/data_ate">
                                                                                <xsl:if test="not(data_ate/@visible)">
                                                                                    <th align="" item-name="data_ate">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/sep_met/fields/data_ate/label"/>
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
                                                                        <xsl:for-each select="rows/content/sep_met/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_sep_met_id" value="{sep_met_id}"/>
                                                                                <xsl:if test="tipo_de_metrica">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(tipo_de_metrica/@visible)">
                                                                                            <td field="tipo_de_metrica" data-row="{position()}" data-title="{../../../fields/tipo_de_metrica/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="tipo_de_metrica_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_tipo_de_metrica_fk" value="{tipo_de_metrica}"/>
                                                                                                <input type="hidden" name="p_tipo_de_metrica_fk_desc" value="{tipo_de_metrica_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_tipo_de_metrica_fk" value="{tipo_de_metrica}"/>
                                                                                            <input type="hidden" name="p_tipo_de_metrica_fk_desc" value="{tipo_de_metrica_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="metricas">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(metricas/@visible)">
                                                                                            <td field="metricas" data-row="{position()}" data-title="{../../../fields/metricas/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="metricas_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_metricas_fk" value="{metricas}"/>
                                                                                                <input type="hidden" name="p_metricas_fk_desc" value="{metricas_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_metricas_fk" value="{metricas}"/>
                                                                                            <input type="hidden" name="p_metricas_fk_desc" value="{metricas_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="pontos">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(pontos/@visible)">
                                                                                            <td field="pontos" data-row="{position()}" data-title="{../../../fields/pontos/label}" class="number">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="pontos_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_pontos_fk" value="{pontos}"/>
                                                                                                <input type="hidden" name="p_pontos_fk_desc" value="{pontos_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_pontos_fk" value="{pontos}"/>
                                                                                            <input type="hidden" name="p_pontos_fk_desc" value="{pontos_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="estado_sep_org">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(estado_sep_org/@visible)">
                                                                                            <td field="estado_sep_org" data-row="{position()}" data-title="{../../../fields/estado_sep_org/label}" class="select">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="estado_sep_org_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_estado_sep_org_fk" value="{estado_sep_org}"/>
                                                                                                <input type="hidden" name="p_estado_sep_org_fk_desc" value="{estado_sep_org_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_estado_sep_org_fk" value="{estado_sep_org}"/>
                                                                                            <input type="hidden" name="p_estado_sep_org_fk_desc" value="{estado_sep_org_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="date_de">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(date_de/@visible)">
                                                                                            <td field="date_de" data-row="{position()}" data-title="{../../../fields/date_de/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="date_de_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_date_de_fk" value="{date_de}"/>
                                                                                                <input type="hidden" name="p_date_de_fk_desc" value="{date_de_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_date_de_fk" value="{date_de}"/>
                                                                                            <input type="hidden" name="p_date_de_fk_desc" value="{date_de_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="data_ate">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(data_ate/@visible)">
                                                                                            <td field="data_ate" data-row="{position()}" data-title="{../../../fields/data_ate/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="data_ate_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_data_ate_fk" value="{data_ate}"/>
                                                                                                <input type="hidden" name="p_data_ate_fk_desc" value="{data_ate_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_data_ate_fk" value="{data_ate}"/>
                                                                                            <input type="hidden" name="p_data_ate_fk_desc" value="{data_ate_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="sep_met">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="sep_met">
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
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_tipo_de_metrica":[{"name":"CHANGE_TIPO_METRICAS","event":"change","condition":"notnull","value":"","value2":"","patern":"","patern_custom":"","action":"remote_combobox","targets":"metricas","procedure":"SA.SA_OBJETIVOS_DB.GET_SQL_METRICAS_RULLE","msg_type":"","msg":"","opposite":"1","isTable":false}]});</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1489668919140"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1489668919140"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1489668919140"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1489668919140"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1489668919140"/>
</xsl:stylesheet>