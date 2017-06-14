<?xml version="1.0" encoding="utf-8"?>
<gen:stylesheet version="1.0" xmlns:gen="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="dim-red"
 exclude-result-prefixes="xsl">
  <gen:namespace-alias stylesheet-prefix="xsl" result-prefix="xsl"/>
  <gen:template match="/">
    <xsl:stylesheet version="1.0">
      <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
      <xsl:template match="/">
       <html>
       		<gen:text><![CDATA[<!--XSL Generator (RED/DIM 2015)-->]]></gen:text>
           <head>
           		<gen:text><![CDATA[<!--HOME-HEADER-->]]></gen:text>
           		<xsl:call-template name="home-header"></xsl:call-template>
           </head>
           <body class="bodyColor">
           		<gen:variable name="genClassForm"> 
                    <gen:choose> 
                        <gen:when test="rows/content/form"> 
                            <gen:text>default_form</gen:text> 
                        </gen:when> 
                        <gen:otherwise>
                            <gen:text>default_filter</gen:text>
                        </gen:otherwise>
                    </gen:choose> 
           		</gen:variable>
                
                <gen:variable name="genAlignLeft">
                    <gen:if test="(rows/content/menu/group/@align = 'left') or (rows/content/*[@type = 'chart']/@align = 'left')">
                        <gen:text>1</gen:text>
                    </gen:if> 
               </gen:variable>
               
               <gen:variable name="genAlignRight">
                    <gen:if test="(rows/content/menu/group/@align = 'right') or (rows/content/*[@type = 'chart']/@align = 'right')">
                        <gen:text>1</gen:text>
                    </gen:if> 
               </gen:variable>
               
               <gen:variable name="layout">
                    <gen:choose>
                        <gen:when test="$genAlignRight = 1 and $genAlignLeft = 1">colLCR</gen:when>
                        <gen:when test="$genAlignRight = 1 and $genAlignLeft = ''">colLR</gen:when>
                        <gen:when test="$genAlignRight = '' and $genAlignLeft = 1">colLR</gen:when>
                        <gen:otherwise>none</gen:otherwise>
                    </gen:choose>
           		</gen:variable>
                
           		<div class="IGRP_overlay"/>
                <gen:text><![CDATA[<!--HOME TOP-->]]></gen:text>
                <!--START HEAD PAGE-->
                <xsl:call-template name="home-top-main"></xsl:call-template>
                <!--END HEAD PAGE-->
                <gen:text><![CDATA[<!--HOME-->]]></gen:text>
                <!--START BODY PAGE-->
                <div id="igrp-bodyPage">
                	<!--START LEFT PAGE-->
                    <gen:text><![CDATA[<!--HOME LEFT-->]]></gen:text>
                	<xsl:call-template name="home-slide-menu"></xsl:call-template>
                    <!--END LEFT PAGE-->
                    <!--START RIGTH PAGE-->
                    <gen:text><![CDATA[<!--HOME RIGTH-->]]></gen:text>
                    <div class="bodyPageRigth">
                    	<gen:text><![CDATA[<!-- START YOUR CODE HERE -->]]></gen:text>
                        
                        <gen:text><![CDATA[<!-- SHOW TABLET AND MOBILE TITLE -->]]></gen:text>
                        <div class="box-head showTabMobile"><xsl:value-of select="rows/content/title"></xsl:value-of></div>
                            
                        <gen:text><![CDATA[<!-- SHOW NOTIFICATION MESSAGES-->]]></gen:text>
                        <xsl:apply-templates mode="notif_messages" select="rows/content/messages"></xsl:apply-templates>
                        
                        <gen:if test="$layout != 'none' and $genAlignLeft = 1">
                            <div class="{$layout} divLeft">
                            	<div class="box-content resetPadding">
                                     <gen:if test="rows/content/menu/group/@align = 'left'">
                                        <gen:text><![CDATA[<!-- START LATERAL MENU  -->]]></gen:text>
                                            <xsl:apply-templates mode="lateral-menu" select="rows/content/menu"/>
                                        <gen:text><![CDATA[<!-- END LATERAL MENU  -->]]></gen:text>
                                     </gen:if>
                                     <gen:if test="rows/content/*[@type = 'chart']">
                                         <gen:call-template name="gen_chart">
                                            <gen:with-param name="align" select="'left'"></gen:with-param>
                                        </gen:call-template>
                                    </gen:if>
                                    <div class="_clear"/>
                                </div>
                            </div>
                        </gen:if>
                        
                        <gen:if test="$layout != 'none'">
                            <gen:choose>
                                <gen:when test="$layout = 'colLCR'">
                                    <gen:text>&lt;div class="colCenterLR"&gt;</gen:text>
                                </gen:when>
                                <gen:otherwise>
                                    <gen:text>&lt;div class="colCenter"&gt;</gen:text>
                                </gen:otherwise>
                            </gen:choose>
                       </gen:if>
                        
                        
                        <!--START PROCESS FLOW-->             
                        <gen:if test="rows/content/table/@operation = 'workflow'">
                        <gen:text><![CDATA[<!-- SHOW PROCESS FLOW-->]]></gen:text>
                        <xsl:apply-templates mode="process-flow" select="rows/content/table"/>
                        </gen:if>             
                        <!--END PROCESS FLOW-->
                        
                        <!--START VIW-->
                       	<gen:call-template name="gen_view"/>
                        <!--END VIW-->
                        
                        <!-- START MENU-->
                         <gen:call-template name="gen_menu">
                            <gen:with-param name="align" select="'center'"/>
                         </gen:call-template>
                        <!-- END MENU-->
                        
                        <form action="#" method="post" id="formular_default" name="formular_default" class="{$genClassForm}">
                        	<gen:if test="rows/content/form">
                        		<gen:attribute name="enctype">multipart/form-data</gen:attribute>
                    		</gen:if>
                            
                            <!--START HIDDEN-->
                            <gen:text><![CDATA[<!-- SHOW HIDDEN-->]]></gen:text>
                            <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"></xsl:apply-templates>
                            <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"></xsl:apply-templates>
                            <!--END HIDDEN-->
                            
                            <!-- START FORM-->
                   			<gen:if test="rows/content/form and rows/content/@type != 'table'">
                   				<gen:text><![CDATA[<!-- START FORM-->]]></gen:text>

                                <gen:if test="rows/content/form/tools-bar">
                                    <gen:text><![CDATA[<!--START TOOLS BAR FROM-->]]></gen:text>
                                    <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar"></xsl:apply-templates>
                                    <gen:text><![CDATA[<!--END TOOLS BAR FORM-->]]></gen:text>
                                </gen:if>
                                
                                <gen:if test="rows/content/form/@tab = 'true'">
                                    <gen:text><![CDATA[<!-- START SEPARADOR TAB-->]]></gen:text>
                                    <xsl:apply-templates mode="workFlow_tab" select="rows/content/form/label"/>
                                    <gen:text><![CDATA[<!-- END SEPARADOR TAB-->]]></gen:text>
                                </gen:if>
                                
                                
                                <gen:if test="rows/content/form/@tab = 'true'">
                                	<gen:text><![CDATA[<div class="col addBorder">]]></gen:text>
                       			</gen:if>

                                <div class="col addMarginTop addPaddingBottom10" sep-name="form">
                                    <gen:if test="rows/content/form/label/*[not(contains(@type,'filter_')) and not(@rel)]">
                                        <gen:attribute name="class">col</gen:attribute>
                                    </gen:if>
                                    <gen:call-template name="gen_form">
                                        <gen:with-param name="fields" select="rows/content/form/label/*[not(contains(@type,'filter_')) and not(@rel)]"/>
                                        <gen:with-param name="tagfield" select="'form'"></gen:with-param>
                                    </gen:call-template>
                                    <div class="_clear"/>
                                </div>    
                                <gen:if test="rows/content/form/@tab = 'true'">
                                	<gen:text><![CDATA[</div>]]></gen:text>
                       			</gen:if>
                                
                            </gen:if>
                            <!-- END FORM-->
                            
                            <!-- START FILTER-->
                            <gen:if test="rows/content/filter or (rows/content/@type = 'table' and rows/content/form)">
                                <gen:text><![CDATA[<!-- START FILTER-->]]></gen:text>
                                <gen:choose>
                                    <gen:when test="rows/content/@type = 'table' and rows/content/form">
                                       <gen:if test="rows/content/form/label/*[@type != 'hidden']">  
                                            <div class="box-content resetPadding">
                                                <div class="col">
                                                    <gen:call-template name="gen_labelFild">
                                                        <gen:with-param name="fields" select="rows/content/form/label/*[not(contains(@type,'filter_'))]"/>
                                                        <gen:with-param name="tagfield" select="'form'"></gen:with-param>
                                                    </gen:call-template>
                                                    <div class="_clear"/>
                                                </div>
                                                <gen:if test="rows/content/form/tools-bar">
                                                    <gen:text><![CDATA[<!--START TOOL BAR FILTER-->]]></gen:text>
                                                    <xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar"/>
                                                    <gen:text><![CDATA[<!--END TOOL BAR FILTER-->]]></gen:text>
                                                </gen:if>
                                            </div>
                                        </gen:if>
                                    </gen:when>
                                    <gen:otherwise>
                                        <gen:if test="rows/content/filter/label/*[@type != 'hidden']">  
                                            <div class="box-content resetPadding">
                                                <div class="col">
                                                    <gen:call-template name="gen_labelFild">
                                                        <gen:with-param name="fields" select="rows/content/filter/label/*[not(contains(@type,'filter_'))]"/>
                                                        <gen:with-param name="tagfield" select="'filter'"></gen:with-param>
                                                    </gen:call-template>
                                                    <div class="_clear"/>
                                                </div>
                                                <gen:if test="rows/content/filter/tools-bar">
                                                    <gen:text><![CDATA[<!--START TOOL BAR FILTER-->]]></gen:text>
                                                    <xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/>
                                                    <gen:text><![CDATA[<!--END TOOL BAR FILTER-->]]></gen:text>
                                                </gen:if>
                                            </div>
                                        </gen:if>
                                    </gen:otherwise>
                                </gen:choose>
                                <gen:text><![CDATA[<!-- END FILTER-->]]></gen:text>
                            </gen:if>
                            <!-- END FILTER-->
                            <!-- START TABLE-->
                            <gen:if test="rows/content/table/value/row != '' and rows/content/table/@operation != 'workflow'">
                            	<gen:call-template name="gen_table"/>
                    		</gen:if>
                            <!-- END TABLE-->
                        </form>
                        <!-- template gen charts-->
                        <gen:if test="rows/content/*[@type = 'chart']">
                            <gen:call-template name="gen_chart">
                                <gen:with-param name="align" select="'center'"></gen:with-param>
                           </gen:call-template>
                       </gen:if>
                        <gen:if test="$layout != 'none'">
                        	
                            <gen:text>&lt;/div&gt;</gen:text>
                       </gen:if>
                       
                       
                        <gen:if test="$layout != 'none' and $genAlignRight = 1">
                            <div class="{$layout}">
                            	<div class="box-content resetPadding">
                                     <gen:if test="rows/content/menu/group/@align = 'right'">
                                        <gen:text><![CDATA[<!-- START LATERAL MENU  -->]]></gen:text>
                                            <xsl:apply-templates mode="lateral-menu" select="rows/content/menu"/>
                                        <gen:text><![CDATA[<!-- END LATERAL MENU  -->]]></gen:text>
                                     </gen:if>
                                     <gen:if test="rows/content/*[@type = 'chart']">
                                         <gen:call-template name="gen_chart">
                                            <gen:with-param name="align" select="'right'"></gen:with-param>
                                        </gen:call-template>
                                    </gen:if>
                                    <div class="_clear"/>
                                </div>
                            </div>
                        </gen:if>
                
                        <gen:text><![CDATA[<!-- END YOUR CODE HERE -->]]></gen:text>
                    	<div class="_clear"/>
                    </div>
                    <!--END RIGTH PAGE-->
                    <gen:if test="rows/content/form/label/*[contains(@type,'LOOKUP')] or rows/content/filter/label/*[contains(@type,'LOOKUP')]">
                        <xsl:call-template name="link-opener"/>
                    </gen:if>
                	<div class="_clear"/>
                </div>
                <!--END BODY PAGE-->
                <!--FOOTER PAGE-->
                <gen:text><![CDATA[<!--FOOTER PAGE-->]]></gen:text>
    			<div id="igrp-footerPage"><xsl:call-template name="footer"/></div>
           </body>
        </html>
      </xsl:template>
          <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=red_version"/>
          <gen:if test="rows/content/form/label/*/@type = 'plaintext' or rows/content/form/label/*/@type = 'image' or rows/content/form/label/*/@type = 'iframe' or rows/content/form/label/*/@type = 'signature' or rows/content/table">
          	<xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=red_version"/>
          </gen:if>
           <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=red_version"/>
          <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=red_version"/>
          <gen:if test="rows/content/table/@operation = 'workflow'">
          	<xsl:include href="../../xsl/tmpl/IGRP-process.tmpl.xsl?v=red_version"/>
          </gen:if>
          <!--<gen:if test="rows/content/view">
          	<xsl:include href="../../xsl/tmpl/IGRP-view.tmpl.xsl?v=red_version"/>
          </gen:if>-->
          <gen:if test="(rows/content/menu and not(rows/content/menu/group)) or (rows/content/menu/group and (rows/content/menu/group/@align = 'left' or rows/content/menu/group/@align = 'right'))">
          	 <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/menu/group and (rows/content/menu/group/@align = 'center' or (rows/content/menu/group/@align != 'left' or rows/content/menu/group/@align != 'right'))">
          	 <xsl:include href="../../xsl/tmpl/IGRP-tab-menu.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/form/@tab = 'true'">
          	<xsl:include href="../../xsl/tmpl/IGRP-workflowtab.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/form/label/*/@type = 'texteditor'">
          	<xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/form/label/*[contains(@type,'vkb_')]">
          	<xsl:include href="../../xsl/tmpl/IGRP-virtualkeyboard.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/form/label/*[contains(@type,'biometric')]">
          	<xsl:include href="../../xsl/tmpl/IGRP-finger-print.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/table/@operation = 'line'">
            <xsl:include href="../../xsl/tmpl/IGRP-operation-table.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/*[@type = 'chart']">
            <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=red_version"/>
          </gen:if>
          <gen:if test="rows/content/table/context-menu or rows/content/table/label/*/@type='js_passa_valor' ">
          	<xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=red_version"/>
         </gen:if>
    </xsl:stylesheet>
  </gen:template>
  
  <!-- FIELD VALIDATOR -->
