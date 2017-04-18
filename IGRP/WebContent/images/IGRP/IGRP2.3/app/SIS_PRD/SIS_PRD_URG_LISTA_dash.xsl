<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
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
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/filter_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="filter_1" style="baseline;&#10;transparent&#10;bebebe;">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/filter_1/fields"/>
                                                                <xsl:if test="rows/content/filter_1/fields/numero_utente">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="numero_utente" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/numero_utente/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/numero_utente/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/numero_utente/value}" class="form-control " id="{rows/content/filter_1/fields/numero_utente/@name}" name="{rows/content/filter_1/fields/numero_utente/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/nome_utente">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="nome_utente" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/nome_utente/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/nome_utente/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/nome_utente/value}" class="form-control " id="{rows/content/filter_1/fields/nome_utente/@name}" name="{rows/content/filter_1/fields/nome_utente/@name}" maxlength="400" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/numero_documento">
                                                                    <div class="form-group col-md-4   gen-fields-holder" item-name="numero_documento" item-type="text">
                                                                        <label for="{rows/content/filter_1/fields/numero_documento/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/numero_documento/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/filter_1/fields/numero_documento/value}" class="form-control " id="{rows/content/filter_1/fields/numero_documento/@name}" name="{rows/content/filter_1/fields/numero_documento/@name}" maxlength="30" placeholder=""></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_de">
                                                                    <div class="form-group col-md-4  gen-fields-holder" item-name="data_de" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_de/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_de/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_de/value}" class="form-control gen-date " id="filter_1-data_de" name="{rows/content/filter_1/fields/data_de/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-info">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/filter_1/fields/data_ate">
                                                                    <div class="form-group col-md-4  gen-fields-holder" item-name="data_ate" item-type="date">
                                                                        <label for="{rows/content/filter_1/fields/data_ate/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/filter_1/fields/data_ate/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/filter_1/fields/data_ate/value}" class="form-control gen-date " id="filter_1-data_ate" name="{rows/content/filter_1/fields/data_ate/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-info">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/filter_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table" style="baseline;&#10;transparent&#10;bebebe;">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/gen_table/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu" exports="null">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/numero_utente">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/numero_utente/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/nome_utente_list">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/nome_utente_list/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/dt_nasc_list">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/dt_nasc_list/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/doc_list">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/doc_list/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/dt_hora">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/dt_hora/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/atendedor_list">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/atendedor_list/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <th class="igrp-table-ctx-th"/>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="numero_utente">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/numero_utente/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="numero_utente"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="nome_utente_list">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/nome_utente_list/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="nome_utente_list"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="dt_nasc_list">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/dt_nasc_list/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="dt_nasc_list"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="doc_list">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/doc_list/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="doc_list"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="dt_hora">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/dt_hora/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="dt_hora"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="atendedor_list">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/atendedor_list/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="atendedor_list"/>
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
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1491831584972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1491831584972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1491831584972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1491831584972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1491831584972"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1491831584972"/>
</xsl:stylesheet>