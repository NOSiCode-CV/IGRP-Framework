<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	  <xsl:variable name="sourcePath" select="concat($path,'/core/formgen/util/gen.source.xml')"/>
    <xsl:variable name="gen" select="document($sourcePath)/gen"/>
    <xsl:variable name="logo">
      <xsl:choose>
        <xsl:when test="$themeConfigData/logo">
          <xsl:value-of select="concat($themePath,'/',$themeConfigData/logo)"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="concat($path,'/themes/default/img/logo2.svg')"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

  	<xsl:template name="formgen-html">
  		
      <html>
          
        <head>
            
            <xsl:call-template name="IGRP-head"/>
            
            <xsl:call-template name="GEN-head"/>

        </head>

        <body class="fixed-nav startin" view="gen-design" template="{rows/template}" id="igrp-form-gen">
            
          <nav id="igrp-top-nav" class="navbar navbar-fixed-top" bg-color="template">
              <a class="navbar-brand col-sm-3 col-md-2" href="#" >
                  <img src="{$logo}"/>
                  <span><b>IGRP</b></span>
              </a>
              <div id="side-bar-ctrl" bg-hover-color="template">
                  <i class="fa fa-navicon"></i>
              </div>
              <!-- <div id="igrp-app-title" class="">Studio</div> -->
              <div id="gen-views-ctrl">
                  <ul>
                      <li rel="gen-design" class="active" active-text-color="primary">
                          <span>DESIGN</span>
                      </li>
                      <li rel="gen-css" active-text-color="primary">
                          <span>CSS</span>
                      </li>
                      <li rel="gen-js" active-text-color="primary">
                          <span>JS</span>
                      </li>
                      <li rel="gen-xml" active-text-color="primary">
                          <span>XML</span>
                      </li>
                      <li rel="gen-xsl" active-text-color="primary">
                          <span>XSL</span>
                      </li>
                      <!-- <li rel="gen-plsql" xslt-path="{$path}/core/formgen/util/plsql" xslt-file="XSL-plsql.xsl" text-color="1">
                          <span>PLSQL</span>
                      </li>  -->
                      <li rel="gen-java" xslt-path="{$path}/core/formgen/util/java" xslt-file="XSL_GENERATOR.xsl" text-color="1">
                        <span>JAVA</span>
                    </li>
                  </ul>
              </div>
              <!--
              <div id="igrp-app-title" class="">INTEGRATED GOVERNMENT RESOURCE PLANNING</div>-->
              <ul id="igrp-top-menu" class="hidden-xs nav navbar-nav navbar-right">
                  <xsl:for-each select="rows/content/form/tools-bar/item">
                      <li>
                          <a target="{target}" class="form-gen-save igrpClick">
                              <xsl:call-template name="page-nav">
                                  <xsl:with-param name="action" select="link" />
                                  <xsl:with-param name="page" select="page" />
                                  <xsl:with-param name="app" select="app" />
                                  <xsl:with-param name="linkextra" select="parameter" />
                              </xsl:call-template> 
                              <xsl:value-of select="title"/>
                          </a>
                      </li>
                  </xsl:for-each>
                  <!-- <li alt="Publicar">
                      <a href="#">
                          <i class="fa fa-refresh"></i>
                      </a>
                  </li>
                  <li alt="Gravar" class="form-gen-save">
                      <a href="#">
                          <i class="fa fa-save"></i>
                      </a>
                  </li> -->
              </ul>
          </nav>

          <form class="IGRP-form" name="formular_default" novalidate="">
              <div class="container-fluid">
                  <div class="row">
                      <div class="col-md-2 col-sm-3 sidebar tree-list" id="igrp-sidebar" bg-color="primary">
                          
                          <ul class="nav nav-tabs col-md-2 col-sm-3 col-xs-12 clearfix" role="tablist" bg-color="primary">
                             <!--<li class="col-xs-4">
                                  <a class="txt-ellipsis" href="#gen-page-properties" role="tab" data-toggle="tab">
                                      <i class="fa fa-cog"></i>
                                      <span class="">Settings</span>
                                  </a>
                              </li>-->
                              <li class="active col-xs-6">
                                  <a class="txt-ellipsis" href="#gen-list-components" role="tab" data-toggle="tab">
                                      <i class="fa fa-cube"></i>
                                      <span class="">Components</span>
                                  </a>
                              </li> 
                              <li class="col-xs-6">
                                  <a class="txt-ellipsis" href="#gen-list-fields" role="tab" data-toggle="tab">
                                      <i class="fa fa-dot-circle-o"></i>
                                      <span class="">Fields</span>
                                  </a>
                              </li> 
                              
                          </ul>

                          <div class="form-group gen-searcher-wrapper col-md-2 col-sm-3 col-xs-12" h-calc="-55">
                           
                            <input bg-color="primary" type="text" class="form-control gen-types-search" placeholder="Pesquisar..."/>
                            
                            <span class="gen-type-search-clear">
                              <i class="fa fa-times"></i>
                            </span>

                            <div class="gen-searcher-contents" bg-color="primary">
                              
                            </div>

                          </div>

                          <div class="tab-content" style="margin:0 -20px;padding:0;border:0">
                              <div role="tabpanel" class="tab-pane active" id="gen-list-components">
                                  <ul class="treeview-menu gen-containers menu-open" style="display:block">
                                      <xsl:for-each select="$gen/containers/item">
                                          <xsl:sort select="label"/>
                                          <li class="gen-declared-containers" label="{label}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" hasField="{hasField}">
                                              <a href="#">
                                                  <xsl:call-template name="getComponentIcon"/>
                                                  <span>
                                                      <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </div>
                              <div role="tabpanel" class="tab-pane" id="gen-list-fields">
                                  <ul class="treeview-menu gen-fields menu-open" style="display:block">
                                      <xsl:for-each select="$gen/fields/item">
                                          <xsl:sort select="label"/>
                                          <li alt="{name}" title="{name}" label="{label}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" class="gen-declared-fields">
                                              <a href="#">
                                                  <xsl:call-template name="getComponentIcon"/>
                                                  <span >
                                                     <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </div>

                              <div role="tabpanel" class="tab-pane" id="gen-page-properties">
                                  
                                  <xsl:call-template name="page-properties-tab"/>

                              </div>

                          </div>

                          <!-- <ul class="nav nav-sidebar">
                            <li>
                                <a href="#" id="gen-page-setts-ctrl">
                                    <i class="fa fa-gears"></i>
                                    <span>PL/SQL Settings</span>
                                </a>
                            </li>

                            <li>
                                <a href="#" id="download-gen-xsl">
                                    <i class="fa fa-upload"></i>
                                    <span>Download</span>
                                </a>
                            </li> 

                        </ul> -->

                          <!-- <ul class="nav nav-sidebar">
                              <li class="treeview active">
                                  <a href="#">
                                      <i class="fa fa-th"></i>
                                      <span>Components</span>
                                      <i class="fa fa-angle-right pull-right"></i>
                                  </a>
                                  <ul class="treeview-menu gen-containers menu-open" style="display:block">
                                      <xsl:for-each select="$gen/containers/item">
                                          <li class="gen-declared-containers" alt="{name}" title="{name}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" hasField="{hasField}">
                                              <a href="#">
                                                  <i class="fa fa-angle-right"></i>
                                                  <span>
                                                      <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </li>
                              <li class="treeview">
                                  <a href="#">
                                      <i class="fa fa-dot-circle-o"></i>
                                      <span>Fields</span>
                                      <i class="fa fa-angle-right pull-right"></i>
                                  </a>
                                  <ul class="treeview-menu gen-fields">
                                      <xsl:for-each select="$gen/fields/item">
                                          <li alt="{name}" title="{name}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" class="gen-declared-fields">
                                              <a href="#">
                                                  <i class="fa fa-angle-right"></i>
                                                  <span>
                                                      <xsl:value-of select="label"/>
                                                  </span>
                                              </a>
                                          </li>
                                      </xsl:for-each>
                                  </ul>
                              </li>
                          </ul> -->
                      </div>
                      <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                          
                          <div class="content gen-viewers active" id="gen-design">
                              
                              <h2 id="gen-page-title"></h2>

                              <div class=" gen-rows-holder " >
                                  
                              </div>


                          </div>

                          <div id="gen-css" class="gen-viewers">
                              <div id="gen-css-view" class="gen-code-mirror"></div>
                          </div>

                          <div id="gen-js" class="gen-viewers">
                              <div id="gen-js-view" class="gen-code-mirror"></div>
                          </div>

                          <div id="gen-xml" class="gen-viewers">
                              <div id="gen-xml-view" class="gen-code-mirror"></div>
                          </div>
                          <div id="gen-xsl" class="gen-viewers">
                              <div id="gen-xsl-view" class="gen-code-mirror"></div>
                          </div>
                          <div id="gen-plsql" class="gen-viewers">
                              <div id="gen-plsql-view" class="gen-code-mirror"></div>
                          </div>

                          <div id="gen-java" class="gen-viewers">
                            <div class="gen-editor-toolsbar col-sm-2 pull-right" ></div>
                            <div class="gen-editors-wrapper"></div>
                            <!-- <div id="gen-java-view" class="gen-code-mirror col-sm-10 custom-size"></div> -->
                        </div>
                          

                          <div class="gen-viewers-toolbar clearfix">
                              
                              <div class="pull-left">
                                  <a href="#" class="btn btn-link gen-include-file">
                                      <span class="f-count"></span> <span class="f-type"></span> included
                                  </a>
                              </div>
                              
                              <div class="pull-left gen-toolbar-items" rel="java">
                                  <a href="{$path}/../../javadoc/index.html" class="btn btn-link" target="_newtab">                                  
                                   <i class="fa fa-file-text"></i>
                                  <span>Javadoc</span>                                  
                                  </a>
                                  <a href="https://nosicode.gitbook.io/faq/" class="btn btn-link" target="_newtab">                                 
                                    <i class=" fa fa-question-circle"></i>
                                    <span>FAQ</span>
                                  </a>
                              </div>


                              <div class="btn btn-link pull-right gen-copy-to-clipboard" >
                                 <i class="fa fa-clipboard"></i><span>Copiar</span>
                              </div>
                              <!-- <a class="btn btn-link pull-right gen-download-content" href="#">
                                 <i class="fa fa-upload"></i><span>Download</span>
                              </a> -->
                              <a class="btn btn-link pull-right gen-page-setts-ctrl"  rel="plsql">
                                  <i class="fa fa-gears"></i>
                                  <span>Settings</span>
                              </a>
                          </div>
                          


                      </div>
                  </div>
              </div>
              <!--
              <div class="link-opener">
                  <iframe id="opener-frame"></iframe>
              </div>-->
              <form-hidden class="form-hidden" style="display:none!important">
                  <xsl:if test="rows/content/form/label/page_xml">
                      <input type="hidden" name="{rows/content/form/value/page_xml/@name}" value="{rows/content/form/value/page_xml}"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/page_xsl">
                      <input type="hidden" name="{rows/content/form/value/page_xsl/@name}" value="{rows/content/form/value/page_xsl}" id="id_{rows/content/form/value/page_xsl/@name}"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/data">
                      <input type="hidden" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" id="{rows/content/form/value/data/@name}" class="file uploadFile form-hidden"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/id_objeto">
                      <input type="hidden" id="id_objeto" name="{rows/content/form/value/id_objeto/@name}" value="{rows/content/form/value/id_objeto}" class="number form-hidden" maxlength="30"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/nome">
                      <input type="hidden" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text form-hidden" maxlength="100"/>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/link_image">
                      <input type="hidden" class="form-hidden" name="p_link_image" value="{rows/content/form/value/link_image}"></input>
                  </xsl:if>
                  <xsl:if test="rows/content/form/label/link_save">
                      <input type="hidden" class="form-hidden" name="p_link_save" value="{rows/content/form/value/link_save}"></input>
                  </xsl:if>
              </form-hidden>
              <!--PAGE SETTINGS-->
              <div class="modal fade" data-backdrop="static" tabindex="-1" id="gen-settings-modal" role="dialog" >
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h4 id="" class="modal-title">Settings</h4>
                          </div>
                          <div class="modal-body" role="form">
                              <div id="gen-page-settings" rel="settings">
                                  <!--  <xsl:if test="rows/content/form/label/instancia">
                                      <div class="col-md-6 form-group" item-name="instancia">
                                          <label>
                                              <xsl:value-of select="rows/content/form/label/instancia" disable-output-escaping="yes"/>
                                          </label>
                                          <select name="{rows/content/form/list/instancia/@name}" id="{rows/content/form/list/instancia/@name}" data-placeholder="{rows/content/form/list/instancia/option[position() = 1]/text}" class="select gen-page-setter form-control" rel="instance" required="required">
                                              
                                              <xsl:for-each select="rows/content/form/list/instancia/option[position() != 1]">
                                                  <option value="{value}">
                                                      <xsl:if test="@selected='true'">
                                                          <xsl:attribute name="selected">selected</xsl:attribute>
                                                      </xsl:if>
                                                      <xsl:value-of select="text"/>
                                                  </option>
                                              </xsl:for-each>
                                          </select>
                                      </div>
                                  </xsl:if>-->
                                  <div class="col-md-6 form-group" item-name="gentype">
                                      <label>Gen Type</label>
                                      <select name="p_gentype" id="p_gentype" class="select gen-page-setter form-control" rel="gentype">
                                        <!-- <option value="plsql" >Plsql</option> -->
                                        <option value="java" selected="">Java</option>
                                      </select>
                                  </div>
                                  <div class="col-md-6 form-group" item-name="table_name">
                                      <label>Table Name</label>
                                      <input rel="table" type="text" name="plsql_table" value="" class="text gen-page-setter form-control" maxlength="50"/>
                                  </div>
                                  <div class="col-md-6 form-group" item-name="package_db_name" required="required">
                                      <label>Package Name (DB)</label>
                                      <input rel="package" required="" type="text" name="plsql_pack" value="" class="text gen-page-setter form-control" maxlength="50"/>
                                  </div>
                                  <div class="col-md-6 form-group" item-name="package_html_name" required="required">
                                      <label>Package Name (HTML)</label>
                                      <input rel="html" type="text" required="" name="plsql_html" value="" class="text gen-page-setter form-control" maxlength="50"/>
                                  </div>

                                  <!-- <div class="col-md-6 form-group" item-name="subversionpath">
                                      <label>Subversion Path</label>
                                      <input rel="subversionpath" type="text" name="plsql_subv" value="" class="text gen-page-setter form-control"/>
                                  </div> -->
                                  <div class="col-md-6 form-group" item-name="page_service">
                                      <label>Service</label>
                                      <div class="settings-service"></div>
                                  </div>
                                  <!-- <div class="col-md-5 col-md-offset-1 checkbox" style="margin-top:15px">
                                      <div  item-name="replace">
                                          <input rel="replace" type="checkbox" name="plsql_replace" value="" class="checkbox gen-page-setter "/>
                                          <span>Replace</span>
                                      </div>
                                      <div item-name="label">
                                          <input rel="label" type="checkbox" name="plsql_label" value="" class="checkbox gen-page-setter"/>
                                          <span>Label</span>
                                      </div>
                                  </div> -->
                              </div>
                          </div>
                          <div class="modal-footer" id="gen-page-setts-btns" style="clear:both">
                              <button disabled="disabled" class="btn btn-link" id="gen-execute-subv">Subversion</button>
                              <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                              <button type="button" class="btn btn-primary" id="gen-page-setts-confirm">Confirm</button>
                          </div>
                      </div>
                  </div>
              </div>
              <!--EDITION MODAL-->
              <div class="modal fade" tabindex="" id="gen-edition-modal" role="dialog" >
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <ul>
                                  <li class="active" rel="properties">Properties</li>
                                  <li rel="style">Style</li>
                                  <li rel="rules">Rules</li>
                                  <li rel="xsl">XSL</li>
                                  <li rel="copy" gen-type="container">Copy From</li>
                              </ul>
                              <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times"/></button>
                          </div>
                          <div class="modal-body" role="form">
                              <div rel="properties" class="gen-properties-setts-holder active">
                                  
                              </div>

                              <div rel="style" class="gen-properties-setts-holder">
                                  <div class="form-group col-md-6">
                                      <label>ID</label>
                                      <input type="text" rel="id" value="" class="form-control style-setter"/>
                                  </div>
                                  <div class="form-group col-md-6">
                                      <label>Class</label>
                                      <input type="text" rel="class" value="" class="form-control style-setter"/>
                                  </div>
                                  <div class="form-group col-md-12">
                                      <label>Inline Style</label>
                                      <textarea rel="inline" value="" class="form-control style-setter"/>
                                  </div>
                              </div>

                              <div rel="rules" class="gen-properties-setts-holder">
                                  <xsl:call-template name="rules-list"/>
                              </div>

                              <div rel="xsl" class="gen-properties-setts-holder">
                                  <div>
                                      <!-- <select class="object-xsl-templates"></select> -->
                                      <input id="use-default-xsl" type="checkbox"/>Default
                                  </div>
                                  
                                  <div id="gen-edit-xsl" class="gen-code-mirror">
                                      
                                  </div>
                              </div>

                              <div rel="copy" class="gen-properties-setts-holder" gen-type="container">
                                  
                                  <div class="col-md-12 form-group" item-type="select" >
                                      <label>From Page</label>
                                      <select id="gen-page-copy-selecter" class="form-control select2"></select>
                                  </div>

                                  <div id="gen-page-copy-c-list" class="col-md-12 form-group">
                                          
                                  </div>
                              </div>

                          </div>
                          <div class="modal-footer">
                              <div class="">
                                  <span class="info object"></span>
                                  <span class="info type"></span>
                                  <span class="info parent" style="display:none"></span>
                              </div>
                              
                              <div class="modal-buttons text-right">
                                  <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button> 
                              	<button type="button" class="btn btn-primary"  id="gen-edit-confirm">Confirm <i class="fa fa-check"/></button>
                          	</div>
                          </div>

                      </div>
                  </div>
              </div>
              <!-- <a class="btn btn-primary" data-toggle="modal" href='#modal-id'>Trigger modal</a> -->
              <div class="modal fade" id="gen-include-file-modal">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                              <h4 class="modal-title"></h4>
                          </div>
                          <div class="modal-body">
                              <div class="box gen-container-item clean" gen-class="" item-name="file_inc">
                                <div class="box-body IGRP-separatorlist" tag="file_inc" dialog="false">
                                  <div class="splist-form-holder">
                                    <div class="splist-form" role="form">
                                      <div class="form-group col-md-12 gen-fields-holder" item-name="file" item-type="text" required="required">
                                        <label>File URL</label>
                                        <input required="required" type="text" value="" class="form-control " id="p_file" name="p_file"></input>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="table-box box-body box-table-contents splist-table">
                                    <table rel="T_file_inc" id="file_inc" class="table table-striped gen-data-table">
                                      <thead>
                                        <tr>
                                          <th align="" item-name="file">Files</th>
                                          <th class="table-btn">
                                            <a class="table-row-add btn btn-link">
                                              <i class="fa fa-plus"/>
                                            </a>
                                          </th>
                                        </tr>
                                      </thead>
                                      <tbody>

                                      </tbody>
                                    </table>
                                  </div>
                                </div>
                              </div>
                          </div>
                          <div class="modal-footer">
                              <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                              <button type="button" class="btn btn-primary" id="gen-inc-confirm">Confirm</button>
                          </div>
                      </div>
                  </div>
              </div>

              <xsl:call-template name="IGRP-bottom"/>
          </form>

          <script src="{$path}/core/formgen/js/GEN.componentsSearcher.js"></script>

          <script src="{$path}/core/bootstrap/plugins/tabdrop/js/bootstrap-tabdrop.js" type="text/javascript"></script>

          <!-- RULES -->
          <script src="{$path}/core/igrp/IGRP.rules.class.js"></script>
          <!-- /RULES -->

          <!-- start:LOOKUP JS INCLUDES -->
          <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js">
          </script>
          <!-- end:LOOKUP JS INCLUDES -->

          <!-- start:SEPARATORLIST -->
          <script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js"></script>
          <script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js"></script>
          <script type="text/javascript" src="{$path}/plugins/select2/select2.init.js"></script>
          <!-- end:SEPARATORLIST -->

          <!-- FORMLIST JS INCLUDES -->
          <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>


          <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"></script>
         
          <script src="{$path}/core/bootstrap/plugins/treeview/js/bootstrap-treeview.js"></script>
          <!--code mirror-->
          <script src="{$path}/core/codemirror/js/codemirror.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/xml-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/matchtags.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/closebrackets.js"></script>
          <script src="{$path}/core/codemirror/js/mode/css/css.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/matchbrackets.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xml.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xslt.js"></script>
          <script src="{$path}/core/codemirror/js/formatting.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/xml-hint.js"></script>
          <script src="{$path}/core/codemirror/js/mode/sql/sql.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/show-hint.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/sql-hint.js"></script>

          <script src="{$path}/core/codemirror/js/addon/search/search.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/searchcursor.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/dialog.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/jump-to-line.js"></script>


          <script src="{$path}/core/codemirror/js/clike.js"></script>
          <!--gen-->
          <script>var gPATH = "<xsl:value-of select='$path' />/app/RED";</script>
          <script src="{$path}/core/formgen/js/chance.js"></script>
          <script src="{$path}/core/formgen/js/jquery-ui.min.js"></script>
          <script src="{$path}/core/formgen/js/string.js" charset="utf-8"></script>
          <!-- <script src="{$path}/core/formgen/js/xml.xsl.transform.js"></script> -->
          <script src="{$path}/core/formgen/js/GEN.converter.2dot2.js"></script>
          <script src="{$path}/core/formgen/js/GEN.vars.js"></script>
          <script src="{$path}/core/formgen/js/GEN.getdata.js"></script>
          <script src="{$path}/core/formgen/js/GEN.Xsl.js"></script>
          <script src="{$path}/core/formgen/js/GEN.XML.js"></script>
          
          <script src="{$path}/core/formgen/js/GEN.config.js"></script>

          <!-- RULEs -->
          <script src="{$path}/core/formgen/js/GEN.rules.js"></script>
          <!-- COLOR PICKER -->
          <script src="{$path}/core/formgen/js/service/jquery.jsPlumb-1.5.5.js"></script>
          <script src="{$path}/core/formgen/js/service/xsdmapper.js"></script>
          <script src="{$path}/core/formgen/js/GEN.service.js"></script>
          <script src="{$path}/core/formgen/js/GEN.layout.js"></script>
          <script src="{$path}/core/formgen/js/GEN.templates.js"></script>
          <script src="{$path}/core/xml2json/jquery.xml2json.js"></script>
          <script src="{$path}/core/formgen/js/GEN.downloadXSL.js"></script>
          <script src="{$path}/core/formgen/js/GEN.controller.js"></script>
          <script src="{$path}/core/formgen/js/GEN.containers.js" charset="utf-8"></script>
          <script src="{$path}/core/formgen/js/GEN.fields.js"></script>
          <script src="{$path}/core/formgen/js/GEN.html.js"></script>

          <script src="{$path}/core/formgen/js/GEN.server.js"></script>

          <script src="{$path}/core/formgen/js/GEN.structures.js"></script>

          <script src="{$path}/core/formgen/js/GEN.xsl.templates.utils.js"></script>

          <script src="{$path}/core/formgen/js/GEN.subversion.js"></script>
          <script src="{$path}/core/formgen/js/vkbeautify.0.99.00.beta.js"></script>
          <script>

            this[VARS.name] = new GENERATOR({
            
              sourcePath : "<xsl:value-of select="$sourcePath"/>",

              dataSrc    : "<xsl:value-of select="rows/content/form/value/page_form"/>",

              imagesURL  : "<xsl:value-of select="rows/content/form/value/link_image"/>",

              configURL  : "<xsl:value-of select="rows/content/form/value/gen_elements"/>",

              server     : {

                java : {

                    basePath : '<xsl:value-of select="$path"/>/core/formgen/util/java',

                    codes : [
                        {
                            name : 'CONTROLLER',
                            xsl  : '/mvc/XSL_CONTROLLER.xsl'
                        },
                        {
                            name : 'MODEL',
                            xsl  : '/mvc/XSL_MODEL.xsl'
                        },

                        {
                            name : 'VIEW',
                            xsl  : '/mvc/XSL_VIEW.xsl'
                        }

                       

                    ]

                }

            }


            });

            var __GEN = this[VARS.name];

          </script>
          
          <!-- GEN Java Auto Complete -->
          <script src="{$path}/core/formgen/js/GEN.autocomplete.js"></script>

          <script src="{$path}/core/formgen/js/GEN.attributes.js"></script>

          <script src="{$path}/core/formgen/js/GEN.importTemplates.js"></script>

          <script src="{$path}/core/formgen/js/GEN.includeFiles.js"></script>
          


          <xsl:for-each select="$gen/containers/item">
              <xsl:if test="not(@js) or @js!='false'">
                  <script src="{$path}/core/formgen/types/containers/{name}/js/{name}.js"></script>
              </xsl:if>
          </xsl:for-each>
          <xsl:for-each select="$gen/fields/item">
              <script src="{$path}/core/formgen/types/fields/{type}/{type}.js"></script>
          </xsl:for-each>

          <script id="custom-js"></script>
        
        </body>

      </html>

  	</xsl:template>

    <xsl:template name="rules-list">
       
        <div class="box gen-container-item "  gen-class="" item-name="separatorlist_2">
          <div class="box-body IGRP-separatorlist" id="gen-rules-holder"  tag="separatorlist_2" dialog="true">
            <div class="splist-form-holder clearfix">

              <div class="splist-form clearfix" role="form">

                <div class="form-group col-md-6 " item-name="gen_rule_name" item-type="text">
                  <label>Name</label>
                  <input type="text" name="p_gen_rule_name" class="form-control rule-setter" rel="gen_rule_name"/>
                </div>
              
                <div class="col-md-6 form-group" item-name="gen_rule_event" item-type="select" required="required">
                    <label>Event</label>
                    <select  required="required" multiple="multiple" name="p_gen_rule_event" class="form-control rule-setter select2" rel="gen_rule_event">
                        <option value="load" label="Load">Load</option>
                        <option value="change" label="Change">Change</option>
                        <option value="blur" label="Blur">Blur</option>
                        <option value="keyup" label="Keyup">Keyup</option>
                        <option value="click" label="Click">Click</option>
                    </select>
                </div>
                
                <div class="box-head subtitle" text-color="1"><span>Condition/Value</span></div>
                
                <div class="col-md-6 form-group" item-name="gen_rule_condition" item-type="select" >
                  <label>Condition</label>
                  <select  name="p_gen_rule_condition" class="select2 form-control rule-setter" rel="gen_rule_condition">
                      
                      <option value=""></option>
                      
                      <option value="equal">Equals</option>

                      <option value="diff">Differs</option>

                      <option value="contains">Contains</option>  

                      <option value="notcontains">Not Contains</option>

                      <option value="checked">Checked</option>  

                      <option value="unchecked">Unchecked</option>
                  
                      <option value="greater">Greater than</option>

                      <option value="less">Less than</option>
                     
                      <option value="between">Between</option>
                      
                      <option value="notnull">Not Null</option>

                      <option value="null">Null</option>
                      
                      <option value="startwith">Start With</option>

                      <option value="notstartwith">Not Start With</option>

                      <option value="endwith">End With</option>

                      <option value="notendwith">Not End With</option>

                      <option value="regexp">RegExp</option>
                      
                      <option value="jsx">Custom</option>

                  </select>
                </div>
                
                <div class="form-group col-md-6" item-name="gen_rule_value" item-type="text">
                    <label>Value</label>
                    <input name="p_gen_rule_value" type="text" class="form-control rule-setter" rel="gen_rule_value"/>
                </div>

                <div class="form-group col-md-6" item-name="gen_rule_value2" item-type="text">
                    <label>Value 2</label>
                    <input name="p_gen_rule_value2" type="text" class="form-control rule-setter" rel="gen_rule_value2"/>
                </div>

                <div class="col-md-6 form-group"  item-name="gen_rule_patern" item-type="select" required="required">
                    <label>Pattern</label>
                    <select  required="required" name="p_gen_rule_patern" class="form-control rule-setter select2" rel="gen_rule_patern">
                        <option></option>
                        <option value="email">E-mail</option>
                        <option value="date">Date</option>
                        <option value="custom">Custom</option>
                    </select>
                </div>

                <div class="form-group col-md-12" item-name="gen_rule_patern_custom" item-type="text">
                    <label>Custom Pattern</label>
                    <input name="p_gen_rule_patern_custom" type="text" class="form-control rule-setter" rel="gen_rule_patern_custom"/>
                </div>

                <div class="col-md-12" item-name="gen_rule_opposite" item-type="checkbox">
                    <div class="form-group">
                        <div class="checkbox form-check-offset">
                            <label>
                                <input type="checkbox" name="p_gen_rule_opposite" class="checkbox" label="Opposite Rule?" value="1" rel="gen_rule_opposite"/>Opposite Rule?
                            </label>
                        </div>
                    </div>
                </div>

                <div class="form-group hidden col-md-6" item-name="gen_rule_actions" item-type="text">
                    <label>Actions</label>
                    <input name="p_gen_rule_actions" type="text" class="form-control rule-setter" rel="gen_rule_actions"/>
                </div>

              </div>
            </div>

            <div class="table-box box-body box-table-contents splist-table">
              <table rel="T_separatorlist_2" id="separatorlist_2" class="table table-striped gen-data-table">
                <thead>
                  <tr>

                    <th align="" item-name="gen_rule_name">
                      <span>
                        Name
                      </span>
                    </th>

                    <th align="" item-name="gen_rule_event">
                      <span>
                        Event
                      </span>
                    </th>

                    <th class="table-btn">
                      <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                        <i class="fa fa-plus"/>
                      </a>
                    </th>
                  </tr>
                </thead>
                <tbody>

                </tbody>
              </table>
            </div>
          </div>
        </div>
        
        <div id="act-list-wrp" class="hidden">
          <div class="box gen-container-item " gen-class="" item-name="actions_list">
            <div class="box-body IGRP-separatorlist" tag="actions_list" dialog="false">
              <div class="splist-form-holder">
                <div class="splist-form" role="form">

                  <div class="box-head subtitle" text-color="1"><span>Actions/Targets</span></div>

                  <div class="col-sm-6 form-group  gen-fields-holder" item-name="gen_rule_action" item-type="select" required="required">
                    
                    <label for="p_gen_rule_action">
                      Action
                    </label>

                    <select class="form-control rule-setter select2 " id="actions_list_gen_rule_action" name="p_gen_rule_action" required="required">
                      <option value="show" >Show</option>
                      <option value="showicon" >Show Icon (date lookup)</option>
                      <option value="hide">Hide</option>
                      <option value="hideicon">Hide Icon (date lookup)</option>
                      <option value="disabled">Disable</option>
                      <option value="enabled">Enable</option>
                      <option value="required">Required</option>
                      <option value="notrequired">Not Required</option>
                      <option value="cleanValue">Clean Value</option>
                      <option value="readonly">Readonly</option>
                      <option value="notreadonly">Not Readonly</option>
                      <option value="remote">Remote</option>
                      <option value="remote_combobox">Remote Combo Box</option>
                      <option value="remote_list">Remote List</option>
                      <option value="message">Notify</option>
                    </select>

                  </div>

                  <div class="col-sm-6 form-group  gen-fields-holder" item-name="gen_rule_targets" item-type="select">
                    <label for="p_gen_rule_targets">
                      Targets
                    </label>
                    <select class="form-control rule-setter select2 " multiple="multiple" id="actions_list_gen_rule_targets" name="p_gen_rule_targets" rel="gen_rule_action">
                      
                    </select>
                  </div>

                  <div class="form-group col-sm-6   gen-fields-holder" item-name="gen_rule_procedure" item-type="text">
                    <label for="p_gen_rule_procedure">
                      <span>
                        Procedure
                      </span>
                    </label>
                    <input type="text" value="" class="form-control rule-setter " id="p_gen_rule_procedure" name="p_gen_rule_procedure" maxlength="500" placeholder="">
                    </input>
                  </div>

                  <div class="form-group col-sm-6   gen-fields-holder" item-name="gen_rule_request_fields" item-type="text">
                    <label for="p_gen_rule_request_fields">
                      <span>
                        Request Fields
                      </span>
                    </label>

                    <select class="form-control rule-setter select2 " multiple="multiple" id="gen_rule_request_fields" name="p_gen_rule_request_fields" ></select>

                  </div>

                  <div class="col-sm-6 form-group  gen-fields-holder" item-name="gen_rule_msg_type" item-type="select" >
                    <label for="p_gen_rule_msg_type">
                      Message Type
                    </label>
                    <select class="form-control rule-setter select2 " id="actions_list_gen_rule_msg_type" name="p_gen_rule_msg_type" >
                      <option value="info">Info</option>
                      <option value="success">Success</option>
                      <option value="warning">Warning</option>
                      <option value="danger">Danger</option>
                    </select>
                  </div>

                  <div class="form-group col-sm-12   gen-fields-holder" item-name="gen_rule_msg" item-type="text">
                    <label for="p_gen_rule_msg">
                      <span>
                        Message
                      </span>
                    </label>
                    <input type="text" value="" class="form-control rule-setter " id="p_gen_rule_msg" name="p_gen_rule_msg" maxlength="2000" placeholder="">
                    </input>
                  </div>

                </div>
              </div>
              <div class="table-box box-body box-table-contents splist-table">
                <table rel="T_actions_list" id="actions_list" class="table table-striped gen-data-table">
                  <thead>
                    <tr>

                      <th align="" item-name="gen_rule_action">
                        <span>
                          Action
                        </span>
                      </th>

                      <th align="" item-name="gen_rule_targets">
                        <span>
                          Targets
                        </span>
                      </th>

                      <th class="table-btn">
                        <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
                          <i class="fa fa-plus"/>
                        </a>
                      </th>
                    </tr>
                  </thead>
                  <tbody>

                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>

    </xsl:template>

	  <xsl:template name="rules-list2">
        <div class="box clean" >
            <div class="box-body IGRP-separatorlist" id="gen-rules-holder" dialog="true" >
                <div class="splist-form-holder" >
                    <div class="splist-form" role="form" >
                        <div class="form-group col-md-6 " item-name="gen_rule_name" item-type="text">
                            <label>Name</label>
                            <input type="text" name="p_gen_rule_name" class="form-control rule-setter" rel="gen_rule_name"/>
                        </div>
                        <div class="col-md-6 form-group" item-name="gen_rule_event" item-type="select" required="required">
                            <label>Event</label>
                            <select  required="required" multiple="multiple" name="p_gen_rule_event" class="form-control rule-setter select2" rel="gen_rule_event">
                                <option value="load" label="Load">Load</option>
                                <option value="change" label="Change">Change</option>
                                <option value="blur" label="Blur">Blur</option>
                                <option value="keyup" label="Keyup">Keyup</option>
                                <option value="click" label="Click">Click</option>
                            </select>
                        </div>
                        
                        <div class="box-head subtitle">Condition/Value</div>
                        
                        <div class="col-md-6 form-group" item-name="gen_rule_condition" item-type="select" >
                            <label>Condition</label>
                            <select  name="p_gen_rule_condition" class="select2 form-control rule-setter" rel="gen_rule_condition">
                                
                                <option value=""></option>
                                
                                <option value="equal">Equals</option>
                                <option value="diff">Differs</option>

                                <option value="contains">Contains</option>                            
                                <option value="notcontains">Not Contains</option>
                            
                                <option value="greater">Greater than</option>
                                <option value="less">Less than</option>
                                
                                <option value="between">Between</option>
                                
                                <option value="notnull">Not Null</option>
                                <option value="null">Null</option>
                                
                                <option value="startwith">Start With</option>
                                <option value="notstartwith">Not Start With</option>

                                <option value="endwith">End With</option>
                                <option value="notendwith">Not End With</option>

                                <option value="regexp">RegExp</option>
                            </select>
                        </div>
                        
                        <div class="form-group col-md-6" item-name="gen_rule_value" item-type="text">
                            <label>Value</label>
                            <input name="p_gen_rule_value" type="text" class="form-control rule-setter" rel="gen_rule_value"/>
                        </div>

                        <div class="form-group col-md-6" item-name="gen_rule_value2" item-type="text">
                            <label>Value 2</label>
                            <input name="p_gen_rule_value2" type="text" class="form-control rule-setter" rel="gen_rule_value2"/>
                        </div>

                        <div class="col-md-6 form-group"  item-name="gen_rule_patern" item-type="select" required="required">
                            <label>Pattern</label>
                            <select  required="required" name="p_gen_rule_patern" class="form-control rule-setter select2" rel="gen_rule_patern">
                                <option></option>
                                <option value="email">E-mail</option>
                                <option value="date">Date</option>
                                <option value="custom">Custom</option>
                            </select>
                        </div>

                        <div class="form-group col-md-12" item-name="gen_rule_patern_custom" item-type="text">
                            <label>Custom Pattern</label>
                            <input name="p_gen_rule_patern_custom" type="text" class="form-control rule-setter" rel="gen_rule_patern_custom"/>
                        </div>

                        <div class="box-head subtitle">Action/Target</div>

                        <div class="col-md-6 form-group" item-name="gen_rule_action" item-type="select" required="required">
                            <label>Action</label>
                            <select required="required" name="p_gen_rule_action" class="select2 form-control rule-setter" rel="gen_rule_action">
                                <option value="show">Show</option>
                                <option value="showicon">Show Icon (date/lookup)</option>
                                <option value="hide">Hide</option>
                                <option value="hideicon">Hide Icon (date/lookup)</option>
                                <option value="disabled">Disable</option>
                                <option value="enabled">Enable</option>
                                <option value="required">Required</option>
                                <option value="notrequired">Not Required</option>
                                <option value="readonly">Readonly</option>
                                <option value="notreadonly">Not Readonly</option>
                                <option value="remote_combobox">Remote Combo Box</option>
                                <option value="message">Notify</option>
                                
                            </select>
                        </div>

                        <div class="col-md-6 form-group" item-name="gen_rule_targets" item-type="select" required="required">
                            <label>Target(s)</label>
                            <select required="required" name="p_gen_rule_targets" multiple="true" class="select2 form-control rule-setter" rel="gen_rule_targets"></select>
                        </div>

                        <div class="form-group col-md-6" item-name="gen_rule_procedure" item-type="text">
                            <label>Procedure</label>
                            <input name="p_gen_rule_procedure" type="text" class="form-control rule-setter" rel="gen_rule_procedure"/>
                        </div>

                        <div class="col-md-6 form-group" item-name="gen_rule_msg_type" item-type="select" required="required">
                            <label>Message Type</label>
                            <select required="required" name="p_gen_rule_msg_type" class="select2 form-control rule-setter" rel="gen_rule_msg_type">
                                <option value="info">Info</option>
                                <option value="success">Success</option>
                                <option value="warning">Warning</option>
                                <option value="danger">Danger</option>
                            </select>
                        </div>

                        <div class="form-group col-md-6" item-name="gen_rule_msg" item-type="text">
                            <label>Message</label>
                            <input name="p_gen_rule_msg" type="text" class="form-control rule-setter" rel="gen_rule_msg"/>
                        </div>


                        <div class="col-md-6" item-name="gen_rule_opposite" item-type="checkbox">
                            <div class="form-group">
                                <div class="checkbox form-check-offset">
                                    <label>
                                        <input type="checkbox" name="p_gen_rule_opposite" class="checkbox" label="Opposite Rule?" value="1" rel="gen_rule_opposite"/>Opposite Rule?
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="table-box box-body box-table-contents splist-table">
                    <table rel="T_separatorlist_1" id="gen-rules-table" class="table table-striped gen-data-table">
                        <thead>
                            <tr gen-id="drop-zone" gen-field-template="th">
                                <th align="" item-name="gen_rule_name">Name</th>
                                <th align="" item-name="gen_rule_event">Event</th>
                                <!-- <th align="" item-name="gen_rule_condition">Condition</th>
                                <th align="" item-name="gen_rule_value">Value</th> -->
                                <!-- <th align="" item-name="gen_rule_action">Action</th>
                                <th align="" item-name="gen_rule_targets">Target(s)</th> -->
                                <th class="table-btn">
                                    <span class="table-row-add btn">
                                        <i class="fa fa-plus"></i>
                                    </span>
                                </th>
                               
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="getComponentIcon">
        <xsl:choose>
            <xsl:when test="icon/@type = 'fa'">
                <i class="fa fa-{icon}"></i>
            </xsl:when>
            <xsl:when test="icon/@type = 'gly'">
                <i class="glyphicon glyphicon-{icon}"></i>
            </xsl:when>
            <xsl:when test="icon/@type = 'img'">
                <img src="{$path}/core/formgen/img/components/{.}"/>
            </xsl:when>
            <xsl:otherwise>
                <i class="fa fa-angle-right"></i>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="GEN-head">
        
        <link href="{$path}/core/bootstrap/plugins/tabdrop/css/tabdrop.css" rel="stylesheet"/>
               
        <link rel="stylesheet" href="{$path}/core/bootstrap/plugins/treeview/css/bootstrap-treeview.css"/>
       
        <!--codeMirror-->
        <link href="{$path}/core/codemirror/css/codemirror.css" rel="stylesheet"/>
        <!--code mirror sql-->
        <link rel="stylesheet" href="{$path}/core/codemirror/css/show-hint.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/dialog.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/matchesonscrollbar.css" />
        <!--GEN-->
        
        <!-- start:SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <!-- end:SEPARATORLIST CSS INCLUDES -->
        
        <!-- start:SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css"/>
        <!-- end:SELECT CSS INCLUDES -->

        <link href="{$path}/core/formgen/css/style.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/types.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/layout.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/service/style.css" rel="stylesheet"></link>
        <link href="{$path}/core/formgen/css/message.css" rel="stylesheet"></link>
        <link media="all and (max-width:1023px)" type="text/css" href="{$path}/core/formgen/css/tablet.css" rel="stylesheet"/>
        
        <link href="{$path}/core/formgen/css/modern.css" rel="stylesheet"></link>

        <!-- FORMLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>

		
        <style id="custom-css"></style>

    </xsl:template>

    <xsl:include href="tmpl/page-properties-tab-content.xsl"/>

</xsl:stylesheet>