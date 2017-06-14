<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_MAP_MAP_dash.xml" -->
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
      <div class="box-content">
      <!--NOTIFICATION MESSAGES-->
      <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
        <xsl:with-param name="class" select="'notification'"/>
        
      </xsl:apply-templates>
      <!--START PAGE-->
      <!--VIEW -->
     
      <!--TAB MENU -->
      
      <div class="head-center-subtitle-ed">
      	<div class="head-subtitle-ed-1">
       		<xsl:call-template name="map_toolbar" />
        </div>
             </div>
             <div class="center-2">
            	 <xsl:apply-templates mode="map" select="rows/content/menu"/>
            </div>
            <div class="left-1" style="margin-left:5px;">
            	<div class="box-content" style="border:none;">
                    <div class="wrap-ed"> 
      					<!-- the tabs -->
      					<ul class="tabs-ed IGRP_menu_group">
          					<li><a href="#tabmenu1">
          						Conteudo</a>
                           	</li>
                            <li><a href="#tabmenu2">
          						Pesquisa</a>
                           	</li>
                            <li><a href="#tabmenu3">
          						Legenda</a>
                           	</li>
      					</ul>
      					<!-- tab "panes" -->
        				<div class="pane-ed IGRP_menu_group-pane IGRP_corner" id="tabmenu1">
                            <div class="box-content" style="margin-top:-6px; margin-left:-1px;">
                            	<!--Arvore menu-->
       								<xsl:apply-templates mode="tree-menu" select="rows/content/menu" />
       							<!--Arvore menu-->
            				</div>
        				</div>
                        <div class="pane-ed IGRP_menu_group-pane IGRP_corner" id="tabmenu2">
                            <div class="box-content" style="margin-top:-6px; margin-left:-1px;">
                            	<form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data">
        						<!--TOOL BAR-->
        						<xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" />
        						<!--HIDDEN FIELDS-->
          						<xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" />
          						<label style="width:100%"> 
                                <span><xsl:value-of select="rows/content/filter/label/pesquisa"/></span>
            					<input type="text" name="{rows/content/filter/value/pesquisa/@name}" value="{rows/content/filter/value/pesquisa}"  class="" maxlength="30" style="width:65%;"/>
          						</label>
                                
                                
                                <label class="button" style="width:50%; float:right; margin-top:-31px">
        							<button id="submitBtn" class="btn btn-blue submit" type="submit">            	
              							<!--<xsl:apply-templates mode="toolsbar-url" select="." />-->
            						<xsl:value-of select="rows/content/filter/tools-bar/item/title"/>
           							</button>
   								 </label>
                                
                                
                                <!--TOOLBAR FILTER style="width:50%; float:right; margin-top:-34px"-->
                                <!--<div class="buttommap">
          						<xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" />
                                </div>-->
                                
          						<!--CONTEXT-MENU -->
        					<xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
        
        					<!--INICIO DA TABELA-->
        					<div class="table">
          					<table class="sortable">
            				<!--CABECALHO DA TABELA-->
            				<thead>
              				<tr>
                				<xsl:if test="rows/content/table/label/resultado">
                  				<th><xsl:value-of select="rows/content/table/label/resultado"/></th>
                			</xsl:if>
              				</tr>
            			</thead>
            			<!--CORPO DA TABELA-->
            			<tbody>
              				<xsl:for-each select="rows/content/table/value/row">
               			 	<xsl:variable name="pos" select="(position()+1) mod 2"/>
                			<tr class="IGRP_contextMenu">
                  				<xsl:apply-templates mode="context-param" select="context-menu" />
                  				<xsl:if test="resultado">
                    				<td class="table_row{$pos}">
                                    <a href="#" class="IGRP_menu" style="text-decoration:underline;">
                                    	<xsl:value-of select="resultado" />
                                    </a></td>
                      			</xsl:if>
                   			 </tr>
              			</xsl:for-each>
            		</tbody>
          		</table>
        		</div>
        			<!--FIM DA TABELA-->
     				 </form>
            		</div>
        				</div>
                        <div class="pane-ed IGRP_menu_group-pane IGRP_corner" id="tabmenu3">
                            <div class="box-content" style="margin-top:-6px; margin-left:-1px;">
                            	<xsl:call-template name="page-title">
            						<xsl:with-param name="title" select="rows/content/form/label/legenda" />
            						<xsl:with-param name="class" select="'subtitle'" />
          						</xsl:call-template>
          						<!--INICIO DA TABELA-->
          						<div class="simple-table">
            						<table rel="T_legenda">
              							<!--CABECALHO DA TABELA-->
              							<thead>
                							<tr><th>
                                            <xsl:value-of select="rows/content/form/table/legenda/label/imagem"/>
                                            </th><th>
                                            <xsl:value-of select="rows/content/form/table/legenda/label/titulo"/>
                                            </th></tr>
              							</thead>
              							<!--CORPO DA TABELA-->
              							<tbody>
                							<xsl:for-each select="rows/content/form/table/legenda/value/row">
                  								<xsl:variable name="pos" select="(position()+1) mod 2"/>
                  								<tr class="IGRP_contextMenu">
                    								<td class="table_row{$pos}">
                                                    	<img src="{$path}/img/icon/{imagem}" />
                                                	</td>
                    								<td class="table_row{$pos}"><xsl:value-of select="titulo" />
                                                	</td>
                  								</tr>
                							</xsl:for-each>
             							 </tbody>
            						</table>
          						</div>
          					<!--FIM DA TABELA-->
            				</div>
        				</div> <!--Fim da label 3-->
    				</div>
      			</div>
      		</div>
      </div>
      <!--END PAGE-->
    </div>
    <!-- END YOUR CODE HERE -->
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>
  <!--TEMPLATE FOR MENU_TREE-->
  <xsl:include href="../../xsl/tmpl/IGRP-tree-menu.tmpl.xsl"/>
   <!--TEMPLATE MAP-->
  <xsl:include href="../../xsl/tmpl/IGRP-map.tmpl.xsl"/>
 <!-- <xsl:include href="../../xsl/tmpl/IGRP-toolbar.tmpl.xsl"/>-->
</xsl:stylesheet>