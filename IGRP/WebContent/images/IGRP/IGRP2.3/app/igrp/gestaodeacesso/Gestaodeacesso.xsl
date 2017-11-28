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
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/table-colors.css?v={$version}"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
                <!-- COLOR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css?v={$version}"/>
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
                                    <div class="row " id="row-d5ccfc99">
                                        <div class="gen-column col-sm-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/sectionheader_1">
                                                    <section class="content-header gen-container-item " gen-class="" item-name="sectionheader_1">
                                                        <h2>
                                                            <xsl:value-of select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"/>
                                                        </h2>
                                                    </section>
                                                </xsl:if>
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-7e903453">
                                        <div class="gen-column col-sm-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/aplicacao">
                                                                    <div class="col-sm-6 form-group  gen-fields-holder" item-name="aplicacao" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/aplicacao/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/aplicacao/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_aplicacao" name="{rows/content/form_1/fields/aplicacao/@name}">
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
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row " id="row-54d13d4e">
                                        <div class="gen-column col-sm-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/toolsbar_1">
                                                    <div class="toolsbar-holder boxed gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn" gen-class="" item-name="toolsbar_1">
                                                        <div class="btns-holder  btn-group-justified" role="group">
                                                            <xsl:apply-templates select="rows/content/toolsbar_1" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                                <xsl:with-param name="outline" select="'false'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/org_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="org_table">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="rows/content/org_table/@title"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                            <xsl:with-param name="collapsed" select="'false'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body ">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/org_table/fields"/>
                                                            <div class="table-contents-head">
                                                                <div class="table-contents-inner">
                                                                    <xsl:apply-templates mode="table-legend" select="rows/content/org_table/table/legend_color"/>
                                                                </div>
                                                            </div>
                                                            <div class="table-box">
                                                                <div class="table-box-inner">
                                                                    <table id="org_table" class="table table-striped  IGRP_contextmenu " exports="null">
                                                                        <thead>
                                                                            <tr>
                                                                                <xsl:if test="rows/content/org_table/fields/estado">
                                                                                    <th align="center" class="color-th gen-fields-holder">
                                                                                        <xsl:value-of select="rows/content/org_table/fields/estado/label"/>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/org_table/fields/org_nome">
                                                                                    <th align="center" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/org_table/fields/org_nome/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/org_table/fields/aidicionar_perfil">
                                                                                    <th align="right" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/org_table/fields/aidicionar_perfil/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/org_table/fields/mostrar_perfis">
                                                                                    <th align="right" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/org_table/fields/mostrar_perfis/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                            <xsl:for-each select="rows/content/org_table/table/value/row[not(@total='yes')]">
                                                                                <tr>
                                                                                    <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                                    <xsl:if test="estado">
                                                                                        <td align="" data-row="{position()}" data-title="{../../label/estado}" class="color" item-name="estado">
                                                                                            <xsl:call-template name="tdcolor">
                                                                                                <xsl:with-param name="color" select="estado"/>
                                                                                            </xsl:call-template>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="org_nome">
                                                                                        <td align="center" data-row="{position()}" data-title="{../../../fields/org_nome/label}" class="text" item-name="org_nome">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="org_nome"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="aidicionar_perfil">
                                                                                        <td align="right" data-row="{position()}" data-title="{../../label/aidicionar_perfil}" class="link" item-name="aidicionar_perfil">
                                                                                            <xsl:choose>
                                                                                                <xsl:when test="aidicionar_perfil != ''">
                                                                                                    <a href="{aidicionar_perfil}" class="link bClick btn btn-success btn-xs" target-fields="" target="modal" name="aidicionar_perfil">
                                                                                                        <i class="fa fa-plus-square"/>
                                                                                                        <span>
                                                                                                            <xsl:value-of select="aidicionar_perfil_desc"/>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </xsl:when>
                                                                                                <xsl:otherwise>
                                                                                                    <span>
                                                                                                        <xsl:value-of select="aidicionar_perfil_desc"/>
                                                                                                    </span>
                                                                                                </xsl:otherwise>
                                                                                            </xsl:choose>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="mostrar_perfis">
                                                                                        <td align="right" data-row="{position()}" data-title="{../../label/mostrar_perfis}" class="link" item-name="mostrar_perfis">
                                                                                            <xsl:choose>
                                                                                                <xsl:when test="mostrar_perfis != ''">
                                                                                                    <a href="{mostrar_perfis}" class="link bClick btn btn-link btn-xs" target-fields="" target="modal" name="mostrar_perfis">
                                                                                                        <i class="fa fa-address-card"/>
                                                                                                        <span>
                                                                                                            <xsl:value-of select="mostrar_perfis_desc"/>
                                                                                                        </span>
                                                                                                    </a>
                                                                                                </xsl:when>
                                                                                                <xsl:otherwise>
                                                                                                    <span>
                                                                                                        <xsl:value-of select="mostrar_perfis_desc"/>
                                                                                                    </span>
                                                                                                </xsl:otherwise>
                                                                                            </xsl:choose>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                </tr>
                                                                            </xsl:for-each>
                                                                        </tbody>
                                                                    </table>
                                                                    <xsl:apply-templates select="rows/content/org_table/table/context-menu" mode="table-context-menu"/>
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
                <!-- COLOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js?v={$version}"/>
                <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js?v={$version}"/>
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_aplicacao":[{"name":"show","events":"change","isTable":false,"conditions":{"rules":[{"condition":"diff","value":"'0'","value2":"","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"show","targets":"toolsbar_1,org_table","procedure":"","request_fields":"","msg_type":"info","msg":""}]}}]},'actionsList');</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1511831681709"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1511831681709"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1511831681709"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1511831681709"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1511831681709"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1511831681709"/>
</xsl:stylesheet>
