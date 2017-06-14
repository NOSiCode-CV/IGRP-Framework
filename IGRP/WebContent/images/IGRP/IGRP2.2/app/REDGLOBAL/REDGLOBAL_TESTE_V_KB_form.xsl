<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_V_KB_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- TESTE TESTE AD-HOC V_KB TECLADO VIRTUAL -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/teclado_az"><label><span><xsl:value-of select="rows/content/form/label/teclado_az"/></span><xsl:call-template name="VirtualKeyBoard"><xsl:with-param name="type" select="'vkb_az'"/><xsl:with-param name="rel" select="local-name(rows/content/form/label/teclado_az)"/><xsl:with-param name="input_name" select="rows/content/form/value/teclado_az/@name"/></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/teclado_num"><label><span><xsl:value-of select="rows/content/form/label/teclado_num"/></span><xsl:call-template name="VirtualKeyBoard"><xsl:with-param name="type" select="'vkb_num'"/><xsl:with-param name="rel" select="local-name(rows/content/form/label/teclado_num)"/><xsl:with-param name="input_name" select="rows/content/form/value/teclado_num/@name"/></xsl:call-template></label></xsl:if><xsl:if test="rows/content/form/label/teclado_alfa"><label><span><xsl:value-of select="rows/content/form/label/teclado_alfa"/></span><xsl:call-template name="VirtualKeyBoard"><xsl:with-param name="type" select="'vkb_aznum'"/><xsl:with-param name="rel" select="local-name(rows/content/form/label/teclado_alfa)"/><xsl:with-param name="input_name" select="rows/content/form/value/teclado_alfa/@name"/></xsl:call-template></label></xsl:if></div><!-- "FORM" devo fachar DIV_SEPARATOR aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201307118"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201307118"/><xsl:include href="../../xsl/tmpl/IGRP-virtualkeyboard.tmpl.xsl?v=201307118"/>

</xsl:stylesheet>