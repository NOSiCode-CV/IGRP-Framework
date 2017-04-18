<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
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
                                                <xsl:if test="rows/content/filter_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="filter_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/filter_1/fields"/>
                                                                <xsl:if test="rows/content/filter_1/fields/data_inicio">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_inicio/value}" class="form-control gen-date " id="filter_1-data_inicio" name="{rows/content/filter_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_fim">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_fim/value}" class="form-control gen-date " id="filter_1-data_fim" name="{rows/content/filter_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/numero_pedido">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="numero_pedido" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/numero_pedido/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/numero_pedido/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/numero_pedido/value}" class="form-control " id="{rows/content/filter_1/fields/numero_pedido/@name}" name="{rows/content/filter_1/fields/numero_pedido/@name}" maxlength="50" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/tipo_pedido">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_pedido" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/tipo_pedido/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/tipo_pedido/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_tipo_pedido" name="{rows/content/filter_1/fields/tipo_pedido/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/tipo_pedido/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/tipo_documento">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="tipo_documento" item-type="select">
                                                                        <label for="{rows/content/filter_1/fields/tipo_documento/@name}">
                                                                            <xsl:value-of select="rows/content/filter_1/fields/tipo_documento/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="filter_1_tipo_documento" name="{rows/content/filter_1/fields/tipo_documento/@name}">
                                                                            <xsl:for-each select="rows/content/filter_1/fields/tipo_documento/list/option">
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
                                                                <xsl:if test="rows/content/filter_1/fields/numero_documento">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="numero_documento" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/numero_documento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/numero_documento/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/numero_documento/value}" class="form-control " id="{rows/content/filter_1/fields/numero_documento/@name}" name="{rows/content/filter_1/fields/numero_documento/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/nome">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="nome" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/nome/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nome/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/nome/value}" class="form-control " id="{rows/content/filter_1/fields/nome/@name}" name="{rows/content/filter_1/fields/nome/@name}" maxlength="500" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/filter_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/tb_toolsbar">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="tb_toolsbar">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/tb_toolsbar" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table " exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/numero_pedido">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/numero_pedido/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/duc">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/duc/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/tipo_pedido">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tipo_pedido/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/tipo_documento">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tipo_documento/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/numero_documento">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/numero_documento/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/nome">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/nome/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/residencia">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/residencia/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/data">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/data/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="numero_pedido">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/numero_pedido}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="numero_pedido != ''">
                                                                                            <a href="{numero_pedido}" class="link bClick" target="_self" name="numero_pedido">
                                                                                                <xsl:value-of select="numero_pedido_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="numero_pedido_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="duc">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/duc}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="duc != ''">
                                                                                            <a href="{duc}" class="link bClick" target="_self" name="duc">
                                                                                                <xsl:value-of select="duc_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="duc_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="tipo_pedido">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/tipo_pedido/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo_pedido"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="tipo_documento">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/tipo_documento/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo_documento"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="numero_documento">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/numero_documento/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="numero_documento"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nome">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nome/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="residencia">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/residencia/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="residencia"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data"/>
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
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1490699110723"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1490699110723"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1490699110723"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1490699110723"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1490699110724"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1490699110724"/>
</xsl:stylesheet>