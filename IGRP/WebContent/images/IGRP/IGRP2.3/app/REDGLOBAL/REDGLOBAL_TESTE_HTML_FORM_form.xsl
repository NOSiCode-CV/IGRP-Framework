<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_HTML_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
		<html>
        
        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
     
       	<body>
        
          <!--HOME TOP-->
        <xsl:call-template name="home-top-main"/>
        
        <!--CENTER PANE-->
        <div class="general">
        <div id="content">    
        
         
         <!--HOME SIDE
        <xsl:call-template name="home-side"/> -->
        
        <div class="ui-layout-center">
         
        <xsl:call-template name="dialog-modal"/>
        <!-- END HOME TOP --><!-- TESTE_HTML TESTE PAGINAS SERVIDOR FORM PAGINA FORMULARIO -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/texto"><label><span><xsl:value-of select="rows/content/form/label/texto"/></span><input type="text" name="{rows/content/form/value/texto/@name}" value="{rows/content/form/value/texto}"   maxlength="150"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/texto" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/data"><label><span><xsl:value-of select="rows/content/form/label/data"/></span><input type="text" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/data" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/combobox"><label><span><xsl:value-of select="rows/content/form/label/combobox"/></span><select name="{rows/content/form/list/combobox/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/combobox" /></xsl:call-template><xsl:for-each select="rows/content/form/list/combobox/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/checkbox"><label><span><xsl:value-of select="rows/content/form/label/checkbox"/></span><input type="checkbox" name="{rows/content/form/value/checkbox/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/checkbox='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/checkbox" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/radio"><label><span><xsl:value-of select="rows/content/form/label/radio"/></span><input type="radio" name="{rows/content/form/value/radio/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/radio='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/radio" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/listaradio"><label><span><xsl:value-of select="rows/content/form/label/listaradio"/></span><xsl:for-each select="rows/content/form/list/listaradio/option"><br /><input type="radio" name="{../@name}" value="{value}" class=""><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="text"/></xsl:for-each></label></xsl:if><xsl:if test="rows/content/form/label/listacheck"><label><span><xsl:value-of select="rows/content/form/label/listacheck"/></span><xsl:for-each select="rows/content/form/list/listacheck/option"><br /><input type="checkbox" name="{../@name}" value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="text"/></xsl:for-each></label></xsl:if><xsl:if test="rows/content/form/label/numero"><label><span><xsl:value-of select="rows/content/form/label/numero"/></span><input type="number" name="{rows/content/form/value/numero/@name}" value="{rows/content/form/value/numero}"   maxlength="30"  class="number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/numero" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/password"><label><span><xsl:value-of select="rows/content/form/label/password"/></span><input type="password" name="{rows/content/form/value/password/@name}" value="{rows/content/form/value/password}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/password" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/email"><label><span><xsl:value-of select="rows/content/form/label/email"/></span><input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"   maxlength="30"  class="email"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/email" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/pesquisa"><label><span><xsl:value-of select="rows/content/form/label/pesquisa"/></span><input type="text" name="{rows/content/form/value/pesquisa/@name}" value="{rows/content/form/value/pesquisa}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/pesquisa" /></xsl:call-template></input><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="rows/page" /><xsl:with-param name="ad_hoc" select="'1'" /><xsl:with-param name="action" select="'LOOKUP'" /><xsl:with-param name="name" select="rows/content/form/value/pesquisa/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesquisa" /></xsl:call-template></label></xsl:if></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->
    
     	</div>
		<xsl:call-template name="home-side"/> 
		</div></div> 
        
        </body>
            
        </html> 
        
        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201303304"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201303304"/>

</xsl:stylesheet>