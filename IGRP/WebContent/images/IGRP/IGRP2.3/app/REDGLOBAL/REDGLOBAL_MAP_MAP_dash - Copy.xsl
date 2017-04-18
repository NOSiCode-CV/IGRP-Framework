<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_MAP_MAP_dash - Copy.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <xsl:call-template name="home-top-inc"/>
    
    <!-- MAP MAPS MAP LAYOUT MAPA -->
    <!-- START YOUR CODE HERE -->
    <!--PAGE TITLE-->
    <div class="box-content">
      <xsl:call-template name="page-title">
        <xsl:with-param name="title" select="rows/content/title" />
        
      </xsl:call-template>
      <!--NOTIFICATION MESSAGES-->
      <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
        <xsl:with-param name="class" select="'notification'"/>
        
      </xsl:apply-templates>
      <!--START PAGE
      
      <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter">
        FILTRO 
        START FORM-->
        <div class="box-content">
          <!--HIDDEN FIELDS-->
          <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" />
          
          <!--<label> <span><xsl:value-of select="rows/content/filter/label/aa"/></span>
            <input type="text" name="{rows/content/filter/value/aa/@name}" value="{rows/content/filter/value/aa}"  class="" maxlength="30" />
          </label>
          TOOLBAR FILTER
          <xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" />-->
          
             <div class="head-center-subtitle-ed">
             	<div class="head-subtitle-ed-1">
                    <xsl:for-each select="rows/content/table/tools-bar/item">
                		<a href="{link}" class="IGRP_menu">
                        	<div class="head-list-icon-mape-ed">
                  			<img src="{$path}/img/icon/{img}" alt="{title}" class="head-list-icon-ed-1" />
                            </div>
                    	</a>
                    </xsl:for-each>
                </div>
             </div>
             
          	<div class="center-2">
            	<div class="box-content">
                	<img src="/images/IGRP/app/REDGLOBAL/img/cape-verde.png"  style=" margin-bottom:5px;"/>
                </div>
            </div>
            <div class="left-1" style="margin-left:5px;">
            	<div class="box-content">
                    
       				<div class="wrap-ed"> 
      					<!-- the tabs -->
      					<ul class="tabs-ed IGRP_menu_group">
        					<xsl:for-each select="rows/content/menu/group">
          						<li><a href="#tabmenu{position()}">
          						<xsl:value-of select="@title" /></a></li>
        					</xsl:for-each>
      					</ul>
      					<!-- tab "panes" -->
      					<xsl:for-each select="rows/content/menu/group">
        				<div class="pane-ed IGRP_menu_group-pane IGRP_corner" id="tabmenu{position()}">
          					<xsl:for-each select="item">
                            <div  class="menu_geral" style="width:100%; height:20px;">
                            	<ul>
                                	<li style="padding:5px 0 0 5px;">
                                    	<a href="{link}" class="IGRP_menu" target="{target}" style="text-decoration:underline;">
                                    		<xsl:value-of select="title"/>
                                        </a>
                                    </li>
                                </ul>
            					<!--<div class="menu_geral" align="center">
              						<div class="menu_img">
                						<xsl:if test="img">
                							<a class="menu_link IGRP_menu">
                								<xsl:call-template name="page-nav">
                  									<xsl:with-param name="action" select="link" />
                  									<xsl:with-param name="page" select="page" />                  									<xsl:with-param name="linkextra" select="parameter" />
                								</xsl:call-template>
                								<img src="{$path}/img/icon/{img}" /> 
                                            </a>
                
                  						<img src="{$path}/img/icon/{img}" />
                						</xsl:if>
              						</div>
              						<div class="menu_title"> 
                                    	<a class="menu_link IGRP_menu">
                							<xsl:call-template name="page-nav">
                  								<xsl:with-param name="action" select="link" />
                  								<xsl:with-param name="page" select="page" />
         		  								<xsl:with-param name="linkextra" select="parameter" />
                							</xsl:call-template>
                							<xsl:value-of select="title" /> 
                                         </a>
                                    </div>-->
            					</div>
          					</xsl:for-each>
        				</div>
      				</xsl:for-each>
    			</div>
    		</div>
        </div>
    </div>
        <!--END FORM-->
        <!--TOOL BAR-->
       <!-- <xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" />-->
        
        <!-- CONTEXT-MENU -->
        <xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
        
        <!--INICIO DA TABELA-->
        <div class="table">
          <table class="sortable">
            <!--CABECALHO DA TABELA-->
            <thead>
              <tr> </tr>
            </thead>
            <!--CORPO DA TABELA-->
            <tbody>
              <xsl:for-each select="rows/content/table/value/row">
                <xsl:variable name="pos" select="(position()+1) mod 2"/>
                <tr class="IGRP_contextMenu">
                  <xsl:apply-templates mode="context-param" select="context-menu" />
                  
                </tr>
              </xsl:for-each>
            </tbody>
          </table>
        </div>
        <!--FIM DA TABELA
      </form>
      END PAGE-->
    </div>
    <!-- END YOUR CODE HERE -->
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>
</xsl:stylesheet>