<gen:template name="FIELD_validator">
     <gen:param name="type" />
     <gen:param name="required" select="''"/>
     <gen:param name="rel" select="''"/>
     <gen:param name="change" select="''"/>
     <gen:param name="readonly" select="''"/>     
     <gen:param name="maxlength" select="30"/>
     <gen:param name="visible" select="''"/>
     <gen:param name="separator" select="'false'"/>
         
    <gen:attribute name="class">
    
        <gen:value-of select="$type" />
        
        <gen:if test="$required='true'">
        	<gen:choose>
            	<gen:when test="$separator = 'true'"><gen:text> important</gen:text></gen:when>
                <gen:otherwise><gen:text> required</gen:text></gen:otherwise>
            </gen:choose>
        </gen:if>
        
        <gen:if test="$change='true'"><gen:text> IGRP_change</gen:text></gen:if>
        
        <gen:if test="$readonly='onchange'"><gen:text> IGRP_change</gen:text></gen:if>
         
        <gen:if test="$type = 'file'"><gen:text> uploadFile</gen:text></gen:if>
    </gen:attribute>
    
    <gen:if test="$readonly='true' and $type != 'file'">
        <gen:attribute name="disabled">
        	<gen:value-of select="'disabled'"/>
        </gen:attribute>
    </gen:if>
    
    <gen:if test="$type='date'">
    	<gen:attribute name="trel"><gen:text>IGRP_datePicker</gen:text></gen:attribute>
    </gen:if>
    
    <gen:if test="$type='datetime'">
    	<gen:attribute name="trel"><gen:text>IGRP_dateTimePicker</gen:text></gen:attribute>
    </gen:if>
    
    <gen:if test="$type='time'">
    	<gen:attribute name="trel"><gen:text>IGRP_timePicker</gen:text></gen:attribute>
    </gen:if>
    
    <gen:if test="$readonly = 'readonly' and $type != 'file'">
        <gen:attribute name="readonly">
        	<gen:value-of select="'readonly'" />
        </gen:attribute>
    </gen:if>
    
     <gen:if test="$visible='false'">
        <gen:attribute name="visible">
        	<gen:value-of select="'false'" />
        </gen:attribute>
    </gen:if>
    
    <gen:if test="($type = 'text' or $type = 'number' or $type = 'textarea' or $type = 'texteditor') and $maxlength != ''">
        <gen:attribute name="maxlength">
            <gen:value-of select="$maxlength" />
         </gen:attribute>
     </gen:if>
    
    <gen:if test="$rel!=''">
        <gen:attribute name="rel">
        	<gen:text>F_</gen:text><gen:value-of select="$rel" />
        </gen:attribute>
    </gen:if> 
</gen:template>
<!-- END template filde validation-->    

  <!-- start template gen view-->
<gen:template name="gen_view" mode="gen_view">
    <gen:if test="rows/content/view">
        <gen:text><![CDATA[<!-- START VIEW -->]]></gen:text>
        <!--<xsl:apply-templates mode="IGRP-view" select="rows/content/view"/>-->
        <div class="box-content resetPadding" sep-name="{local-name(rows/content/view)}">
            <xsl:call-template name="titlecollapser">
                <xsl:with-param name="title" select="rows/content/view/title"/>
            </xsl:call-template>
            <div class="box-collapser">
                <div class="col">
                    <gen:variable name="fotoview" select="'{rows/content/view/value/view_foto}'"/>
                    <xsl:if test="rows/content/view/label/view_foto != ''">
                        <div class="col15">
                            <div class="viewFoto">
                                <img src="{$fotoview}" />
                            </div>
                        </div>
                    </xsl:if>
                    <xsl:variable name="class">
                        <xsl:choose>
                            <xsl:when test="rows/content/view/label/view_foto != ''">
                                <xsl:value-of select="'col85'"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="'col'"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>
                    <gen:variable name="vClass" select="'{$class}'"/>
                    <div class="{$vClass}">
                        <div class="col">
                            <xsl:if test="rows/content/view/label/*[position() = 1 and name() != 'view_foto']/text()">
                                <div class="viewName borderColor">
                                    <xsl:value-of select="rows/content/view/value/*[position() = 1 and name() != 'view_foto']/text()"/>
                                </div>
                            </xsl:if>
                        </div>
                        <div class="viewDados addPaddingBottom10">
                            <gen:for-each select="rows/content/view/label/*[name() != 'view_foto']">
                                <xsl:if test="rows/content/view/label/{name()} != ''">
                                    <gen:variable name="pos" select="(position()+1) mod 2" />
                                    <gen:choose>
                                        <gen:when test="@type = 'separator'">
                                            <div class="col">
                                                <h1>
                                                    <xsl:value-of select="rows/content/view/label/{name()}"/>
                                                </h1>
                                            </div>
                                        </gen:when>
                                        <gen:otherwise>
                                            <div class="col">
                                                <div class="groupView borderColor" color="view{$pos}">
                                                   <gen:if test="position() = last()">
                                                        <gen:attribute name="class">groupView resetBorder</gen:attribute>
                                                    </gen:if>
                                                    <gen:choose>
                                                        <gen:when test="@type = 'link'">
                                                            <gen:variable name="viewLink" select="concat('{rows/content/view/value/',name(),'}')"/>
                                                            <span class="viewValue link">
                                                                <a class="bClick" href="{$viewLink}" target="_blank">
                                                                    <xsl:value-of select="rows/content/view/label/{name()}"/>
                                                                </a>
                                                            </span>
                                                        </gen:when>
                                                        <gen:otherwise>
                                                            <span class="viewLabel">
                                                                <xsl:value-of select="rows/content/view/label/{name()}"/>:
                                                            </span>
                                                            <span class="viewValue">
                                                                <xsl:value-of select="rows/content/view/value/{name()}"/>
                                                            </span>
                                                        </gen:otherwise>
                                                    </gen:choose>
                                                    <div class="_clear"/>
                                                </div>
                                            </div>
                                        </gen:otherwise>
                                    </gen:choose>
                                </xsl:if>
                            </gen:for-each>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                </div>
                <div class="_clear"/>
            </div>
            <div class="_clear"/>
        </div>
        <gen:text><![CDATA[<!-- END VIEW -->]]></gen:text>
    </gen:if>
