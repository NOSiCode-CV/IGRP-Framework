<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
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
                                    <div class="row row-msg">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-07fbb72d">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/codigo">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="codigo" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/codigo/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/codigo/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/codigo/value}" class="form-control " id="{rows/content/form_1/fields/codigo/@name}" name="{rows/content/form_1/fields/codigo/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/codigo"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/aplicacao">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="aplicacao" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/aplicacao"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/aplicacao/list/option">
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
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="organica" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/organica/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/organica/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_organica" name="{rows/content/form_1/fields/organica/@name}">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/organica"/>
                                                                            </xsl:call-template>
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
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body ">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <div class="table-contents-head">
                                                                <div class="table-contents-inner"></div>
                                                            </div>
                                                            <div class="table-box">
                                                                <div class="table-box-inner">
                                                                    <table id="table_1" class="table table-striped igrp-data-table IGRP_contextmenu " exports="null">
                                                                        <thead>
                                                                            <tr>
                                                                                <xsl:if test="rows/content/table_1/fields/codigo">
                                                                                    <th align="left" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/codigo/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/descricao">
                                                                                    <th align="left" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/descricao/label"/>
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
                                                                            <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                                                                <tr>
                                                                                    <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                    <xsl:if test="codigo">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/codigo/label}" class="text" item-name="codigo">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="codigo"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="descricao">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/descricao/label}" class="text" item-name="descricao">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="descricao"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="estado">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/estado/label}" class="text" item-name="estado">
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
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1516553139418"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1516553139418"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1516553139418"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1516553139418"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1516553139418"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1516553139418"/>
</xsl:stylesheet>
