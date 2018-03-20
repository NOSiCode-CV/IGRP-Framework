<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!--TOOLSBAR CSS INCLUDES-->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!--TABCONTENT CSS INCLUDES-->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!--FORM CSS INCLUDES-->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!--TABLE CSS INCLUDES-->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!--SELECT CSS INCLUDES-->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <style/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/webreport/css/webreport.css"/>
            </head>
            <body class="{$bodyClass}">
                <!--<xsl:call-template name="IGRP-topmenu"/>-->
                <nav id="igrp-top-nav" class="navbar navbar-fixed-top" bg-color="1">
                    <a class="navbar-brand col-sm-4 col-md-3" href="{rows/link}" >
                        <img src="{$path}/themes/default/img/logo.png"/>
                        <span class=""><b>IGRP</b></span>
                    </a>
                    <div id="side-bar-ctrl">
                        <i class="fa fa-navicon"></i>
                    </div>
                    <div id="igrp-app-title" class="">
                        <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                    </div>
                </nav>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="hidden">
                        <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                    </div>
                    <div class="container-fluid">
                        <div class="row">
                            <!--<xsl:call-template name="IGRP-sidebar"/>-->
                            <div class="col-md-3 col-sm-4 sidebar tree-list" id="igrp-sidebar">
                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                    <div class="row">
                                        <br/>
                                        <div class="col-md-12 form-group  gen-fields-holder" item-name="env_fk" item-type="select">
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
                                                    <a class="wr-newdocument pull-right" title="Novo Documento">
                                                        <i class="fa fa-plus-circle"/>
                                                    </a>
                                                </div>
                                                <div class="row">
                                                    <div class="gen-column col-md-12" id="wr-list-document">
                                                        <xsl:call-template name="reports"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="rows/content/tabcontent_1/fields/data_source">
                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-data_source" rel="tab-tabcontent_1-data_source">
                                                <div class="row">
                                                    <div class="gen-column col-md-12">
                                                        
                                                        <xsl:if test="rows/content/form_1/fields/datasorce_app">
                                                            <div class="row">    
                                                                <div class="col-md-12 form-group wr-datasource gen-fields-holder" item-name="datasorce_app" item-type="select">
                                                                    <label for="{rows/content/form_1/fields/datasorce_app/@name}">
                                                                        <xsl:value-of select="rows/content/form_1/fields/datasorce_app/label"/>
                                                                    </label>
                                                                    <div class="col-md-10">
                                                                        <div class="row">
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
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <div class="row wr-op-datasource">
                                                                            <a class="btn wr-newdatasource" target="modal" title="Novo Data Source">
                                                                                <i class="fa fa-plus-circle"></i>
                                                                            </a>
                                                                            <a class="btn wr-editdatasource" title="Edit Data Source">
                                                                                <i class="fa fa-pencil-square-o"></i>
                                                                            </a>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </xsl:if>
                                                        <div class="row">
                                                            <div class="col-md-12" id="wr-list-datasource">
                                                                <xsl:if test="count(rows/content/form_1/fields/datasorce_app/list/option[position() != 1]) > 0">
                                                                  <xsl:call-template name="datasorce"/>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-8 col-md-9 col-md-offset-3 col-sm-offset-4 main" id="igrp-contents">
                                <div class="content">
                                    <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" gen-class="" item-name="fmn">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="rows/content/form_1">
                                                    <div class="box  box-wr igrp-forms gen-container-item">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="'Head'"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <div class="row">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="head-wr" item-type="texteditor">
                                                                        <div id="head-wr" name="head" contenteditable="true" class="texteditor editor">
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="box igrp-forms gen-container-item">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="'Body'"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <xsl:if test="rows/content/form_1/fields/report_editor">
                                                                    <div class="row">
                                                                        <div class="form-group col-md-12  gen-fields-holder" item-name="body-wr" item-type="texteditor">
                                                                            <div id="body-wr" name="body" class="gen-texteditor editor">
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </xsl:if>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="box box-wr igrp-forms gen-container-item hiddenItem">
                                                        <xsl:call-template name="box-header">
                                                            <xsl:with-param name="title" select="'Footer'"/>
                                                            <xsl:with-param name="collapsible" select="'true'"/>
                                                        </xsl:call-template>
                                                        <div class="box-body">
                                                            <div role="form">
                                                                <div class="row">
                                                                    <div class="form-group col-md-12  gen-fields-holder" item-name="footer-wr" item-type="texteditor">
                                                                        <div id="footer-wr" contenteditable="true" name="footer" class="texteditor editor">
                                                                        </div>
                                                                    </div>
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
                
                <!--TEXTEDITOR JS INCLUDES-->
                <script type="text/javascript" src="{$path}/core/ckeditor/ckeditor.js"/>
                <script type="text/javascript" src="{$path}/core/webreport/js/webreport.config.js"/>
                <script type="text/javascript" src="{$path}/core/webreport/js/webreport.js"/>
                <script type="text/javascript">
                    CKEDITOR.on( 'instanceCreated', function( event ) {
                        var editor = event.editor,
                            element = editor.element;
                    });
                </script>
                
                
                <script type="text/javascript">
                    var wr_dataSource       = '<xsl:value-of select="rows/content/form_1/fields/datasorce_app/label"/>',
                        wr_app              = '<xsl:value-of select="rows/content/form_1/fields/env_fk/label"/>',
                        wr_newDocumentTitle = '<xsl:value-of select="rows/content/form_1/fields/dialog_titulo_report/label"/>',
                        wr_labelTitle       = '<xsl:value-of select="rows/content/form_1/fields/title_report/label"/>',
                        wr_nameInputTitle   = '<xsl:value-of select="rows/content/form_1/fields/title_report/@name"/>',
                        wr_labelCode        = '<xsl:value-of select="rows/content/form_1/fields/codigo_report/label"/>',
                        wr_nameInputCode    = '<xsl:value-of select="'p_code'"/>',
                        wr_dialogKeysTitle  = '<xsl:value-of select="rows/content/form_1/fields/dialog_keys_report/label"/>',
                        wr_tmpl             = '<xsl:value-of select="rows/content/form_1/value/hidden[@name='p_fwl_tmplconfig']"/>';
                </script>
                <!--TABCONTENT JS INCLUDES-->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!--FORM JS INCLUDES-->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!--SELECT JS INCLUDES-->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <!--XML XSL TRANSFORM-->
                <script type="text/javascript" src="{$path}/core/formgen/js/xml.xsl.transform.js"/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1484140276658"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1484140276658"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1484140276658"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1484140276658"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1484140276658"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1484140276658"/>
    <xsl:include href="../../../core/webreport/xsl/reports.tmpl.xsl?v=1484140276658"/>
    <xsl:include href="../../../core/webreport/xsl/datasorce.tmpl.xsl?v=1484140276658"/>
</xsl:stylesheet>