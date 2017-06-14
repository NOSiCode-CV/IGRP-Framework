<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_CONF_PROCESSO_FORM_INT_TIMER_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- CONF_PROCESSO CONFIGURACAO PROCESSO FORM_INT_TIMER REGISTAR INTERM TIMER -->

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


		  <!--START PAGE--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/processo"><label><span><xsl:value-of select="rows/content/form/label/processo"/></span><input type="text" name="{rows/content/form/value/processo/@name}" value="{rows/content/form/value/processo}"  readonly="readonly"  class="" maxlength="150" /></label></xsl:if><xsl:if test="rows/content/form/label/code"><label><span>(*) <xsl:value-of select="rows/content/form/label/code"/></span><input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}"  readonly="readonly"  class="required" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/form/label/name"><label><span>(*) <xsl:value-of select="rows/content/form/label/name"/></span><input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}"  class="required" maxlength="100" /></label></xsl:if><xsl:if test="rows/content/form/label/description"><label><span><xsl:value-of select="rows/content/form/label/description"/></span><textarea name="{rows/content/form/value/description/@name}"  class=""><xsl:value-of select="rows/content/form/value/description"/></textarea></label></xsl:if><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/transicao" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:if test="rows/content/form/label/etapa"><label><span><xsl:value-of select="rows/content/form/label/etapa"/></span><input type="text" name="{rows/content/form/value/etapa/@name}" value="{rows/content/form/value/etapa}"  readonly="readonly"  class="" maxlength="150" /></label></xsl:if><xsl:if test="rows/content/form/label/acti_tp_to_fk"><label><span>(*) <xsl:value-of select="rows/content/form/label/acti_tp_to_fk"/></span><select name="{rows/content/form/list/acti_tp_to_fk/@name}" class="required"><xsl:for-each select="rows/content/form/list/acti_tp_to_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/acti_tp_to_desc"><label><span><xsl:value-of select="rows/content/form/label/acti_tp_to_desc"/></span><input type="text" name="{rows/content/form/value/acti_tp_to_desc/@name}" value="{rows/content/form/value/acti_tp_to_desc}"  readonly="readonly"  class="" maxlength="150" /></label></xsl:if><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/timer_param" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:if test="rows/content/form/label/time_unity"><label><span>(*) <xsl:value-of select="rows/content/form/label/time_unity"/></span><select name="{rows/content/form/list/time_unity/@name}" class="required"><xsl:for-each select="rows/content/form/list/time_unity/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/limit_time"><label><span>(*) <xsl:value-of select="rows/content/form/label/limit_time"/></span><input type="number" name="{rows/content/form/value/limit_time/@name}" value="{rows/content/form/value/limit_time}"  class="required number" maxlength="30" /></label></xsl:if></div><!--END FORM--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111229"/>



</xsl:stylesheet>