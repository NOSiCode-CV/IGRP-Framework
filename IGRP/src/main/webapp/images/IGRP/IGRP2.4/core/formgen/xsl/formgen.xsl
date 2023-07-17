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
          <xsl:call-template name="GEN-head"/>
          <xsl:call-template name="igrp-head"/>
          <link href="{$path}/core/formgen/css/gen2.css" rel="stylesheet"/>
          <link href="{$path}/core/igrp/toolsbar/igrp.ds.toolsbar.css" rel="stylesheet"/>

          <script>    
           	window.moveTo(0, 0);
           	window.resizeTo(screen.width, screen.height);
      	  </script>
        </head>

        <body class="fixed-nav startin" view="gen-design" template="{rows/template}" id="igrp-form-gen">     
                   
          <nav id="igrp-top-nav" class="flex-nowrap navbar navbar-fixed-top d-flex align-items-center justify-content-start pt-0" bg-color="template" style="position: sticky;">
                <div id="side-bar-ctrl" bg-hover-color="template">
                    <button
                        type="button"
                        class="btn btn-sm px-3 fs-16 header-item vertical-menu-btn topnav-hamburger"
                        id="topnav-hamburger-icon"
                    >
                        <span class="hamburger-icon">
                        <span></span>
                        <span></span>
                        <span></span>
                        </span>
                    </button>
                </div>  
                <a class="navbar-brand d-none" href="{rows/link}" >
                    <img src="{$logo}"/>
                    <span><b>IGRP</b></span>
                </a>
              
              <div id="gen-views-ctrl" class="w-100 me-3">
                  <ul class="d-flex flex-nowrap" style="overflow:auto; ">
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
                      
                     <li rel="gen-blocky"  active-text-color="primary">
                        <span>BLOCKLY</span>
                      </li>
                      
                      <li rel="gen-java" xslt-path="{$path}/core/formgen/util/java" xslt-file="XSL_GENERATOR.xsl" text-color="1">
                        <span>JAVA</span>
                      </li>
                      
                  </ul>
              </div>

              <ul id="igrp-top-menu" class="hidden-xs navbar-right ml-auto pe-4 ms-auto d-flex align-items-center">
                    <li>
                        <a>
                            <i class="fas fa-export"></i>
                        </a>
                    </li>
                    <xsl:for-each select="rows/content/form/tools-bar/item">
                      <li>
                          <a target="{target}" class="form-gen-save igrpClick d-flex align-items-center">
                              <xsl:call-template name="page-nav">
                                  <xsl:with-param name="action" select="link" />
                                  <xsl:with-param name="page" select="page" />
                                  <xsl:with-param name="app" select="app" />
                                  <xsl:with-param name="linkextra" select="parameter" />
                              </xsl:call-template> 
                              <i class="fa fa-cog fa-spin fa-fw d-none"></i><span><xsl:value-of select="title"/></span>
                              
                          </a>
                      </li>
                  </xsl:for-each>

              </ul>

          </nav>

          <form class="IGRP-form" name="formular_default" novalidate="">
              <div class="container-fluid">
                  <div class="row">
                        <div class="col-lg-2  col-md-3 sidebar tree-list shadow d-none d-md-block" id="igrp-sidebar" bg-color="secondary">
                            
                            <div class="d-flex align-items-center px-3 pt-4">
                                <div>
                                    <img src="{$path}/core/formgen/img/logo-gen-white.png"/>
                                </div>
                                <div class="studio-name">
                                    <b>IGRP STUDIO</b>
                                </div>
                            </div>

                            <div class="gen-components-search px-3 mt-4 position-relative">
                                
                                <i class="fa fa-search"></i>
                                <input class="form-control" placeholder="Componentes..."></input>
                                
                            </div>
                            
                            <!--
                            <ul class="nav nav-tabs col-lg-2  col-sm-3 clearfix" role="tablist" bg-color="secondary">
                                <li class="d-none">
                                    <a class="txt-ellipsis d-flex align-items-center justify-content-center flex-column" href="#gen-page-properties" role="tab" data-toggle="tab">
                                        <i class="ri-settings-2-line"></i>
                                        <span class="">Settings</span>
                                    </a>
                                </li>
                                <li class="active w-50">
                                    <a class="txt-ellipsis d-flex align-items-center justify-content-center flex-column" href="#gen-list-components" role="tab" data-toggle="tab">
                                        <i class="ri-apps-line"></i>
                                        <span class="">Components</span>
                                    </a>
                                </li> 
                                <li class="w-50">
                                    <a class="txt-ellipsis d-flex align-items-center justify-content-center flex-column" href="#gen-list-fields" role="tab" data-toggle="tab">
                                        <i class="ri-checkbox-multiple-line"></i>
                                        <span class="">Fields</span>
                                    </a>
                                </li> 
                                
                            </ul>

                            <div class="form-group gen-searcher-wrapper col-lg-2  col-sm-3 " h-calc="-55">
                            
                            <input bg-color="secondary" type="text" class="border-end-0 border-top-0 border-start-0 form-control gen-types-search" placeholder="Pesquisar..."/>
                            
                            <span class="gen-type-search-clear">
                                <i class="fa fa-times"></i>
                            </span>

                            <div class="gen-searcher-contents" bg-color="secondary">
                                
                            </div>

                            </div>

                            -->

                            <div class="tab-content" style="padding:5px 0;border:0">
                                <div role="tabpanel" class="tab-pane active" id="gen-list-components">
                    
                                    <ul class="treeview-menu gen-containers menu-open d-flex flex-wrap" style="display:block">
                                        <xsl:for-each select="$gen/containers/item">
                                            <xsl:sort select="label"/>
                                            <li class="gen-declared-containers col-6" group="{group}" label="{label}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" hasField="{hasField}">
                                                <xsl:attribute name="style">
                                                    <xsl:if test="@hidden = 'true'">
                                                        <xsl:value-of select="'display:none!important;'"/>
                                                    </xsl:if>
                                                </xsl:attribute>
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
                                    <ul class="treeview-menu gen-fields menu-open d-flex flex-wrap" style="display:block">
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
                        <div class="col col-md-9 col-lg-10 col-md-offset-2 col-sm-offset-3 main ms-auto" id="igrp-contents">
                            
                            <div class="content gen-viewers active " id="gen-design">
                               
                                <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                                    <h4 class="mb-0 gen-page-title"></h4>
                                </div>

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
                        
                        <div id="gen-blocky" class="gen-viewers">

                                <div id="gen-blocky-view">
                                    
                                    <xsl:call-template name="IGRP-blocky"></xsl:call-template>
                                
                                </div>
                            </div>
                            

                            <div class="gen-viewers-toolbar clearfix">
                                
                                <div class="pull-left">
                                    <a href="#" class="btn btn-link gen-include-file">
                                        <i class="fa fa-plus"></i>  Include<span class="f-type"></span>:<span class="f-count"></span>
                                    </a>
                                </div>
                                
                                
                                <div class="pull-right gen-toolbar-items" rel="java">
                                    <a href="{$path}/../../javadoc/index.html" class="btn btn-link" target="_newtab">                                  
                                    <i class="fa fa-file-text"></i>
                                    <span>Javadoc - Core.class</span>                                  
                                    </a>
                                    <a href="https://nosicode.gitbook.io/faq/" class="btn btn-link" target="_newtab">                                 
                                    <i class=" fa fa-question-circle"></i>
                                    <span>Guide - How to...</span>
                                    </a>
                                </div>
                                <!--<div class="btn btn-link pull-right gen-copy-to-clipboard" > -->
                                <!--<i class="fa fa-clipboard"></i><span>Copiar</span> -->
                                <!--</div> -->
                                <!-- <a class="btn btn-link pull-right gen-download-content" href="#">
                                    <i class="fa fa-upload"></i><span>Download</span>
                                </a> -->
                                <a class="btn btn-link pull-left gen-page-setts-ctrl"  rel="plsql">
                                    <i class="fa fa-gears"></i>
                                    <span>Settings</span>
                                </a>                             
                                <div class="pull-left d-none">
                                <select class="form-control btn" id="code-mirror-theme-selector" 
                                                    style="padding-bottom: 0px;  padding-top: 0px;    height: 28px;">
                                    <option value="eclipse">Eclipse theme</option>
                                    <option value="midnight">Midnight theme</option>
                                    <option value="blackboard">Blackboard theme</option>
                                    <option value="colorforth">Colorforth theme</option>
                                    <option value="icecoder">Icecoder theme</option>
                                    <option value="monokai">Monokai theme</option>
                                    <option value="night">Night theme</option>
                                </select>
                                    
                                </div>
                            
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
                  <xsl:if test="rows/content/form/label/link_doc">
                     <input type="hidden" class="form-hidden" name="p_link_doc" id="link_doc" value="https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&amp;dad=tutorial&amp;target=_blank&amp;isPublic=1&amp;lang=pt_PT"></input>
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
                                  <div class="col-md-6 form-group" item-name="package_db_name" required="required">
                                      <label>Package Name (DB)</label>
                                      <input rel="package" required="" type="text" name="plsql_pack" value="" class="text gen-page-setter form-control" maxlength="500"/>
                                  </div>
                                  <div class="col-md-6 form-group" item-name="package_html_name" required="required">
                                      <label>Package Name (HTML)</label>
                                      <input rel="html" type="text" required="" name="plsql_html" value="" class="text gen-page-setter form-control" maxlength="500"/>
                                  </div>

								 <div class="col-md-5 col-md-offset-1 checkbox" style="margin-top:15px">
                                      <div  item-name="process">
                                          <input rel="process" type="checkbox" name="plsql_process" value="" class="checkbox gen-page-setter "/>
                                          <span>Processo</span>
                                      </div>
                                  </div>

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
              <div class="modal fade" tabindex="-1" id="gen-edition-modal" role="dialog"  data-bs-keyboard="true" >
                  <div class="modal-dialog modal-lg">
                      <div class="modal-content border-0">
                          <div class="modal-header d-flex flex-column">
                                
                                <h5 class="w-100 bg-primary p-3 text-white text-capitalize m-0" style="border-radius: 4px 4px 0 0;">
                                    <xsl:value-of select="$locale-strings/configurations"/>
                                </h5>

                                <ul class="w-100 d-flex overflow-auto">
                                    <li class="active" rel="properties">
                                        <xsl:value-of select="$locale-strings/properties"/>
                                    </li>
                                    <li rel="fields">
                                        <xsl:value-of select="$locale-strings/fields"/>
                                    </li>
                                    <li rel="style">
                                        <xsl:value-of select="$locale-strings/style"/>
                                    </li>
                                    <li rel="validation">
                                        <xsl:value-of select="$locale-strings/validations"/>
                                    </li>
                                    <li rel="rules">
                                        <xsl:value-of select="$locale-strings/rules"/>
                                    </li>
                                    <li rel="xsl">
                                         <xsl:value-of select="$locale-strings/xsl"/>
                                    </li>
                                    <li rel="copy" gen-type="container">
                                        <xsl:value-of select="$locale-strings/copy"/>
                                    </li>
                                </ul>
                                <button style="position:absolute;top:20px;right:8px;filter: invert(1);" type="button" class="btn-close me-0" data-bs-dismiss="modal" aria-label="Close" fdprocessedid="esl2a"></button>
                          </div>
                          <div class="modal-body" role="form">
                              <div rel="properties" class="gen-properties-setts-holder row active">
                            

                              </div>

                              <div rel="fields" class="gen-properties-setts-holder row">
                                  <div class="col-4 available-wrapper  text-white p-4">
                                    <div>
                                        <div class="position-relative container-field-setter-search-wrapper mb-3">
                                            <input placeholder="{$locale-strings/search-field}" class="ps-4 bg-transparent form-control container-field-setter-search py-1 text-white" type="text"/>
                                            <i class="ri-search-line position-absolute"></i>
                                        </div>
                                        <h5 class="text-white pt-0 mb-1">
                                            <xsl:value-of select="$locale-strings/available-fields"/>
                                        </h5>
                                        <div class="mb-3 pb-2 small">
                                            <small>
                                                <xsl:value-of select="$locale-strings/gen-click-drag-to-add"/>
                                            </small>
                                        </div>
                                    </div>
                                    <div class="no-search-field-result-msg" style="display:none"> 
                                        <xsl:value-of select="$locale-strings/search-no-results"/>
                                    </div>
                                    <div style="height:fit-content">
                                        <div class="available-fields row g-3">
                                        
                                        </div>
                                    </div>

                                  </div>
                                  <div class="col-8 current-wrapper p-4" style="padding-bottom:80px!important">
                                    <div class="mb-2">
                                        <h5><xsl:value-of select="$locale-strings/current-fields"/></h5>
                                    </div>
                                    <div class="mb-2 no-fields-message">
                                        <i class="small"><xsl:value-of select="$locale-strings/gen-container-add-field"/></i>
                                    </div>
                                    
                                    <div class="current-fields position-relative"></div>
                                    <div class="actions-wrapper mt-4">
                                        <span class="text-uppercase" style="font-size:10px;">
                                            <xsl:value-of select="$locale-strings/actions"/>
                                        </span>
                                        <div class="current-action-fields position-relative">
                                    
                                        </div>
                                    </div>
                                    
                                  </div>
                              </div>

                              <div rel="style" class="gen-properties-setts-holder row">
                                  <div class="form-group col-md-6">
                                      <label>Id</label>
                                      <input type="text" rel="id" value="" class="form-control style-setter"/>
                                  </div>
                                  <div class="form-group col-md-6">
                                      <label>Class</label>
                                      <input type="text" rel="class" value="" class="form-control style-setter"/>
                                  </div>
                                  <div class="form-group col-md-12">
                                      <label>Estilo (inline)</label>
                                      <textarea rel="inline" value="" class="form-control style-setter"/>
                                  </div>
                              </div>

							  <div rel="validation" class="gen-properties-setts-holder">
                                  <xsl:call-template name="igrp-field-validation"/>
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
                        
                                <button data-toggle="tooltip"  type="button" class="btn btn-primary waves-effect waves-light" id="gen-edit-confirm">
                                    <i class=" ri-save-line"></i>
                                </button>
                  
                            
                          </div>
                          <div class="modal-footer d-flex align-items-center d-none">
                                <div class="">
                                    <span class="info object d-none"></span>
                                    <span class="info type"></span>
                                    <span class="info parent" style="display:none"></span>
                                </div>

                                <xsl:if test="rows/content/form/label/link_doc">
                                    <span class="igrp-doc pull-left me-auto">
                                        <a id="igrp-doc" href="https://docs.igrp.cv/IGRP/app/webapps?r=tutorial/Listar_documentos/index&amp;dad=tutorial&amp;target=_blank&amp;isPublic=1&amp;lang=pt_PT" target="_newtab">
                                            <i class="fa fa-question-circle" style="margin-right:5px"></i>
                                            <xsl:choose>
                                                <xsl:when test="rows/content/form/label/link_doc != ''">
                                                    <xsl:value-of select="rows/content/form/label/link_doc"></xsl:value-of>
                                                </xsl:when>
                                                <xsl:otherwise>Help</xsl:otherwise>
                                            </xsl:choose>
                                            
                                        </a>	
                                    </span>
                              	</xsl:if>
                              
                              <div class="modal-buttons text-right">
                              	
                                <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button> 
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
                          
                          <div class="modal-body px-0 pt-0 pb-3">
                              <div class="box card gen-container-item clean" gen-class="" item-name="file_inc">
                                <div class="d-flex align-items-center card-header">
                                    <h5 class="modal-title"></h5>
                                    <div class="ms-auto d-flex align-items-center ">
                                        <a class="btn fs-12 btn-sm btn-success show-add-row text-capitalize">
                                          <xsl:value-of select="$locale-strings/add"/>
                                        </a>
                                      </div>
                                    
                                </div>
                                <div class="box-body  card-body IGRP-separatorlist pt-0" tag="file_inc" dialog="false">
                                  <div class="splist-form-holder ">
                                    <div class="splist-form" role="form">
                                      <div class="form-group col-md-12 gen-fields-holder" item-name="file" item-type="text" required="required">
                                        <label>File URL</label>
                                        <input required="required" type="text" value="" class="form-control " id="p_file" name="p_file"></input>
                                      </div>
                                    </div>
                                  </div>
                                  <div class="table-box box-body box-table-contents splist-table  table-card mt-0">
                                    <table rel="T_file_inc" id="file_inc" class="table table- gen-data-table">
                                      <thead class="table-light">
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
                              <button type="button" class="btn btn-default" data-dismiss="modal">
                                <xsl:value-of select="$locale-strings/close"></xsl:value-of>
                              </button>
                              <button type="button" class="btn btn-soft-primary" id="gen-inc-confirm">
                                <xsl:value-of select="$locale-strings/confirm"></xsl:value-of>
                              </button>
                          </div>
                      </div>
                  </div>
              </div>

              <xsl:call-template name="IGRP-bottom"/>
          </form>


        <script src="https://cdn.jsdelivr.net/npm/handlebars@latest/dist/handlebars.js"></script>

          <script src="{$path}/core/formgen/js/GEN.componentsSearcher.js"></script>
          
          <script type="text/javascript" src="{$path}/core/ckeditor/ckeditor.js"/>

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

          <script type="text/javascript" src="{$path}/components/separatorlist/igrp.separatorlist.js"></script>
          <!-- end:SEPARATORLIST -->

          <!-- FORMLIST JS INCLUDES -->
          <script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>


          <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"></script>
         
          <script src="{$path}/core/bootstrap/plugins/treeview/js/bootstrap-treeview.js"></script>
          <!--code mirror-->
          <script src="{$path}/core/codemirror/js/codemirror.js"></script>
          <script src="{$path}/core/codemirror/js/clike.js"></script>
          <script src="{$path}/core/codemirror/js/formatting.js"></script>
          <script src="{$path}/core/codemirror/js/mode/sql/sql.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xml.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xslt.js"></script>
          <script src="{$path}/core/codemirror/js/mode/css/css.js"></script>
          <script src="{$path}/core/codemirror/js/mode/javascript/javascript.js"></script>
          
          <script src="{$path}/core/codemirror/js/keymap/sublime.js"></script>
          
          <script src="{$path}/core/codemirror/js/addon/fold/foldcode.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/foldgutter.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/brace-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/xml-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/indent-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/markdown-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/comment-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/matchtags.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/closebrackets.js"></script>        
          <script src="{$path}/core/codemirror/js/addon/edit/matchbrackets.js"></script> 
          <script src="{$path}/core/codemirror/js/addon/hint/xml-hint.js"></script>         
          <script src="{$path}/core/codemirror/js/addon/hint/show-hint.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/sql-hint.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/search.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/searchcursor.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/dialog.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/jump-to-line.js"></script>
          <script src="{$path}/core/codemirror/js/addon/display/fullscreen.js"></script>
          <script>var gPATH = "<xsl:value-of select='$path' />/app/RED";</script>
          <script src="{$path}/core/formgen/js/chance.js"></script>
          <script src="{$path}/core/formgen/js/jquery-ui.min.js"></script>
          <script src="{$path}/core/formgen/js/string.js" charset="utf-8"></script>
          <script src="{$path}/core/formgen/js/GEN.converter.2dot2.js"></script>
          <script src="{$path}/core/formgen/js/GEN.vars.js"></script>
          <script src="{$path}/core/formgen/js/GEN.getdata.js"></script>
          <script src="{$path}/core/formgen/js/GEN.Xsl.js"></script>
          <script src="{$path}/core/formgen/js/GEN.XML.js"></script>
          <script src="{$path}/core/formgen/js/GEN.config.js"></script>

          <!-- Validation -->
          <script src="{$path}/core/formgen/js/GEN.validation.js"></script>
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
         
          <script src="{$path}/core/formgen/js/GEN.containers.js" charset="utf-8"></script>
          <script src="{$path}/core/formgen/js/GEN.fields.js"></script>
          <script src="{$path}/core/formgen/js/GEN.html.js"></script>

          

          <script src="{$path}/core/formgen/js/GEN.server.js"></script>
			<script src="{$path}/core/formgen/js/GEN.controller.js"></script>
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
                            xsl  : 'mvc/XSL_CONTROLLER.xsl'
                        },
                        {
                            name : 'MODEL',
                            xsl  : 'mvc/XSL_MODEL.xsl'
                        },

                        {
                            name : 'VIEW',
                            xsl  : 'mvc/XSL_VIEW.xsl'
                        },

                        {
                            name : 'INTERFACE',
                            xsl  : 'mvc/XSL_INTERFACE.xsl'
                        },

                    ]

                }

            }


            });

            var __GEN = this[VARS.name];

          </script>


          <script src="{$path}/core/formgen/js/v2/GEN.containerFieldSetter.js" ></script>
          
          <script src="{$path}/core/formgen/js/v2/GEN.groupContainerMenus.js"></script>

          <script src="{$path}/core/formgen/js/v2/GEN.tableProperties.js"></script>

          <script src="{$path}/core/formgen/js/v2/GEN.actionProperties.js"></script>
          
          <!-- GEN Java Auto Complete -->
          <script src="{$path}/core/formgen/js/GEN.autocomplete.js"></script>

          <script src="{$path}/core/formgen/js/GEN.attributes.js"></script>

          <script src="{$path}/core/formgen/js/GEN.importTemplates.js"></script>

          <script src="{$path}/core/formgen/js/GEN.includeFiles.js"></script>
          
          <script src="{$path}/core/formgen/js/GEN.lookupMap.js"></script>
          
          <script src="{$path}/core/formgen/js/classes/Requests.js"></script>

          <script src="{$path}/core/formgen/types/containers/chart/index.js"></script>

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
                <i class="ri-home-heart-line"></i>
            </xsl:otherwise>
        </xsl:choose>
       
    </xsl:template>

    <xsl:template name="GEN-head">

        <script>
            var path        = '<xsl:value-of select="$path"/>';
            var ispublic    = '<xsl:value-of select="$ispublic"/>';
            var rekey       = '<xsl:value-of select="$recaptchakey"/>'; 
            var secretrekey = '<xsl:value-of select="$secretrecaptchakey"/>'; 
            var theme_path  = '<xsl:value-of select="$themePath"/>';
        </script>
        <!-- reCAPTCHA -->  
            <script src="https://www.google.com/recaptcha/api.js?render={$recaptchakey}"></script>

        <!-- BS CSS -->    
        <script src="{$path}/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="{$path}/libs/simplebar/simplebar.min.js"></script>
        <script src="{$path}/libs/node-waves/waves.min.js"></script>
        <script src="{$path}/libs/feather-icons/feather.min.js"></script>
        <script src="{$themePath}/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
        <script src="{$themePath}/assets/js/plugins.js"></script>


         <!-- NOT ASYNC JS-->   
        <script src="{$path}/core/promise/promise.min.js" ></script>    
        <script src="{$path}/core/jquery/{$jq-v}/jquery.min.js" ></script>  
        <script src="{$path}/core/jquery/2.1/jquery-migrate.min.js" ></script>     
        <script src="{$path}/core/bootstrap/plugins/toolkit/bootstrap-toolkit.min.js"></script>  
        <!-- VERIFIED /NOT ASYNC JS-->  
        <script src="{$path}/core/bootstrap/plugins/validation/js/jquery.validate.js" ></script>    
        <script src="{$path}/core/moment/moment.min.js" ></script>  
        <script src="{$path}/core/bootstrap/plugins/notify/bootstrap-notify.min.js" ></script>    
        
        <!-- EVENTS class -->
        <script src="{$path}/core/igrp/IGRP.events.class.js?v={$version}"></script>
        <!-- UTILS class -->
        <script src="{$path}/core/igrp/IGRP.jsutils.js?v={$version}" ></script>
        <!-- IGRP class -->
        <script src="{$path}/core/igrp/IGRP.class.js?v={$version}" ></script>
        <!-- IGRP config -->
        <script src="{$path}/core/igrp/IGRP.defaults.js?v={$version}" ></script>
        <!-- IGRP core functions -->
        <script src="{$path}/core/igrp/IGRP.core.js?v={$version}" ></script>
        <!-- IGRP globalModal
        not async -->
        <script src="{$path}/core/igrp/globalmodal/IGRP.globalModal.js?v={$version}"  ></script>
        <!-- IGRP iframeNavigation 
        not async -->
        <script src="{$path}/core/igrp/iframenav/IGRP.iframeNav.js?v={$version}"  ></script>
        <!-- IGRP targets controller -->
        <script src="{$path}/core/igrp/targets/IGRP.targets.js?v={$version}" ></script>
        <!-- IGRP targets controller -->
        <script src="{$path}/core/igrp/tree/IGRP.tree.js?v={$version}" ></script>
        <!-- IGRP sidebar controller -->
        <script src="{$path}/core/igrp/sidebar/IGRP.sidebar.js?v={$version}"></script>
        <!-- IGRP list association controller -->
        <script src="{$path}/core/igrp/components/list-association/igrp.list.association.js?v={$version}"></script>
        <!-- IGRP searchlist controller -->
        <script src="{$path}/core/igrp/searchlist/IGRP.searchlist.js"  charset="UTF-8"></script>
        <!-- IGRP rightpanel controller -->
        <script src="{$path}/core/igrp/rightpanel/rightpanel.js" ></script>
        <!-- IGRP themes controller -->
        <script src="{$path}/core/igrp/themes/IGRP.themes.js?v={$version}" ></script>
        <!-- IGRP scroll to top controller -->
        <script src="{$path}/core/igrp/scrolltop/IGRP.scrolltop.js?v={$version}" ></script>
        <!-- IGRP XML XSL Transform -->
        <script src="{$path}/core/igrp/xml.xslt/xml.xsl.transform.js?v={$version}" ></script>
        <!-- IGRP handler -->
        <script encode="utf-8" src="{$path}/core/igrp/IGRP.handler.js?v={$version}" ></script>



        <script>
			$.IGRP.locale = {
				current : "<xsl:value-of select="$locale"/>",
				texts : {
				<xsl:for-each select="$locale-strings/*">
					"<xsl:value-of select="name()"/>" : "<xsl:value-of select="."/>"<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				},
				get:function(string){
					return $.IGRP.locale.texts[string] || string;
				}
			}
		
		</script>

        <xsl:call-template name="colorpalettes-js"/>

        <!-- THEME JS -->
        <xsl:for-each select="$themeConfigData/js/file">
        <script src="{$themePath}/{.}"></script>
        </xsl:for-each>
        <!-- /THEME JS -->

        <script>
        $(window).on('load', function(){
            $.IGRP.onLoad ? $.IGRP.onLoad() : null;
        });
        $(document).ready( function(){
            $.IGRP.init( );
        });
        </script> 
        
        <link href="{$path}/core/bootstrap/plugins/tabdrop/css/tabdrop.css" rel="stylesheet"/>
               
        <link rel="stylesheet" href="{$path}/core/bootstrap/plugins/treeview/css/bootstrap-treeview.css"/>
       
        <!--codeMirror-->
        <link href="{$path}/core/codemirror/css/codemirror.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/js/addon/fold/foldgutter.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/js/addon/display/fullscreen.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/css/eclipse.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/css/blackboard.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/css/midnight.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/css/colorforth.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/css/icecoder.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/css/monokai.css" rel="stylesheet"/>
        <link href="{$path}/core/codemirror/css/night.css" rel="stylesheet"/>        
   
        <link rel="stylesheet" href="{$path}/core/codemirror/css/show-hint.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/dialog.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/matchesonscrollbar.css" />
<!--         <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/lint/lint.css" /> -->

        <!-- FontAwesome -->
        <link rel="stylesheet" href="{$path}/core/fontawesome/4.7/css/font-awesome.min.css" media="none" onload="if(media!='all')media='all'"/>
        <!-- /FontAwesome -->
        <!--GEN-->
        
        <!-- start:SEPARATORLIST CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css"/>
        <!--<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>-->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>

        <link rel="stylesheet" type="text/css" href="{$path}/components/separatorlist/igrp.separatorlist.css"/>
        <!-- end:SEPARATORLIST CSS INCLUDES -->
        
        <!-- start:SELECT CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css"/>
       
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
       		
        <style id="custom-css"></style>

    </xsl:template>
    
    <xsl:include href="tmpl/igrp.fields.validation.xsl"/>
    
    <xsl:include href="tmpl/igrp.fields.rules.xsl"/>

    <xsl:include href="tmpl/page-properties-tab-content.xsl"/>
    
    <xsl:include href="tmpl/igrp.blocky.xsl"/>


    <xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=1515664208567"/>

</xsl:stylesheet>