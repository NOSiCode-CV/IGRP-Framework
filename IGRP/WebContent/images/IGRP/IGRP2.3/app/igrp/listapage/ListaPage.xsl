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
                                    <div class="row " id="row-21e1f7d6">
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
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                                                    <div class="col-sm-6 form-group  gen-fields-holder" item-name="env_fk" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/env_fk/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 IGRP_change" id="form_1_env_fk" name="{rows/content/form_1/fields/env_fk/@name}">
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
                                                                <xsl:if test="rows/content/form_1/fields/link_btn_nova_pagina">
                                                                    <div class="form-group col-sm-2 pull-right gen-fields-holder" item-name="link_btn_nova_pagina" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/link_btn_nova_pagina/value}" class="link btn btn-success form-link" close="refresh" target="modal">
                                                                            <i class="fa fa-plus-square"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/link_btn_nova_pagina/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/link_btn_ab">
                                                                    <div class="form-group col-sm-2 pull-right gen-fields-holder" item-name="link_btn_ab" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/link_btn_ab/value}" class="link btn btn-info form-link" target="_self">
                                                                            <i class="fa fa-th"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/link_btn_ab/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/btn_import">
                                                                    <div class="form-group col-sm-2 pull-right gen-fields-holder" item-name="btn_import" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/btn_import/value}" class="link btn btn-default form-link" close="refresh" target="modal">
                                                                            <i class="fa fa-upload"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/btn_import/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
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
                                    <div class="row " id="row-7a4db530">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
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
                                                                                <xsl:if test="rows/content/table_1/fields/status_page">
                                                                                    <th class="bs-checkbox gen-fields-holder" align="center">
                                                                                        <span>Ativo?</span>
                                                                                        <input type="checkbox" class="IGRP_checkall" check-rel="status_page" title="Ativo?" data-toggle="tooltip"/>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/descricao_page">
                                                                                    <th align="left" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/descricao_page/label"/>
                                                                                        </span>
                                                                                    </th>
                                                                                </xsl:if>
                                                                                <xsl:if test="rows/content/table_1/fields/nome_page">
                                                                                    <th align="left" class=" gen-fields-holder">
                                                                                        <span>
                                                                                            <xsl:value-of select="rows/content/table_1/fields/nome_page/label"/>
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
                                                                                    <input type="hidden" name="p_id_page_fk" value="{id_page}"/>
                                                                                    <input type="hidden" name="p_id_page_fk_desc" value="{id_page_desc}"/>
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
                                                                                    <xsl:if test="descricao_page">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/descricao_page/label}" class="text" item-name="descricao_page">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="descricao_page"/>
                                                                                            </span>
                                                                                        </td>
                                                                                    </xsl:if>
                                                                                    <xsl:if test="nome_page">
                                                                                        <td align="left" data-row="{position()}" data-title="{../../../fields/nome_page/label}" class="text" item-name="nome_page">
                                                                                            <span class="">
                                                                                                <xsl:value-of select="nome_page"/>
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
                <!-- RULES -->
                <script src="{$path}/core/igrp/IGRP.rules.class.js"/>
                <script>
$.IGRP.rules.set({"p_env_fk":[{"name":"Show table","events":"load,change","isTable":false,"conditions":{"rules":[{"condition":"less","value":"1","value2":"10","patern":"","patern_custom":"","opposite":"1"}],"actions":[{"action":"hide","targets":"table_1","procedure":"","request_fields":"","msg_type":"info","msg":""}]}}]},'actionsList');</script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515013478661"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515013478661"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515013478661"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1515013478661"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1515013478661"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1515013478661"/>
</xsl:stylesheet>
