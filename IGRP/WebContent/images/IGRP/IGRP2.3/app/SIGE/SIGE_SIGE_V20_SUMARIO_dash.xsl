<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TOOLSBAR CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css" rel="stylesheet" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- TABLE CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" rel="stylesheet" />
                <!-- DATE CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" />
                <!-- SELECT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/select2/select2.min.css" rel="stylesheet" />
                <link type="text/css" href="{$path}/plugins/select2/select2.style.css" rel="stylesheet" />
                <style />
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu" />
                <form class="IGRP-form" name="formular_default" method="POST" enctype="multipart/form-data">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar" />
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title" gen-class="">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value" />
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-fields=".btns-holder a.btn" item-name="fmn" gen-class="" gen-structure="toolsbar">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'" />
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                <xsl:if test="rows/content/form_1/fields/resumo">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/resumo/label" />
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-type="date" item-name="data">
                                                                        <label for="{rows/content/form_1/fields/data/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data/label" />
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input class="form-control gen-date IGRP_change" id="form_1-data" type="text" name="{rows/content/form_1/fields/data/@name}" value="{rows/content/form_1/fields/data/value}" maxlength="30" format="IGRP_datePicker" />
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar" />
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/sumario">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-type="textarea" item-name="sumario">
                                                                        <label for="{rows/content/form_1/fields/sumario/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/sumario/label" />
                                                                        </label>
                                                                        <textarea class="textarea form-control " name="{rows/content/form_1/fields/sumario/@name}" maxlength="500">
                                                                            <xsl:value-of select="rows/content/form_1/fields/sumario/value" />
                                                                        </textarea>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/alunos_turma">
                                                                    <div class="box-head subtitle gen-fields-holder">
                                                                        <xsl:value-of select="rows/content/form_1/fields/alunos_turma/label" />
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/turma">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="turma">
                                                                        <label for="{rows/content/form_1/fields/turma/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/turma/label" />
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_turma" name="{rows/content/form_1/fields/turma/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/turma/list/option">
                                                                                <option label="{text}" value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/hora">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-type="select" item-name="hora">
                                                                        <label for="{rows/content/form_1/fields/hora/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/hora/label" />
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_hora" name="{rows/content/form_1/fields/hora/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/hora/list/option">
                                                                                <option label="{text}" value="{value}">
                                                                                    <xsl:if test="@selected='true'">
                                                                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                                                                    </xsl:if>
                                                                                    <span>
                                                                                        <xsl:value-of select="text" />
                                                                                    </span>
                                                                                </option>
                                                                            </xsl:for-each>
                                                                        </select>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/lista_turma">
                                                    <div class="box box-table-contents gen-container-item " item-name="lista_turma" gen-class="">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/lista_turma/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/lista_turma/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="lista_turma" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/lista_turma/fields/ano_curricular">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_turma/fields/ano_curricular/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_turma/fields/turma_sumario">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_turma/fields/turma_sumario/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_turma/fields/disc_turma">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_turma/fields/disc_turma/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_turma/fields/hora_inicio">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_turma/fields/hora_inicio/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_turma/fields/hora_fim">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_turma/fields/hora_fim/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_turma/fields/sumario_texto">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_turma/fields/sumario_texto/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_turma/fields/marcar_turmas">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input class="IGRP_checkall" type="checkbox" check-rel="marcar_turmas" />
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/lista_turma/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                            <xsl:if test="ano_curricular">
                                                                                <td class="text" align="left" data-title="{../../fields/ano_curricular/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="ano_curricular" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="turma_sumario">
                                                                                <td class="text" align="left" data-title="{../../fields/turma_sumario/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="turma_sumario" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="disc_turma">
                                                                                <td class="text" align="left" data-title="{../../fields/disc_turma/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="disc_turma" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="hora_inicio">
                                                                                <td class="text" align="left" data-title="{../../fields/hora_inicio/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="hora_inicio" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="hora_fim">
                                                                                <td class="text" align="left" data-title="{../../fields/hora_fim/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="hora_fim" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="sumario_texto">
                                                                                <td class="text" align="left" data-title="{../../fields/sumario_texto/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="sumario_texto" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="marcar_turmas">
                                                                                <td class="bs-checkbox" align="" data-title="{../../label/marcar_turmas}" data-row="{position()}">
                                                                                    <xsl:if test="marcar_turmas != '-0'">
                                                                                        <input type="checkbox" name="p_marcar_turmas" value="{marcar_turmas}" check-rel="marcar_turmas">
                                                                                            <xsl:if test="marcar_turmas_check=marcar_turmas">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/lista_alunos">
                                                    <div class="box box-table-contents gen-container-item " item-name="lista_alunos" gen-class="">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/lista_alunos/@title" />
                                                            <xsl:with-param name="collapsible" select="'true'" />
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/lista_alunos/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="lista_alunos" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/lista_alunos/fields/nome">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_alunos/fields/nome/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_alunos/fields/total_faltas">
                                                                            <th class=" gen-fields-holder" align="left">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/lista_alunos/fields/total_faltas/label" />
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_alunos/fields/falta_presenca">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input class="IGRP_checkall" type="checkbox" check-rel="falta_presenca" />
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/lista_alunos/fields/falta_injustificada">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input class="IGRP_checkall" type="checkbox" check-rel="falta_injustificada" />
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/lista_alunos/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                            <xsl:if test="nome">
                                                                                <td class="text" align="left" data-title="{../../fields/nome/label}" data-row="{position()}">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome" />
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="total_faltas">
                                                                                <td class="link" align="left" data-title="{../../label/total_faltas}" data-row="{position()}">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="total_faltas != ''">
                                                                                            <a class="link bClick" href="{total_faltas}" name="total_faltas" target="_self">
                                                                                                <xsl:value-of select="total_faltas_desc" />
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="total_faltas_desc" />
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="falta_presenca">
                                                                                <td class="bs-checkbox" align="" data-title="{../../label/falta_presenca}" data-row="{position()}">
                                                                                    <xsl:if test="falta_presenca != '-0'">
                                                                                        <input type="checkbox" name="p_falta_presenca" value="{falta_presenca}" check-rel="falta_presenca">
                                                                                            <xsl:if test="falta_presenca_check=falta_presenca">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="falta_injustificada">
                                                                                <td class="bs-checkbox" align="" data-title="{../../label/falta_injustificada}" data-row="{position()}">
                                                                                    <xsl:if test="falta_injustificada != '-0'">
                                                                                        <input type="checkbox" name="p_falta_injustificada" value="{falta_injustificada}" check-rel="falta_injustificada">
                                                                                            <xsl:if test="falta_injustificada_check=falta_injustificada">
                                                                                                <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                            </xsl:if>
                                                                                        </input>
                                                                                    </xsl:if>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table" gen-class="">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates select="rows/content/gen_table/fields" mode="form-hidden-fields" />
                                                            <table class="table table-striped gen-data-table " id="gen_table" exports="">
                                                                <thead>
                                                                    <tr></tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
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
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js" />
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js" />
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js" />
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490198621483" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490198621483" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490198621483" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490198621483" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490198621483" />
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1490198621483" />
</xsl:stylesheet>