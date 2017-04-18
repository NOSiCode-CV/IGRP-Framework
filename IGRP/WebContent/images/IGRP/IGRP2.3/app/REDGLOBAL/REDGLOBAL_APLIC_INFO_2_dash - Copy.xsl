<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_APLIC_INFO_2_dash.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- APLIC_INFO INFORMACOES APLICACAO 2 INFO APLICACAO -->

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


		  <!--START PAGE-->
<form action="#" method="post" id="formular_default" name="formular_default" class="default_filter">
<!--TOOL BAR-->
<xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" />
<!-- CONTEXT-MENU -->
<xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
<!--INICIO DA TABELA-->
<div class="table">
<table class="sortable">
<!--CABECALHO DA TABELA-->
<thead><tr>
</tr></thead>
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
<!--FIM DA TABELA-->
</form>
<!--END PAGE-->
<div class="box-info">
        	<!--inicio codigo edson-->
            
            	<div class="title_info">
                	<div class="icon_info"> 
                		<a href="#">
                        	<img src="{$path}/img/icon/{rows/content/application_info/form/value/img}"  align="absmiddle"/>
                        </a> 
                    </div>
                     <div class="desc_info">
                     	<div class="title-description">
                        	<xsl:value-of select="rows/content/application_info/form/value/title" /><br />
                            <p class="title-description-versao">
                            	<xsl:value-of select="rows/content/application_info/form/value/versao" />
                            </p>
                        </div>
              		</div>
               </div>
               
               <div class="box-content">
                    
               		<!--area para video-->
          	   		<div class="div_video">
               			<div class="video_info">
                        	<div class="video">
                            	<xsl:apply-templates mode="video" select="rows/content/video/form"/>
 							</div>
               			</div>
               		</div>
                   <!-- fim de area para video-->

         				<br />
          				<h1 class="item"><xsl:value-of select="rows/content/form/label/area" /></h1>
                        <p class="text"><xsl:value-of select="rows/content/form/value/area" /></p>
                        
                        <br />
          				<h1 class="item"><xsl:value-of select="rows/content/form/label/system" /></h1>
                        <p class="text"><xsl:value-of select="rows/content/form/value/system" /></p>
                        
                        <br />
          				<h1 class="item"><xsl:value-of select="rows/content/form/label/descricao" /></h1>
                        <p class="text"><xsl:value-of select="rows/content/form/value/descricao" /></p>
                        
                        <br />
          				<h1 class="item"><xsl:value-of select="rows/content/form/label/objectivo" /></h1>
                        <p class="text"><xsl:value-of select="rows/content/form/value/objectivo" /></p>

               </div>

         </div>

	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>
<xsl:include href="../../xsl/tmpl/IGRP-video.tmpl.xsl"/>
</xsl:stylesheet>