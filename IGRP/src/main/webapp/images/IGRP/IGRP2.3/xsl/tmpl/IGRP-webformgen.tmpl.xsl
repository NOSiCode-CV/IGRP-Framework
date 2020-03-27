<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <!-- ALL FORM FIELD GENERATOR -->
  <xsl:template name="GEN-FORM">
    

    <!--<xsl:if test="rows/content/*[@type ='tabcontent']/fields">
      <xsl:text  disable-output-escaping="yes"><![CDATA[<div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" gen-class="" item-name="tabcontent">]]></xsl:text>

      <ul class="nav nav-tabs">
        <xsl:for-each select="rows/content/*[@type ='tabcontent']/fields/*">
          <xsl:variable name="pos" select="position()"/>
          <xsl:variable name="vName" select="name()"/>
          <li item-name="tab-process-{$pos}" tab-process="tab-process" class="gen-fields-holder" rel="proc-tabcontent-{$pos}">
            <xsl:if test="$pos = 1">
              <xsl:attribute name="class">gen-fields-holder active</xsl:attribute>
            </xsl:if>
            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#proc-tabcontent-{$pos}">
              <i class="fa fa-angle-right"/>
              <span><xsl:value-of select="label"/></span>
            </a>
          </li>
        </xsl:for-each>
      </ul>
      <xsl:text  disable-output-escaping="yes"><![CDATA[<div class="tab-content"><div id="start-content" class="box-body">]]></xsl:text>
    </xsl:if>-->

    <div class="row">
      <xsl:for-each select="rows/content/*[name(.) != 'messages' and @type != 'workflow' or @type != 'tabcontent']">
        
        <xsl:variable name="colsize">
          <xsl:choose>
            <xsl:when test="@size and @size != ''">
              <xsl:value-of select="@size"></xsl:value-of>
            </xsl:when>
            <xsl:otherwise>col-md-12</xsl:otherwise>
          </xsl:choose>
        </xsl:variable>

        <div class="{$colsize}">
          <xsl:choose>
            <!-- TAB 
            <xsl:when test="@type='tabcontent'">
              <xsl:text  disable-output-escaping="yes"><![CDATA[</div>
              <section class="tab-pane tab-process gen-rows-holder" id="tabcontent-" rel="tabcontent-">]]></xsl:text>
            </xsl:when>-->
            <!-- SEPARATOR -->
            <xsl:when test="@type='separator' or @type='sectionheader'">
              
              <section class="content-header gen-container-item "  text-color="primary" item-name="{name()}">
                <h2 class="disable-output-escaping">
                  <xsl:value-of select="fields/*/value"/>
                </h2>
                <xsl:apply-templates mode="form-hidden-fields" select="fields"/>
              </section>
              
            </xsl:when>

            <xsl:when test="@type='paragraph'">
              <div class="box-head subtitle" text-color="primary" item-name="{name()}">
                <span>
                  <xsl:value-of select="fields/*/value"/>
                </span>
              </div>
            </xsl:when>

            <xsl:when test="@type = 'toolsbar'">
              
                <xsl:variable name="align">
                    <xsl:choose>
                    <xsl:when test="@align and @align != ''">
                        <xsl:value-of select="@align"></xsl:value-of>
                    </xsl:when>
                    <xsl:otherwise>pull-right</xsl:otherwise>
                    </xsl:choose>
               </xsl:variable>

                <div class="toolsbar-holder {@template} default gen-container-item " item-name="{name()}">
                    <div class="btns-holder {@style} {$align}" role="group">
                    <xsl:apply-templates select="." mode="gen-buttons">
                        <xsl:with-param name="vertical" select="'true'"/>
                        <xsl:with-param name="outline" select="'false'"/>
                    </xsl:apply-templates>
                    </div>
                </div>
            </xsl:when>

            <xsl:when test="@type = 'verticalmenu'">

                <xsl:variable name="template">
                    <xsl:choose>
                    <xsl:when test="@template and @template != ''">
                        <xsl:value-of select="@template"></xsl:value-of>
                    </xsl:when>
                    <xsl:otherwise>default</xsl:otherwise>
                    </xsl:choose>
               </xsl:variable>

                <div class="igrp-vertical-menu gen-container-item " template="{$template}" item-name="{name()}">
                    <div class="list-group">
                        <xsl:apply-templates select="." mode="gen-buttons">
                            <xsl:with-param name="vertical" select="'true'"/>
                        </xsl:apply-templates>
                    </div>
                </div>
            </xsl:when>
          
            <!--<xsl:when test="@type='biometric' or @type='biometric_view'">
              <div class="fingerprint box gen-container-item " item-name="fp">
                <xsl:call-template name="box-header">
                  <xsl:with-param name="title" select="."/>
                  <xsl:with-param name="collapsible" select="'false'"/>
                  <xsl:with-param name="collapsed" select="'false'"/>
                </xsl:call-template>
                
                <xsl:call-template name="GEN-biometric"/>

              </div> 
            </xsl:when>-->

            <xsl:when test="@type = 'chart' ">
              <div class="box gen-container-item " gen-structure="graphic" item-name="{name()}">
                <xsl:call-template name="box-header">
                  <xsl:with-param name="title" select="@title"/>
                  <xsl:with-param name="collapsible" select="'true'"/>
                  <xsl:with-param name="collapsed" select="'false'"/>
                </xsl:call-template>
                <div class="box-body">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="."/>
                    <xsl:with-param name="chart_type" select="chart_type"/>
                    <xsl:with-param name="height" select="'250'"/>
                    <xsl:with-param name="title" select="@title"/>
                    <xsl:with-param name="url" select="url"/>
                  </xsl:call-template>
                </div>
              </div>
            </xsl:when>

            <xsl:when test="@type = 'treemenu'">
                <div class="treemenu box gen-container-item " gen-structure="treemenu" gen-class="" item-name="{name}">
                    
                    <xsl:if test="@title and @title != ''">
                        <xsl:call-template name="box-header">
                            <xsl:with-param name="title" select="@title"/>
                            <xsl:with-param name="collapsible" select="'false'"/>
                            <xsl:with-param name="collapsed" select="'true'"/>
                        </xsl:call-template>
                    </xsl:if>

                    <xsl:variable name="target">
                        <xsl:choose>
                            <xsl:when test="@target and @target != ''">
                                <xsl:copy-of select="@target"></xsl:copy-of>
                            </xsl:when>
                            <xsl:otherwise>_blank</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:variable name="toggle">
                        <xsl:choose>
                            <xsl:when test="@toggle and @toggle != ''">
                                <xsl:copy-of select="@toggle"></xsl:copy-of>
                            </xsl:when>
                            <xsl:otherwise>live</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <xsl:apply-templates mode="form-hidden-fields" select="fields"/>
                    <xsl:apply-templates select="." mode="treemenu">
                        <xsl:with-param name="target" select="$target"/>
                        <xsl:with-param name="style" select="@style"/>
                        <xsl:with-param name="app" select="//rows/app"/>
                        <xsl:with-param name="gentype" select="'plsql'"/>
                        <xsl:with-param name="package" select="'c'"/>
                        <xsl:with-param name="toggle" select="$toggle"/>
                        <xsl:with-param name="onload" select="@onload"/>
                        <xsl:with-param name="tooltip" select="@tooltip"/>
                        <xsl:with-param name="parser" select="@parser"/>
                        <xsl:with-param name="search" select="@search"/>
                    </xsl:apply-templates>
                    </div>
            </xsl:when>
          
            <xsl:when test="@type = 'mapp_esri'">
              <div class="clear">
                MAPP ESRI TO IMPLEMENT. CONTACT DIM
              </div>
            </xsl:when>
            <!-- SEPARADOR LISTA-->
            <xsl:when test="@type='separatorlist' or @type='separatordialog'">
              <xsl:call-template name="GEN-separatorlist">
                <xsl:with-param name="isDialog">
                    <xsl:if test="@type = 'separatordialog'">true</xsl:if>
                </xsl:with-param>
              </xsl:call-template>
            </xsl:when>
            <!-- FORM LISTA-->
            <xsl:when test="@type='formlist'">
              <xsl:call-template name="GEN-formlist"/>
            </xsl:when>
            <!-- LISTA-->
            <xsl:when test="@type = 'table'">
              <xsl:call-template name="GEN-table"/>
            </xsl:when>

            <xsl:when test="@type='form'">
              <div class="box igrp-forms gen-container-item " item-name="{name()}">
                <xsl:if test="@title and @title != ''">
                  <xsl:call-template name="box-header">
                    <xsl:with-param name="title" select="@title"/>
                    <xsl:with-param name="collapsible" select="'true'"/>
                  </xsl:call-template>
                </xsl:if>
                <div class="box-body">
                  <div role="form">

                    <xsl:apply-templates mode="form-hidden-fields" select="fields/*[@type = 'hidden']" />

                    <xsl:for-each select="fields/*[@type != 'hidden']">
                      <xsl:call-template name="GEN-formfield"/>
                    </xsl:for-each>
                  </div>
                </div>
                <xsl:apply-templates select="tools-bar" mode="form-buttons"/>
              </div>
            </xsl:when>
          </xsl:choose>
          </div>
      </xsl:for-each>
    </div>
    <!--<xsl:if test="rows/content/*[@type ='tabcontent']/fields">
      <xsl:text  disable-output-escaping="yes"><![CDATA[</div>]]></xsl:text>
    </xsl:if>-->

  </xsl:template>

  <xsl:template name="setlinktarget">
    <xsl:param name="target" select="'_blank'"/>
    <xsl:attribute name="target">
      <xsl:choose>
        <xsl:when test="$target = 'mcparent' or $target = 'modalpopup'">modal</xsl:when>
        <xsl:otherwise><xsl:value-of select="$target"/></xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:if test="$target = 'mcparent'">
      <xsl:attribute name="close">refresh</xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  <xsl:include href="components/2.3/GEN-formfields.tmpl.xsl?v=1"/>

  <xsl:include href="components/2.3/GEN-table.tmpl.xsl?v=1"/>

  <xsl:include href="components/2.3/GEN-separatorlist.tmpl.xsl?v=1"/>

  <xsl:include href="components/2.3/GEN-formlist.tmpl.xsl?v=1"/>

</xsl:stylesheet>