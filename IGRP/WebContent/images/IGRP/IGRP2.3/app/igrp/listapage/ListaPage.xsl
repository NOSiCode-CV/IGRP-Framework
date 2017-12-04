<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
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
                                    <div class="row " id="row-8b701b1a">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                                                    <div class="col-sm-3 form-group  gen-fields-holder" item-name="env_fk" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/env_fk/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_env_fk" name="{rows/content/form_1/fields/env_fk/@name}">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/env_fk"/>
                                                                            </xsl:call-template>
                                                                            <xsl:for-each select="rows/content/form_1/fields/env_fk/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/page">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="page" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/page/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/page/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/page/value}" class="form-control " id="{rows/content/form_1/fields/page/@name}" name="{rows/content/form_1/fields/page/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/page"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/page_descr">
                                                                    <div class="form-group col-sm-3   gen-fields-holder" item-name="page_descr" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/page_descr/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/page_descr/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/page_descr/value}" class="form-control " id="{rows/content/form_1/fields/page_descr/@name}" name="{rows/content/form_1/fields/page_descr/@name}" maxlength="30" placeholder="">
                                                                            <xsl:call-template name="setAttributes">
                                                                                <xsl:with-param name="field" select="rows/content/form_1/fields/page_descr"/>
                                                                            </xsl:call-template>
                                                                        </input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/table_1">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="table_1">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/table_1/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                            <xsl:with-param name="collapsed" select="'false'"/>
                                                        </xsl:call-template>
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
                                                                                <xsl:if test="rows/content/table_1/fields/nome_page">
                                                                                    <th align="left" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/nome_page/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/descricao_page">
                                                                                    <th align="left" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/descricao_page/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/status_page">
                                                                                    <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                        <span>Ativo?</span>
                                                                                        <input type="checkbox" class="IGRP_checkall" check-rel="status_page" title="Ativo?" data-toggle="tooltip"/>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <th class="igrp-table-ctx-th"/>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <xsl:for-each select="rows/content/table_1/table/value/row[not(@total='yes')]">
                                                                                <tr>
                                                                                    <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                    <input type="hidden" name="p_id_page_fk" value="{id_page}"/>
                                                                                    <input type="hidden" name="p_id_page_fk_desc" value="{id_page_desc}"/>
                                                                                    <xsl:if test="nome_page">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/nome_page/label}" class="text" item-name="nome_page">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="nome_page"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="descricao_page">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/descricao_page/label}" class="text" item-name="descricao_page">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="descricao_page"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="status_page">
                                                                                        <td align="" data-row="{position()}" data-title="{../../label/status_page}" class="bs-checkbox" item-name="status_page">
                                                                                            <xsl:if test="status_page != '-0'">
                                                                                                <input type="checkbox" name="p_status_page" value="{status_page}" check-rel="status_page">
                                                                                                    <xsl:if test="status_page_check=status_page">
                                                                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                                                                    </xsl:if>
                                                                                                </input>
                                                                                            </xsl:if>
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
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1512345105273"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1512345105273"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1512345105273"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1512345105273"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1512345105273"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1512345105273"/>
</xsl:stylesheet>