</gen:template>
  <!--end template gen view-->
  
  <!-- start template gen charts-->
  <gen:template name="gen_chart" mode="gen_chart">
  	<gen:param name="align" select="'center'"></gen:param>
  	<div class="col">
        <gen:for-each select="rows/content/*[@type = 'chart' and @align = $align]">
            <gen:variable name="vClass">
                <gen:choose>
                    <gen:when test="@align = 'center'">
                        <gen:choose>
                            <gen:when test="width != ''">
                                <gen:choose>
                                    <gen:when test="width = 1">col</gen:when>
                                    <gen:otherwise>col-1-<gen:value-of select="width"/></gen:otherwise>
                                </gen:choose>
                           </gen:when>
                           <gen:otherwise>col-1-3</gen:otherwise>
                        </gen:choose>
                    </gen:when>
                    <gen:otherwise>col</gen:otherwise>
                </gen:choose>
            </gen:variable>
           
            <xsl:if test="rows/content/{name()}">
                <gen:text><![CDATA[<!-- START CHARTS-->]]></gen:text>
                <div class="{$vClass}"  sep-name="{name()}">
                    <xsl:call-template name="igrp-graph">
                        <xsl:with-param name="table" select="rows/content/{name()}"/>
                        <xsl:with-param name="chart_type" select="rows/content/{name()}/chart_type"/>
                        <xsl:with-param name="height" select="{height}"/>
                        <xsl:with-param name="title" select="rows/content/{name()}/caption"/>
                        <!--<xsl:with-param name="url" select="{url}"/>-->
                    </xsl:call-template>
                </div>
                <gen:text><![CDATA[<!-- END CHARTS-->]]></gen:text>
            </xsl:if>
        </gen:for-each>
    <div class="_clear"/>
    </div>
  </gen:template>
  <!--end template gen charts-->
  
   <!-- start template gen menu-->
  <gen:template name="gen_menu" mode="gen_menu">
   <gen:param name="align" select="'center'"></gen:param>
  	<gen:choose>
    	<gen:when test="rows/content/menu/group/@align = $align and rows/content/menu/group/@align != 'center'">
        	<gen:text><![CDATA[<!-- START LATERAL MENU  -->]]></gen:text>
            	<xsl:apply-templates mode="lateral-menu" select="rows/content/menu"/>
            <gen:text><![CDATA[<!-- END LATERAL MENU  -->]]></gen:text>
        </gen:when>
        <gen:otherwise>
            <gen:choose> 
                    <gen:when test="rows/content/menu/group and (rows/content/menu/group/@align = 'center' or rows/content/menu/group/@align != $align)">
                        <gen:text><![CDATA[<!-- START TAB MENU  -->]]></gen:text>
                            <xsl:apply-templates mode="tab-menu" select="rows/content/menu"/>
                        <gen:text><![CDATA[<!-- END TAB MENU  -->]]></gen:text>
                     </gen:when>
                    <gen:otherwise>
                        <gen:if test="rows/content/menu and not(rows/content/menu/group)">
                            <gen:text><![CDATA[<!-- START SIMPLE-MENU -->]]></gen:text>
                                <xsl:apply-templates mode="simple-menu" select="rows/content/menu"/>
                            <gen:text><![CDATA[<!-- END SIMPLE-MENU -->]]></gen:text>
                        </gen:if>
                    </gen:otherwise>
               </gen:choose>
        </gen:otherwise>
    </gen:choose>
  </gen:template>
  <!--end template gen menu-->
  
  <!-- start template gen filtor az, aznum, num-->
  <gen:template name="genfilter_az" mode="genfilter_az">
      <gen:for-each select="rows/content/filter/label/*[contains(@type,'filter_')]">
          <xsl:call-template name="filter-az">
            <xsl:with-param name="name" select="rows/content/filter/value/{name()}/@name"/>
            <xsl:with-param name="value" select="rows/content/filter/value/{name()}"/>
            <xsl:with-param name="type" select="'{@type}'"/>
         </xsl:call-template>
       </gen:for-each>
  </gen:template>
  <!--end template gen filtor az, aznum, num-->
  
  <!-- start template gen table-->
  <gen:template name="gen_table" mode="gen_table">
  	<gen:param name="tagname" select="'table'"></gen:param>
  	<gen:variable name="genContexmenu">
      	<gen:if test="rows/content/table/context-menu and rows/content/table/@operation ='menu'">IGRP_contextMenu</gen:if>
    </gen:variable>
        <gen:text><![CDATA[<!-- START TABELA-->]]></gen:text>
        <div class="box-content resetPadding">
      <xsl:call-template name="titlecollapser">
        <xsl:with-param name="title" select="rows/content/table/title"/>
      </xsl:call-template>
      <xsl:call-template name="table-view">
        <xsl:with-param name="rel" select="'{$tagname}'"/>
      </xsl:call-template>
      <div class="box-collapser addPaddingBottom10">
        <gen:if test="rows/content/table/tools-bar">
            <gen:text><![CDATA[<!--START TOOL BAR TABLE-->]]></gen:text>
            <xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar">
            	<xsl:with-param name="isTable" select="'true'"/>
                <xsl:with-param name="rel" select="'{$tagname}'"/>
            </xsl:apply-templates>
            <gen:text><![CDATA[<!--END TOOL BAR TABLE-->]]></gen:text>
        </gen:if>
        
        <div class="box-table table-responsive">
            <gen:if test="rows/content/table/label/*[@type = 'color_td']">
                <gen:text><![CDATA[<!-- LEGENDA TABELA -->]]></gen:text>
                <xsl:apply-templates mode="table-legend" select="rows/content/table/legend_color"/>
            </gen:if>
            <gen:call-template name="genfilter_az"/>
            <div class="table-container">
            <gen:if test="rows/content/table/context-menu">
            	<gen:text><![CDATA[<!--  CONTEXT-MENU  -->]]></gen:text>
                <xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu">
                    <xsl:with-param name="contextId" select="'{$tagname}'"/>
                </xsl:apply-templates>
        	</gen:if>
            <table class="IGRP_table default-table" data-control="{$tagname}">
                <thead>
                    <tr>
                        <gen:for-each select="rows/content/table/label/*[@type != 'field_copy' and @type != 'hidden']">
                            <xsl:if test="rows/content/table/label/{name()}">
                                <gen:choose>
                                    <gen:when test="@type = 'checkbox'">
                                        <th class="checkbox sorttable_nosort" align="center">
                                            <input type="checkbox" name="p_{name()}_all" class="IGRP_checkall"/>
                                           <!--<xsl:value-of select="rows/content/table/label/{name()}"/>-->
                                        </th>
                                    </gen:when>
                                    <gen:when test="@type = 'color_td'">
                                        <th class="tdcolor">
                                           <xsl:value-of select="rows/content/table/label/{name()}"/>
                                        </th>
                                    </gen:when>
                                    <gen:otherwise>
                                        <th align="{@align}">
                                            <xsl:value-of select="rows/content/table/label/{name()}"/>
                                        </th>
                                    </gen:otherwise>
                                </gen:choose>
                            </xsl:if>
                        </gen:for-each>
                        <gen:if test="rows/content/table/@operation = 'line'">
                            <th></th>
                        </gen:if>
                    </tr>
                </thead>
                <tbody>
                    <gen:variable name="genpos" select="'{position()}'"/>
                    <xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                        <tr row="{$genpos}" class="{$genContexmenu}">
                            <xsl:apply-templates mode="context-param" select="context-menu"/>
                            <gen:for-each select="rows/content/table/label/*[@type != 'field_copy' and @type != 'hidden']">
                            	<gen:variable name="v_label" select="concat('{../../label/',name(),'}')"/>
                                <xsl:if test="{name()}">
                                    <td align="{@align}" data-row="{$genpos}" data-title="{$v_label}" class="{@type}">
                                        <gen:choose>
                                            <gen:when test="@type = 'color_td'">
                                            	<gen:attribute name="class">
                                                	<gen:text>tdcolor</gen:text> <gen:value-of select="@type"/>
                                                 </gen:attribute>
                                                <xsl:call-template name="tdcolor">
                                                    <xsl:with-param name="color" select="{name()}"/>
                                                </xsl:call-template>
                                            </gen:when>
                                            <gen:when test="@type = 'checkbox' or @type = 'radio'">
                                            	<gen:variable name="radioname" select="concat(concat('{',name()),'}')"/>
                                                <xsl:if test="{name()} != '-0'">
                                                    <input type="{@type}" name="{@name}" value="{$radioname}">
                                                        <xsl:if test="{name()}_check={name()}">
                                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                                        </xsl:if>
                                                    </input>
                                                </xsl:if>
                                                <xsl:value-of select="{name()}_desc"/>
                                            </gen:when>
                                            <gen:when test="@type = 'link'">
                                                <gen:variable name="link" select="concat(concat('{',name()),'}')"/>
                                                <gen:variable name="_target">
                                                    <gen:choose>
                                                        <gen:when test="@target = '' or not(@target)">_blank</gen:when>
                                                        <gen:otherwise><gen:value-of select="@target"/></gen:otherwise>
                                                    </gen:choose>
                                                </gen:variable>
                                                <xsl:choose>
                                                    <xsl:when test="{name()} != ''">
                                                        <a href="{$link}" class="link bClick" target="{$_target}" name="{name()}">
                                                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                                        </a>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </gen:when>
                                            <gen:when test="@type = 'js_passa_valor'">
                                                <a class="link bClick" title="Passa Valor" target="lookup">
                                                    <xsl:value-of select="{name()}" disable-output-escaping="yes"/>
                                                </a>
                                            </gen:when>
                                            <gen:otherwise>
                                                <xsl:value-of select="{name()}"/>
                                            </gen:otherwise>
                                        </gen:choose>
                                        <gen:if test="position() = 1 and (../../@operation = 'line' or ../../@operation = 'menu')">
                                            <xsl:apply-templates mode="cxtmenu-resp" select="//rows/content/table/context-menu">
                                                <xsl:with-param name="ctx" select="context-menu"/>
                                            </xsl:apply-templates>
                                      </gen:if>
                                    </td>
                                </xsl:if>
                            </gen:for-each>
                            <gen:if test="rows/content/table/@operation = 'line'">
                                <td  class="operationTable" data-row="{$genpos}" data-title="Operacoes">
                                    <xsl:apply-templates mode="operation-table" select="//rows/content/table/context-menu">
                                        <xsl:with-param name="ContextMenuRow" select="context-menu"/>
                                    </xsl:apply-templates>
                                </td>
                            </gen:if>
                         </tr>
                    </xsl:for-each>
                </tbody>
                <gen:if test="rows/content/table/label/*[@type = 'total']">
                    <tfoot>
                        <tr>
                            <gen:for-each select="rows/content/table/label/*[@type != 'field_copy']">
                                <xsl:if test="rows/content/table/label/{name()}">
                                    <td align="{@align}">
                                        <xsl:value-of select="rows/content/table/value/row[@total='yes']/{name()}"/>
                                    </td>
                                </xsl:if>
                            </gen:for-each>
                             <gen:if test="rows/content/table/@operation = 'line'">
                                <td></td>
                            </gen:if>
                        </tr>
                    </tfoot>
                </gen:if>
            </table>
            </div>
           <!-- <gen:if test="rows/content/table/label/*[@type = 'color_td']">
                <gen:text></gen:text>
                <xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/>
            </gen:if>-->
        </div>
        <div class="_clear"/>
      </div>
    </div>
        <gen:text><![CDATA[<!-- END TABELA-->]]></gen:text>
  </gen:template>
  <!--end template gen table-->
  
  <!-- start template gen table list-->
  <gen:template name="gen_tableList" mode="gen_tableList">
  	<gen:param name="tagname" select="''"></gen:param>
    <gen:param name="separator" select="'false'"></gen:param>
    <gen:param name="dialog" select="''"></gen:param>
    <gen:variable name="fields" select="/rows/content/form/label/*[@rel = $tagname and @type!='group' and not(@visible) and not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check')]"></gen:variable>
    
  	<gen:text><![CDATA[<!-- START TABELA LIST-->]]></gen:text>
    <gen:variable name="edit" select="'{$lngPath/separatorlist_dialog/edit}'"/>
    <gen:variable name="del" select="'{$lngPath/separatorlist_dialog/delete}'"/>
    <gen:variable name="genpath" select="'{$path_tmpl}'"/>
    <gen:variable name="genpos" select="'{position()}'"/>
    
    <div class="box-table table-responsive">
    	<gen:if test="$separator = 'true'">
    		<ul class="contextMenu ctxSepListDialog" id="data-{$tagname}" sep-name="btn-{$tagname}">
                <li rel="{$tagname}" class="IGRP_editRow operationTable" item-name="edit-{$tagname}">
                    <gen:if test="$dialog != ''">
                        <gen:attribute name="type"><gen:value-of select="$dialog"/></gen:attribute>
                    </gen:if>
                    <img src="{$genpath}/img/icon/tools-bar/edit.png"/>
                    <span><xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/></span>
                </li>
                <li rel="{$tagname}" class="IGRP_delRow operationTable" item-name="del-{$tagname}">
                    <gen:if test="$dialog != ''">
                        <gen:attribute name="type"><gen:value-of select="$dialog"/></gen:attribute>
                    </gen:if>
                    <img src="{$genpath}/img/icon/tools-bar/delete.png"/>
                    <span><xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/></span>
                </li>
        	</ul>
        </gen:if>
        <table rel="T_{$tagname}" data-control="data-{$tagname}">
            <thead>
                <tr>
                    <gen:for-each select="$fields[@type!='hidden']">
                        <xsl:if test="rows/content/form/table/{$tagname}/label/{name()}">
                            <xsl:if test="not(rows/content/form/table/{$tagname}/label/{name()}/@visible)">
                                <gen:choose>
                                    <gen:when test="@type = 'checkbox' and $separator = 'false'">
                                        <th class="checkbox">
                                            <input type="checkbox" name="p_{name()}_all" class="IGRP_checkall"/>
                                            <!--<xsl:value-of select="rows/content/form/table/{$tagname}/label/{name()}"/>-->
                                        </th>
                                    </gen:when>
                                    <gen:otherwise>
                                        <th>
                                            <gen:attribute name="class">
                                                <gen:if test="@type = 'color'">tdcolor</gen:if>
                                            </gen:attribute>
                                            <xsl:value-of select="rows/content/form/table/{$tagname}/label/{name()}" disable-output-escaping="yes"/>
                                        </th>
                                    </gen:otherwise>
                                </gen:choose>
                            </xsl:if>
                        </xsl:if>
                    </gen:for-each>
                    <gen:if test="$separator = 'true'">
                    	<th class="bEdDel"></th>
                    </gen:if>
                </tr>
            </thead>
            <tbody>
            	<xsl:for-each select="rows/content/form/table/{$tagname}/value/row[not(@total='yes')]">
                    <tr row="{$genpos}">
                    	<gen:for-each select="$fields[@type != 'hidden']">
                        	<gen:variable name="tagval" select="concat(concat('{',name()),'}')"/>
            				<gen:variable name="tagvaldesc" select="concat(concat('{',name()),'_desc}')"/>
                            <gen:variable name="v_label" select="concat('{../../label/',name(),'}')"/>
                            <xsl:if test="{name()}">
                            	<xsl:if test="not({name()}/@visible)">
                                    <td data-row="{$genpos}" data-title="{$v_label}" class="{@type}">
                                        <gen:choose>
                                            <gen:when test="(@type = 'checkbox' or @type = 'radio') and $separator = 'false'">
                                            	<gen:variable name="radioname" select="concat(concat('{',name()),'}')"/>
                                                <xsl:if test="{name()} != '-0'">
                                                    <input type="{@type}" name="{@name}_fk" value="{$radioname}">
                                                        <xsl:if test="{name()}_check={name()}">
                                                            <xsl:attribute name="checked">checked</xsl:attribute>
                                                        </xsl:if>
                                                    </input>
                                                </xsl:if>
                                                <xsl:value-of select="{name()}_desc"/>
                                            </gen:when>
                                            <gen:when test="@type = 'link' or @type = 'file'">
                                                <gen:variable name="link" select="concat(concat('{',name()),'}')"/>
                                                <gen:variable name="_target">
                                                    <gen:choose>
                                                        <gen:when test="@target = '' or not(@target)">_blank</gen:when>
                                                        <gen:otherwise><gen:value-of select="@target"/></gen:otherwise>
                                                    </gen:choose>
                                                </gen:variable>
                                                <xsl:choose>
                                                    <xsl:when test="{name()} != ''">
                                                        <a href="{$link}" class="link bClick" target="{$_target}" name="{name()}">
                                                            <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                                        </a>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </gen:when>
                                            <gen:when test="@type = 'color' and $separator = 'true'">
                                                <span class="color" style="background-color:{$tagvaldesc}"></span>
                                            </gen:when>
                                            <gen:otherwise>
                                            	<gen:choose>
                                                	<gen:when test="$separator = 'true'">
                                                    	<xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                                    </gen:when>
                                                    <gen:otherwise>
                                                    	<xsl:value-of select="{name()}" disable-output-escaping="yes"/>
                                                    </gen:otherwise>
                                                </gen:choose>
                                            </gen:otherwise>
                                        </gen:choose>
                                        <gen:if test="@type != 'checkbox' and @type != 'radio'">                                        
                                        	<input type="hidden" name="{@name}_fk" value="{$tagval}" />
                                        </gen:if>
										<gen:if test="$separator = 'true'">
                                            <input type="hidden" name="{@name}_fk_desc" value="{$tagvaldesc}" />
                                    	</gen:if>
                                        <gen:if test="position() = 1 and $separator = 'true'">
                                            <span class="showResponsiveTable ctxmenu"></span>
                                      </gen:if>
                                    </td>
                                </xsl:if>
                                
                                 <xsl:if test="{name()}/@visible = 'false'">
                                    <input type="hidden" name="{@name}_fk" value="{$tagval}" />
    								<gen:if test="$separator = 'true'">
                                    <input type="hidden" name="{@name}_fk_desc" value="{$tagvaldesc}" />
    								</gen:if>
                                  </xsl:if>
                                 
                            </xsl:if>
                        </gen:for-each>
                        <gen:if test="$separator = 'true'">
                           <td class="bEdDel" data-row="{$genpos}" data-title="{$edit}/{$del}">
                           		<xsl:if test="not(@noupdate)">
                                    <img title="{$edit}" src="{$genpath}/img/icon/tools-bar/edit.png" item-name="edit-{$tagname}" rel="{$tagname}" class="IGRP_editRow{$dialog}"/>
                              </xsl:if>	
                            <xsl:if test="not(@nodelete)">
                                <img title="{$del}" src="{$genpath}/img/icon/tools-bar/delete.png" item-name="del-{$tagname}" rel="{$tagname}" class="IGRP_delRow"/>
                            </xsl:if>					 
                          </td>
                    	</gen:if>
                        <input type="hidden" name="p_{$tagname}_id" value="{concat(concat('{',$tagname),'_id}')}"/>
                        <gen:for-each select="$fields[@type = 'hidden']">
                        	<gen:variable name="tagvalh" select="concat(concat('{',name()),'}')"/>
            				<gen:variable name="tagvaldesch" select="concat(concat('{',name()),'_desc}')"/>
                            <input type="hidden" name="{@name}_fk" value="{$tagvalh}" />
                            <input type="hidden" name="{@name}_fk_desc" value="{$tagvaldesch}" />
                        </gen:for-each>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </div>
  	<gen:text><![CDATA[<!-- END TABELA LIST-->]]></gen:text>
  </gen:template>
  <!--end template gen table list-->
  
  <!-- start template gen form list-->
  <gen:template name="gen_formList" mode="gen_formList">
  	<gen:param name="tagname" select="''"></gen:param>
    <gen:variable name="fields" select="/rows/content/form/label/*[@rel = $tagname and @type!='group' and not(@visible) and not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check')]"></gen:variable>
  	<gen:text><![CDATA[<!-- START FORM LIST-->]]></gen:text>
    <gen:variable name="add" select="'{$lngPath/separatorlist_dialog/add}'"/>
    <gen:variable name="del" select="'{$lngPath/separatorlist_dialog/delete}'"/>
    <gen:variable name="genpath" select="'{$path_tmpl}'"/>
    
    <xsl:if test="not(rows/content/form/table/{$tagname}/value/row[position() = 1]/@noupdate)">
        <div class="col showResponsiveTable" item-name="add-{$tagname}">
            <div class="addRowFormlist addRow">
                <a rel="{$tagname}" class="IGRP_addRowForm" >
                    <img title="{$add}" src="{$genpath}/img/icon/tools-bar/sepAdd.png"/>
                    <span><xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/></span>
                </a>
            </div>
        </div>
    </xsl:if>
    
  	<div class="box-table table-responsive">
    	<table class="IGRP_formlist" rel="T_{$tagname}" data-control="data-{$tagname}">
        	<thead>
            	<tr>
                	<gen:for-each select="$fields[@type!='hidden']">
                        <xsl:if test="rows/content/form/table/{$tagname}/label/{name()}">
                            <xsl:if test="not(rows/content/form/table/{$tagname}/label/{name()}/@visible)">
                                <gen:choose>
                                    <gen:when test="@type = 'checkbox'">
                                        <th class="checkbox">
                                            <input type="checkbox" name="p_{name()}_all" class="IGRP_checkall"/>
                                            <!--<xsl:value-of select="rows/content/form/table/{$tagname}/label/{name()}"/>-->
                                        </th>
                                    </gen:when>
                                    <gen:otherwise>
                                        <th>
                                            <xsl:value-of select="rows/content/form/table/{$tagname}/label/{name()}" disable-output-escaping="yes"/>
                                        </th>
                                    </gen:otherwise>
                                </gen:choose>
                            </xsl:if>
                        </xsl:if>
                    </gen:for-each>
                    <xsl:if test="not(rows/content/form/table/{$tagname}/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/{$tagname}/value/row[position() = 1]/@nodelete)">
                        <th class="fBtn">
                            <xsl:if test="not(rows/content/form/table/{$tagname}/value/row[position() = 1]/@noupdate)">
                                <img title="{add}" src="{$genpath}/img/icon/tools-bar/add.png" item-name="add-{$tagname}" rel="{$tagname}" class="IGRP_addRowForm"/>
                            </xsl:if>
                        </th>
                   </xsl:if> 
                </tr>
            </thead>
            <tbody>
            	<gen:variable name="genpos" select="'{position()}'"/>
                <gen:variable name="genno" select="'@nodelete'"/>
            	<xsl:for-each select="rows/content/form/table/{$tagname}/value/row[not(@total='yes')]">
                    <tr row="{$genpos}">
                    	<gen:for-each select="$fields[@type != 'hidden']">
                        	<gen:variable name="v_label" select="concat('{../../label/',name(),'}')"/>
                        	<xsl:if test="{name()}">
                            	<xsl:if test="not({name()}/@visible)">
                                    <td data-row="{$genpos}" data-title="{$v_label}" class="{@type}">
                                        <gen:call-template name="gen_field">
                                            <gen:with-param name="tagfield" select="$tagname"/>
                                            <gen:with-param name="formlist" select="'true'"/>
                                        </gen:call-template>
                                        <gen:if test="position() = 1">
                                        	<xsl:if test="not({$genno})">
                                                <span class="showResponsiveTable respDelRow" item-name="del-{$tagname}">
                                                    <img title="{$del}" src="{$genpath}/img/icon/tools-bar/delete.png" rel="{$tagname}" class="IGRP_delRowForm"/>
                                                </span>
                                            </xsl:if>
                                        </gen:if>
                                    </td>
                                </xsl:if>
                             </xsl:if>   
                        </gen:for-each>
                        <xsl:if test="not(@nodelete) or not(@noupdate)">
                        <td class="fBtn" data-row="{$genpos}" data-title="{$del}">
                            <xsl:if test="not(@nodelete)">
                                <img title="{$del}" src="{$genpath}/img/icon/tools-bar/delete.png" item-name="del-{$tagname}" class="IGRP_delRowForm" rel="{$tagname}"/>
                            </xsl:if>
                        </td>
                        </xsl:if>
                        <input type="hidden" name="p_{$tagname}_id" value="{concat(concat('{',$tagname),'_id}')}"/>
                         <gen:for-each select="$fields[@type = 'hidden']">
                        	<gen:variable name="tagvalh" select="concat(concat('{',name()),'}')"/>
            				<gen:variable name="tagvaldesch" select="concat(concat('{',name()),'_desc}')"/>
                            <input type="hidden" name="{@name}_fk" value="{$tagvalh}" />
                            <input type="hidden" name="{@name}_fk_desc" value="{$tagvaldesch}" />
                        </gen:for-each>
                   </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </div>
  	<gen:text><![CDATA[<!-- END FORM LIST-->]]></gen:text>
  </gen:template>
  <!--end template gen form list-->
  
  
  
  <!-- start template gen_FIELD_validator-->
  <gen:template name="gen_FIELD_validator" mode="gen_FIELD_validator">
  	<gen:param name="tagfield" select="'form'"/>
    <gen:param name="formlist" select="'false'"/>
    <gen:param name="separator" select="'false'"/>
    
    <gen:variable name="change">
        <gen:choose>
            <gen:when test="@type = 'selectchange'">
                <gen:text>true</gen:text>
            </gen:when>
            <gen:otherwise>
                <gen:value-of select="@change"/>
            </gen:otherwise>
        </gen:choose>
    </gen:variable>
            
  	<gen:call-template name="FIELD_validator">
        <gen:with-param name="type" select="@type" />
        <gen:with-param name="required" select="@required"/>
        <gen:with-param name="rel" select="@rel"/>
        <gen:with-param name="change" select="$change"/>
        <gen:with-param name="readonly" select="@readonly"/> 
        <gen:with-param name="maxlength" select="@maxlength"/>    
        <gen:with-param name="visible" select="@visible"/>
        <gen:with-param name="separator" select="$separator"/>
    </gen:call-template>
    
    <gen:choose>
    	<gen:when test="@type = 'radiolist' or @type = 'checkboxlist'">
        	<xsl:call-template name="FIELD_validator">
              	<xsl:with-param name="field" select="../../../label/{name()}"/>
            </xsl:call-template>
        </gen:when>
        
        <gen:when test="$formlist = 'true'">
        	<xsl:call-template name="FIELD_validator">
              	<xsl:with-param name="field" select="../../label/{name()}"/>
            </xsl:call-template>
        </gen:when>
        <gen:otherwise>
        	<xsl:call-template name="FIELD_validator">
                <xsl:with-param name="field" select="rows/content/{$tagfield}/label/{name()}"/>
            </xsl:call-template>
        </gen:otherwise>
    </gen:choose>
  </gen:template>
  <!--end template gen_FIELD_validator-->
  
  <gen:template name="checkORradioList">
        <gen:param name="tagfield"/>
        <gen:param name="type"/>
        <gen:param name="separator"/>
        <gen:param name="required"/>
        <gen:param name="change"/>
        <gen:param name="readonly"/>
        <gen:param name="rel"/>

        <gen:variable name="gentype">
            <gen:choose>
                <gen:when test="$type = 'radiolist'"><gen:text>radio</gen:text></gen:when>
                <gen:otherwise><gen:text>checkbox</gen:text></gen:otherwise>
            </gen:choose>
        </gen:variable>

        <gen:variable name="genrequired">
            <gen:if test="$required = 'true'">
                <gen:choose>
                    <gen:when test="$separator = 'true'"><gen:text>important</gen:text></gen:when>
                    <gen:otherwise><gen:text>required</gen:text></gen:otherwise>
                </gen:choose>
            </gen:if>
        </gen:variable>

        <gen:variable name="genchange">
            <gen:if test="$change = 'true' or $readonly = 'onchange'">IGRP_change</gen:if>
        </gen:variable>

        <gen:variable name="gendisabled">
            <gen:if test="$readonly = 'true'">disabled</gen:if>
        </gen:variable>

        <xsl:call-template name="checkORradioList">
            <xsl:with-param name="filds" select="rows/content/{$tagfield}/label/{name()}"/>
            <xsl:with-param name="fildsOption" select="rows/content/{$tagfield}/list/{name()}/option"/>
            <xsl:with-param name="type" select="'{$gentype}'"/>
            <gen:if test="$rel != ''">
            <xsl:with-param name="separator" select="'{$rel}'"/>
            </gen:if>
            <gen:if test="$genrequired != ''">
            <xsl:with-param name="required" select="'{$genrequired}'"/>
            </gen:if>
            <gen:if test="$genchange != ''">
            <xsl:with-param name="change" select="'{$genchange}'"/>
            </gen:if>
            <gen:if test="$gendisabled != ''">
            <xsl:with-param name="disabled" select="'{$gendisabled}'"/>
            </gen:if>
        </xsl:call-template>
  </gen:template>

  <!-- start template gen field-->
  <gen:template name="gen_field" mode="gen_field">
  	<gen:param name="tagfield" select="'form'"></gen:param>
    <gen:param name="formlist" select="'false'"></gen:param>
    <gen:param name="separator" select="'false'"/>
    
    <gen:variable name="genName" select="concat('{rows/content/',$tagfield,'/value/')"></gen:variable>
    <gen:variable name="genValue" select="concat('{rows/content/',$tagfield,'/value/')"></gen:variable>
    <gen:variable name="genNameSelect" select="concat('{rows/content/',$tagfield,'/list/')"></gen:variable>
    
    <gen:variable name="name">
        <gen:choose>
            <gen:when test="$formlist = 'true'">
            	<gen:value-of  select="concat('{../../label/',name(),'/@name}_fk')"/>
             </gen:when>
            <gen:otherwise>
            	<gen:value-of select="concat($genName,name(),'/@name}')"/>
             </gen:otherwise>
        </gen:choose>
    </gen:variable>
    
    <gen:variable name="nameSelect">
        <gen:choose>
            <gen:when test="$formlist = 'true'">
            	<gen:value-of  select="concat('{../../../../list/',name(),'/@name}_fk')"/>
             </gen:when>
            <gen:otherwise>
            	<gen:value-of select="concat($genNameSelect,name(),'/@name}')"/>
             </gen:otherwise>
        </gen:choose>
    </gen:variable>
    
    <gen:variable name="value">
        <gen:choose>
            <gen:when test="$formlist = 'true'">
            	<gen:value-of  select="concat('{',name(),'}')"/>
             </gen:when>
            <gen:otherwise>
            	<gen:value-of select="concat($genValue,name(),'}')"/>
             </gen:otherwise>
        </gen:choose>
    </gen:variable>
    
    <gen:variable name="valueradio" select="'{value}'"/> 
    <gen:variable name="tagval" select="concat('{',name(),'}')"/>
    
    <gen:if test="$formlist = 'true'">
        <gen:variable name="tagvaldesc" select="concat('{',name(),'_desc}')"/>  
        <input type="hidden" name="{@name}_fk_desc" value="{$tagvaldesc}" />
    </gen:if>                       
      <gen:choose>
        <gen:when test="@type = 'select' or @type = 'selectchange' or @type = 'selectlist' or ((@type = 'radiolist' or @type = 'checkboxlist') and $formlist = 'true')">
        
            <gen:variable name="placeholder">
                <gen:choose>
                    <gen:when test="$formlist = 'true'">
                        <gen:value-of select="concat('{../../../../list/',name(),'/option[position() = 1]}')"/>
                    </gen:when>
                    <gen:otherwise>
                        <gen:value-of select="concat('{rows/content/',$tagfield,'/list/',name(),'/option[position() = 1]}')"/>
                    </gen:otherwise>
                </gen:choose>
            </gen:variable>
            
            <select name="{$nameSelect}" chosen="select" id="{$nameSelect}" data-placeholder="{$placeholder}">
            	<gen:if test="@type = 'selectlist'">
                	<gen:attribute name="multiple">multiple</gen:attribute>
                </gen:if>
                
                <gen:call-template name="gen_FIELD_validator">
                    <gen:with-param name="tagfield" select="$tagfield" />
                    <gen:with-param name="formlist" select="$formlist" />
                    <gen:with-param name="separator" select="$separator"/>
                </gen:call-template>
                <option value=""></option>  
                <gen:choose>
                	<gen:when test="$formlist = 'true'">
                    	<xsl:variable name="v_{name()}" select="{name()}"/>
                    	<xsl:for-each select="../../../../list/{name()}/option[position() != 1]">
                            <option value="{$valueradio}">
                                <xsl:if test="$v_{name()} = value">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="text"/>
                            </option>
                        </xsl:for-each>
                    </gen:when>
                    <gen:otherwise>
                    	<xsl:for-each select="rows/content/{$tagfield}/list/{name()}/option[position() != 1]">
                            <option value="{$valueradio}">
                                <xsl:if test="@selected='true'">
                                    <xsl:attribute name="selected">selected</xsl:attribute>
                                </xsl:if>
                                <xsl:value-of select="text"/>
                            </option>
                        </xsl:for-each>
                    </gen:otherwise>
                </gen:choose>
            </select>
        </gen:when>

        <gen:when test="(@type = 'radiolist' or @type = 'checkboxlist') and $formlist = 'false'">
            <gen:call-template name="checkORradioList">
                <gen:with-param name="tagfield" select="$tagfield"/>
                <gen:with-param name="type" select="@type"/>
                <gen:with-param name="separator" select="$separator"/>
                <gen:with-param name="required" select="@required"/>
                <gen:with-param name="change" select="@change"/>
                <gen:with-param name="readonly" select="@readonly"/>
                <gen:with-param name="rel" select="@rel"/>
            </gen:call-template>
        </gen:when>
        
        <gen:when test="@type = 'textarea'">
        	<textarea name="{$name}">
            	<gen:call-template name="gen_FIELD_validator">
                    <gen:with-param name="tagfield" select="$tagfield" />
                    <gen:with-param name="formlist" select="$formlist" />
                    <gen:with-param name="separator" select="$separator"/>
                </gen:call-template>
                
                <gen:choose>
                	<gen:when test="$formlist = 'true'">
                    	<xsl:value-of select="{name()}" disable-output-escaping="yes"/>
                    </gen:when>
                    <gen:otherwise>
                    	<xsl:value-of select="rows/content/{$tagfield}/value/{name()}" disable-output-escaping="yes"/>
                    </gen:otherwise>
                </gen:choose>
            </textarea>
        </gen:when>
        
        <gen:when test="@type = 'plaintext'">
        	<xsl:call-template name="plaintext" >
            	<xsl:with-param name="value" select="rows/content/{$tagfield}/value/{name()}"/>
                <xsl:with-param name="name" select="{name()}"/>
            </xsl:call-template>
        </gen:when>
        
       <gen:when test="@type = 'texteditor' and $formlist = 'false'">
       		<xsl:call-template name="text-editor">
                <xsl:with-param name="name" select="rows/content/{$tagfield}/value/{name()}/@name"/>
                <xsl:with-param name="value" select="rows/content/{$tagfield}/value/{name()}"/>
                <xsl:with-param name="maxlength" select="{@maxlength}"/>
                <xsl:with-param name="rel" select="'{@rel}'"/>
            </xsl:call-template>
        </gen:when>
        
        <gen:when test="@type = 'image' and $formlist = 'false'">
            <xsl:if test="rows/content/{$tagfield}/label/{name()}">
                <xsl:call-template name="image">
                    <xsl:with-param name="img" select="rows/content/{$tagfield}/value/{name()}"/>
                    <xsl:with-param name="name" select="{name()}"/>
                </xsl:call-template>
           </xsl:if>
         </gen:when>
                
        <gen:when test="@type = 'iframe' and $formlist = 'false'">
            <xsl:if test="rows/content/{$tagfield}/label/{name()}">
                <xsl:call-template name="iframe">
                    <xsl:with-param name="url" select="rows/content/{$tagfield}/value/{name()}"/>
                    <xsl:with-param name="name" select="{name()}"/>
                </xsl:call-template>
           </xsl:if>
        </gen:when>
        
        <gen:when test="@type = 'text' and $formlist = 'true'">
        	<xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
            <input type="hidden" name="{@name}_fk" value="{$tagval}" />
        </gen:when>

        <gen:when test="@type = 'signature' and $formlist = 'false'">
            <gen:variable name="value_desc" select="concat('rows/content/',$tagfield,'/value/',name(),'_desc')"/> 
            <xsl:if test="rows/content/{$tagfield}/label/{name()}">
                <xsl:call-template name="signature">
                    <xsl:with-param name="name" select="{name()}"/>
                    <xsl:with-param name="value" select="rows/content/{$tagfield}/value/{name()}"/>
                    <xsl:with-param name="desc" select="{$value_desc}"/>
                </xsl:call-template>
           </xsl:if>
         </gen:when>
        
         <gen:when test="contains(@type,'vkb_')">
         	<gen:variable name="genpos" select="'position()'"/>
         	<div class="itemIcon">
                <xsl:call-template name="VirtualKeyBoard">
                    <xsl:with-param name="type" select="'{@type}'"/>
                    <xsl:with-param name="rel" select="concat('{name()}_',{$genpos})"/>
                    <xsl:with-param name="input_type" select="'password'"/>
                    
                    <gen:choose>
                        <gen:when test="$formlist = 'true'">
                            <xsl:with-param name="input_name" select="concat(../../label/{name()}/@name,'_fk')"/>
                        </gen:when>
                        <gen:otherwise>
                            <xsl:with-param name="input_name" select="rows/content/{$tagfield}/value/{name()}/@name"/>
                        </gen:otherwise>
                    </gen:choose>
                </xsl:call-template>
            </div>
        </gen:when>
        
       <gen:when test="@type = 'link' and $formlist = 'true'">
            <input type="hidden" name="{@name}_fk" value="{$tagval}" />
            <gen:choose>
                <gen:when test="name() != ''">
                    <gen:variable name="_target">
                        <gen:choose>
                            <gen:when test="@target = '' or not(@target)">_blank</gen:when>
                            <gen:otherwise><gen:value-of select="@target"/></gen:otherwise>
                        </gen:choose>
                    </gen:variable>
                    <a href="{$tagval}" class="link bClick" target="{$_target}" name="{@name}">
                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                    </a>
                </gen:when>
                <gen:otherwise>
                    <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
               </gen:otherwise>
           </gen:choose>
        </gen:when>
        
       <gen:when test="@type = 'link' and $formlist = 'false'"></gen:when>
        
        <gen:when test="@type = 'separator' or @type = 'hidden'">
        </gen:when>
        
        <gen:when test="@type = 'checkbox' or @type = 'radio'">
            <gen:choose>
                <gen:when test="$formlist = 'true'">
                	<xsl:if test="{name()} != '-0'">
                        <input type="{@type}" name="{$name}" value="{$value}">
                            <gen:call-template name="gen_FIELD_validator">
                                <gen:with-param name="tagfield" select="$tagfield"/>
                                <gen:with-param name="formlist" select="$formlist"/>
                                <gen:with-param name="separator" select="$separator"/>
                            </gen:call-template>
                            
                            <xsl:if test="{name()}_check= {name()}">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                        </input>
                    </xsl:if>
                </gen:when>
                <gen:otherwise>
                	<div class="col-1-1">
                        <input type="{@type}" name="{$name}" value="1">
                            <gen:call-template name="gen_FIELD_validator">
                                <gen:with-param name="tagfield" select="$tagfield" />
                                <gen:with-param name="separator" select="$separator"/>
                            </gen:call-template>
                            
                            <xsl:if test="rows/content/{$tagfield}/value/{name()}='1'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                            </xsl:if>
                        </input>
                        <xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                        <gen:if test="@required = 'true'"><span class="riquired">*</span></gen:if>
                    </div>
                </gen:otherwise>
            </gen:choose>
        </gen:when>
        
        <gen:otherwise>
        
            <gen:variable name="gentype">
                <gen:choose>
                    <gen:when test="@type = 'date' or @type = 'color' or @type = 'time' or @type = 'datetime'">
                        <gen:text>text</gen:text>
                    </gen:when>
                    <gen:otherwise>
                        <gen:value-of select="@type"/>
                    </gen:otherwise>
                </gen:choose>
            </gen:variable>
            
            <gen:choose>
            	<gen:when test="@type = 'file' or @type = 'color' or contains(@type,'LOOKUP') or @type = 'date' or @type = 'datetime' or @type = 'time'">
                	<div class="itemIcon">
                    	<gen:if test="@type = 'file'">
                            <input class="notForm" placeholder="Choose File" disabled="disabled" file="id_{$name}"/>
                            <span class="upload"></span>
                        </gen:if>
                        <input type="{$gentype}" name="{$name}" value="{$value}">
                        	<gen:if test="@type = 'file' or @type = 'color'">
                        		<gen:attribute name="id"><gen:text>id_</gen:text><gen:value-of select="$name"/></gen:attribute>
                        	</gen:if>
                            <gen:call-template name="gen_FIELD_validator">
                                <gen:with-param name="tagfield" select="$tagfield" />
                                <gen:with-param name="formlist" select="$formlist" />
                                <gen:with-param name="separator" select="$separator"/>
                            </gen:call-template>
                        </input>
                        <gen:if test="@type = 'color'">
                        	<gen:variable name="formatColor">
                            	<gen:choose>
                                	<gen:when test="@format != ''"><gen:value-of select="@format"/></gen:when>
                                    <gen:otherwise><gen:value-of select="'hex'"/></gen:otherwise>
                                </gen:choose>
                            </gen:variable>
                			<input type="text" class="colorPicker notForm" relColor="id_{$name}" format="{$formatColor}" defaultColor="{$value}"/>
                		</gen:if>
                        <gen:choose>
                            <gen:when test="@type = 'LOOKUP'">
                                <xsl:call-template name="lookup-tool">
                                    <xsl:with-param name="page" select="rows/page"/>
                                    <xsl:with-param name="ad_hoc" select="'1'"/>
                                    <xsl:with-param name="action" select="'LOOKUP'"/>
                                    <gen:choose>
                                        <gen:when test="$formlist = 'true'">
                                           <xsl:with-param name="name" select="concat(../../label/{name()}/@name,'_fk')"/>
                                            <xsl:with-param name="js_lookup" select="../../../../lookup/{name()}"/>
                                        </gen:when>
                                        <gen:otherwise>
                                            <xsl:with-param name="name" select="rows/content/{$tagfield}/value/{name()}/@name"/>
                                            <xsl:with-param name="js_lookup" select="rows/content/{$tagfield}/lookup/{name()}"/>
                                        </gen:otherwise>
                                    </gen:choose>
                                    
                                </xsl:call-template>
                            </gen:when>
                            <gen:when test="contains(@type,'LOOKUP')">
                                <xsl:call-template name="lookup-tool">
                                    <xsl:with-param name="page" select="'LOOKUP'"/>
                                    <xsl:with-param name="action" select="'{@type}'"/>
                                    
                                    <gen:choose>
                                        <gen:when test="$formlist = 'true'">
                                            <xsl:with-param name="name" select="concat(../../label/{name()}/@name,'_fk')"/>
                                            <xsl:with-param name="js_lookup" select="../../../../lookup/{name()}"/>
                                        </gen:when>
                                        <gen:otherwise>
                                            <xsl:with-param name="name" select="rows/content/{$tagfield}/value/{name()}/@name"/>
                                            <xsl:with-param name="js_lookup" select="rows/content/{$tagfield}/lookup/{name()}"/>
                                        </gen:otherwise>
                                    </gen:choose>
                                </xsl:call-template>
                            </gen:when>
                        </gen:choose>
                        <gen:if test="@type = 'date' or @type = 'datetime' or @type = 'time'"><div class="calendar"/></gen:if> 
                    </div>
                </gen:when>
                <gen:otherwise>
                	<input type="{$gentype}" name="{$name}" value="{$value}">
                        <gen:call-template name="gen_FIELD_validator">
                            <gen:with-param name="tagfield" select="$tagfield"/>
                            <gen:with-param name="formlist" select="$formlist"/>
                            <gen:with-param name="separator" select="$separator"/>
                        </gen:call-template>
                    </input>
                </gen:otherwise>
            </gen:choose>
        </gen:otherwise>
    </gen:choose>
