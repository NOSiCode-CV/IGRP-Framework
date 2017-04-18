<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_REDONLY_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- TESTE TESTE AD-HOC REDONLY FORM READONLY -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/lista_check"><label><a id="idp_lista_check" /><span><xsl:value-of select="rows/content/form/label/lista_check"/></span><xsl:for-each select="rows/content/form/list/lista_check/option"><br /><input type="checkbox" name="{../@name}" value="{value}" class="IGRP_change"><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="../../../label/lista_check" /></xsl:call-template></input><xsl:value-of select="text"/></xsl:for-each></label></xsl:if><xsl:if test="rows/content/form/label/lista_radio"><label><span><xsl:value-of select="rows/content/form/label/lista_radio"/></span><xsl:for-each select="rows/content/form/list/lista_radio/option"><br /><input type="radio" name="{../@name}" value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="../../../label/lista_radio" /></xsl:call-template></input><xsl:value-of select="text"/></xsl:for-each></label></xsl:if><xsl:if test="rows/content/form/label/campo_radio"><label><span><xsl:value-of select="rows/content/form/label/campo_radio"/></span><input type="radio" name="{rows/content/form/value/campo_radio/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/campo_radio='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/campo_radio" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/campo_check"><label><a id="idp_campo_check" /><span><xsl:value-of select="rows/content/form/label/campo_check"/></span><input type="checkbox" name="{rows/content/form/value/campo_check/@name}" value="1"  class="IGRP_change"><xsl:if test="rows/content/form/value/campo_check='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/campo_check" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/text"><label><span><xsl:value-of select="rows/content/form/label/text"/></span><input type="checkbox" name="{rows/content/form/value/text/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/text='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/text" /></xsl:call-template></input></label></xsl:if></div><!-- "FORM" devo fachar DIV_SEPARATOR aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201309069"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201309069"/>

</xsl:stylesheet>