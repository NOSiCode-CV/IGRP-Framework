<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDGLOBALGLB_T_ENTITY_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- REDGLOBAL.GLB_T_ENTITY GESTAO ENTIDADES PAGAMENTO FORM FORM -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/aplication"><label><span><xsl:value-of select="rows/content/form/label/aplication"/></span><select name="{rows/content/form/list/aplication/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/aplication" /></xsl:call-template><xsl:for-each select="rows/content/form/list/aplication/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/code"><label><span>(*) <xsl:value-of select="rows/content/form/label/code"/></span><input type="number" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}"   maxlength="22"  class="required number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/code" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/type"><label><span>(*) <xsl:value-of select="rows/content/form/label/type"/></span><select name="{rows/content/form/list/type/@name}" class="required IGRP_change"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/type" /></xsl:call-template><xsl:for-each select="rows/content/form/list/type/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/function"><label><span>(*) <xsl:value-of select="rows/content/form/label/function"/></span><input type="text" name="{rows/content/form/value/function/@name}" value="{rows/content/form/value/function}"   maxlength="250"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/function" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/db_link"><label><span><xsl:value-of select="rows/content/form/label/db_link"/></span><input type="text" name="{rows/content/form/value/db_link/@name}" value="{rows/content/form/value/db_link}"   maxlength="100"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/db_link" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/wsdl"><label><span><xsl:value-of select="rows/content/form/label/wsdl"/></span><input type="text" name="{rows/content/form/value/wsdl/@name}" value="{rows/content/form/value/wsdl}"   maxlength="250"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/wsdl" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/url"><label><span>(*) <xsl:value-of select="rows/content/form/label/url"/></span><input type="text" name="{rows/content/form/value/url/@name}" value="{rows/content/form/value/url}"   maxlength="250"  class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/url" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/namespace"><label><span><xsl:value-of select="rows/content/form/label/namespace"/></span><input type="text" name="{rows/content/form/value/namespace/@name}" value="{rows/content/form/value/namespace}"   maxlength="250"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/namespace" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/metodo"><label><span><xsl:value-of select="rows/content/form/label/metodo"/></span><input type="text" name="{rows/content/form/value/metodo/@name}" value="{rows/content/form/value/metodo}"   maxlength="100"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/metodo" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/wallet"><label><span><xsl:value-of select="rows/content/form/label/wallet"/></span><input type="text" name="{rows/content/form/value/wallet/@name}" value="{rows/content/form/value/wallet}"   maxlength="250"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/wallet" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/status"><label><span>(*) <xsl:value-of select="rows/content/form/label/status"/></span><select name="{rows/content/form/list/status/@name}" class="required"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/status" /></xsl:call-template><xsl:for-each select="rows/content/form/list/status/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if></div><!-- "FORM" devo fachar DIV_SEPARATOR aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201310227"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201310227"/>

</xsl:stylesheet>