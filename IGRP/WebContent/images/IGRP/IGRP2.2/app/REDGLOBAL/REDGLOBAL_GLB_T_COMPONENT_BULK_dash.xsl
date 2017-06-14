<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_COMPONENT_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- GLB_T_COMPONENT COMPONENTES BULK LISTA -->

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


		  <!--START PAGE--><!--FILTRO --><!--START FORM--><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/descr"/></span><input type="text" name="{rows/content/filter/value/descr/@name}" value="{rows/content/filter/value/descr}"  class="" /></label><label><span><xsl:value-of select="rows/content/filter/label/proc_name"/></span><input type="text" name="{rows/content/filter/value/proc_name/@name}" value="{rows/content/filter/value/proc_name}"  class="" /></label><label><span><xsl:value-of select="rows/content/filter/label/flg_home"/></span><select name="{rows/content/filter/list/flg_home/@name}" class=""><xsl:for-each select="rows/content/filter/list/flg_home/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/xsl_file"/></span><input type="text" name="{rows/content/filter/value/xsl_file/@name}" value="{rows/content/filter/value/xsl_file}"  class="" /></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></form></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><th align="center"><xsl:value-of select="rows/content/table/label/id"/></th><th align="left"><xsl:value-of select="rows/content/table/label/descr"/></th><th align="left"><xsl:value-of select="rows/content/table/label/proc_name"/></th><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_flg_home_all" value="{value}" class="IGRP_checkall" /></th><th align="left"><xsl:value-of select="rows/content/table/label/xsl_file"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><td class="table_row{$pos}" align="center"><xsl:value-of select="id" /></td><td class="table_row{$pos}" align="left"><xsl:value-of select="descr" /></td><td class="table_row{$pos}" align="left"><xsl:value-of select="proc_name" /></td><td class="table_row{$pos} checkbox" align="left"><input type="checkbox" name="p_flg_home" value="{flg_home}" /></td><td class="table_row{$pos}" align="left"><xsl:value-of select="xsl_file" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>