<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
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
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" gen-class="" item-name="tabcontent_1">
                                                    <ul class="nav nav-tabs">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/reports">
                                                            <li item-name="reports" class="active gen-fields-holder" rel="tab-tabcontent_1-reports">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-reports">
                                                                    <i class="fa fa-file-text-o"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/reports/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/data_source">
                                                            <li item-name="data_source" class=" gen-fields-holder" rel="tab-tabcontent_1-data_source">
                                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-data_source">
                                                                    <i class="fa fa-database"/>
                                                                    <span>
                                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/data_source/label"/>
                                                                    </span>
                                                                </a>
                                                            </li>
                                                        </xsl:if>
                                                    </ul>
                                                    <div class="tab-content">
                                                        <xsl:if test="rows/content/tabcontent_1/fields/reports">
                                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-reports" rel="tab-tabcontent_1-reports">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner"/></div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <xsl:if test="rows/content/tabcontent_1/fields/data_source">
                                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-data_source" rel="tab-tabcontent_1-data_source">
                                                                <div class="row">
                                                                    <div class="gen-column col-md-12">
                                                                        <div class="gen-inner"/></div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                    </div>
                                                </div>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box igrp-forms gen-container-item " gen-class="" item-name="form_1">
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="env_fk" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/env_fk/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_env_fk" name="{rows/content/form_1/fields/env_fk/@name}">
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
                                                                <xsl:if test="rows/content/form_1/fields/datasorce_app">
                                                                    <div class="col-md-3 form-group  gen-fields-holder" item-name="datasorce_app" item-type="select">
                                                                        <label for="{rows/content/form_1/fields/datasorce_app/@name}">
                                                                            <xsl:value-of select="rows/content/form_1/fields/datasorce_app/label"/>
                                                                        </label>
                                                                        <select class="form-control select2 " id="form_1_datasorce_app" name="{rows/content/form_1/fields/datasorce_app/@name}" multiple="multiple">
                                                                            <xsl:for-each select="rows/content/form_1/fields/datasorce_app/list/option">
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
                                                                <xsl:if test="rows/content/form_1/fields/report_editor">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="report_editor" item-type="texteditor">
                                                                        <label>
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/report_editor/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <textarea id="form_1_report_editor" name="{rows/content/form_1/fields/report_editor/@name}" class="gen-texteditor">
                                                                            <xsl:value-of select="rows/content/form_1/fields/report_editor/value" disable-output-escaping="yes"/>
                                                                        </textarea>
                                                                        <script type="text/javascript"></script>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/link_add_source">
                                                                    <div class="form-group col-md-3  gen-fields-holder" item-name="link_add_source" item-type="link">
                                                                        <a href="{rows/content/form_1/fields/link_add_source/value}" class="link btn btn-link form-link" target="_self">
                                                                            <i class="fa fa-link"/>
                                                                            <span>
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/form_1/fields/link_add_source/label"/>
                                                                                </span>
                                                                            </span>
                                                                        </a>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/dialog_titulo_report">
                                                                    <div class="col-md-3  form-group  gen-fields-holder" item-name="dialog_titulo_report" item-type="plaintext">
                                                                        <xsl:value-of select="rows/content/form_1/fields/dialog_titulo_report/value"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/dialog_keys_report">
                                                                    <div class="col-md-3  form-group  gen-fields-holder" item-name="dialog_keys_report" item-type="plaintext">
                                                                        <xsl:value-of select="rows/content/form_1/fields/dialog_keys_report/value"/>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/codigo_report">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="codigo_report" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/codigo_report/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/codigo_report/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/codigo_report/value}" class="form-control" id="{rows/content/form_1/fields/codigo_report/@name}" name="{rows/content/form_1/fields/codigo_report/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                                <xsl:if test="rows/content/form_1/fields/title_report">
                                                                    <div class="form-group col-md-3   gen-fields-holder" item-name="title_report" item-type="text">
                                                                        <label for="{rows/content/form_1/fields/title_report/@name}">
                                                                            <span>
                                                                                <xsl:value-of select="rows/content/form_1/fields/title_report/label"/>
                                                                            </span>
                                                                        </label>
                                                                        <input type="text" value="{rows/content/form_1/fields/title_report/value}" class="form-control" id="{rows/content/form_1/fields/title_report/@name}" name="{rows/content/form_1/fields/title_report/@name}" maxlength="30"></input>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                        <xsl:apply-templates select="rows/content/form_1/tools-bar" mode="form-buttons"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/gen_table">
                                                    <div class="box box-table-contents gen-container-item " gen-class="" item-name="gen_table">
                                                        <div class="box-body table-box">
                                                            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/gen_table/fields"/>
                                                            <table id="gen_table" class="table table-striped gen-data-table ">
                                                                <thead>
                                                                    <tr>
                                                                        <xsl:if test="rows/content/gen_table/fields/title">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/title/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/link">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/link/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/descricao">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/descricao/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                        <xsl:if test="rows/content/gen_table/fields/id">
                                                                            <th align="left" class=" gen-fields-holder">
                                                                                <span>
                                                                                    <xsl:value-of select="rows/content/gen_table/fields/id/label"/>
                                                                                </span>
                                                                            </th>
                                                                        </xsl:if>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                                    <xsl:for-each select="rows/content/gen_table/table/value/row">
                                                                        <tr>
                                                                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                                                                            <xsl:if test="title">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/title/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="title"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="link">
                                                                                <td align="left" data-row="{position()}" data-title="{../../label/link}" class="link">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="link != ''">
                                                                                            <a href="{link}" class="link bClick" target="_self" name="link">
                                                                                                <xsl:value-of select="link_desc" disable-output-escaping="yes"/>
                                                                                            </a>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <span>
                                                                                                <xsl:value-of select="link_desc" disable-output-escaping="yes"/>
                                                                                            </span>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="descricao">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/descricao/label}" class="text">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="descricao"/>
                                                                                    </span>
                                                                                </td>
                                                                            </xsl:if>
                                                                            <xsl:if test="id">
                                                                                <td align="left" data-row="{position()}" data-title="{../../fields/id/label}" class="number">
                                                                                    <span class="">
                                                                                        <xsl:value-of select="id"/>
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
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!-- TEXTEDITOR JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/ckeditor/ckeditor.js"/>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1486380295324"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1486380295324"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1486380295324"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1486380295324"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1486380295324"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1486380295324"/>
</xsl:stylesheet>