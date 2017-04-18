<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/bpmn/css/BPMN.css"/>
                <style/>
            </head>
            <body class="{$bodyClass}">
                <!--<xsl:call-template name="IGRP-topmenu"/>-->
                <nav id="igrp-top-nav" class="navbar navbar-fixed-top" bg-color="1">
                    <a class="navbar-brand col-sm-4 col-md-3" href="{rows/link}" >
                        <img src="{$path}/themes/default/img/logo.png"/>
                        <span class=""><b>IGRP</b> <small></small></span>
                    </a>
                    <div id="side-bar-ctrl">
                        <i class="fa fa-navicon"></i>
                    </div>
                    <div id="igrp-app-title" class="">
                        <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                    </div>
                </nav>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div id="currentFile">(Unsaved File)</div>
                    <div class="container-fluid" id="PaletteAndDiagram">
                        <div class="row">
                            <!--<xsl:call-template name="IGRP-sidebar"/>-->
                            <div class="col-md-3 col-sm-4 sidebar tree-list" id="igrp-sidebar">
                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                    <div class="row">
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
                                <div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" item-name="tabcontent_1">
                                    <ul class="nav nav-tabs">
                                        <xsl:if test="rows/content/tabcontent_1/fields/processos">
                                            <li item-name="processos" class="active gen-fields-holder" rel="tab-tabcontent_1-processos">
                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-processos">
                                                    <i class="fa fa-cog"/>
                                                    <span>
                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/processos/label"/>
                                                    </span>
                                                </a>
                                            </li>
                                        </xsl:if>
                                        <xsl:if test="rows/content/tabcontent_1/fields/bpmn">
                                            <li item-name="bpmn" class=" gen-fields-holder" rel="tab-tabcontent_1-bpmn">
                                                <a data-toggle="tab" aria-expanded="true" href="#tab-tabcontent_1-bpmn">
                                                    <i class="fa fa-cogs"/>
                                                    <span>
                                                        <xsl:value-of select="rows/content/tabcontent_1/fields/bpmn/label"/>
                                                    </span>
                                                </a>
                                            </li>
                                        </xsl:if>
                                    </ul>
                                    <div class="tab-content">
                                        <xsl:if test="rows/content/tabcontent_1/fields/processos">
                                            <div class="tab-pane gen-rows-holder active" id="tab-tabcontent_1-processos" rel="tab-tabcontent_1-processos">
                                                <div class="row">
                                                    <div class="col-md-12">
                                                      <a class="addArea" title="{rows/content/form_1/fields/link_add_area/label}">
                                                        <i class="fa fa-plus-circle"/>
                                                      </a> 
                                                    </div>
                                                    <div class="col-md-12" id="tabprocessos">
                                                        <xsl:apply-templates mode="tree-menu" select="rows/content/gen_table/table"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="rows/content/tabcontent_1/fields/bpmn">
                                            <div class="tab-pane gen-rows-holder " id="tab-tabcontent_1-bpmn" rel="tab-tabcontent_1-bpmn">
                                                <div class="row">
                                                    <div id="sideBar">
                                                        <div id="accordion">
                                                          <h4>Level 1 items</h4>
                                                          <div>
                                                            <div id="myPaletteLevel1" class="myPaletteDiv" ></div>
                                                          </div>
                                                          <h4>Level 2 items</h4>
                                                          <div>
                                                            <div id="myPaletteLevel2" class="myPaletteDiv"></div>
                                                          </div>
                                                          <h4>Other items</h4>
                                                          <div>
                                                            <div id="myPaletteLevel3" class="myPaletteDiv"></div>
                                                          </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </xsl:if>
                                    </div>
                                </div>
                                <div class="overviw">
                                    <a class="cOverviw">Over View</a>
                                    <div id="myOverviewDiv"></div>
                                </div>
                            </div>
                            <div class="col-sm-8 col-md-9 col-md-offset-3 col-sm-offset-4 main" id="igrp-contents">
                                <div class="content">
                                    <div class="row">
                                        <div class="gen-column col-md-12">
                                            <div class="gen-inner">
                                                <xsl:if test="rows/content/fmn">
                                                    <div class="toolsbar-holder default gen-container-item " gen-structure="toolsbar" gen-fields=".btns-holder a.btn" item-name="fmn">
                                                        <div class="btns-holder   pull-right" role="group">
                                                            <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                                                                <xsl:with-param name="vertical" select="'true'"/>
                                                            </xsl:apply-templates>
                                                        </div>
                                                    </div>
                                                </xsl:if>
                                            </div>
                                            <div class="row">
                                                <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                                <div class="row hidden">
                                                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                                </div>
                                                <div id="myDiagramDiv"></div>

                                                <ul class="contextMenu ctxBpmn" id="ctx-bpnm-event">
                                                  <!--<li class="operationTable activity">
                                                    <a type="default" href="2">Add Email Event</a>
                                                  </li>
                                                  <li class="operationTable activity">
                                                    <a type="default" href="3">Add Timer Event</a>
                                                  </li>
                                                  <li class="operationTable activity">
                                                    <a type="default" href="4">Add Escalation Event</a>
                                                  </li>
                                                  <li class="operationTable activity">
                                                    <a type="default" href="7">Add Error Event</a>
                                                  </li>  //-->
                                                  <xsl:for-each select="//rows/content/context_menu/table/value/row[ctx_tipo !='line']">
                                                    <li class="operationTable">
                                                      <a href="{ctx_link}"><xsl:value-of select="ctx_nome"/></a>
                                                    </li>
                                                  </xsl:for-each>
                                                </ul>
                                                <ul class="contextMenu ctxBpmn" id="ctx-bpnm-line">
                                                  <!-- <li class="operationTable"><a type="default" href="default">Default Flow</a></li>
                                                  <li class="operationTable"><a type="default" href="conditional">Conditional Flow</a></li> //-->
                                                  <xsl:for-each select="//rows/content/context_menu/table/value/row[ctx_tipo ='line']">
                                                    <li class="operationTable">
                                                      <a  href="{ctx_link}"><xsl:value-of select="ctx_nome"/></a>
                                                    </li>
                                                  </xsl:for-each>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <script type="text/javascript" src="{$path}/core/bpmn/js/jquery-ui.js"></script>
                <!-- FORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- TABLE JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/igrp/table/jquery.dataTables.min.js"/>
                <script type="text/javascript" src="{$path}/core/igrp/table/dataTables.bootstrap.min.js"/>
                <!-- XML XSL TRANSFORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/formgen/js/xml.xsl.transform.js"/>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>

                <script type="text/javascript">
                  var vUrlGlob = '<xsl:value-of select="//rows/content/form/form_1/fields/extra_link/value"/>';
                  var vUrlLinkSave = '<xsl:value-of select="//rows/content/form_1/fields/link_save/value"/>';
                  var loaddata = '<xsl:value-of select="//rows/content/form_1/fields/data/value"/>';
                </script>
                <script type="text/javascript" src="{$path}/core/bpmn/release/go.js"></script>
                <script type="text/javascript" src="{$path}/core/bpmn/js/DrawCommandHandler.js"></script>
                <script type="text/javascript" src="{$path}/core/bpmn/js/BPMNClasses.js"></script>
                <script type="text/javascript" src="{$path}/core/bpmn/js/BPMN.js"></script>
                <script type="text/javascript" src="{$path}/core/bpmn/js/BPMN.init.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../core/bpmn/xsl/bpmn-tree-menu.tmpl.xsl?v=1482941622041"/>
</xsl:stylesheet>