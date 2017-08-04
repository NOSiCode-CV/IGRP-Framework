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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/entidade">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="entidade" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/entidade/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/entidade/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_entidade" name="{rows/content/form_1/fields/entidade/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/entidade/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/balcao">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="balcao" item-type="select" required="required">
                                                                        <label for="{rows/content/form_1/fields/balcao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/balcao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_balcao" name="{rows/content/form_1/fields/balcao/@name}" required="required">
                                                                            <xsl:for-each select="rows/content/form_1/fields/balcao/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/servico">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="servico" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/servico/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/servico/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_servico" name="{rows/content/form_1/fields/servico/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/servico/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/date_de">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="date_de" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/date_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/date_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/date_de/value}" class="form-control gen-date " id="form_1-date_de" name="{rows/content/form_1/fields/date_de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-primary">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_ate">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_ate" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_ate/value}" class="form-control gen-date " id="form_1-data_ate" name="{rows/content/form_1/fields/data_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-primary">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu" exports="null">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/dia">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/dia/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/hora">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/hora/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/nome">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/nome/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/balcao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/balcao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/servico">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/servico/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/estado">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/estado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <th class="igrp-table-ctx-th"/>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="dia">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/dia/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="dia"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="hora">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/hora/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="hora"/>
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
                                                                            <xsl:if test="balcao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/balcao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="balcao"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="servico">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/servico/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="servico"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="estado">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/estado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="estado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <td class="igrp-table-ctx-td">
                                                                                <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                                                                                    <xsl:with-param name="row-params" select="context-menu"/>
                                                                                </xsl:apply-templates>
                                                                            </td>
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
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1501680059437"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1501680059437"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1501680059437"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1501680059437"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1501680059437"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1501680059437"/>
</xsl:stylesheet>
