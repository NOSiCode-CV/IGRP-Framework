<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- DATE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css"/>
                <style/>
            </head>
            <body class="{$bodyClass}">
                <xsl:call-template name="IGRP-topmenu"/>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <xsl:call-template name="IGRP-sidebar"/>
                            <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                    <div class="row">
                                        <div class="gen-column col-1-1">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/page_title">
                                                    <section class="content-header gen-container-item " item-name="page_title">
                                                        <h1>
                                                            <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                                                        </h1>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" item-name="toolsbar_1">
                                                        <div class="btns-holder btn-group-lg pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table IGRP_contextmenu">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/codigo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/codigo/label"/>
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
                                                                        <xsl:if test="rows/content/gen_table/fields/titular">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/titular/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/area">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/area/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/concelholocal">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/concelholocal/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/estado">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/estado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/tipo_predio">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/tipo_predio/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/poligono">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/poligono/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/natureza">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/natureza/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/escolher">
                                                                            <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                <input type="checkbox" class="IGRP_checkall" check-rel="escolher"/>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="codigo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/codigo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="codigo"/>
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
                                                                            <xsl:if test="titular">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/titular/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="titular"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="area">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/area/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="area"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="concelholocal">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/concelholocal/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="concelholocal"/>
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
                                                                            <xsl:if test="tipo_predio">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/tipo_predio/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="tipo_predio"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="poligono">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/poligono/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="poligono"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="natureza">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/natureza/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="natureza"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="escolher">
                                                                                <td align="" data-row="{position()}" data-title="{../../label/escolher}" class="bs-checkbox">
                                                                                    <xsl:if test="escolher != '-0'">
                                                                                        <input type="checkbox" name="p_escolher" value="{escolher}" check-rel="escolher">
                                                                                            <xsl:if test="escolher_check=escolher">
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
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1482861269374"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1482861269374"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1482861269374"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1482861269374"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1482861269374"/>
</xsl:stylesheet>