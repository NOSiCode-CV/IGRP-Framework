<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
    <xsl:template match="/">
        <html>
            <head>
                <xsl:call-template name="IGRP-head"/>
                <!-- TOOLSBAR CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css" media="none" onload="if(media!='all')media='all'"/>
                <!-- FORM CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" media="none" onload="if(media!='all')media='all'"/>
                <!-- TABLE CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" media="none" onload="if(media!='all')media='all'"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css" media="none" onload="if(media!='all')media='all'"/>
                <!-- TABCONTENT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css" media="none" onload="if(media!='all')media='all'"/>
                <!-- SELECT CSS INCLUDES -->
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css" media="none" onload="if(media!='all')media='all'"/>
                <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css" media="none" onload="if(media!='all')media='all'"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/bpmnjs/assets/bpmn.css" media="none" onload="if(media!='all')media='all'"/>
                <style/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/bpmnjs/assets/app.css" media="none" onload="if(media!='all')media='all'"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/bpmnjs/assets/properties.css" media="none" onload="if(media!='all')media='all'"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/bpmnjs/assets/diagram-js.css" media="none" onload="if(media!='all')media='all'"/>
                <link rel="stylesheet" type="text/css" href="{$path}/core/bpmnjs/assets/bpmn-font/css/bpmn-embedded.css" media="none" onload="if(media!='all')media='all'"/>
            </head>
            <body class="{$bodyClass} white-sidebar">
                <!--<xsl:call-template name="IGRP-topmenu"/>-->
                <nav id="igrp-top-nav" class="navbar navbar-fixed-top" bg-color="1">
                    <a class="navbar-brand col-sm-4 col-md-3" href="{rows/link}" >
                        <img src="{$path}/themes/igrp_studio/img/studioLogoBlank.svg"/>
                        <span class=""><b>IGRP</b> <small></small></span>
                    </a>
                    <div id="side-bar-ctrl">
                        <i class="fa fa-navicon"></i>
                    </div>
                    <div id="igrp-app-title" class="">
                        <xsl:value-of select="rows/content/page_title/fields/page_title_text/value"/>
                    </div>
                </nav>
                <xsl:if test="rows/content/fmn">
                  <div class="toolsbar-holder default gen-container-item hidden" gen-structure="toolsbar" gen-fields=".btns-holder a.btn" item-name="fmn">
                    <div class="btns-holder   pull-right" role="group">
                      <xsl:apply-templates select="rows/content/fmn" mode="gen-buttons">
                        <xsl:with-param name="vertical" select="'true'"/>
                      </xsl:apply-templates>
                    </div>
                  </div>
                </xsl:if>
                <form method="POST" class="IGRP-form" name="formular_default">
                    <div class="container-fluid">
                        <div class="row">
                            <!--<xsl:call-template name="IGRP-sidebar"/>-->
                            <div class="col-md-3 col-sm-4 sidebar tree-list" id="igrp-sidebar">
                                <xsl:if test="rows/content/form_1/fields/env_fk">
                                    <div class="row">
                                    	<a id="igrp-doc" href="https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&amp;dad=tutorial&amp;target=_blank&amp;isPublic=1&amp;lang=pt_PT;&amp;p_type=bpmn" class="bpmn-controller link btn btn-link pull-right" target="_newtab" request-fields="">
					                      <i class="fa fa-question-circle" style="margin-right:5px"></i>Help
					                      </a>
					                      <a id="igrp-forum" href="https://gitter.im/igrpweb/bpmn?utm_source=share-link&amp;utm_medium=link&amp;utm_campaign=share-link" class="bpmn-controller link btn btn-link pull-right" target="_newtab" request-fields="">
					                      <i class="fa fa-comments" style="margin-right:5px"></i>Forum
					                      </a>
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
                                <xsl:if test="rows/content/tabcontent_1/fields/processos">
                                    <div class="col-md-12">
                                      <div class="row">
                                        <xsl:if test="rows/content/tabcontent_1/fields/processos">
                                          <div class="box-head subtitle" text-color="1">
                                            <span>
                                              <i class="fa fa-cog"/>
                                              <xsl:value-of select="rows/content/tabcontent_1/fields/processos/label"/>
                                            </span>
                                            <a class="addArea" title="{rows/content/form_1/fields/link_add_area/label}">
                                              <i class="fa fa-plus-circle"/>
                                            </a>
                                          </div>
                                        </xsl:if>
                                        <div class="list-processos" id="processos">
                                          <div id="tabprocessos">
                                              <xsl:apply-templates mode="tree-menu" select="rows/content/gen_table/table"/>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                </xsl:if>
                            </div>
                            <div class="col-sm-8 col-md-9 col-md-offset-3 col-sm-offset-4 main" id="igrp-contents">
                                <xsl:if test="count(rows/content/messages/message[@type != 'debug' and @type != 'confirm']) &gt;0">
                                  <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                                </xsl:if>
                                <div class="row hidden">
                                  <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_1/fields"/>
                                </div>
                                <div id="jsleftpanel" class="col-md-9">
                                    <div class="content js-panel" id="js-drop-zone">
                                        <div id="js-canvas"></div>
                                    </div>
                                    <div class="io-import-export">
                                        <ul class="io-import io-control io-control-list io-horizontal">
                                          <li>
                                            <button title="open BPMN diagram from local file system" jsaction="click:bio.openLocal">
                                              <span class="fa fa-folder-open"></span>
                                            </button>
                                          </li>
                                          <li class="vr" style="margin-left: 2px"></li>
                                          <li>
                                            <button title="create new BPMN diagram" jsaction="click:bio.createNew">
                                              <span class="fa fa-plus-circle"></span>
                                            </button>
                                          </li>
                                        </ul>

                                        <!--[if !IE]><!-->
                                        <ul class="io-export io-control io-control-list io-horizontal">
                                            <li>
                                                <a id="save" _jsaction="click:bio.save" href="" type="save" class="download export" title="Save BPMN diagram">
                                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="download" title="download BPMN diagram" jswidget="downloadBPMN" data-track="diagram:download-bpmn">
                                                    <span class="fa fa-download"></span>
                                                </a>
                                            </li>
                                            <li>
                                                <a class="download" title="download as SVG image" jswidget="downloadSVG" data-track="diagram:download-svg">
                                                    <span class="fa fa-picture-o"></span>
                                                </a>
                                            </li>
                                        </ul>
                                        <!--<![endif]-->
                                    </div>

                                    <!--<div class="io-alerts">
                                        <div class="io-control alert" jswidget="import-warnings-alert">
                                            <a class="close" aria-hidden="true" jsaction="click:bio.clearImportDetails">&amp;times;</a>
                                            Diagram may not render correctly due to import warnings.

                                            <a jsaction="click:bio.showImportDetails">Show details</a>.
                                        </div>

                                        <div class="io-control alert" jswidget="undo-redo-alert">
                                          You edited the diagram.

                                            <a jsaction="click:bio.undo">Undo last change</a>.

                                            <a class="close" aria-hidden="true" jsaction="click:bio.hideUndoAlert">&amp;times;</a>
                                        </div>
                                    </div>-->

                                    <div class="io-editing-tools active jscAttr" jswidget="editing-tools">
                                        <ul class="io-control-list io-horizontal">
                                          <li class="io-control">
                                            <button title="Toggle keyboard shortcuts overlay"
                                                    jsaction="click:bio.showKeyboard">
                                              <span class="fa fa-keyboard-o"> </span>
                                            </button>
                                          </li>
                                          <li class="io-control">
                                            <button title="Toggle Fullscreen"
                                                    jsaction="click:bio.toggleFullscreen">
                                              <span class="fa fa-expand"> </span>
                                            </button>
                                          </li>
                                          <!--<li class="io-control">
                                            <button title="Panel de Atributos" class="panelAttr jscAttr">
                                              <span class="fa fa-gear"></span>
                                            </button>
                                          </li>-->
                                        </ul>
                                    </div>

                                    <div class="io-zoom-controls jscAttr">

                                        <ul class="io-zoom-reset io-control io-control-list">
                                          <li>
                                            <button title="reset zoom" jsaction="click:bio.zoomReset">
                                              <span class="fa fa-crosshairs"></span>
                                            </button>
                                          </li>
                                        </ul>

                                        <ul class="io-zoom io-control io-control-list">
                                          <li>
                                            <button title="zoom in" jsaction="click:bio.zoomIn">
                                              <span class="fa fa-plus"></span>
                                            </button>
                                          </li>
                                          <li>
                                            <hr/>
                                          </li>
                                          <li>
                                            <button title="zoom out" jsaction="click:bio.zoomOut">
                                              <span class="fa fa-minus"></span>
                                            </button>
                                          </li>
                                        </ul>
                                    </div>

                                    <div class="io-dialog keybindings-dialog" jswidget="keybindings-dialog">

                                        <div class="content bindings-mac">
                                          <h1>Keyboard Shortcuts</h1>
                                          <table>
                                            <tbody>
                                              <tr>
                                                <td>Undo</td>
                                                <td class="binding">cmd + Z</td>
                                              </tr>
                                              <tr>
                                                <td>Redo</td>
                                                <td class="binding">cmd + <i class="fa fa-long-arrow-up" aria-hidden="true"></i> + Z</td>
                                              </tr>
                                              <tr>
                                                <td>Select All</td>
                                                <td class="binding">cmd + A</td>
                                              </tr>
                                              <tr>
                                                <td>Scrolling (Vertical)</td>
                                                <td class="binding">cmd + Scrolling</td>
                                              </tr>
                                              <tr>
                                                <td>Scrolling (Horizontal)</td>
                                                <td class="binding">cmd + <i class="fa fa-long-arrow-up" aria-hidden="true"></i> + Scrolling</td>
                                              </tr>
                                              <tr>
                                                <td>Direct Editing</td>
                                                <td class="binding">E</td>
                                              </tr>
                                              <tr>
                                                <td>Hand Tool</td>
                                                <td class="binding">H</td>
                                              </tr>
                                              <tr>
                                                <td>Lasso Tool</td>
                                                <td class="binding">L</td>
                                              </tr>
                                              <tr>
                                                <td>Space Tool</td>
                                                <td class="binding">S</td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </div>

                                        <div class="content bindings-default">
                                          <h1>Keyboard Shortcuts</h1>
                                          <table>
                                            <tbody>
                                              <tr>
                                                <td>Undo</td>
                                                <td class="binding">ctrl + Z</td>
                                              </tr>
                                              <tr>
                                                <td>Redo</td>
                                                <td class="binding">ctrl + <i class="fa fa-long-arrow-up" aria-hidden="true"></i> + Z</td>
                                              </tr>
                                              <tr>
                                                <td>Select All</td>
                                                <td class="binding">ctrl + A</td>
                                              </tr>
                                              <tr>
                                                <td>Scrolling (Vertical)</td>
                                                <td class="binding">ctrl + Scrolling</td>
                                              </tr>
                                              <tr>
                                                <td>Scrolling (Horizontal)</td>
                                                <td class="binding">ctrl + <i class="fa fa-long-arrow-up" aria-hidden="true"></i> + Scrolling</td>
                                              </tr>
                                              <tr>
                                                <td>Direct Editing</td>
                                                <td class="binding">E</td>
                                              </tr>
                                              <tr>
                                                <td>Hand Tool</td>
                                                <td class="binding">H</td>
                                              </tr>
                                              <tr>
                                                <td>Lasso Tool</td>
                                                <td class="binding">L</td>
                                              </tr>
                                              <tr>
                                                <td>Space Tool</td>
                                                <td class="binding">S</td>
                                              </tr>
                                            </tbody>
                                          </table>
                                        </div>
                                    </div>

                                    <div class="clear"></div>
                                </div>
                                <div id="jsrightpanel" class="col-md-3">
                                    <div class="js-panel jscAttr" id="js-properties-panel">
                                      
                                    <xsl:if test="rows/content/form_1/fields/formkey">
                                      <div class="bpm-lookup">

                                        <div class="form-group col-sm-12  gen-fields-holder" item-name="formkey" item-type="lookup">
                                          <div class="input-group">
                                            <input type="text" value="{rows/content/form_1/fields/formkey/value}" class="form-control gen-lookup " id="form_1_formkey" name="{rows/content/form_1/fields/formkey/@name}" maxlength="30">
                                              <xsl:call-template name="setAttributes">
                                                <xsl:with-param name="field" select="rows/content/form_1/fields/formkey"/>
                                              </xsl:call-template>
                                            </input>
                                            <xsl:call-template name="lookup-tool">
                                              <xsl:with-param name="page" select="rows/page"/>
                                              <xsl:with-param name="ad_hoc" select="'1'"/>
                                              <xsl:with-param name="action" select="'LOOKUP'"/>
                                              <xsl:with-param name="name" select="rows/content/form_1/fields/formkey/@name"/>
                                              <xsl:with-param name="js_lookup" select="rows/content/form_1/fields/formkey/lookup"/>
                                              <xsl:with-param name="input-id" select="'form_1_formkey'"/>
                                              <xsl:with-param name="btnClass" select="'primary'"/>
                                            </xsl:call-template>
                                          </div>
                                        </div>

                                        <xsl:if test="rows/content/form_1/fields/linkfile and rows/content/form_1/fields/linkfile/value != ''">
                                          <div class="form-group col-sm-12  gen-fields-holder" item-name="linkfile" item-type="link">
                                            <div class="row">
                                              <a href="{rows/content/form_1/fields/linkfile/value}" class="bpmn-controller link btn btn-link form-link" target="modal" request-fields="">
                                                <i class="fa fa-edit"/>
                                                <span>
                                                  <xsl:value-of select="rows/content/form_1/fields/linkfile/label"/>
                                                </span>
                                              </a>
                                            </div>
                                          </div>
                                        </xsl:if>
                                      </div>
                                    </xsl:if>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:call-template name="IGRP-bottom"/>
                </form>
                <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
                <!-- LOOKUP JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js?v={$version}"/>
                <!-- XML XSL TRANSFORM JS INCLUDES -->
                <script type="text/javascript" src="{$path}/core/formgen/js/xml.xsl.transform.js"/>
                <!-- TABCONTENT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js"/>
                <!-- SELECT JS INCLUDES -->
                <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"/>
                <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"/>
                <script type="text/javascript" src="{$path}/core/bpmnjs/app/globalbpmn.min.js"></script>

                <script type="text/javascript">
                  var vUrlGlob     = '<xsl:value-of select="//rows/content/form/form_1/fields/extra_link/value"/>';
                  var vUrlLinkSave = '<xsl:value-of select="//rows/content/form_1/fields/link_save/value"/>';
                  var loaddata     = '<xsl:value-of select="//rows/content/form_1/fields/data/value"/>';
                </script>
                <script type="text/javascript" src="{$path}/core/bpmnjs/app/xml2do.js"></script>
                <script type="text/javascript" src="{$path}/core/bpmnjs/app/bpmn.js"></script>
            </body>
        </html>
    </xsl:template>
    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1482941622041"/>
    <xsl:include href="../../../core/bpmnjs/xsl/bpmn-tree-menu.tmpl.xsl?v=1482941622041"/>
</xsl:stylesheet>
