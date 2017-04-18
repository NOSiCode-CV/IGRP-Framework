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
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
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
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/mn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="mn">
                                                        <div class="btns-holder btn-group-lg pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/mn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/filter_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="filter_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/filter_1/fields"/>
                                                                <xsl:if test="rows/content/filter_1/fields/cidade_zona">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="cidade_zona" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/cidade_zona/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/cidade_zona/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="filter_1_cidade_zona" name="{rows/content/filter_1/fields/cidade_zona/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/cidade_zona/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/bairro_lugar">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="bairro_lugar" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/bairro_lugar/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/bairro_lugar/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_bairro_lugar" name="{rows/content/filter_1/fields/bairro_lugar/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/bairro_lugar/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/n_processo">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="n_processo" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/n_processo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/n_processo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/n_processo/value}" class="form-control" id="{rows/content/filter_1/fields/n_processo/@name}" name="{rows/content/filter_1/fields/n_processo/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/n_poligno">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="n_poligno" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/n_poligno/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/n_poligno/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/n_poligno/value}" class="form-control" id="{rows/content/filter_1/fields/n_poligno/@name}" name="{rows/content/filter_1/fields/n_poligno/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/codigo_claim">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="codigo_claim" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/codigo_claim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/codigo_claim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/codigo_claim/value}" class="form-control" id="{rows/content/filter_1/fields/codigo_claim/@name}" name="{rows/content/filter_1/fields/codigo_claim/@name}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/nip">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nip" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/nip/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nip/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/nip/value}" class="form-control" id="{rows/content/filter_1/fields/nip/@name}" name="{rows/content/filter_1/fields/nip/@name}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_de">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_de" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_de/value}" class="form-control gen-date" id="filter_1-data_de" name="{rows/content/filter_1/fields/data_de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_ate">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_ate" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_ate/value}" class="form-control gen-date" id="filter_1-data_ate" name="{rows/content/filter_1/fields/data_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/nome_prop">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome_prop" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/nome_prop/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nome_prop/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/nome_prop/value}" class="form-control" id="{rows/content/filter_1/fields/nome_prop/@name}" name="{rows/content/filter_1/fields/nome_prop/@name}" maxlength="4000" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/nif">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nif" item-type="number">
                                                                        <label for="{rows/content/filter_1/fields/nif/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nif/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/filter_1/fields/nif/value}" class="form-control" id="{rows/content/filter_1/fields/nif/@name}" name="{rows/content/filter_1/fields/nif/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/nm_predio">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nm_predio" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/nm_predio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nm_predio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/nm_predio/value}" class="form-control" id="{rows/content/filter_1/fields/nm_predio/@name}" name="{rows/content/filter_1/fields/nm_predio/@name}" maxlength="400" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/tp_predio">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tp_predio" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/tp_predio/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/tp_predio/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_tp_predio" name="{rows/content/filter_1/fields/tp_predio/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/tp_predio/list/option">
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
                                                        <xsl:apply-templates select="rows/content/filter_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/n_processo_desc">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/n_processo_desc/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/nip_desc">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/nip_desc/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/nome_prop_desc">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/nome_prop_desc/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/tipo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tipo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/cidade_bairro_desc">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/cidade_bairro_desc/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/area">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/area/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/poligono">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/poligono/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/data_homologacao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/data_homologacao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ver_poligno">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ver_poligno/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ver_cip">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ver_cip/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <input type="hidden" name="p_estado_nip_desc_fk" value="{estado_nip_desc}"/>
                                                                            <input type="hidden" name="p_estado_nip_desc_fk_desc" value="{estado_nip_desc_desc}"/>
                                                                            <input type="hidden" name="p_ba_unit_id_fk" value="{ba_unit_id}"/>
                                                                            <input type="hidden" name="p_ba_unit_id_fk_desc" value="{ba_unit_id_desc}"/>
                                                                            <input type="hidden" name="p_transaction_id_fk" value="{transaction_id}"/>
                                                                            <input type="hidden" name="p_transaction_id_fk_desc" value="{transaction_id_desc}"/>
                                                                            <input type="hidden" name="p_auxliar1_fk" value="{auxliar1}"/>
                                                                            <input type="hidden" name="p_auxliar1_fk_desc" value="{auxliar1_desc}"/>
                                                                            <input type="hidden" name="p_auxiliar2_fk" value="{auxiliar2}"/>
                                                                            <input type="hidden" name="p_auxiliar2_fk_desc" value="{auxiliar2_desc}"/>
                                                                            <xsl:if test="n_processo_desc">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_processo_desc/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_processo_desc"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nip_desc">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nip_desc/label}" class="text">
                                                                                    <span class="lookup-parser">
                                                                                        <xsl:value-of select="nip_desc"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nome_prop_desc">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nome_prop_desc/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome_prop_desc"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="tipo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/tipo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="cidade_bairro_desc">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/cidade_bairro_desc/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="cidade_bairro_desc"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="area">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/area/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="area"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="poligono">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/poligono/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="poligono"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_homologacao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_homologacao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_homologacao"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ver_poligno">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/ver_poligno}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="ver_poligno != ''">
                                                                                            <a href="{ver_poligno}" class="link bClick" target="_blank" name="ver_poligno">
                                                                                                <xsl:value-of select="ver_poligno_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="ver_poligno_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ver_cip">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/ver_cip}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="ver_cip != ''">
                                                                                            <a href="{ver_cip}" class="link bClick" target="_blank" name="ver_cip">
                                                                                                <xsl:value-of select="ver_cip_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="ver_cip_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/gen_table/table/context-menu" mode="table-context-menu"/>
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488892757845"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488892757845"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488892757845"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488892757845"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488892757845"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1488892757845"/>
</xsl:stylesheet>