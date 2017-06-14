<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_CONF_PROC_CLIENT_MOVE_COPY_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- CONF_PROC_CLIENT CONFIGURACAO PROCESSOS (CLIENTE) MOVE_COPY MOVER/COPIAR PROCESSO -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/area_super_fk"><label><a id="idp_area_super_fk" /><span><xsl:value-of select="rows/content/form/label/area_super_fk"/></span><select name="{rows/content/form/list/area_super_fk/@name}" class="IGRP_change"><xsl:for-each select="rows/content/form/list/area_super_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/area_super_name_desc"><th align="left"><xsl:value-of select="rows/content/table/label/area_super_name_desc"/></th></xsl:if><xsl:if test="rows/content/table/label/area_name_desc"><th align="left"><xsl:value-of select="rows/content/table/label/area_name_desc"/></th></xsl:if><xsl:if test="rows/content/table/label/area_fk"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_area_fk_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="area_super_name_desc"><td class="table_row{$pos}" align="left"><xsl:value-of select="area_super_name_desc" /></td></xsl:if><xsl:if test="area_name_desc"><td class="table_row{$pos}" align="left"><xsl:value-of select="area_name_desc" /></td></xsl:if><xsl:if test="area_fk"><td class="table_row{$pos} checkbox" align="center"><input type="checkbox" name="p_area_fk" value="{area_fk}"><xsl:if test="area_fk_check=area_fk"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="area_fk_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201203151"/>



</xsl:stylesheet>