<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_PROC_CONFIG_22_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- PROC_CONFIG CONFIGURACAO PROCESSOS 22 ASSOCIAR COMPONENTES ETAPA -->

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


		  <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/task_destino_componentes" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><label><span><xsl:value-of select="rows/content/form/label/area_form"/></span><select name="{rows/content/form/list/area_form/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/form/list/area_form/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/processos_form"/></span><select name="{rows/content/form/list/processos_form/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/form/list/processos_form/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/tasks_form"/></span><select name="{rows/content/form/list/tasks_form/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/form/list/tasks_form/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/passos_form"/></span><select name="{rows/content/form/list/passos_form/@name}" class=""><xsl:for-each select="rows/content/form/list/passos_form/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/associacao_novos_componentes" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></div><!--END FORM--><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><label><span><xsl:value-of select="rows/content/filter/label/aplicacao"/></span><select name="{rows/content/filter/list/aplicacao/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/filter/list/aplicacao/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/processo"/></span><select name="{rows/content/filter/list/processo/@name}" class=" IGRP_change"><xsl:for-each select="rows/content/filter/list/processo/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/filter/label/task"/></span><select name="{rows/content/filter/list/task/@name}" class=""><xsl:for-each select="rows/content/filter/list/task/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/codigo"><th align="left"><xsl:value-of select="rows/content/table/label/codigo"/></th></xsl:if><xsl:if test="rows/content/table/label/name"><th align="left"><xsl:value-of select="rows/content/table/label/name"/></th></xsl:if><xsl:if test="rows/content/table/label/preview"><th align="left"><xsl:value-of select="rows/content/table/label/preview"/></th></xsl:if><xsl:if test="rows/content/table/label/marcar"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_marcar_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="codigo"><td class="table_row{$pos}" align="left"><xsl:value-of select="codigo" /></td></xsl:if><xsl:if test="name"><td class="table_row{$pos}" align="left"><xsl:value-of select="name" /></td></xsl:if><xsl:if test="preview"><td class="table_row{$pos} checkbox" align="left"><a href="{preview}" class="_blank">preview</a></td></xsl:if><xsl:if test="marcar"><td class="table_row{$pos} checkbox" align="left"><input type="checkbox" name="p_marcar" value="{marcar}"><xsl:if test="marcar_check=marcar"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="marcar_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>

</xsl:stylesheet>