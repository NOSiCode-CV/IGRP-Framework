<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_MAP_MAP_dash.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <xsl:call-template name="home-top-inc"/>
    
    <!-- MAP MAPS MAP LAYOUT MAPA -->
    <!-- START YOUR CODE HERE -->
    
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=true"></script>
    <script type="text/javascript" src="{$path}/js/IGRP.google.maps.js?v=5"></script>

    <script type="text/javascript"> 

	$(document).ready(function() {
		IGRP_init_map();
		$(".map_zoom_plus").click(function(){IGRP_zoom_plus();});
		$(".map_zoom_minus").click(function(){IGRP_zoom_minus();});
		$(".map_view_init").click(function(){IGRP_view_inicial();});
		$(".map_view_prev").click(function(){IGRP_view_previous();});
		$(".map_print").click(function(){IGRP_map_print();});
	});
    </script>
    
    
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
      <!--START FORM VIEW
      <div class="box-content">
        <div class="box-entity">
          <div class="foto-box"> <img class="foto" src="{rows/content/view/value/view_foto}" /> </div>
          <div class="info-box">
            <ul>
              <li><span class="label"><xsl:value-of select="rows/content/view/label/tab_conteudo"/>:</span> <xsl:value-of select="rows/content/view/value/tab_conteudo"/></li>
              <li><span class="label"><xsl:value-of select="rows/content/view/label/tab_pesquisa"/>:</span> <xsl:value-of select="rows/content/view/value/tab_pesquisa"/></li>
              <li><span class="label"><xsl:value-of select="rows/content/view/label/tab_legenda"/>:</span> <xsl:value-of select="rows/content/view/value/tab_legenda"/></li>
            </ul>
          </div>
        </div>
      </div>
      END FORM VIEW-->
      <!--TAB MENU -->
      
      <div class="head-center-subtitle-ed">
             	<div class="head-subtitle-ed-1">
                    <!--<xsl:for-each select="rows/content/table/tools-bar/item">
                		<a href="{link}" class="IGRP_menu">
                        	<div class="head-list-icon-mape-ed">
                  			<img src="{$path}/img/icon/{img}" alt="{title}" class="head-list-icon-ed-1" />
                            </div>
                    	</a>
                    </xsl:for-each>-->
                    <xsl:call-template name="map_toolbar" />
                </div>
             </div>
             <div class="center-2">
            	<div class="box-content" id="igrp_map_canvas" style="height:500px">
                	<!--<img src="/images/IGRP/app/REDGLOBAL/img/cape-verde.png"  style=" margin-bottom:5px;"/>-->
                </div>
            </div>
            <div class="left-1" style="margin-left:5px;">
            	<div class="box-content" style="border:none;">
     				<!-- <xsl:apply-templates mode="tab-menu" select="rows/content/menu" />-->
                    
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
  
   <!--TEMPLATE FOR MAP BUTTOM-->
  <xsl:template name="map_button">
  <xsl:param name="img" select="''" />
  <xsl:param name="title" select="''" />
  <xsl:param name="class" select="''" />
     
    <div class="head-list-icon-mape-ed">
        <img src="{$path}/img/icon/{$img}" alt="{$title}" title="{$title}" class="head-list-icon-ed-1 {$class}" />
    </div>
   
  </xsl:template>
  
   <!--TEMPLATE FOR MAP TOOLBAR-->
  <xsl:template name="map_toolbar">
       
     <!--<xsl:call-template name="map_button">
          <xsl:with-param name="img" select="'tb_zoom-janela.png'" />
          <xsl:with-param name="title" select="'Zoom Janela'" />
          <xsl:with-param name="class" select="'map_zoom'" />
    </xsl:call-template>-->
    
     <xsl:call-template name="map_button">
          <xsl:with-param name="img" select="'tb_acercar.png'" />
          <xsl:with-param name="title" select="'Zoom +'" />
          <xsl:with-param name="class" select="'map_zoom_plus'" />
    </xsl:call-template>
    
     <xsl:call-template name="map_button">
          <xsl:with-param name="img" select="'tb_distanciar.png'" />
          <xsl:with-param name="title" select="'Zoom -'" />
          <xsl:with-param name="class" select="'map_zoom_minus'" />
    </xsl:call-template>
    
     <xsl:call-template name="map_button">
          <xsl:with-param name="img" select="'tb_vista-inicial.png'" />
          <xsl:with-param name="title" select="'Vista Inicial'" />
          <xsl:with-param name="class" select="'map_view_init'" />
    </xsl:call-template>
    
    
     <xsl:call-template name="map_button">
          <xsl:with-param name="img" select="'tb_vista-anterior.png'" />
          <xsl:with-param name="title" select="'Vista Anterior'" />
          <xsl:with-param name="class" select="'map_view_prev'" />
    </xsl:call-template>
    
     <xsl:call-template name="map_button">
          <xsl:with-param name="img" select="'print.png'" />
          <xsl:with-param name="title" select="'Imprimir'" />
          <xsl:with-param name="class" select="'map_print'" />
    </xsl:call-template>
  
  </xsl:template>
  
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>
  <!--TEMPLATE FOR MENU_TREE-->
  <xsl:include href="../../xsl/tmpl/IGRP-tree-menu.tmpl.xsl"/>
 <!-- <xsl:include href="../../xsl/tmpl/IGRP-toolbar.tmpl.xsl"/>-->
</xsl:stylesheet>