<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass} sidebar-off">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_2">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_2/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-12">
                                                                    <div class="gen-inner"/></div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/view_1">
                                                                            <div class="box clearfix view-block gen-container-item " has-img="false" gen-class="" item-name="view_1">
                                                                                <div class="box-body">
                                                                                    <xsl:if test="rows/content/view_1/fields/view_img">
                                                                                        <img src="{rows/content/view_1/fields/view_img}"/>
                                                                                    </xsl:if>
                                                                                    <div class="view-body clearfix ">
                                                                                        <xsl:if test="rows/content/view_1/fields/device_f">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <a href="{rows/content/view_1/fields/device_f/value}" target="_self">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/view_1/fields/device_f/label"/>
                                                                                                    </span>
                                                                                                </a>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/export_f">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <a href="{rows/content/view_1/fields/export_f/value}" target="_self">
                                                                                                    <span>
                                                                                                        <xsl:value-of select="rows/content/view_1/fields/export_f/label"/>
                                                                                                    </span>
                                                                                                </a>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/conteudo_f">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/conteudo_f/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/conteudo_f/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                    <!-- <div class="view-buttons clearfix"  gen-id="drop-zone" gen-only-type="button" gen-field-template="button"></div> -->
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                                <div class="gen-column col-md-6">
                                                                    <div class="gen-inner">
                                                                        <xsl:if test="rows/content/view_2">
                                                                            <div class="box clearfix view-block gen-container-item " has-img="false" gen-class="" item-name="view_2">
                                                                                <div class="box-body">
                                                                                    <xsl:if test="rows/content/view_2/fields/view_img">
                                                                                        <img src="{rows/content/view_2/fields/view_img}"/>
                                                                                    </xsl:if>
                                                                                    <div class="view-body clearfix ">
                                                                                        <xsl:if test="rows/content/view_2/fields/utilizador_criacao_f">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/utilizador_criacao_f/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/utilizador_criacao_f/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_2/fields/total_registos_f">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/total_registos_f/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/total_registos_f/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                    </div>
                                                                                    <!-- <div class="view-buttons clearfix"  gen-id="drop-zone" gen-only-type="button" gen-field-template="button"></div> -->
                                                                                </div>
                                                                            </div>
                                                                        </xsl:if>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/gen_table/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/tipo">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tipo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/replica_id">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/replica_id/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/source_register_id">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/source_register_id/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/status">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/status/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/user_id">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/user_id/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/criado_em">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/criado_em/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/ultimo_sync">
                                                                            <th align="center" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/ultimo_sync/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="tipo">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/tipo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="replica_id">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/replica_id/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="replica_id"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="source_register_id">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/source_register_id/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="source_register_id"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="status">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/status/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="status"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="user_id">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/user_id/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="user_id"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="criado_em">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/criado_em/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="criado_em"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="ultimo_sync">
                                                                                <td align="center" data-row="{position()}" data-title="{../../fields/ultimo_sync/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="ultimo_sync"/>
                                                                                    </span>
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1484739959581"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1484739959581"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1484739959581"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1484739959581"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1484739959582"/>
</xsl:stylesheet>