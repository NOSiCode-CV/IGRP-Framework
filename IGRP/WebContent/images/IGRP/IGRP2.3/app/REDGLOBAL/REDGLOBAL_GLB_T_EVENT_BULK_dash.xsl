<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_EVENT_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- GLB_T_EVENT GESTAO EVENTOS BULK LISTA -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/cat_fk"/></span><input type="number" name="{rows/content/filter/value/cat_fk/@name}" value="{rows/content/filter/value/cat_fk}"  class=" number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/filter/label/start_time"/></span><input type="date" name="{rows/content/filter/value/start_time/@name}" value="{rows/content/filter/value/start_time}" class="IGRP_datepicker  date" /></label><label><span><xsl:value-of select="rows/content/filter/label/end_time"/></span><input type="date" name="{rows/content/filter/value/end_time/@name}" value="{rows/content/filter/value/end_time}" class="IGRP_datepicker  date" /></label><label><span><xsl:value-of select="rows/content/filter/label/dm_imp_level"/></span><input type="text" name="{rows/content/filter/value/dm_imp_level/@name}" value="{rows/content/filter/value/dm_imp_level}"  class="" maxlength="250" /></label><label><span><xsl:value-of select="rows/content/filter/label/subject"/></span><input type="text" name="{rows/content/filter/value/subject/@name}" value="{rows/content/filter/value/subject}"  class="" maxlength="400" /></label><label><span><xsl:value-of select="rows/content/filter/label/location"/></span><input type="text" name="{rows/content/filter/value/location/@name}" value="{rows/content/filter/value/location}"  class="" maxlength="400" /></label><label><span><xsl:value-of select="rows/content/filter/label/dm_unid_time"/></span><input type="text" name="{rows/content/filter/value/dm_unid_time/@name}" value="{rows/content/filter/value/dm_unid_time}"  class="" maxlength="250" /></label><label><span><xsl:value-of select="rows/content/filter/label/reminder_time"/></span><input type="text" name="{rows/content/filter/value/reminder_time/@name}" value="{rows/content/filter/value/reminder_time}"  class="" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/filter/label/dm_status"/></span><input type="text" name="{rows/content/filter/value/dm_status/@name}" value="{rows/content/filter/value/dm_status}"  class="" maxlength="250" /></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/cat_fk"><th align="center"><xsl:value-of select="rows/content/table/label/cat_fk"/></th></xsl:if><xsl:if test="rows/content/table/label/start_time"><th align="center"><xsl:value-of select="rows/content/table/label/start_time"/></th></xsl:if><xsl:if test="rows/content/table/label/end_time"><th align="center"><xsl:value-of select="rows/content/table/label/end_time"/></th></xsl:if><xsl:if test="rows/content/table/label/reminder_time"><th align="left"><xsl:value-of select="rows/content/table/label/reminder_time"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="cat_fk"><td class="table_row{$pos}" align="center"><xsl:value-of select="cat_fk" /></td></xsl:if><xsl:if test="start_time"><td class="table_row{$pos}" align="center"><xsl:value-of select="start_time" /></td></xsl:if><xsl:if test="end_time"><td class="table_row{$pos}" align="center"><xsl:value-of select="end_time" /></td></xsl:if><xsl:if test="reminder_time"><td class="table_row{$pos}" align="left"><xsl:value-of select="reminder_time" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>