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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/requisito">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="requisito" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/requisito/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/requisito/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_requisito" name="{rows/content/form_1/fields/requisito/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/requisito/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/organica">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="organica" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/organica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_organica" name="{rows/content/form_1/fields/organica/@name}">
                                                                            <xsl:for-each select="rows/content/form_1/fields/organica/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/data_inicio">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_inicio" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_inicio/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_inicio/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_inicio/value}" class="form-control gen-date" id="form_1-data_inicio" name="{rows/content/form_1/fields/data_inicio/@name}" format="IGRP_datePicker" maxlength="30"/>
                                                                            <span class="input-group-btn gen-date-icon">
                                                                                <span class="btn btn-default">
                                                                                    <i class="fa fa-calendar"/>
                                                                                </span>
                                                                            </span>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/data_fim">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="data_fim" item-type="date">
                                                                        <label for="{rows/content/form_1/fields/data_fim/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/data_fim/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <div class="input-group">
                                                                            <input type="text" value="{rows/content/form_1/fields/data_fim/value}" class="form-control gen-date" id="form_1-data_fim" name="{rows/content/form_1/fields/data_fim/@name}" format="IGRP_datePicker" maxlength="30"/>
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
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <xsl:call-template name="table-export-options">
                                                                <xsl:with-param name="pdf" select="true()"/>
                                                                <xsl:with-param name="excel" select="true()"/>
                                                            </xsl:call-template>
                                                            <table id="gen_table" class="table table-striped gen-data-table " exports="pdf,excel">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/organica_list">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/organica_list/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/n_atendimentos">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/n_atendimentos/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/tempo_medio_atendimento">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tempo_medio_atendimento/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/requisito_list">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/requisito_list/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/n_registos">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/n_registos/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/media_classificacao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/media_classificacao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="organica_list">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/organica_list/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="organica_list"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="n_atendimentos">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/n_atendimentos/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_atendimentos"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="tempo_medio_atendimento">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/tempo_medio_atendimento/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tempo_medio_atendimento"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="requisito_list">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/requisito_list/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="requisito_list"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="n_registos">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/n_registos/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="n_registos"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="media_classificacao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/media_classificacao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="media_classificacao"/>
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/export/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/export/dataTables.buttons.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/export/buttons.flash.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/export/jszip.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/export/pdfmake.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/export/vfs_fonts.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/export/buttons.html5.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/export/buttons.print.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.export.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1488887630772"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1488887630772"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1488887630772"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1488887630772"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1488887630773"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1488887630773"/>
</xsl:stylesheet>