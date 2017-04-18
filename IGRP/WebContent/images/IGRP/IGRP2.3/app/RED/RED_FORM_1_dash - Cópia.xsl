<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">

    <xsl:variable name="sourcePath" select="concat($path,'/extensions/formgen/util/gen.source.xml')"/>

    <xsl:variable name="gen" select="document($sourcePath)/gen"/>

    <html>
      <head>
        <xsl:call-template name="home-header"/>
        <!-- codeMirror -->
        <link href="{$path}/extensions/codemirror/css/codemirror.css" rel="stylesheet"/>
        <script src="{$path}/extensions/codemirror/js/codemirror.js"></script>
        <script src="{$path}/extensions/codemirror/js/addon/fold/xml-fold.js"></script>
        <script src="{$path}/extensions/codemirror/js/addon/edit/matchtags.js"></script>
        <script src="{$path}/extensions/codemirror/js/mode/xml/xml.js"></script>
        <script src="{$path}/extensions/codemirror/js/mode/xml/xslt.js"></script>
        <script src="{$path}/extensions/codemirror/js/formatting.js"></script>
        <script src="{$path}/extensions/codemirror/js/addon/hint/xml-hint.js"></script>
        <!-- code mirror sql -->
        <link rel="stylesheet" href="{$path}/extensions/codemirror/css/show-hint.css" />
        <script src="{$path}/extensions/codemirror/js/mode/sql/sql.js"></script>
        <script src="{$path}/extensions/codemirror/js/addon/hint/show-hint.js"></script>
        <script src="{$path}/extensions/codemirror/js/addon/hint/sql-hint.js"></script>
        <!-- GEN -->
        <link href="{$path}/extensions/formgen/css/style.css" rel="stylesheet"></link>
        <link href="{$path}/extensions/formgen/css/types.css" rel="stylesheet"></link>
        <link href="{$path}/extensions/formgen/css/layout.css" rel="stylesheet"></link>
        <link href="{$path}/extensions/formgen/css/service/style.css" rel="stylesheet"></link>
        <link href="{$path}/extensions/formgen/css/message.css" rel="stylesheet"></link>
        <link media="all and (max-width:1023px)" type="text/css" href="{$path}/extensions/formgen/css/tablet.css" rel="stylesheet"/>


        <script>
          var gPATH = "<xsl:value-of select='$path' />/app/RED";
        </script>

        <script src="{$path}/extensions/formgen/js/chance.js"></script>
        <script src="{$path}/extensions/formgen/js/jquery-ui.js"></script>
        <script src="{$path}/extensions/formgen/js/string.js" charset="utf-8"></script>
        <script src="{$path}/extensions/formgen/js/xml.xsl.transform.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.converter.2dot2.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.vars.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.getdata.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.Xsl.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.XML.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.structures.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.config.js"></script>
        
        <script src="{$path}/extensions/formgen/js/service/jquery.jsPlumb-1.5.5.js"></script>
        <script src="{$path}/extensions/formgen/js/service/xsdmapper.js"></script>

        <script src="{$path}/extensions/formgen/js/GEN.service.js"></script>


        <script src="{$path}/extensions/formgen/js/GEN.layout.js"></script>

        <script src="{$path}/extensions/formgen/js/GEN.templates.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.controller.js"></script>
        <script src="{$path}/extensions/formgen/js/GEN.containers.js" charset="utf-8"></script>
        <script src="{$path}/extensions/formgen/js/GEN.fields.js"></script>

        <script src="{$path}/extensions/formgen/js/GEN.subversion.js"></script>

        <script src="{$path}/extensions/formgen/js/vkbeautify.0.99.00.beta.js"></script>

      </head>
      <body class="bodyColor startin">
        <xsl:attribute name="screen">
          <xsl:choose>
            <xsl:when test="rows/target = '_blank'">full</xsl:when>
            <xsl:otherwise></xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
        <xsl:attribute name="has-message">
          <xsl:choose>
            <xsl:when test="count(rows/content/messages/message[@type!='confirm' and @type!='debug']) &gt; 0">true</xsl:when>
            <xsl:otherwise>false</xsl:otherwise>
          </xsl:choose>
          <!-- <xsl:value-of select="count(rows/content/messages/message[@type!='confirm' and @type!='debug'])"/> -->
        </xsl:attribute>

        
        <xsl:call-template name="home-top-main"/>
        <div id="igrp-bodyPage">
          <xsl:call-template name="home-slide-menu"/>
          <div class="bodyPageRigth">
            <!--SHOW TABLET AND MOBILE TITLE
            <div class="box-head showTabMobile">
              <xsl:value-of select="rows/content/title"/>
            </div>-->
            

            <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data">

              <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
              <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
          
              <div class="box-content resetPadding" id="gen-main-holder" sep-name="form">
                
                <div id="content" rel="gen-contents-holder" class="">
                  <div id="gen-overlay"></div>

                  <section id="gen-types-holder">
                    <ul id="gen-types-menu" has-menu="{rows/content/form/value/has_menu}">
                      
                      <xsl:if test="rows/content/form/value/has_menu = '1'">
                        <li rel="modules" class="active"><span><xsl:value-of select="rows/content/table/label/title"/></span></li>
                      </xsl:if>

                      <!-- <li class="active" rel="settings" alt="Settings" title="Settings"><span>Settings</span></li> -->
                      
                      <li rel="containers" alt="Containers" title="Containers">
                        <xsl:attribute name="class">
                          <xsl:if test="rows/content/form/value/has_menu != '1'">active</xsl:if>
                        </xsl:attribute>
                        <span>Containers</span>
                      </li>

                      <li rel="fields" alt="Fields" title="Fields"><span>Fields</span></li>
                    </ul>
                    <div class="clr"></div>
                    <div id="gen-types-rel">

                      <!-- HAS MENU ? -->
                      <xsl:if test="rows/content/form/value/has_menu = '1'">
                       <div class="gen-menu-rel active " rel="modules">
                          <xsl:if test="rows/content/filter/label/env_fk">
                            <div class="col item" id="gen-app-choser" item-name="env_fk">
                              <div class="igrp_item select">
                                <label>
                                  <xsl:if test="string-length(rows/content/filter/label/env_fk) > 45">
                                    <xsl:attribute name="title">
                                      <xsl:value-of select="rows/content/filter/label/env_fk"/>
                                    </xsl:attribute>
                                  </xsl:if>
                                  <xsl:value-of select="rows/content/filter/label/env_fk"/>
                                </label>
                                <select name="{rows/content/filter/list/env_fk/@name}" chosen="select" id="{rows/content/filter/list/env_fk/@name}" data-placeholder="{rows/content/filter/list/env_fk/option[position() = 1]}" class="select bpmnApp">
                                  <option value=""/>
                                  <xsl:for-each select="rows/content/filter/list/env_fk/option[position() != 1]">
                                    <option value="{value}">
                                      <xsl:if test="@selected='true'">
                                        <xsl:attribute name="selected">selected</xsl:attribute>
                                      </xsl:if>
                                      <xsl:value-of select="text"/>
                                    </option>
                                  </xsl:for-each>
                                </select>
                                <div class="_clear"/>
                              </div>
                              <div class="_clear"/>
                            </div>
                          </xsl:if>
                          <div id="gen-apps-holder">
                             <xsl:apply-templates mode="tree-menu" select="rows/content/table">
                               <xsl:with-param name="delete" select="'false'"/>
                             </xsl:apply-templates>
                         </div>
                       </div>
                      </xsl:if>

                      <!-- CONTAINERS -->
                      <div class="gen-menu-rel" rel="containers">
                        <xsl:attribute name="class">
                          <xsl:choose>
                            <xsl:when test="rows/content/form/value/has_menu != '1'">gen-menu-rel active</xsl:when>
                            <xsl:otherwise>gen-menu-rel</xsl:otherwise>
                          </xsl:choose>
                        </xsl:attribute>
                        <ul class="gen-containers">
                          <xsl:for-each select="$gen/containers/item">
                            <li alt="{name}" title="{name}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" class="gen-declared-containers" style="background-image:url({$path}/extensions/formgen/types/containers/{name}/img/{name}.icon.png)">
                              <span>
                                <xsl:value-of select="label"/>
                              </span>
                            </li>
                          </xsl:for-each>
                        </ul>
                        <div class="clr"></div>
                      </div>
                      <!-- FIELDS -->
                      <div class="gen-menu-rel" rel="fields">
                        <ul class="gen-fields">
                          <xsl:for-each select="$gen/fields/item">
                            <li alt="{name}" title="{name}" name="{name}" type="{type}" label="{label}" style="background-image:url({$path}/extensions/formgen/types/fields/{name}/img/{name}.icon.png)">
                              <span >
                                <xsl:value-of select="label"/>
                              </span>
                              <i class="gen-icons"></i>
                            </li>
                          </xsl:for-each>
                        </ul>
                        <div class="clr"></div>
                      </div>
                    </div>
                  </section>

                  <section id="gen-view" class="gen-viewers active" layout="f">
                    
                    <div id="gen-noif-holder">
                      <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
                    </div>
                    <div id="gen-viewr-contents">
                      
                      <!-- <ul id="gen-sheets-list">
                        <li gen-tab-rel="tab-0">1</li>
                      </ul> -->
                      
                      <div class="gen-tab-content-holder gen-rows-holder active" gen-tab-rel="tab-0"></div>
                   
                    </div>
                    
                    
                    <div class="clr"></div>
                    
                    <!-- <div id="gen-sheets">
                      <div class="inner-pad">
                        <ul id="gen-sheets-list">
                          <li>1</li>
                        </ul>
                      </div>
                    </div> -->

                  </section>

                  <div id="gen-proprieties-editor">

                    <div id="gen-page-settings" rel="settings">
                        <xsl:if test="rows/content/form/label/instancia">
                          <div class="col item" item-name="instancia">
                            <div class="igrp_item select">
                              <label>
                                <xsl:if test="string-length(rows/content/form/label/instancia) >45">
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="rows/content/form/label/instancia" disable-output-escaping="yes"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="rows/content/form/label/instancia" disable-output-escaping="yes"/>
                              </label>
                              <select name="{rows/content/form/list/instancia/@name}" chosen="select" id="{rows/content/form/list/instancia/@name}" data-placeholder="{rows/content/form/list/instancia/option[position() = 1]/text}" class="select gen-page-setter" rel="instance">
                                <xsl:call-template name="FIELD_validator">
                                  <xsl:with-param name="field" select="rows/content/form/label/instancia"/>
                                </xsl:call-template>
                                <option value=""/>
                                <xsl:for-each select="rows/content/form/list/instancia/option[position() != 1]">
                                  <option value="{value}">
                                    <xsl:if test="@selected='true'">
                                      <xsl:attribute name="selected">selected</xsl:attribute>
                                    </xsl:if>
                                    <xsl:value-of select="text"/>
                                  </option>
                                </xsl:for-each>
                              
                              </select>
                              <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                          </div>
                        </xsl:if>

                         <div class="col item" item-name="table_name">
                          <div class="igrp_item text">
                            <label>Table Name</label>
                            <input rel="table" type="text" name="" value="" class="text gen-page-setter" maxlength="30"/>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div>

                        <div class="col item" item-name="package_db_name">
                          <div class="igrp_item text">
                            <label>Package Name (DB)</label>
                            <input rel="package" type="text" name="" value="" class="text gen-page-setter" maxlength="30"/>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div>

                        <div class="col item" item-name="package_html_name">
                          <div class="igrp_item text">
                            <label>Package Name (HTML)</label>
                            <input rel="html" type="text" name="" value="" class="text gen-page-setter" maxlength="30"/>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div>

                        <div class="col item active" item-name="subversionpath">
                          <div class="igrp_item text">
                            <label>Subversion Path</label>
                            <input rel="subversionpath" type="text" name="" value="" class="text gen-page-setter"/>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div>

                        <div class="col-1-2 item" item-name="replace">
                          <div class="igrp_item checkbox">
                            <div class="col-1-1">
                              <input rel="replace" type="checkbox" name="" value="" class="checkbox gen-page-setter"/>
                              <span>Replace</span>
                            </div>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div>

                        <div class="col-1-2 item" item-name="label">
                          <div class="igrp_item checkbox">
                            <div class="col-1-1">
                              <input rel="label" type="checkbox" name="" value="" class="checkbox gen-page-setter"/>
                              <span>Label</span>
                            </div>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div>

                        <div id="gen-page-setts-btns">
                          <button disabled="disabled" id="gen-execute-subv">Subversion</button>
                        </div>

                        <!-- <div class="col-1-9 item" item-name="biztalk">
                          <div class="igrp_item checkbox">
                            <div class="col-1-1">
                              <input rel="biztalk" type="checkbox" name="" value="" class="checkbox gen-page-setter"/>
                              <span>Biztalk</span>
                            </div>
                            <div class="_clear"/>
                          </div>
                          <div class="_clear"/>
                        </div> -->
                    </div>

                    <div id="gen-edition-dialog-holder">
                      <div id="gen-edition-dialog">
                        <!-- <h3 class="gen-edition-title-ctrl active" rel="proprieties">Propriedades</h3> -->
                        <div id="gen-edition-proprieties" class="gen-edition-contents active" rel="proprieties">
                        </div>

                       <!--  <h3 class="gen-edition-title-ctrl" rel="style">Estilo</h3>
                        <div id="gen-edition-style" class="gen-edition-contents" rel="style">
                          teste
                        </div> -->

                      </div>
                    </div>

                  </div>

                  <section id="gen-code" class="gen-viewers">
                    <div id="gen-code-view">

                    </div>
                  </section>

                  <section id="gen-plsql" class="gen-viewers">

                    <div class="gen-vw-inner">
                      <textarea id="txt-area"></textarea>
                      <div class="inner-pad">

                        <div id="gen-plsql-view">

                        </div>
                      </div>
                    </div>
                  </section>

                  <section id="gen-toolbar">
                    <span id="gen-page-title">
                      <span class="title"><xsl:value-of select="rows/content/form/value/nome"/></span>
                      
                      <i id="gen-page-loading"></i>
                    </span>
                    <ul id="view-types">
                      <li id="gen-page-setts-icon"></li>
                      <li rel="gen-view" class="gen-views-control active"><span>Design</span></li>
                      <li rel="gen-code" class="gen-views-control"><span>Xsl</span></li>
                      <li rel="gen-plsql" xslt-path="{$path}/extensions/formgen/util/plsql" xslt-file="XSL-plsql.xsl" class="gen-views-control">
                        <span>plsql</span>
                        <!-- <div class="gen-v-types-sub">
                          <div class="gen-v-types-sub-item" id="gen-execute-subv">Subversion</div>
                        </div> -->
                      </li>
                      
                      <xsl:if test="rows/content/form/label/transform_tools">
                        <xsl:for-each select="rows/content/form/table/transform_tools/value/row[not(@total='yes')]">

                          <li rel="gen-{tool_nome}" xslt-path="{xsl_path}" xslt-file="" on-click="{on_click}" class="gen-views-control custom"><span><xsl:value-of select="tool_nome"/></span></li>

                        </xsl:for-each>
                      </xsl:if>

                    </ul>

                    <!-- <p id="gen-page-title">
                      <span><xsl:value-of select="rows/content/form/value/nome"/></span>
                    </p> -->
         
                    <div id="igrp-tools">
                      <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar">
                        <xsl:with-param name="isTable" select="'true'"/>
                        <xsl:with-param name="vClassClick" select="'form-gen-save'"/>
                      </xsl:apply-templates>
                    </div>

                    <div id="gen-page-setts">
                        <div class="arrow_box"></div>
                        <!-- <div id="gen-noif-holder">
                          <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
                        </div> -->
                        
                        <!-- <div rel="gen-page-setts-togg">
                          <span>settings</span>
                        </div> -->

                    </div>

                  </section>
                  <div class="IGRP_overlay"/>
                 <div class="clr"/>
                
                </div>
              </div>

              <!-- SERVICE MAP -->
              <div id="gen-service-mapper">
                <div class="closer"></div>
                <div class="inner" id="gen-service-mapper-contents">
                  <div class="gen-service-panel" id="source">
                    <h3>XSD Request</h3>
                    <div class="content">
                    </div>
                  </div>

                  <div class="gen-service-panel" id="target">
                    <h3>XSD Service</h3>
                    <div class="content"></div>
                  </div>
                </div>
                 <div id="gen-service-buttons">
                  <button rel="confirm">Confirmar</button>
                </div>
              </div>
             
              <form-hidden class="form-hidden">

                <xsl:if test="rows/content/form/label/page_xml">
                  <input type="hidden" name="{rows/content/form/value/page_xml/@name}" value="{rows/content/form/value/page_xml}"/>
                </xsl:if>
                
                <xsl:if test="rows/content/form/label/page_xsl">
                  <input type="hidden" name="{rows/content/form/value/page_xsl/@name}" value="{rows/content/form/value/page_xsl}" id="id_{rows/content/form/value/page_xsl/@name}"/>
                </xsl:if>

                <xsl:if test="rows/content/form/label/data">
                  <input type="hidden" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" id="{rows/content/form/value/data/@name}" class="file uploadFile form-hidden">
                    <xsl:call-template name="FIELD_validator">
                      <xsl:with-param name="field" select="rows/content/form/label/data"/>
                    </xsl:call-template>
                  </input>
                </xsl:if>

                <xsl:if test="rows/content/form/label/id_objeto">
                  <input type="hidden" id="id_objeto" name="{rows/content/form/value/id_objeto/@name}" value="{rows/content/form/value/id_objeto}" class="number form-hidden" maxlength="30">
                    <xsl:call-template name="FIELD_validator">
                      <xsl:with-param name="field" select="rows/content/form/label/id_objeto"/>
                    </xsl:call-template>
                  </input>
                </xsl:if>

                <xsl:if test="rows/content/form/label/nome">
                  <input type="hidden" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}" class="text form-hidden" maxlength="100">
                    <xsl:call-template name="FIELD_validator">
                      <xsl:with-param name="field" select="rows/content/form/label/nome"/>
                    </xsl:call-template>
                  </input>
                </xsl:if>

                <xsl:if test="rows/content/form/label/link_image">
                  <input type="hidden" class="form-hidden" name="p_link_image" value="{rows/content/form/value/link_image}"></input>
                </xsl:if>

                <xsl:if test="rows/content/form/label/link_save">
                  <input type="hidden" class="form-hidden" name="p_link_save" value="{rows/content/form/value/link_save}"></input>
                </xsl:if>
              </form-hidden>

              </form>

              <xsl:if test="rows/content/form/value/has_menu='1'">
                <div id="gen-apps-modules-frame" link="{rows/content/form/value/link_save}">
                  <iframe id="gen-apps-modules"></iframe>
                </div>
              </xsl:if>

                <!--END YOUR CODE HERE-->
                <div class="_clear"/>
              </div>
              <div class="_clear"/>
            </div>
            
            <xsl:call-template name="link-opener"/>

            <!-- GEN MESSAGE 
            <div id="gen-message-holder">
              <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
            </div>-->

            <!--FOOTER PAGE-->
            <div id="igrp-footerPage">
              <xsl:call-template name="footer"/>
            </div>

            <script>
              this[VARS.name] = new GENERATOR({
                dataSrc   : '<xsl:value-of select="rows/content/form/value/page_form"/>',
                imagesURL : '<xsl:value-of select="rows/content/form/value/link_image"/>',
                configURL : '<xsl:value-of select="rows/content/form/value/gen_elements"/>'
              });

              var __GEN = this[VARS.name];
            </script>
            
            <xsl:for-each select="$gen/containers/item">
              <script src="{$path}/extensions/formgen/types/containers/{name}/js/{name}.js"></script>
            </xsl:for-each>
            <xsl:for-each select="$gen/fields/item">
              <script src="{$path}/extensions/formgen/types/fields/{type}/{type}.js"></script>
            </xsl:for-each>

            <!-- JAVA DEPLOY -->
            <!-- <script src="{$path}/extensions/formgen/js/deployJava.js"></script> -->
          </body>
        </html>
      </xsl:template>

      <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
      <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150615"/>
      <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150615"/>
      <xsl:include href="../../xsl/tmpl/IGRP-tree-menu.tmpl.xsl?v=20150615"/>

    </xsl:stylesheet>
