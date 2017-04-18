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
                                                <div class="box igrp-box-holder gen-container-item " gen-class="" item-name="box_1">
                                                    <xsl:call-template name="box-header">
                                                        <xsl:with-param name="title" select="rows/content/box_1/@title"/>
                                                        <xsl:with-param name="collapsible" select="'true'"/>
                                                    </xsl:call-template>
                                                    <div class="box-body" gen-preserve-content="true">
                                                        <div>
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
                                                                                        <xsl:if test="rows/content/view_1/fields/nome">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/nome/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/nome/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/utilizador_f">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/utilizador_f/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/utilizador_f/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/data_criacao_f">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/data_criacao_f/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/data_criacao_f/value"/>
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
                                                                                        <xsl:if test="rows/content/view_2/fields/mac_address">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/mac_address/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/mac_address/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_2/fields/ambiente">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/ambiente/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/ambiente/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_2/fields/estado">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/estado/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/estado/value"/>
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
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
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
                                                                        <xsl:if test="rows/content/gen_table/fields/name">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/name/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/utilizador">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/utilizador/label"/>
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
                                                                            <input type="hidden" name="p_id_export_fk" value="{id_export}"/>
                                                                            <input type="hidden" name="p_id_export_fk_desc" value="{id_export_desc}"/>
                                                                            <input type="hidden" name="p_device_id_fk" value="{device_id}"/>
                                                                            <input type="hidden" name="p_device_id_fk_desc" value="{device_id_desc}"/>
                                                                            <input type="hidden" name="p_user_register_id_fk" value="{user_register_id}"/>
                                                                            <input type="hidden" name="p_user_register_id_fk_desc" value="{user_register_id_desc}"/>
                                                                            <xsl:if test="name">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/name/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="name"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="utilizador">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/utilizador/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="utilizador"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data/label}" class="date">
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1485274305454"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1485274305454"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1485274305454"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1485274305454"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1485274305454"/>
</xsl:stylesheet>