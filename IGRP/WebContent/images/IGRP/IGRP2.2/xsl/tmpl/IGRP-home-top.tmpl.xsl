<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="home-top" mode="home-top" match="rows">
  	<div id="igrp-topPage" class="bodyColor">
        <div id="igrp-topLogo">
            <div class="topLeft">
            	<xsl:choose>
                	<!--Quando o Home.xml tiver a tag application, 
                	significa que a janela activa é a do DIRECTÓRIO, e mostra esta imagem-->
                	<xsl:when test="applications">
                    	<a href="{link}">
                            <div class="topLeftLogo">
                                <img src="{$path}/themes/default/img/igrp-logo.png" />
                                <!-- <img src="{$lngPath/framework/logo}" /> -->
                            </div>
                            <div class="topLeftIgrp"><xsl:value-of select="$lngPath/framework/abbreviation"/><br/>
                                <span><xsl:value-of select="$lngPath/framework/version"/></span>
                            </div>
                        </a>
                        <xsl:choose>
                        	<xsl:when test="fmw_nome">
                            	<div class="topLeftTitle _hiddenMobile"><xsl:value-of select="fmw_nome"/></div>
                            </xsl:when>
                            <xsl:otherwise>
                            	<div class="topLeftTitle _hiddenMobile">
                                	<xsl:value-of select="$lngPath/framework/name"/>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <!--Caso o Home.xml não tiver a tag application, 
                	significa que estamos dentro da aplicação, e mostra esta imagem-->
                    <xsl:otherwise>
                    	<a href="{link}">
                            <div class="topLeftLogo">
                                <img src="{$path}/themes/default/img/igrp-logo.png" />
                                <!-- <img src="{$lngPath/framework/logo}" /> -->
                            </div>
                            <div class="topLeftIgrp"><xsl:value-of select="$lngPath/framework/abbreviation"/><br/>
                                <span><xsl:value-of select="$lngPath/framework/version"/></span>
                            </div>
                        </a>
                        <div class="topLeftTitle _hiddenMobile"><xsl:value-of select="title"/></div>
                    </xsl:otherwise>
                </xsl:choose>
            </div>
            <div class="topRigth">
            	<span><xsl:value-of select="site/welcome_note"/></span>
                <xsl:value-of select="site/user_name"/>
          	</div>
        </div>
        <div id="igrp-topMenu">
            <div class="topMenuLeft">
                <div id="iconMenu" class="pMenu"></div>
                <span class="pageTitle showDesktop"><xsl:value-of select="content/title"/></span>
            </div>
            <div class="topMenuRigth">
            	<!--TOP MENU-->
                <ul>      
        			<xsl:apply-templates mode="top-menu" select="document(top_menu/@file)" />
                	<li alt="{site/button/title}" title="{site/button/title}">
                        <a href="{site/button/link}">
                            <img src="{$path_tmpl}/img/icon/{site/button/img}"/>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="_clear"/>
    </div>
  </xsl:template>
  <!--TEMPLATE FOR TOP-MENU-->
  <xsl:include href="IGRP-top-menu.tmpl.xsl" />
</xsl:stylesheet>