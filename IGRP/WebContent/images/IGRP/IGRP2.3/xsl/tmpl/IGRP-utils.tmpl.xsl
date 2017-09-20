<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <!-- BOX-HEADER // title/collapsible -->
  <xsl:template name="box-header">
    <xsl:param name="title"/>
    <xsl:param name="collapsible" select="'false'"/>
    <xsl:variable name="collapsibleClass">
      <xsl:if test="$collapsible = 'true'">box-collapser</xsl:if>
    </xsl:variable>
    <xsl:attribute name="collapsed">false</xsl:attribute>
    <div class="box-header {$collapsibleClass}">
      <h3 class="box-title"><xsl:value-of select="$title"/></h3>
      <xsl:if test="$collapsible = 'true'">
        <div class="box-tools pull-right">
        <a class="btn-box-tool"><i class="fa fa-chevron-up"></i></a>
      </div>
      </xsl:if>
    </div>
  </xsl:template>
  <!-- TOOLSBAR BUTTONS -->
  <xsl:template name="gen-item-btn" mode="gen-item-btn" match="item">
    <xsl:param name="type"/>
    <xsl:param name="use-fa" select="'true'"/>
    <xsl:param name="fixed-target"/>
    <xsl:param name="vertical"/>
    <xsl:param name="outline"/>
    <xsl:param name="position"/>
    <xsl:param name="fixed-btn-class" select="'btn-default'"/>

   <xsl:variable name="btn-class">
      <xsl:choose>
        <xsl:when test="@class"><xsl:value-of select="@class"/></xsl:when>
        <xsl:otherwise>default</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="target">
      <xsl:choose>
        <xsl:when test="$fixed-target"><xsl:value-of select="$fixed-target"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="target"/></xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="img-folder">
      <xsl:choose>
        <xsl:when test="$type='tools-bar'">tools-bar</xsl:when>
        <xsl:otherwise>menu</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <a target="{$target}" use-fa="{$use-fa}" position="{$position}">
      
      <xsl:variable name="outlineClss">
        <xsl:if test="$outline = 'true'"><xsl:value-of select="' btn-outline'"/></xsl:if>
      </xsl:variable>

      <xsl:if test="img!=''"> 
        <xsl:attribute name="has-img">true</xsl:attribute>
      </xsl:if>

      <xsl:if test="$use-fa = 'false'"> 
        <xsl:attribute name="class">btn 
          <xsl:choose>
            <xsl:when test="$target = 'submit'">btn-success</xsl:when>
            <xsl:when test="$target = 'alert_submit'">btn-primary</xsl:when>
            <xsl:otherwise><xsl:value-of select="$fixed-btn-class"/></xsl:otherwise>
          </xsl:choose>
        </xsl:attribute>
      </xsl:if>

      <xsl:if test="contains($target, '|')">
        <xsl:call-template name="get-target-params">
          <xsl:with-param name="list" select="$target"/>
        </xsl:call-template>
      </xsl:if>

      <xsl:call-template name="page-nav">
          <xsl:with-param name="action" select="link" />
          <xsl:with-param name="page" select="page" />
          <xsl:with-param name="app" select="app" />
          <xsl:with-param name="linkextra" select="parameter" />
      </xsl:call-template> 
      
      <xsl:if test="img">
        <xsl:choose>
          <xsl:when test="$use-fa != 'false'">
            <xsl:call-template name="get-icon-item-with-color">
              <xsl:with-param name="list" select="img"/>
              <xsl:with-param name="use-fa" select="$use-fa"/>
              <xsl:with-param name="img-folder" select="$img-folder"/>
              <xsl:with-param name="classes" select="$outlineClss"/>
            </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
            <img src="{$path}/assets/img/v1/icon/{$img-folder}/{img}"/>
          </xsl:otherwise>
        </xsl:choose>

        <xsl:if test="$vertical='false'">
          <br/>
        </xsl:if>

      </xsl:if>

      <span><xsl:value-of select="title"/></span> 

    </a>
  </xsl:template>

  <xsl:template name="gen-buttons" match="*" mode="gen-buttons">
    <xsl:param name="vertical" select="'true'"/>
    <xsl:param name="outline" select="'false'"/>
    <xsl:param name="type"/>
    <xsl:param name="use-fa" select="'true'"/>
    <xsl:param name="fixed-target"/>
    <xsl:param name="fixed-btn-class" select="'btn-default'"/>

    <!-- <xsl:attribute name="use-fa"><xsl:value-of select="$use-fa"/></xsl:attribute>

    <xsl:attribute name="vertical"><xsl:value-of select="$vertical"/></xsl:attribute> -->

    <xsl:variable name="img-folder">
      <xsl:choose>
        <xsl:when test="$type='tools-bar'">tools-bar</xsl:when>
        <xsl:otherwise>menu</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:for-each select="item">

      <xsl:apply-templates mode="gen-item-btn" select=".">
       
        <xsl:with-param name="type" select="$type"/>
        <xsl:with-param name="use-fa" select="$use-fa"/>
        <xsl:with-param name="fixed-target" select="$fixed-target"/>
        <xsl:with-param name="vertical" select="$vertical"/>
        <xsl:with-param name="outline" select="$outline"/>
        <xsl:with-param name="position" select="position()"/>
        <xsl:with-param name="fixed-btn-class" select="$fixed-btn-class"/>
      </xsl:apply-templates>

    </xsl:for-each>
  </xsl:template>
  <!-- VERTICAL MENU-->
  <xsl:template name="gen-vmenu" match="*" mode="gen-vmenu">
    
    <xsl:param name="class"/>

    <ul class="nav {$class}">
      <xsl:for-each select="item[not(@parent)]">
        <xsl:variable name="rel" select="@rel"/>
        <xsl:variable name="childs" select="../item[@parent=$rel]"/>
        <xsl:variable name="countChilds" select="count(childs)"/>
        <li>
          <xsl:if test="$childs">
              <xsl:attribute name="class">treeview</xsl:attribute>
          </xsl:if>
          <xsl:apply-templates mode="gen-item-btn" select="."/>

          <xsl:if test="$childs">

            <ul class="treeview-menu">
              
                <li>
                  <a href="{link}">
                      <i class="fa fa-angle-right"></i>
                      <span>TEST</span>
                  </a>
                </li>
              
            </ul>
          </xsl:if>

        </li>
          <!-- <li>
            <xsl:if test="submenu">
              <xsl:attribute name="class">treeview</xsl:attribute>
            </xsl:if>
            <a href="#">
              <xsl:value-of select="title"/>
              <i class="fa fa-angle-right pull-right"></i>
              <span class="nav-bar-active" bg-color="2"/>
            </a>
            <xsl:if test="submenu">
              <ul class="treeview-menu">
                <xsl:for-each select="submenu">
                  <li>
                    <a href="{link}">
                        <i class="fa fa-angle-right"></i>
                        <span><xsl:value-of select="title"/></span>
                    </a>
                  </li>
                </xsl:for-each>
              </ul>
            </xsl:if>
          </li> -->
      </xsl:for-each>
    </ul>
  </xsl:template>
  <!-- OLD FILTER BUTTON -->
  <xsl:template name="gen-filter-submit" match="*" mode="gen-filter-submit">   
  </xsl:template>
  <!-- BUTTONS INLINE -->
  <xsl:template name="gen-buttons-group" match="*" mode="gen-buttons-group">
    <xsl:param name="id" select="'btn-group'"/>

    <ul class="nav nav-tabs" data-toggle="btns">
      <xsl:for-each select="group">
        <xsl:variable name="isActive">
          <xsl:if test="position()=1">active</xsl:if>
        </xsl:variable>

        <li class="{$isActive}">
          <a href="#{$id}-{position()}" data-toggle="tab"><xsl:value-of select="@title"/></a>
        </li>
      </xsl:for-each>
    </ul>

    <div class="tab-content">
      <xsl:for-each select="group">
        <xsl:variable name="isActive">
          <xsl:if test="position()=1">active</xsl:if>
        </xsl:variable>

        <div class="tab-pane {$isActive}" id="{$id}-{position()}">
          <div class="toolsbar-holder boxed gen-container-item clearfix">
            <div class="btns-holder clearfix" role="group">
              <xsl:apply-templates select="." mode="gen-buttons">
                <xsl:with-param name="use-fa" select="'false'"/>
                <xsl:with-param name="vertical" select="'false'"/>

              </xsl:apply-templates>
            </div>
          </div>
        </div>

      </xsl:for-each>

      <div class="tab-pane" id="{$id}-2">.2.</div>
    </div>
  </xsl:template>
  <!-- ACORDION BUTTONS -->
  <xsl:template name="gen-accordion-group" match="*" mode="gen-accordion-group">
    <xsl:param name="id" select="'gen-accordion-group'"/>
    
    <div class="panel-group" id="{$id}" template="igrp-accordion-group">
     
      <xsl:for-each select="group">
        
        <xsl:variable name="groupID" select="concat($id,'-item-',position())"/>
        
        <xsl:variable name="activeClss">
          <xsl:if test="position()=1">in</xsl:if>
        </xsl:variable>

        <xsl:variable name="collapsedClss">
          <xsl:if test="position()!=1">collapsed</xsl:if>
        </xsl:variable>

        <div class="panel panel-default no-shadow">
          <div class="panel-heading">
              <h4 class="panel-title">
                  <a data-toggle="collapse" data-parent="#{$id}" href="#{$groupID}" class="collapse-icon-ctrl {$collapsedClss}">
                    <span><xsl:value-of select="@title"/></span>
                    <i class="fa fa-chevron-down" text-color="1"></i>
                  </a>
              </h4>
          </div>
          <div id="{$groupID}" class="panel-collapse collapse {$activeClss}">
              <div class="panel-body no-padding">

                <xsl:apply-templates select="." mode="gen-buttons">
                  <xsl:with-param name="use-fa" select="'false'"/>
                  <xsl:with-param name="fixed-btn-class" select="''"/>
                </xsl:apply-templates>

              </div>
          </div>
        </div>

      </xsl:for-each>

      


    </div>  
  </xsl:template>

  <xsl:template name="igrp-msg-transform">
    <xsl:choose>
      <xsl:when test="@type = 'error'">danger</xsl:when>
      <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="igrp-msg-icon">
    <xsl:choose>
      <xsl:when test="@type = 'error'">exclamation-circle</xsl:when>
      <xsl:when test="@type = 'warning'">exclamation-triangle</xsl:when>
      <xsl:when test="@type = 'success'">check-circle</xsl:when>
      <xsl:when test="@type = 'info'">info-circle</xsl:when>
      <xsl:otherwise>bullseye</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- HIDDEN FIELDS -->
  <xsl:template mode="form-hidden-fields" match="*">
    <xsl:for-each select="hidden">
      <input type="hidden" name="{@name}" id="{@name}" value="{.}">
          <xsl:if test="@rel">
            <xsl:attribute name="rel">
              <xsl:value-of select="concat('F_',@rel)"/>
              </xsl:attribute>
          </xsl:if>
      </input>
    </xsl:for-each> 
  </xsl:template>
  <!-- OLD IGRP HIDDEN FIELDS -->
  <xsl:template mode="form-hidden" match="value">
    <xsl:param name="rel"/>
    <xsl:choose>
      <xsl:when test="$rel">
        <xsl:for-each select="hidden[@rel = $rel]">
          <input type="hidden" name="{@name}" id="{@name}" value="{.}" rel="F_{@rel}"/>
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
        <xsl:for-each select="hidden[not(@rel)]">
          <input type="hidden" name="{@name}" id="{@name}" value="{.}"/>
        </xsl:for-each>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template name="form-tab-menu-v1">

    <div class="gen-container-item igrp-gen-workflow">
      <div role="tabpanel">
        <div class="board">
          <div class="board-inner">
            <ul class="nav nav-tabs nav-justified" role="tablist" show-tooltip="false">
              <xsl:for-each select="rows/content/form/label/*[@type='separator']">
                <xsl:variable name="aClss">
                  <xsl:if test="position() = 1">active</xsl:if>
                </xsl:variable>
                <li role="presentation" class="{$aClss}" style-listener="true">
                  <a href="#gen-tab-{name()}" role="tab" data-toggle="tab" class="btn">
                    <span class="round-tabs one" data-toggle="tooltip" title="{.}" active-bg-color="1" active-border-color="1">
                      <xsl:value-of select="position()"/>
                      <!-- <i class="fa fa-home"/> -->
                    </span>
                  </a>
                  <!-- <h3><xsl:value-of select="."/></h3> -->
                  <span class="igrp-wf-item-title" active-text-color="1" ><xsl:value-of select="."/></span>
                </li>
              </xsl:for-each>
            </ul>
          </div>
        </div>
      </div>
    </div>

  </xsl:template>

  <!-- GET VALUE FROM XML -->
  <xsl:template mode="getValue" name="getValue" match="*">
    <xsl:param name="default"/>
    <xsl:choose>
        <xsl:when test=". and . != '' ">
          <xsl:value-of select="."/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:value-of select="$default"/>
        </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  <!-- 2.1 TO 2.3 ICONS -->
  <xsl:template name="topMenuIconsMap">
    
    <xsl:choose>
      <xsl:when test="img='home.png'">fa-home</xsl:when>
      <xsl:when test="img='settings.png'">fa-gears</xsl:when>
      <xsl:when test="img='process.png'">fa-share-alt</xsl:when>
      <xsl:when test="img='tasks.png'">fa-list-ol</xsl:when>
      <xsl:when test="img='support.png'">fa-question</xsl:when>
      <xsl:when test="img='info.png'">fa-info</xsl:when>
      <xsl:otherwise>fa-gear</xsl:otherwise>
    </xsl:choose>
  </xsl:template>
  
</xsl:stylesheet>