<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!--DASHBOARD TOOLS BAR-->

  <xsl:template name="tools-bar" mode="tools-bar" match="*">
  	<xsl:param name="isTable" select="'false'"/>
    <xsl:param name="rel" select="'pag'"/>
    <xsl:param name="vClassClick" select="'bClick'"/>
  
        <div class="col tool-bar" bar-name="{$rel}" data-native-menu="true">
        	<xsl:if test="$isTable = 'false'">
            	<xsl:attribute name="rel">noTable</xsl:attribute>
            </xsl:if>
        	<xsl:if test="count(item) &gt; 5">
            	 <xsl:attribute name="mobile"><xsl:text>true</xsl:text></xsl:attribute>
                 <div class="icon"/>
            </xsl:if>
            <ul>
                <xsl:for-each select="item[@type='specific']">
                    <li item-name="btn-{position()}">
                        <a class="{$vClassClick}" target="{target}">
                        	<xsl:if test="string-length(title) &gt; 14">
                            	<xsl:attribute name="title"><xsl:value-of select="title" disable-output-escaping="yes"/></xsl:attribute>
                            </xsl:if>
                            <xsl:if test="target = '_link'">
                                <xsl:attribute name="href"><xsl:value-of select="parameter" disable-output-escaping="yes"/></xsl:attribute>
                            </xsl:if>
                            <xsl:if test="target != '_close' and target != '_back' and target != '_link'">
                                <xsl:apply-templates mode="toolsbar-url" select="." />
                            </xsl:if>
                            <xsl:variable name="vImg">
                              <xsl:choose>
                                <xsl:when test="img != ''"><xsl:value-of select="img"/></xsl:when>
                                <xsl:otherwise>default.png</xsl:otherwise>
                              </xsl:choose>
                            </xsl:variable>
                            <img alt="{title}" name="{title}" src="{$path_tmpl}/img/icon/tools-bar/{$vImg}" />
                            <span><xsl:value-of select="title" disable-output-escaping="yes"/></span>
                        </a>
                    </li>
                </xsl:for-each>
            </ul>
            <div class="_clear"/>
        </div>

  </xsl:template>

  <xsl:template name="tools-bar-item" mode="tools-bar-item" match="item">
    <a class="bClick" target="{target}">
      <xsl:if test="string-length(title) &gt; 14">
          <xsl:attribute name="title"><xsl:value-of select="title" disable-output-escaping="yes"/></xsl:attribute>
        </xsl:if>
        <xsl:if test="target = '_link'">
            <xsl:attribute name="href"><xsl:value-of select="parameter" disable-output-escaping="yes"/></xsl:attribute>
        </xsl:if>
        <xsl:if test="target != '_close' and target != '_back' and target != '_link'">
            <xsl:apply-templates mode="toolsbar-url" select="." />
        </xsl:if>
        <xsl:if test="img != ''">
            <img alt="{title}" name="{title}" src="{$path_tmpl}/img/icon/tools-bar/{img}" /> 
        </xsl:if>
        <span gen-lbl-setter=""><xsl:value-of select="title" disable-output-escaping="yes"/></span>
    </a>
  </xsl:template>
  
  
    <!--FORM TOOLS BAR-->
  <xsl:template name="tools-bar-form" mode="tools-bar-form" match="tools-bar">
      <div class="tool-bar">
        <ul id="dashboard-buttons">
          <!--BUTOES DE FROMULARIO-->
          <div class="box-tool-bar-form">
            <xsl:for-each select="item[@type='form']">
              <li> <a class="tooltip-addhoc">                
                 <xsl:apply-templates mode="toolsbar-url" select="." />
                <img alt="{title}" src="{$path_tmpl}/img/icon/tools-bar/{img}" /> 
                </a> <em><xsl:value-of select="title"/>e</em> </li>
            </xsl:for-each>
          </div>
        </ul>
      </div>
  </xsl:template>
  
  
    <!--FORM TOOLS BAR GROUP-->
  <xsl:template name="tools-bar-form-group">
	  <xsl:param name="rel" select="''" />
      <xsl:param name="class" select="'IGRP_addRow'" />
      <div class="col" add-name="{$rel}">
        <div class="addRow separador">
            <a rel="{$rel}" class="{$class}" item-name="add-{$rel}">
            <img src="{$path_tmpl}/img/icon/tools-bar/sepAdd.png" />
            	<span><xsl:value-of select="$lngPath/separatorlist_dialog/add" disable-output-escaping="yes"/></span>
            </a>
        </div>
    </div>
  </xsl:template>
  

  <!--BUTTONS BAR-->
  <xsl:template name="button-bar" mode="button-bar" match="tools-bar">
      <div class="buttonBar">
        <xsl:for-each select="item">
            <a class="bClick" target="submit" item-name="btn-{name()}">
                <xsl:apply-templates mode="toolsbar-url" select="." />
                <span class="img">
            		<xsl:if test="img != ''"><img src="{$path_tmpl}/img/icon/tools-bar/{img}" /></xsl:if>
            	</span>
                <span class="label">
                	<xsl:value-of select="title" disable-output-escaping="yes"/>
                </span>
            </a>
        </xsl:for-each>
        <div class="_clear"/>
      </div>
  </xsl:template>
  
   <!--LOOKUP BUTTON-->
    <xsl:template name="lookup-tool">  
        <xsl:param name="page" select="'LOOKUP'" />
        <xsl:param name="action" select="''" />
        <xsl:param name="name" select="''" />
        <xsl:param name="js_lookup" select="''" />    
        <xsl:param name="ad_hoc" select="'0'" />
        
        <a class="IGRP_lookupPopup" ctx_param="{$name}">   
           <xsl:call-template name="page-nav">
             <xsl:with-param name="action" select="$action" />
             <xsl:with-param name="page" select="$page" />
             <xsl:with-param name="linkextra" select="$js_lookup" />
             <xsl:with-param name="ad_hoc" select="$ad_hoc" />
            </xsl:call-template> 
            <img alt="LOOKUP" src="{$path_tmpl}/img/icon/search.png" /> 
         </a>
    </xsl:template>
   
    <xsl:template name="toolsbar-url" mode="toolsbar-url" match="item">    
        <xsl:call-template name="page-nav">
            <xsl:with-param name="action" select="link" />
            <xsl:with-param name="page" select="page" />
            <xsl:with-param name="app" select="app" />
            <xsl:with-param name="linkextra" select="parameter" />
        </xsl:call-template> 
    </xsl:template>
</xsl:stylesheet>
