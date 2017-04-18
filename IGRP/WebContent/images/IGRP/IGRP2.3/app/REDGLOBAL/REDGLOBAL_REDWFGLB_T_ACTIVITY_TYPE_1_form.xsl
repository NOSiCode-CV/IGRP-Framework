<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_ACTIVITY_TYPE_1_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- REDWF.GLB_T_ACTIVITY_TYPE GESTAO ETAPA 1 CONFIGURACAO ETAPA -->

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


		  <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span><xsl:value-of select="rows/content/form/label/proc_tp_fk"/></span><select name="{rows/content/form/list/proc_tp_fk/@name}" disabled="disabled"  class=""><xsl:for-each select="rows/content/form/list/proc_tp_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span>(*) <xsl:value-of select="rows/content/form/label/code"/></span><input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}"  class="required" maxlength="20" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/name"/></span><input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}"  class="required" maxlength="100" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/class_fk"/></span><select name="{rows/content/form/list/class_fk/@name}" class="required"><xsl:for-each select="rows/content/form/list/class_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/time_units_1"/></span><select name="{rows/content/form/list/time_units_1/@name}" class=""><xsl:for-each select="rows/content/form/list/time_units_1/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/optimal_time"/></span><input type="number" name="{rows/content/form/value/optimal_time/@name}" value="{rows/content/form/value/optimal_time}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/warn_time"/></span><input type="number" name="{rows/content/form/value/warn_time/@name}" value="{rows/content/form/value/warn_time}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/prioridade"/></span><select name="{rows/content/form/list/prioridade/@name}" class=""><xsl:for-each select="rows/content/form/list/prioridade/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/origem"/></span><input type="text" name="{rows/content/form/value/origem/@name}" value="{rows/content/form/value/origem}"  disabled="disabled"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/destino"/></span><input type="text" name="{rows/content/form/value/destino/@name}" value="{rows/content/form/value/destino}"  disabled="disabled"  class="" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/multipla_instancia"/></span><xsl:for-each select="rows/content/form/list/multipla_instancia/option"><input type="radio" name="{../@name}" value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="text"/></xsl:for-each></label><label><span><xsl:value-of select="rows/content/form/label/ordem_inst"/></span><select name="{rows/content/form/list/ordem_inst/@name}" class=""><xsl:for-each select="rows/content/form/list/ordem_inst/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/description"/></span><textarea name="{rows/content/form/value/description/@name}"  class=""><xsl:value-of select="rows/content/form/value/description"/></textarea></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/execution_time" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/data"/></span><input type="date" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}" class="IGRP_datepicker date" /></label><label><span><xsl:value-of select="rows/content/form/label/time_units"/></span><select name="{rows/content/form/list/time_units/@name}" class=""><xsl:for-each select="rows/content/form/list/time_units/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/number_time"/></span><input type="number" name="{rows/content/form/value/number_time/@name}" value="{rows/content/form/value/number_time}"  class="number" maxlength="30" /></label><label><span><xsl:value-of select="rows/content/form/label/destino"/></span><select name="{rows/content/form/list/destino/@name}" class=""><xsl:for-each select="rows/content/form/list/destino/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>