</gen:template>
  <!--end template gen field-->
  
<gen:template name="gen_labelFild" mode="gen_labelFild">
    <gen:param name="tagfield" select="'filter'"></gen:param>
    <gen:param name="fields"></gen:param>
    <gen:param name="separator" select="'false'"></gen:param>
    
    <gen:for-each select="$fields">
        <gen:if test="@type != 'hidden' and @type != 'separator' and @type != 'list' and @type != 'separatorlist' and @type != 'separatordialog' and @type != 'separatorlist'">
            <gen:variable name="genName" select="concat(concat('{rows/content/',$tagfield),'/value/')"></gen:variable>
            <gen:variable name="genValue" select="concat(concat('{rows/content/',$tagfield),'/value/')"></gen:variable>
            <gen:variable name="name" select="concat(concat($genName,name()),'/@name}')"></gen:variable>
            <gen:variable name="value" select="concat(concat($genValue,name()),'}')"></gen:variable>
            
            <gen:variable name="col">
                <gen:choose>
                    <gen:when test="@type = 'texteditor' or @type = 'iframe'"><gen:text>col</gen:text></gen:when>
                    <gen:when test="@type = 'textarea' or @type = 'image' or @type = 'radiolist' or @type = 'checkboxlist'">
                        <gen:choose>
                            <gen:when test="@class != ''"><gen:value-of select="@class"/></gen:when>
                            <gen:otherwise><gen:text>col-1-4</gen:text></gen:otherwise>
                        </gen:choose>
                    </gen:when>
                    <gen:otherwise><gen:text>col-1-4</gen:text></gen:otherwise>
                </gen:choose>
            </gen:variable>
            
            <gen:choose>
                <gen:when test="@type = 'group'">
                    <xsl:if test="rows/content/{$tagfield}/label/{name()}">
                        <div class="col" sep-name="{name()}">
                            <xsl:call-template name="page-title">
                                <xsl:with-param name="title" select="rows/content/{$tagfield}/label/{name()}"/>
                                <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                        </div>
                    </xsl:if>
                </gen:when>
                <gen:when test="@type = 'radiolist' or @type = 'checkboxlist'">
                    <gen:call-template name="checkORradioList">
                        <gen:with-param name="tagfield" select="$tagfield"/>
                        <gen:with-param name="type" select="@type"/>
                        <gen:with-param name="separator" select="$separator"/>
                        <gen:with-param name="required" select="@required"/>
                        <gen:with-param name="change" select="@change"/>
                        <gen:with-param name="readonly" select="@readonly"/>
                        <gen:with-param name="rel" select="@rel"/>
                    </gen:call-template>
                </gen:when>
                <gen:otherwise>
                    <xsl:if test="rows/content/{$tagfield}/label/{name()}">      
                        <div class="{$col} item" item-name="{name()}">
                            <div class="igrp_item {@type}">
                                <gen:if test="@type = 'iframe' or @type = 'image'">
                                	<gen:attribute name="class">igrp_item <gen:value-of select="@type"/> addBorder</gen:attribute>
                                </gen:if>
                                <gen:if test="@change = 'true' or @type='selectchange' or @readonly='onchange'"><a id="id{@name}"/></gen:if>
                                <gen:choose>
                                    <gen:when test="@type = 'link'">
                                        <gen:if test="@rel">
                                            <gen:variable name="desc" select="concat('{rows/content/',$tagfield,'/label/',name(),'}')"/>
                                            <input type="link" desc="{$desc}" name="{@name}" rel="F_{@rel}" value="{$value}" style="display:none;"/>
                                        </gen:if>
                                        <gen:variable name="_target">
                                            <gen:choose>
                                                <gen:when test="@target = '' or not(@target)">_blank</gen:when>
                                                <gen:otherwise><gen:value-of select="@target"/></gen:otherwise>
                                            </gen:choose>
                                        </gen:variable>
                                        <a href="{$value}" class="link bClick" name="{@name}" target="{$_target}">
                                        	<xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                                        </a>
                                    </gen:when>
                                    <gen:when test="@type = 'radio' or @type = 'checkbox' or @type = 'iframe' or @type = 'image'"></gen:when>
                                    <gen:otherwise>
                                        <label>
                                        	<xsl:if test="string-length(rows/content/{$tagfield}/label/{name()}) &gt; 45">
                                                <xsl:attribute name="title">
                                                	<xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                            <gen:if test="@required = 'true'"><span class="riquired">*</span></gen:if>
                                            <xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                                        </label>
                                    </gen:otherwise>
                                </gen:choose>
                                <gen:call-template name="gen_field">
                                	<gen:with-param name="tagfield" select="$tagfield"></gen:with-param>
                                    <gen:with-param name="separator" select="$separator"/>
                                </gen:call-template>
                                <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </xsl:if>
                </gen:otherwise>
            </gen:choose>
        </gen:if>
    </gen:for-each>
