<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_CONF_PROCESSO_FORM_PROC_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- CONF_PROCESSO CONFIGURACAO PROCESSO FORM_PROC REGISTAR PROCESSOS -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/area_fk"><label><span>(*) <xsl:value-of select="rows/content/form/label/area_fk"/></span><select name="{rows/content/form/list/area_fk/@name}" class="required IGRP_change"><xsl:for-each select="rows/content/form/list/area_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/code"><label><span>(*) <xsl:value-of select="rows/content/form/label/code"/></span><input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}"  readonly="readonly"  class="required" maxlength="20" /></label></xsl:if><xsl:if test="rows/content/form/label/name"><label><span>(*) <xsl:value-of select="rows/content/form/label/name"/></span><input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}"  class="required" maxlength="100" /></label></xsl:if><xsl:if test="rows/content/form/label/descr"><label><span><xsl:value-of select="rows/content/form/label/descr"/></span><textarea name="{rows/content/form/value/descr/@name}"  class=""><xsl:value-of select="rows/content/form/value/descr"/></textarea></label></xsl:if><xsl:if test="rows/content/form/label/param_exec"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/param_exec" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/time_unity"><label><span><xsl:value-of select="rows/content/form/label/time_unity"/></span><select name="{rows/content/form/list/time_unity/@name}" class=""><xsl:for-each select="rows/content/form/list/time_unity/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/work_time"><label><span><xsl:value-of select="rows/content/form/label/work_time"/></span><input type="number" name="{rows/content/form/value/work_time/@name}" value="{rows/content/form/value/work_time}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/limit_time"><label><span><xsl:value-of select="rows/content/form/label/limit_time"/></span><input type="number" name="{rows/content/form/value/limit_time/@name}" value="{rows/content/form/value/limit_time}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/warn_time"><label><span><xsl:value-of select="rows/content/form/label/warn_time"/></span><input type="number" name="{rows/content/form/value/warn_time/@name}" value="{rows/content/form/value/warn_time}"  class="number" maxlength="22" /></label></xsl:if><xsl:if test="rows/content/form/label/clone"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/clone" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/aplicacao_origem"><label><span><xsl:value-of select="rows/content/form/label/aplicacao_origem"/></span><select name="{rows/content/form/list/aplicacao_origem/@name}" class="IGRP_change"><xsl:for-each select="rows/content/form/list/aplicacao_origem/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/processo"><label><span><xsl:value-of select="rows/content/form/label/processo"/></span><select name="{rows/content/form/list/processo/@name}" class=""><xsl:for-each select="rows/content/form/list/processo/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/incluir"><label><span><xsl:value-of select="rows/content/form/label/incluir"/></span><select name="{rows/content/form/list/incluir/@name}" multiple="multiple" size="5" class=""><xsl:for-each select="rows/content/form/list/incluir/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/bpmn_diag"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/bpmn_diag" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/file"><label><span><xsl:value-of select="rows/content/form/label/file"/></span><input type="file" name="{rows/content/form/value/file/@name}" value="{rows/content/form/value/file}"  class="" maxlength="30" /></label></xsl:if></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20120112"/>



</xsl:stylesheet>