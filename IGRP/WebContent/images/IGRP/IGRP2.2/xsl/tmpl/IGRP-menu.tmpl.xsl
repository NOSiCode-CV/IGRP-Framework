<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template mode="gen-simple-menu" name="gen-simple-menu" match="*">
    <div class="box-content resetPadding" id="simpleMenu" smenu-name="{name()}">
        <ul class="IGRP-menu itemMenu" type="simple">
            <xsl:for-each select="item">
                <xsl:variable name="pos" select="position() -1"/>
              <li itemMenu-name="{name()}">
                <a class="bClick" target="{target}" pos="{$pos}">
                    <xsl:call-template name="page-nav">          
                        <xsl:with-param name="action" select="link" />
                        <xsl:with-param name="page" select="page" />
                        <xsl:with-param name="app" select="app" />
                        <xsl:with-param name="linkextra" select="parameter" />
                    </xsl:call-template>
                    <span class="icon">
                        <xsl:choose>
                            <xsl:when test="img and img != ''"><img src="{$path_tmpl}/img/icon/menu/{img}"/></xsl:when>
                            <xsl:otherwise><img src="{$path_tmpl}/img/icon/menu/default.png"/></xsl:otherwise>
                        </xsl:choose>
                    </span>
                    <span class="title">
                        <xsl:if test="string-length(title) &gt; 14">
                           <xsl:attribute name="title"><xsl:value-of select="title"/></xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="title"/>
                    </span>
                </a></li>
            </xsl:for-each>
            <div class="_clear"/>
        </ul>
      <div class="_clear"/>
    </div>
  </xsl:template>

  <xsl:template mode="simple-menu" name="simple-menu" match="menu">
    <div class="box-content resetPadding" id="simpleMenu" smenu-name="{name()}">
        <ul class="IGRP-menu itemMenu" type="simple">
            <xsl:for-each select="item">
            	<xsl:variable name="pos" select="position() -1"/>
              <li itemMenu-name="{name()}">
              	<a class="bClick" target="{target}" pos="{$pos}">
                    <xsl:call-template name="page-nav">          
                        <xsl:with-param name="action" select="link" />
                        <xsl:with-param name="page" select="page" />
                        <xsl:with-param name="app" select="app" />
                        <xsl:with-param name="linkextra" select="parameter" />
                    </xsl:call-template>
                    <span class="icon">
                        <xsl:choose>
                        	<xsl:when test="img and img != ''"><img src="{$path_tmpl}/img/icon/menu/{img}"/></xsl:when>
                            <xsl:otherwise><img src="{$path_tmpl}/img/icon/menu/default.png"/></xsl:otherwise>
                        </xsl:choose>
                    </span>
                    <span class="title">
                        <xsl:if test="string-length(title) &gt; 14">
                           <xsl:attribute name="title"><xsl:value-of select="title"/></xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="title"/>
                    </span>
                </a></li>
            </xsl:for-each>
            <div class="_clear"/>
        </ul>
      <div class="_clear"/>
    </div>
  </xsl:template>
  
  <xsl:template mode="gen-lateral-menu" name="gen-lateral-menu" match="*">
    <div class="box-process lateralMenu" laftmenu-name="{name()}">
        <div class="col divBorder">
            <!-- <xsl:call-template name="page-title">
                <xsl:with-param name="title" select="title"/>
            </xsl:call-template> -->
            <ul class="process_menu">
                <xsl:for-each select="group">
                    <xsl:variable name="pos" select="position() - 1"/>
                    <li groupMenu-name="{name()}{$pos}"><a pos="{$pos}"><xsl:value-of select="@title"/></a>
                        <ul class="bodyColor">
                            <xsl:for-each select="item">
                                <xsl:variable name="vPos" select="concat($pos,position() -1)"/>
                                <li itemMenu-name="{name()}{$vPos}"><a class="bClick" target="{target}" pos="{$vPos}">
                                    <xsl:call-template name="page-nav">
                                        <xsl:with-param name="action" select="link" />
                                        <xsl:with-param name="page" select="page" />
                                        <xsl:with-param name="app" select="app" />                  
                                        <xsl:with-param name="linkextra" select="parameter" />                  
                                    </xsl:call-template>
                                    <xsl:value-of select="title"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
           
            <div class="_clear"/>
        </div>
       <div class="_clear"/>
   </div>
  </xsl:template>

  <xsl:template mode="lateral-menu" name="lateral-menu" match="menu">
  	<div class="box-process lateralMenu" laftmenu-name="{name()}">
        <div class="col divBorder">
            <xsl:call-template name="page-title">
                <xsl:with-param name="title" select="title"/>
            </xsl:call-template>
            <!--inicio menu interior-->
            <ul class="process_menu">
                <xsl:for-each select="group">
                	<xsl:variable name="pos" select="position() - 1"/>
                    <li groupMenu-name="{name()}{$pos}"><a pos="{$pos}"><xsl:value-of select="@title"/></a>
                        <ul class="bodyColor">
                            <xsl:for-each select="item">
                            	<xsl:variable name="vPos" select="concat($pos,position() -1)"/>
                                <li itemMenu-name="{name()}{$vPos}"><a class="bClick" target="{target}" pos="{$vPos}">
                                    <xsl:call-template name="page-nav">
                                        <xsl:with-param name="action" select="link" />
                                        <xsl:with-param name="page" select="page" />
                                        <xsl:with-param name="app" select="app" />                  
                                        <xsl:with-param name="linkextra" select="parameter" />                  
                                    </xsl:call-template>
                                	<xsl:value-of select="title"/>
                                </a></li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </xsl:for-each>
            </ul>
            <!--fim menu interior-->
            <div class="_clear"/>
        </div>
       <div class="_clear"/>
   </div>
  </xsl:template>
</xsl:stylesheet>