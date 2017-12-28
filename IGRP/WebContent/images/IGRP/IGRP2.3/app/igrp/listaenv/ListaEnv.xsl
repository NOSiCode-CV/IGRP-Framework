<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
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
                                    <div class="row " id="row-8367ac04">
                                        <div class="gen-column col-sm-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-105" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/sectionheader/sectionheader.html" gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                            </div>
                                        </div>
                                        <div class="gen-column col-sm-6">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-121" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/toolsbar/toolsbar.html" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder btn-group-lg pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-8073af76">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-116" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/table/table.html" gen-class="" item-name="table_1">
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
                                                                                <xsl:if test="rows/content/table_1/fields/status">
                                                                                    <th class="bs-checkbox gen-fields-holder" align="center" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-139" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/fields/checkbox/templates/checkbox.table.th.html">
                                                                                        <span>Ativo?</span>
                                                                                        <input type="checkbox" class="IGRP_checkall" check-rel="status" title="Ativo?" data-toggle="tooltip"/>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/name">
                                                                                    <th align="left" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-118" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/table/th.html" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/name/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/dad">
                                                                                    <th align="left" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-118" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/table/th.html" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/dad/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/t_page_builder">
                                                                                    <th align="left" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-118" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/table/th.html" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/t_page_builder/label"/>
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
                                                                                    <input type="hidden" name="p_id_fk" value="{id}"/>
                                                                                    <input type="hidden" name="p_id_fk_desc" value="{id_desc}"/>
                                                                                    <xsl:if test="status">
                                                                                        <td align="" data-row="{position()}" data-title="{../../label/status}" class="bs-checkbox" item-name="status" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-138" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/fields/checkbox/templates/checkbox.table.html">
                                                                                            <xsl:if test="status != '-0'">
                                                                                                <input type="checkbox" name="p_status" value="{status}" check-rel="status">
                                                                                                    <xsl:if test="status_check=status">
                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                    </xsl:if>
                                                                                                </input>
                                                                                            </xsl:if>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="name">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/name/label}" class="text" item-name="name" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-115" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/table/field.html">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="name"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="dad">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/dad/label}" class="text" item-name="dad" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-115" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/containers/table/field.html">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="dad"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="t_page_builder">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../label/t_page_builder}" class="link" item-name="t_page_builder" data-genuitec-lp-enabled="false" data-genuitec-file-id="wc1-161" data-genuitec-path="/IGRP/WebContent/images/IGRP/IGRP2.3/core/formgen/types/fields/link/templates/link.table.html">
                                                                                            <xsl:choose>
                                                                                                <xsl:when test="t_page_builder != ''">
                                                                                                    <a href="{t_page_builder}" class="link bClick btn btn-warning " target-fields="" target="_self" name="t_page_builder">
                                                                                                        <i class="fa fa-file-code-o"/>
                                                                                                        <span>
                                                                                                            <xsl:value-of select="t_page_builder_desc"/>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </xsl:when>
                                                                                                <xsl:otherwise>
                                                                                                    <span>
                                                                                                        <xsl:value-of select="t_page_builder_desc"/>
                                                                                                    </span>
                                                                                                </xsl:otherwise>
                                                                                            </xsl:choose>
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
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1514252719551"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1514252719551"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1514252719551"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1514252719551"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1514252719551"/>
</xsl:stylesheet>
