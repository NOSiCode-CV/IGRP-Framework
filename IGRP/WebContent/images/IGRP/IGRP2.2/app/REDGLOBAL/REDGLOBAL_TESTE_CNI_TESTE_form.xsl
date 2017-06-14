<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_CNI_TESTE_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- TESTE TESTE AD-HOC CNI_TESTE TESTE CNI -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/code_enviado"><label><span><xsl:value-of select="rows/content/form/label/code_enviado"/></span><input type="text" name="{rows/content/form/value/code_enviado/@name}" value="{rows/content/form/value/code_enviado}"   maxlength="100"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/code_enviado" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/code_recebido"><label><span><xsl:value-of select="rows/content/form/label/code_recebido"/></span><input type="text" name="{rows/content/form/value/code_recebido/@name}" value="{rows/content/form/value/code_recebido}"   maxlength="100"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/code_recebido" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/certificado"><label><span><xsl:value-of select="rows/content/form/label/certificado"/></span><textarea name="{rows/content/form/value/certificado/@name}"  maxlength="4000"  class=""><xsl:value-of select="rows/content/form/value/certificado"/><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/certificado" /></xsl:call-template></textarea></label></xsl:if></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201304114"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201304114"/>

</xsl:stylesheet>