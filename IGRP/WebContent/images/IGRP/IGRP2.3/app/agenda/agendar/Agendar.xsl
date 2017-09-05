<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- SEPARATORLIST CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
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
                                    <div class="row" id="row-b6aa2189">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <xsl:if test="rows/content/box_1">
                                                    <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                        <div class="box-body" gen-preserve-content="true">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_1/fields"/>
                                                            <div>
                                                                <div class="row" id="row-593378d7">
                                                                    <div class="gen-column col-sm-6">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/page_title">
                                                                                <section class="content-header gen-container-item " gen-class="" item-name="page_title">
                                                                                    <h2>
                                                                                        <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                                                    </h2>
                                                                                </section>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                    <div class="gen-column col-sm-6">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_1">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                                                    <div class="btns-holder   pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                            <xsl:with-param name="outline" select="'false'"/>
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
                                                </xsl:if>
                                                <xsl:if test="rows/content/separatorlist_2">
                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_2">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/separatorlist_2/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_2" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_2/fields"/>
                                                                    <xsl:if test="rows/content/separatorlist_2/fields/agenda">
                                                                        <div class="col-sm-2 form-group  gen-fields-holder" item-name="agenda" item-type="select">
                                                                            <label for="{rows/content/separatorlist_2/fields/agenda/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_2/fields/agenda/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_2_agenda" name="{rows/content/separatorlist_2/fields/agenda/@name}">
                                                                                <xsl:for-each select="rows/content/separatorlist_2/fields/agenda/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_2/fields/data">
                                                                        <div class="form-group col-sm-2  gen-fields-holder" item-name="data" item-type="date" required="required">
                                                                            <label for="{rows/content/separatorlist_2/fields/data/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/data/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_2/fields/data/value}" class="form-control gen-date " id="separatorlist_2-data" name="{rows/content/separatorlist_2/fields/data/@name}" required="required" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-primary">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_2/fields/hora">
                                                                        <div class="form-group col-sm-3  gen-fields-holder" item-name="hora" item-type="date">
                                                                            <label for="{rows/content/separatorlist_2/fields/hora/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/hora/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_2/fields/hora/value}" class="form-control gen-date " id="separatorlist_2-hora" name="{rows/content/separatorlist_2/fields/hora/@name}" format="IGRP_timePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_2/fields/nome">
                                                                        <div class="form-group col-sm-2   gen-fields-holder" item-name="nome" item-type="text" required="required">
                                                                            <label for="{rows/content/separatorlist_2/fields/nome/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_2/fields/nome/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <input type="text" value="{rows/content/separatorlist_2/fields/nome/value}" class="form-control " id="{rows/content/separatorlist_2/fields/nome/@name}" name="{rows/content/separatorlist_2/fields/nome/@name}" required="required" maxlength="100" placeholder=""></input>
                                                                        </div>
                                                                    </xsl:if>
                                                                </div>
                                                            </div>
                                                            <div class="table-box box-body box-table-contents splist-table">
                                                                <table rel="T_separatorlist_2" id="separatorlist_2" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_2/fields/agenda">
                                                                                <xsl:if test="not(agenda/@visible)">
                                                                                    <th align="" item-name="agenda">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/agenda/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_2/fields/data">
                                                                                <xsl:if test="not(data/@visible)">
                                                                                    <th align="" item-name="data">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/data/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_2/fields/hora">
                                                                                <xsl:if test="not(hora/@visible)">
                                                                                    <th align="" item-name="hora">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/hora/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_2/fields/nome">
                                                                                <xsl:if test="not(nome/@visible)">
                                                                                    <th align="" item-name="nome">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_2/fields/nome/label"/>
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
                                                                        <xsl:for-each select="rows/content/separatorlist_2/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_2_id" value="{separatorlist_2_id}"/>
                                                                                <xsl:if test="agenda">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(agenda/@visible)">
                                                                                            <td field="agenda" data-row="{position()}" data-title="{../../../fields/agenda/label}" class="select" item-name="agenda">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="agenda_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_agenda_fk" value="{agenda}"/>
                                                                                                <input type="hidden" name="p_agenda_fk_desc" value="{agenda_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_agenda_fk" value="{agenda}"/>
                                                                                            <input type="hidden" name="p_agenda_fk_desc" value="{agenda_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="data">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(data/@visible)">
                                                                                            <td field="data" data-row="{position()}" data-title="{../../../fields/data/label}" class="date" item-name="data">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="data_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_data_fk" value="{data}"/>
                                                                                                <input type="hidden" name="p_data_fk_desc" value="{data_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_data_fk" value="{data}"/>
                                                                                            <input type="hidden" name="p_data_fk_desc" value="{data_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="hora">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(hora/@visible)">
                                                                                            <td field="hora" data-row="{position()}" data-title="{../../../fields/hora/label}" class="date" item-name="hora">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="hora_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_hora_fk" value="{hora}"/>
                                                                                                <input type="hidden" name="p_hora_fk_desc" value="{hora_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_hora_fk" value="{hora}"/>
                                                                                            <input type="hidden" name="p_hora_fk_desc" value="{hora_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="nome">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(nome/@visible)">
                                                                                            <td field="nome" data-row="{position()}" data-title="{../../../fields/nome/label}" class="text" item-name="nome">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="nome_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                                                                                <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_nome_fk" value="{nome}"/>
                                                                                            <input type="hidden" name="p_nome_fk_desc" value="{nome_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <td data-row="{position()}" class="table-btn">
                                                                                    <xsl:if test="not(@noupdate)">
                                                                                        <span class="table-row-edit btn btn-default " rel="separatorlist_2">
                                                                                            <i class="fa fa-pencil"/>
                                                                                        </span>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="not(@nodelete)">
                                                                                        <span class="table-row-remove btn btn-danger" rel="separatorlist_2">
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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/form_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/requerente">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="requerente" item-type="text" required="required">
                                                                        <label for="{rows/content/form_1/fields/requerente/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/requerente/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/requerente/value}" class="form-control " id="{rows/content/form_1/fields/requerente/@name}" name="{rows/content/form_1/fields/requerente/@name}" required="required" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/tipo_documento_de_identificacao">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="tipo_documento_de_identificacao" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/tipo_documento_de_identificacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/tipo_documento_de_identificacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_tipo_documento_de_identificacao" name="{rows/content/form_1/fields/tipo_documento_de_identificacao/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/tipo_documento_de_identificacao/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/documento_de_identificacao">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="documento_de_identificacao" item-type="number" required="required">
                                                                        <label for="{rows/content/form_1/fields/documento_de_identificacao/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/documento_de_identificacao/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/documento_de_identificacao/value}" class="form-control " id="{rows/content/form_1/fields/documento_de_identificacao/@name}" name="{rows/content/form_1/fields/documento_de_identificacao/@name}" required="required" min="" max="" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/email">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="email" item-type="email">
                                                                        <label for="{rows/content/form_1/fields/email/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/email/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="email" value="{rows/content/form_1/fields/email/value}" class="form-control " id="{rows/content/form_1/fields/email/@name}" name="{rows/content/form_1/fields/email/@name}" maxlength="100" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/telemovel">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="telemovel" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/telemovel/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/telemovel/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/telemovel/value}" class="form-control " id="{rows/content/form_1/fields/telemovel/@name}" name="{rows/content/form_1/fields/telemovel/@name}" min="" max="" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/telefone">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="telefone" item-type="number">
                                                                        <label for="{rows/content/form_1/fields/telefone/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/telefone/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="number" value="{rows/content/form_1/fields/telefone/value}" class="form-control " id="{rows/content/form_1/fields/telefone/@name}" name="{rows/content/form_1/fields/telefone/@name}" min="" max="" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/notificacao">
                                                                    <div class="col-sm-3  gen-fields-holder" item-name="notificacao" item-type="checkbox">
                                                                        <div class="form-group">
                                                                            <div class="checkbox form-check-offset">
                                                                                <label>
                                                                                    <input type="checkbox" name="{rows/content/form_1/fields/notificacao/@name}" value="1" class="checkbox " label="{rows/content/form_1/fields/notificacao/label}">
                                                                                        <xsl:if test="rows/content/form_1/fields/notificacao/value = '1'">
                                                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                        </xsl:if>
                                                                                    </input>
                                                                                    <span>
                                                                                        <xsl:value-of select="rows/content/form_1/fields/notificacao/label"/>
                                                                                    </span>
                                                                                </label>
                                                                            </div>
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
                <!-- SEPARATORLIST JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- FORM JS INCLUDES -->
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1503939754248"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1503939754249"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1503939754249"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1503939754249"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1503939754249"/>
</xsl:stylesheet>
