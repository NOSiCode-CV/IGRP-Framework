<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
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
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" gen-class="" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/dados_gerais">
                                                            <li item-name="dados_gerais" class="active gen-fields-holder" rel="tab-tabcontent_1-dados_gerais">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-dados_gerais">
                                                                    <i class="fa fa-cog"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/dados_gerais/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/mobilidades">
                                                            <li item-name="mobilidades" class=" gen-fields-holder" rel="tab-tabcontent_1-mobilidades">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-mobilidades">
                                                                    <i class="fa fa-spinner"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/mobilidades/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/formacao">
                                                            <li item-name="formacao" class=" gen-fields-holder" rel="tab-tabcontent_1-formacao">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-formacao">
                                                                    <i class="fa fa-graduation-cap"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/formacao/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/avaliacao">
                                                            <li item-name="avaliacao" class=" gen-fields-holder" rel="tab-tabcontent_1-avaliacao">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-avaliacao">
                                                                    <i class="fa fa-smile-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/avaliacao/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/rendenc">
                                                            <li item-name="rendenc" class=" gen-fields-holder" rel="tab-tabcontent_1-rendenc">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-rendenc">
                                                                    <i class="fa fa-dollar"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/rendenc/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/relatorios">
                                                            <li item-name="relatorios" class=" gen-fields-holder" rel="tab-tabcontent_1-relatorios">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-relatorios">
                                                                    <i class="fa fa-file-pdf-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/relatorios/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/dados_gerais">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-dados_gerais" rel="tab-tabcontent_1-dados_gerais">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_1">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_1">
                                                                                    <div class="btns-holder  pull-right" role="group">
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
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/mobilidades">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-mobilidades" rel="tab-tabcontent_1-mobilidades">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_2">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_2">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_2" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/formacao">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-formacao" rel="tab-tabcontent_1-formacao">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_3">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_3">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_3" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/avaliacao">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-avaliacao" rel="tab-tabcontent_1-avaliacao">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_4">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_4">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_4" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/rendenc">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-rendenc" rel="tab-tabcontent_1-rendenc">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_5">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_5">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_5" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/relatorios">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-relatorios" rel="tab-tabcontent_1-relatorios">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner">
                                                                            <xsl:if test="rows/content/toolsbar_6">
                                                                                <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_6">
                                                                                    <div class="btns-holder  pull-right" role="group">
                                                                                        <xsl:apply-templates select="rows/content/toolsbar_6" mode="gen-buttons">
                                                                                            <xsl:with-param name="vertical" select="'true'"/>
                                                                                        </xsl:apply-templates>
                                                                                    </div>
                                                                                </div>
                                                                            </xsl:if>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                    </div>
                                                </div>
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
                                                                        <xsl:if test="rows/content/toolsbar_7">
                                                                            <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_7">
                                                                                <div class="btns-holder   pull-right" role="group">
                                                                                    <xsl:apply-templates select="rows/content/toolsbar_7" mode="gen-buttons">
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
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/table_1/fields"/>
                                                            <table id="table_1" class="table table-striped gen-data-table IGRP_contextmenu" exports="">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/table_1/fields/situacao_juridica">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/situacao_juridica/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/quadro">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/quadro/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/referencia_escalao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/referencia_escalao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/cargo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/cargo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/centro_de_custo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/centro_de_custo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/dirgeraldirservico">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/dirgeraldirservico/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/table_1/fields/data_inicio">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/data_inicio/label"/>
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
                                                                        <xsl:if test="rows/content/table_1/fields/fluxo">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/table_1/fields/fluxo/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/table_1/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="situacao_juridica">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/situacao_juridica/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="situacao_juridica"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="quadro">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/quadro/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="quadro"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="referencia_escalao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/referencia_escalao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="referencia_escalao"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="cargo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/cargo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="cargo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="centro_de_custo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/centro_de_custo/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="centro_de_custo"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="dirgeraldirservico">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/dirgeraldirservico/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="dirgeraldirservico"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="data_inicio">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/data_inicio/label}" class="date">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="data_inicio"/>
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
                                                                            <xsl:if test="fluxo">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/fluxo}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="fluxo != ''">
                                                                                            <a href="{fluxo}" class="link bClick" target="_blank" name="fluxo">
                                                                                                <xsl:value-of select="fluxo_desc"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="fluxo_desc"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                        </tr>
                                                                    </xsl:for-each>
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="table-context-menu"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_7">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="toolsbar_7">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_7" mode="gen-buttons">
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
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js"/>
                <!-- DATE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js"/>
                <script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1492443094518"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1492443094518"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1492443094518"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1492443094518"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1492443094519"/>
</xsl:stylesheet>