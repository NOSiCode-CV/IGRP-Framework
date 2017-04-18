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
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_1">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                                        <xsl:if test="rows/content/form_1/fields/funcionario">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="funcionario" item-type="text">
                                                                                                <label for="{rows/content/form_1/fields/funcionario/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_1/fields/funcionario/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_1/fields/funcionario/value}" class="form-control " id="{rows/content/form_1/fields/funcionario/@name}" name="{rows/content/form_1/fields/funcionario/@name}" readonly="readonly" maxlength="50" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/form_2">
                                                                            <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_2">
                                                                                <div class="box-body">
                                                                                    <div role="form">
                                                                                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_2/fields"/>
                                                                                        <xsl:if test="rows/content/form_2/fields/abono">
                                                                                            <div class="form-group col-md-6   gen-fields-holder" item-name="abono" item-type="text">
                                                                                                <label for="{rows/content/form_2/fields/abono/@name}">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/form_2/fields/abono/label"/>
                                                                                                    </span>
                                                                                                </label>
                                                                                                <input type="text" value="{rows/content/form_2/fields/abono/value}" class="form-control " id="{rows/content/form_2/fields/abono/@name}" name="{rows/content/form_2/fields/abono/@name}" readonly="readonly" maxlength="50" placeholder=""></input>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                </div>
                                                                                <xsl:apply-templates select="rows/content/form_2/tools-bar" mode="form-buttons"/>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <xsl:if test="rows/content/separatorlist_1">
                                                    <div class="box gen-container-item " gen-class="" item-name="separatorlist_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/separatorlist_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body IGRP-separatorlist" tag="separatorlist_1" dialog="false">
                                                            <div class="splist-form-holder">
                                                                <div class="splist-form" role="form">
                                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/nome">
                                                                        <div class="col-md-3 form-group  gen-fields-holder" item-name="nome" item-type="select">
                                                                            <label for="{rows/content/separatorlist_1/fields/nome/@name}">
                                                                                <xsl:value-of select="rows/content/separatorlist_1/fields/nome/label"/>
                                                                            </label>
                                                                            <select class="form-control select2 " id="separatorlist_1_nome" name="{rows/content/separatorlist_1/fields/nome/@name}">
                                                                                <xsl:for-each select="rows/content/separatorlist_1/fields/nome/list/option">
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
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/inscricao">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="inscricao" item-type="date">
                                                                            <label for="{rows/content/separatorlist_1/fields/inscricao/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/inscricao/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/inscricao/value}" class="form-control gen-date " id="separatorlist_1-inscricao" name="{rows/content/separatorlist_1/fields/inscricao/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/data_inicio">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                            <label for="{rows/content/separatorlist_1/fields/data_inicio/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/data_inicio/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/data_inicio/value}" class="form-control gen-date " id="separatorlist_1-data_inicio" name="{rows/content/separatorlist_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                                <span class="input-group-btn gen-date-icon">
                                                                                    <span class="btn btn-default">
                                                                                        <i class="fa fa-calendar"/>
                                                                                    </span>
                                                                                </span>
                                                                            </div>
                                                                        </div>
                                                                    </xsl:if>
                                                                    <xsl:if test="rows/content/separatorlist_1/fields/data_fim">
                                                                        <div class="form-group col-md-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                            <label for="{rows/content/separatorlist_1/fields/data_fim/@name}">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/separatorlist_1/fields/data_fim/label"/>
                                                                                </span>
                                                                            </label>
                                                                            <div class="input-group">
                                                                                <input type="text" value="{rows/content/separatorlist_1/fields/data_fim/value}" class="form-control gen-date " id="separatorlist_1-data_fim" name="{rows/content/separatorlist_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                                <table rel="T_separatorlist_1" id="separatorlist_1" class="table table-striped gen-data-table">
                                                                    <thead>
                                                                        <tr>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/nome">
                                                                                <xsl:if test="not(nome/@visible)">
                                                                                    <th align="" item-name="nome">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/nome/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/inscricao">
                                                                                <xsl:if test="not(inscricao/@visible)">
                                                                                    <th align="" item-name="inscricao">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/inscricao/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/data_inicio">
                                                                                <xsl:if test="not(data_inicio/@visible)">
                                                                                    <th align="" item-name="data_inicio">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/data_inicio/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </xsl:if>
                                                                            <xsl:if test="rows/content/separatorlist_1/fields/data_fim">
                                                                                <xsl:if test="not(data_fim/@visible)">
                                                                                    <th align="" item-name="data_fim">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/separatorlist_1/fields/data_fim/label"/>
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
                                                                        <xsl:for-each select="rows/content/separatorlist_1/table/value/row">
                                                                            <tr>
                                                                                <input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
                                                                                <xsl:if test="nome">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(nome/@visible)">
                                                                                            <td field="nome" data-row="{position()}" data-title="{../../../fields/nome/label}" class="select">
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
                                                                                <xsl:if test="inscricao">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(inscricao/@visible)">
                                                                                            <td field="inscricao" data-row="{position()}" data-title="{../../../fields/inscricao/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="inscricao_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_inscricao_fk" value="{inscricao}"/>
                                                                                                <input type="hidden" name="p_inscricao_fk_desc" value="{inscricao_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_inscricao_fk" value="{inscricao}"/>
                                                                                            <input type="hidden" name="p_inscricao_fk_desc" value="{inscricao_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="data_inicio">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(data_inicio/@visible)">
                                                                                            <td field="data_inicio" data-row="{position()}" data-title="{../../../fields/data_inicio/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="data_inicio_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_data_inicio_fk" value="{data_inicio}"/>
                                                                                                <input type="hidden" name="p_data_inicio_fk_desc" value="{data_inicio_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_data_inicio_fk" value="{data_inicio}"/>
                                                                                            <input type="hidden" name="p_data_inicio_fk_desc" value="{data_inicio_desc}"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:if>
                                                                                <xsl:if test="data_fim">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="not(data_fim/@visible)">
                                                                                            <td field="data_fim" data-row="{position()}" data-title="{../../../fields/data_fim/label}" class="date">
                                                                                                <span class="separator-list-td-val">
                                                                                                    <xsl:value-of select="data_fim_desc"/>
                                                                                                </span>
                                                                                                <input type="hidden" name="p_data_fim_fk" value="{data_fim}"/>
                                                                                                <input type="hidden" name="p_data_fim_fk_desc" value="{data_fim_desc}"/>
                                                                                            </td>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <input type="hidden" name="p_data_fim_fk" value="{data_fim}"/>
                                                                                            <input type="hidden" name="p_data_fim_fk_desc" value="{data_fim_desc}"/>
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
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492434332152"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492434332152"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492434332152"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492434332152"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1492434332152"/>
</xsl:stylesheet>