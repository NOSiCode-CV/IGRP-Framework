<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head" />
                <!-- TABCONTENT CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css" rel="stylesheet" />
                <!-- FORM CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" rel="stylesheet" />
                <!-- TABLE CSS INCLUDES -->
                <link type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" rel="stylesheet" />
                <!-- DATE CSS INCLUDES -->
                <link type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css" rel="stylesheet" />
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
                                                <xsl:apply-templates select="rows/content/messages" mode="igrp-messages" />
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " item-name="tabcontent_3" tab-template="default" gen-class="">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_3/fields/meus_dados">
                                                            <li class="active gen-fields-holder" rel="tab-tabcontent_3-meus_dados" item-name="meus_dados">
                                                                <a aria-expanded="true" href="#tab-tabcontent_3-meus_dados" data-toggle="tab">
                                                                    <i class="fa fa-user" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_3/fields/meus_dados/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_3/fields/sumario">
                                                            <li class=" gen-fields-holder" rel="tab-tabcontent_3-sumario" item-name="sumario">
                                                                <a aria-expanded="true" href="#tab-tabcontent_3-sumario" data-toggle="tab">
                                                                    <i class="fa fa-book" />
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_3/fields/sumario/label" />
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_3/fields/meus_dados">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_3-meus_dados" rel="tab-tabcontent_3-meus_dados">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_1">
                                                                                <div class="box igrp-forms gen-container-item " item-name="form_1" gen-class="">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates select="rows/content/form_1/fields" mode="form-hidden-fields" />
                                                                                            <xsl:if test="rows/content/form_1/fields/nome">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="nome">
                                                                                                    <label for="{rows/content/form_1/fields/nome/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/nome/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/nome/@name}" type="text" name="{rows/content/form_1/fields/nome/@name}" value="{rows/content/form_1/fields/nome/value}" placeholder="" maxlength="300"></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/data_nascimento">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="data_nascimento">
                                                                                                    <label for="{rows/content/form_1/fields/data_nascimento/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/data_nascimento/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/data_nascimento/@name}" type="text" name="{rows/content/form_1/fields/data_nascimento/@name}" value="{rows/content/form_1/fields/data_nascimento/value}" placeholder="" maxlength="30"></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/nacionalidade">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="nacionalidade">
                                                                                                    <label for="{rows/content/form_1/fields/nacionalidade/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/nacionalidade/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/nacionalidade/@name}" type="text" name="{rows/content/form_1/fields/nacionalidade/@name}" value="{rows/content/form_1/fields/nacionalidade/value}" placeholder="" maxlength="200"></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/naturalidade">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="naturalidade">
                                                                                                    <label for="{rows/content/form_1/fields/naturalidade/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/naturalidade/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/naturalidade/@name}" type="text" name="{rows/content/form_1/fields/naturalidade/@name}" value="{rows/content/form_1/fields/naturalidade/value}" placeholder="" maxlength="100"></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/concelho">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="concelho">
                                                                                                    <label for="{rows/content/form_1/fields/concelho/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/concelho/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/concelho/@name}" type="text" name="{rows/content/form_1/fields/concelho/@name}" value="{rows/content/form_1/fields/concelho/value}" placeholder="" maxlength="100"></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_1/fields/email">
                                                                                                <div class="form-group col-md-6   gen-fields-holder" item-type="text" item-name="email">
                                                                                                    <label for="{rows/content/form_1/fields/email/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_1/fields/email/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <input class="form-control " id="{rows/content/form_1/fields/email/@name}" type="text" name="{rows/content/form_1/fields/email/@name}" value="{rows/content/form_1/fields/email/value}" placeholder="" maxlength="200"></input>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons" />
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_2">
                                                                                <div class="box igrp-forms gen-container-item " item-name="form_2" gen-class="">
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates select="rows/content/form_2/fields" mode="form-hidden-fields" />
                                                                                            <xsl:if test="rows/content/form_2/fields/info_ano_letivo_corrente">
                                                                                                <div class="box-head subtitle gen-fields-holder">
                                                                                                    <xsl:value-of select="rows/content/form_2/fields/info_ano_letivo_corrente/label" />
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons" />
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_1">
                                                                                <div class="box box-table-contents gen-container-item " item-name="table_1" gen-class="">
                                                                                    <div class="box-body table-box">
                                                                                        <xsl:apply-templates select="rows/content/table_1/fields" mode="form-hidden-fields" />
                                                                                        <table class="table table-striped gen-data-table " id="table_1" exports="">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/table_1/fields/ano_dl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_1/fields/ano_dl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_1/fields/turma_dl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_1/fields/turma_dl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_1/fields/disciplinas_dl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_1/fields/disciplinas_dl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_1/fields/nr_alunos_dl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_1/fields/nr_alunos_dl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                                                    <tr>
                                                                                                        <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                                                        <xsl:if test="ano_dl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/ano_dl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="ano_dl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="turma_dl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/turma_dl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="turma_dl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="disciplinas_dl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/disciplinas_dl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="disciplinas_dl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="nr_alunos_dl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/nr_alunos_dl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="nr_alunos_dl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
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
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_3/fields/sumario">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_3-sumario" rel="tab-tabcontent_3-sumario">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/form_3">
                                                                                <div class="box igrp-forms gen-container-item " item-name="form_3" gen-class="">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/form_3/@title" />
                                                                                        <xsl:with-param name="collapsible" select="'true'" />
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body">
                                                                                        <div role="form">
                                                                                            <xsl:apply-templates select="rows/content/form_3/fields" mode="form-hidden-fields" />
                                                                                            <xsl:if test="rows/content/form_3/fields/data_sum">
                                                                                                <div class="form-group col-md-3  gen-fields-holder" item-type="date" item-name="data_sum">
                                                                                                    <label for="{rows/content/form_3/fields/data_sum/@name}">
                                                                                                        <span>
                                                                                                            <xsl:value-of select="rows/content/form_3/fields/data_sum/label" />
                                                                                                        </span>
                                                                                                    </label>
                                                                                                    <div class="input-group">
                                                                                                        <input class="form-control gen-date " id="form_3-data_sum" type="text" name="{rows/content/form_3/fields/data_sum/@name}" value="{rows/content/form_3/fields/data_sum/value}" maxlength="30" format="IGRP_datePicker" />
                                                                                                        <span class="input-group-btn gen-date-icon">
                                                                                                            <span class="btn btn-info">
                                                                                                                <i class="fa fa-calendar" />
                                                                                                            </span>
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                            <xsl:if test="rows/content/form_3/fields/sum_texo">
                                                                                                <div class="form-group col-md-9  gen-fields-holder" item-type="textarea" item-name="sum_texo">
                                                                                                    <label for="{rows/content/form_3/fields/sum_texo/@name}">
                                                                                                        <xsl:value-of select="rows/content/form_3/fields/sum_texo/label" />
                                                                                                    </label>
                                                                                                    <textarea class="textarea form-control " name="{rows/content/form_3/fields/sum_texo/@name}" maxlength="200">
                                                                                                        <xsl:value-of select="rows/content/form_3/fields/sum_texo/value" />
                                                                                                    </textarea>
                                                                                                </div>
                                                                                            </xsl:if>
                                                                                        </div>
                                                                                    </div>
                                                                                    <xsl:apply-templates select="rows/content/form_3/tools-bar" mode="form-buttons" />
                                                                                </div>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/table_2">
                                                                                <div class="box box-table-contents gen-container-item " item-name="table_2" gen-class="">
                                                                                    <xsl:call-template name="box-header">
                                                                                        <xsl:with-param name="title" select="rows/content/table_2/@title" />
                                                                                        <xsl:with-param name="collapsible" select="'true'" />
                                                                                    </xsl:call-template>
                                                                                    <div class="box-body table-box">
                                                                                        <xsl:apply-templates select="rows/content/table_2/fields" mode="form-hidden-fields" />
                                                                                        <table class="table table-striped gen-data-table " id="table_2" exports="null">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <xsl:if test="rows/content/table_2/fields/turmas_sl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_2/fields/turmas_sl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_2/fields/disciplinas_sl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_2/fields/disciplinas_sl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_2/fields/hora_inicio_sl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_2/fields/hora_inicio_sl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_2/fields/hora_fim_sl">
                                                                                                        <th class=" gen-fields-holder" align="left">
                                                                                                            <span>
                                                                                                                <xsl:value-of select="rows/content/table_2/fields/hora_fim_sl/label" />
                                                                                                            </span>
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                    <xsl:if test="rows/content/table_2/fields/marcar_sl">
                                                                                                        <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                                            <input class="IGRP_checkall" type="checkbox" check-rel="marcar_sl" />
                                                                                                        </th>
                                                                                                    </xsl:if>
                                                                                                </tr>
                                                                                            </thead>
                                                                                            <tbody>
                                                                                                <xsl:for-each select="rows/content/table_2/table/value/row">
                                                                                                    <tr>
                                                                                                        <xsl:apply-templates select="context-menu" mode="context-param" />
                                                                                                        <xsl:if test="turmas_sl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/turmas_sl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="turmas_sl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="disciplinas_sl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/disciplinas_sl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="disciplinas_sl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="hora_inicio_sl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/hora_inicio_sl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="hora_inicio_sl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="hora_fim_sl">
                                                                                                            <td class="text" align="left" data-title="{../../fields/hora_fim_sl/label}" data-row="{position()}">
                                                                                                                <span class="">
                                                                                                                    <xsl:value-of select="hora_fim_sl" />
                                                                                                                </span>
                                                                                                            </td>
                                                                                                        </xsl:if>
                                                                                                        <xsl:if test="marcar_sl">
                                                                                                            <td class="bs-checkbox" align="" data-title="{../../label/marcar_sl}" data-row="{position()}">
                                                                                                                <xsl:if test="marcar_sl != '-0'">
                                                                                                                    <input type="checkbox" name="p_marcar_sl" value="{marcar_sl}" check-rel="marcar_sl">
                                                                                                                        <xsl:if test="marcar_sl_check=marcar_sl">
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
                                                                        </div>
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
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom" />
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js" />
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js" />
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js" />
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490091969277" />
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490091969277" />
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490091969277" />
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490091969277" />
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490091969277" />
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1490091969277" />
</xsl:stylesheet>