</gen:template>
  
  <!-- start template gen filter-->
  <gen:template name="gen_form" mode="gen_form">
  	<gen:param name="tagfield" select="'filter'"></gen:param>
    <gen:param name="fields"></gen:param>
    
    <gen:for-each select="$fields[@type != 'hidden']">
    
    	<gen:variable name="genName" select="concat(concat('{rows/content/',$tagfield),'/value/')"></gen:variable>
        <gen:variable name="genValue" select="concat(concat('{rows/content/',$tagfield),'/value/')"></gen:variable>
    	<gen:variable name="name" select="concat(concat($genName,name()),'/@name}')"></gen:variable>
        <gen:variable name="value" select="concat(concat($genValue,name()),'}')"></gen:variable>

        
        <gen:if test="@type = 'separator' and /rows/content/form/@tab = 'true'">
           &lt;/div&gt;&lt;div id="<gen:value-of select='name()'/>" class="workFlow-content"&gt;
        </gen:if>
        <gen:if test="@type = 'separator' or @type = 'list' or @type = 'separatorlist' or @type = 'separatordialog' or @type = 'separatorlist'">
        	<gen:text><![CDATA[<!-- INICIO SEPARADOR ]]> </gen:text> <gen:value-of select='name()'/> <gen:text><![CDATA[-->]]></gen:text>
        </gen:if>
        <xsl:if test="rows/content/{$tagfield}/label/{name()}">
        	<gen:choose>
                <gen:when test="@type = 'separator' and //rows/content/form/@tab = 'true'"></gen:when>
                <gen:when test="@type = 'separator' and //rows/content/form/@tab != 'true'">
                	<gen:variable name="labelname" select="name()"/>
                    <div class="box-content resetPadding" sep-name="{name()}">
                        <xsl:call-template name="titlecollapser">
                            <xsl:with-param name="title" select="rows/content/{$tagfield}/label/{name()}"/>
                        </xsl:call-template>
                        <div class="box-collapser">
                            <gen:call-template name="gen_labelFild">
                                <gen:with-param name="fields" select="//rows/content/form/label/*[not(contains(@type,'hidden')) and @rel = $labelname]"/>
                                <gen:with-param name="tagfield" select="$tagfield"></gen:with-param>
                            </gen:call-template>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                    </div>
                </gen:when>
                
                <gen:when test="@type = 'image'">
                	<gen:if test="not(@rel)">
                        <div class="box-content resetPadding addMarging10" sep-name="{name()}">
                            <xsl:call-template name="image">
                                <xsl:with-param name="img" select="rows/content/{$tagfield}/value/{name()}"/>
                                <xsl:with-param name="name" select="{name()}"/>
                            </xsl:call-template>
                       </div>
                   </gen:if>
                </gen:when>
                
                <gen:when test="@type = 'iframe'">
                	<gen:if test="not(@rel)">
                        <div class="box-content resetPadding addMarging10" sep-name="{name()}">
                            <xsl:call-template name="iframe">
                                <xsl:with-param name="url" select="rows/content/{$tagfield}/value/{name()}"/>
                                <xsl:with-param name="name" select="{name()}"/>
                            </xsl:call-template>
                        </div>
                   </gen:if>
            	</gen:when>
                
                <gen:when test="@type = 'plaintext'">
                	<gen:if test="not(@rel)">
                        <div class="box-content resetPadding addMarging10" sep-name="{name()}">
                            <xsl:call-template name="plaintext">
                                <xsl:with-param name="value" select="rows/content/{$tagfield}/value/{name()}"/>
                                <xsl:with-param name="name" select="{name()}"/>
                            </xsl:call-template>
                        </div>
                   </gen:if>
            	</gen:when>
                
                <gen:when test="@type = 'texteditor'">
                	<gen:if test="not(@rel)">
                        <div class="box-content addPadding10 resetBorder" sep-name="{name()}">
                            <xsl:call-template name="text-editor">
                                <xsl:with-param name="name" select="rows/content/{$tagfield}/value/{name()}/@name"/>
                                <xsl:with-param name="value" select="rows/content/{$tagfield}/value/{name()}"/>
                                <xsl:with-param name="maxlength" select="{@maxlength}"/>
                            </xsl:call-template>
                        </div>
                   </gen:if>
            	</gen:when>
                
                <gen:when test="@type = 'list'">
                    <div class="box-content resetPadding" sep-name="{name()}">
                        <xsl:call-template name="titlecollapser">
                        	<xsl:with-param name="title" select="rows/content/{$tagfield}/label/{name()}"/>
                        </xsl:call-template>
                        <div class="box-collapser">
                            <gen:call-template name="gen_tableList">
                                <gen:with-param name="tagname" select="name()"></gen:with-param>
                            </gen:call-template>
                            <div class="_clear"/>
                     	</div>
                        <div class="_clear"/>
                	</div>
            	</gen:when>
                
                 <gen:when test="@type = 'separatorlist' or @type = 'separatordialog'">
                 	<gen:variable name="dialog"><gen:if test="@type = 'separatordialog'">_diag</gen:if></gen:variable>
                 	<gen:variable name="labelname" select="name()"/>
                    
                    	<div class="box-content resetPadding" sep-name="{$labelname}">
                            <xsl:call-template name="titlecollapser">
                                <xsl:with-param name="title" select="rows/content/{$tagfield}/label/{name()}"/>
                            </xsl:call-template>
                            <div class="box-collapser">
                        
                            
                           <!-- start Separator dialog-->
                            <gen:if test="@type = 'separatordialog'">
                                <gen:variable name="genpath" select="'{$path_tmpl}'"/>
                                <div class="D_{$labelname} IGRP_dialogbox" sep-name="group-{$labelname}">
                                    <div class="IGRP_dialogboxTop">
                     					<div class="titlecollapser">
                                        	<xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                                        </div>
                        				<div class="IGRP_btn_close" rel="{$labelname}"/>
                     				</div>
                                    <div class="IGRP_dialogboxCenter">
                                        <gen:call-template name="gen_labelFild">
                                            <gen:with-param name="fields" select="//rows/content/form/label/*[not(contains(@type,'hidden')) and @rel = $labelname]"/>
                                            <gen:with-param name="tagfield" select="'form'"></gen:with-param>
                                            <gen:with-param name="separator" select="'true'"/>
                                        </gen:call-template>
                                        <div class="_clear"/>
                                    </div>
                                    <div class="dialog_btnContainer" sep-name="op-{name()}">
                                    	<gen:variable name="save" select="'$lngPath/separatorlist_dialog/save'"/>
                                    		<gen:variable name="save_close" select="'$lngPath/separatorlist_dialog/save_close'"/>
                                        <div class="col">
                                            <div class="addRow separador">
                                                <a rel="{$labelname}" class="IGRP_row_confirm" item-name="save-{$genpath}">
                                                    <img src="{$genpath}/img/icon/tools-bar/sepAdd.png" />
                                                    <span><xsl:value-of select="{$save}" disable-output-escaping="yes"/></span>
                                                </a>
                                                <a rel="{$labelname}" class="IGRP_row_confirmClose" item-name="save-close-{$genpath}">
                                                    <img src="{$genpath}/img/icon/tools-bar/sepAdd.png" />
                                                    <span><xsl:value-of select="{$save_close}" disable-output-escaping="yes"/></span>
                                                </a>
                                            </div>
                                        </div>
                                	</div>
                                	<div class="_clear"/>
                                </div>
                            </gen:if>
                           <!-- start Separator dialog-->
                            
                            <gen:if test="@type = 'separatorlist'">
                            	<div class="col" sep-name="group-{$labelname}">
                                <gen:call-template name="gen_labelFild">
                                    <gen:with-param name="fields" select="//rows/content/form/label/*[not(contains(@type,'hidden')) and @rel = $labelname]"/>
                                    <gen:with-param name="tagfield" select="'form'"></gen:with-param>
                                    <gen:with-param name="separator" select="'true'"/>
                                </gen:call-template>
                                <div class="_clear"/>
                                </div>
                            </gen:if>
                            <xsl:call-template name="tools-bar-form-group">
                            	<xsl:with-param name="class" select="'IGRP_addRow{$dialog}'"/>
                                <xsl:with-param name="rel" select="'{$labelname}'"/>
                            </xsl:call-template>
                          	<div class="col" sep-name="list-{$labelname}">
                                <gen:call-template name="gen_tableList">
                                    <gen:with-param name="tagname" select="$labelname"/>
                                    <gen:with-param name="separator" select="'true'"/>
                                    <gen:with-param name="dialog" select="$dialog"/>
                                </gen:call-template>
                        	</div>
                        	<div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                    </div>
            	</gen:when>
                
                <gen:when test="@type = 'formlist'">
                    <div class="box-content resetPadding" sep-name="{name()}">
                       <xsl:call-template name="titlecollapser">
                            <xsl:with-param name="title" select="rows/content/{$tagfield}/label/{name()}"/>
                        </xsl:call-template>
                        <div class="box-collapser">
                            <gen:call-template name="gen_formList">
                                <gen:with-param name="tagname" select="name()"/>
                            </gen:call-template>
                            <div class="_clear"/>
                        </div>
                        <div class="_clear"/>
                    </div>
                </gen:when>
                
                <gen:when test="@type = 'biometric_view' or @type = 'biometric'">
                	<gen:variable name="viewonly">
                    	<gen:choose>
                        	<gen:when test="@type = 'biometric_view'">true</gen:when>
                            <gen:otherwise>false</gen:otherwise>
                        </gen:choose>
                    </gen:variable>
                   
                    <div class="col" sep-name="{name()}">
                        <xsl:apply-templates mode="fingerprint" select="rows/content/fingerprint">
                            <xsl:with-param name="view_only" select="'{$viewonly}'"/>
                            <xsl:with-param name="vTitle" select="rows/content/{$tagfield}/label/{name()}"/>
                        </xsl:apply-templates>
                    </div>
                </gen:when>
                <gen:when test="@type = 'hidden'"></gen:when>
                
                <gen:when test="@type = 'mapp_esri'">
                	<!--mapa-->
        		</gen:when>
                <gen:when test="@type = 'group'">
                    <xsl:if test="rows/content/{$tagfield}/label/{name()}">
                        <div class="col" sep-name="{name()}">
                            <xsl:call-template name="page-title">
                                <xsl:with-param name="title" select="rows/content/{$tagfield}/label/{name()}"/>
                                <xsl:with-param name="class" select="'subtitle'"/>
                            </xsl:call-template>
                        </div>
                    </xsl:if>
                </gen:when>

                <gen:otherwise>
                	<gen:if test="not(@rel)">
                        <gen:variable name="col">
                            <gen:choose>
                                <gen:when test="@type = 'texteditor' or @type = 'iframe'"><gen:text>col</gen:text></gen:when>
                                <gen:when test="@type = 'textarea' or @type = 'image' or @type = 'radiolist' or @type = 'checkboxlist'">
                                    <gen:choose>
                                        <gen:when test="@class != ''"><gen:value-of select="@class"/></gen:when>
                                        <gen:otherwise><gen:text>col-1-4</gen:text></gen:otherwise>
                                    </gen:choose>
                                </gen:when>
                                <gen:otherwise><gen:text>col-1-4</gen:text></gen:otherwise>
                            </gen:choose>
                        </gen:variable>
                        
                        <gen:choose>
                    <gen:when test="@type = 'group'">
                        <xsl:if test="rows/content/{$tagfield}/label/{name()}">
                            <div class="col" sep-name="{name()}">
                                <xsl:call-template name="page-title">
                                    <xsl:with-param name="title" select="rows/content/{$tagfield}/label/{name()}"/>
                                    <xsl:with-param name="class" select="'subtitle'"/>
                                </xsl:call-template>
                            </div>
                        </xsl:if>
                    </gen:when>
                    <gen:when test="@type = 'radiolist' or @type = 'checkboxlist'">
                        <gen:call-template name="checkORradioList">
                            <gen:with-param name="tagfield" select="$tagfield"/>
                            <gen:with-param name="type" select="@type"/>
                            <gen:with-param name="separator" select="'false'"/>
                            <gen:with-param name="required" select="@required"/>
                            <gen:with-param name="change" select="@change"/>
                            <gen:with-param name="readonly" select="@readonly"/>
                            <gen:with-param name="rel" select="@rel"/>
                        </gen:call-template>
                    </gen:when>
                    <gen:otherwise>
                        <div class="{$col} item" item-name="{name()}">
                            <div class="igrp_item {@type}">
                                <gen:if test="@type = 'iframe' or @type = 'image'">
                                    <gen:attribute name="class">igrp_item <gen:value-of select="@type"/> addBorder</gen:attribute>
                                </gen:if>
                                <gen:if test="@change = 'true' or @type='selectchange' or @readonly='onchange'"><a id="id{@name}"/></gen:if>
                                <gen:choose>
                                    <gen:when test="@type = 'link'">
                                        <gen:if test="@rel">
                                            <gen:variable name="desc" select="concat('{rows/content/',$tagfield,'/label/',name(),'}')"/>
                                            <input type="link" desc="{$desc}" name="{@name}" rel="F_{@rel}" value="{$value}" style="display:none;"/>
                                        </gen:if>
                                        <gen:variable name="_target">
                                            <gen:choose>
                                                <gen:when test="@target = '' or not(@target)">_blank</gen:when>
                                                <gen:otherwise><gen:value-of select="@target"/></gen:otherwise>
                                            </gen:choose>
                                        </gen:variable>
                                        <a href="{$value}" class="link bClick" name="{@name}" target="{$_target}">
                                            <xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                                        </a>
                                    </gen:when>
                                    <gen:when test="@type = 'radio' or @type = 'checkbox' or @type = 'iframe' or @type = 'image'"></gen:when>
                                    <gen:otherwise>
                                        <label>
                                        	<xsl:if test="string-length(rows/content/{$tagfield}/label/{name()}) &gt; 45">
                                                <xsl:attribute name="title">
                                                	<xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                                                </xsl:attribute>
                                            </xsl:if>
                                            <gen:if test="@required = 'true'"><span class="riquired">*</span></gen:if>
                                            <xsl:value-of select="rows/content/{$tagfield}/label/{name()}" disable-output-escaping="yes"/>
                                        </label>
                                    </gen:otherwise>
                                </gen:choose>
                                <gen:call-template name="gen_field">
                                    <gen:with-param name="tagfield" select="$tagfield"></gen:with-param>
                                    <gen:with-param name="separator" select="'false'"/>
                                </gen:call-template>
                                <div class="_clear"/>
                            </div>
                            <div class="_clear"/>
                        </div>
                    </gen:otherwise>
               	 </gen:choose>
               	</gen:if>
              </gen:otherwise>
          </gen:choose>
      </xsl:if>
    </gen:for-each>
  </gen:template>
  <!--end template gen filter-->
</gen:stylesheet>
