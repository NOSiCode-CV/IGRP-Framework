<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- VIEW CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css"/>
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
                                                                                        <xsl:if test="rows/content/view_1/fields/numero_de_pedido">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/numero_de_pedido/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/numero_de_pedido/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/numero_de_processo">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/numero_de_processo/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/numero_de_processo/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_1/fields/tipo_de_pedido">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/tipo_de_pedido/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_1/fields/tipo_de_pedido/value"/>
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
                                                                                        <xsl:if test="rows/content/view_2/fields/predio">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/predio/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/predio/value"/>
                                                                                                </span>
                                                                                            </div>
                                                                                        </xsl:if>
                                                                                        <xsl:if test="rows/content/view_2/fields/data_do_pedido">
                                                                                            <div class="view-item gen-fields-holder">
                                                                                                <span class="view-label">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/data_do_pedido/label"/>
                                                                                                </span>
                                                                                                <span class="view-value">
                                                                                                    <xsl:value-of select="rows/content/view_2/fields/data_do_pedido/value"/>
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
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table " exports="null">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/data">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/data/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/utilizador">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/utilizador/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/de">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/de/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/para">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/para/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/resultado">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/resultado/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/notas">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/notas/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="data">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data"/>
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
                                                                            <xsl:if test="de">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/de/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="de"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="para">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/para/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="para"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="resultado">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/resultado/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="resultado"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="notas">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/notas/label}" class="plaintext">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="notas"/>
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
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1489163921373"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1489163921373"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1489163921373"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1489163921373"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1489163921373"/>
</xsl:stylesheet>