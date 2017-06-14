<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_ACTIVITY_TYPE_FORM_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>

<xsl:template match="/">
<xsl:call-template name="home-top-inc"/>

		  <!-- REDWF.GLB_T_ACTIVITY_TYPE GESTAO ETAPA FORM FORM -->

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


		  <!--START FORM--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><label><span>(*) <xsl:value-of select="rows/content/form/label/proc_tp_fk"/></span><select name="{rows/content/form/list/proc_tp_fk/@name}" class="required"><xsl:for-each select="rows/content/form/list/proc_tp_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span>(*) <xsl:value-of select="rows/content/form/label/code"/></span><input type="text" name="{rows/content/form/value/code/@name}" value="{rows/content/form/value/code}"  class="required" maxlength="20" /></label><label><span>(*) <xsl:value-of select="rows/content/form/label/name"/></span><input type="text" name="{rows/content/form/value/name/@name}" value="{rows/content/form/value/name}"  class="required" maxlength="100" /></label><label><span><xsl:value-of select="rows/content/form/label/description"/></span><textarea name="{rows/content/form/value/description/@name}"  class=""><xsl:value-of select="rows/content/form/value/description"/></textarea></label><label><span>(*) <xsl:value-of select="rows/content/form/label/class_fk"/></span><select name="{rows/content/form/list/class_fk/@name}" class="required"><xsl:for-each select="rows/content/form/list/class_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label><label><span><xsl:value-of select="rows/content/form/label/start_mode"/></span><input type="checkbox" name="{rows/content/form/value/start_mode/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/start_mode='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label><label><span><xsl:value-of select="rows/content/form/label/limit_time"/></span><input type="number" name="{rows/content/form/value/limit_time/@name}" value="{rows/content/form/value/limit_time}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/warn_time"/></span><input type="number" name="{rows/content/form/value/warn_time/@name}" value="{rows/content/form/value/warn_time}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/event_time"/></span><input type="number" name="{rows/content/form/value/event_time/@name}" value="{rows/content/form/value/event_time}"  class="number" maxlength="22" /></label><label><span><xsl:value-of select="rows/content/form/label/proc_name"/></span><input type="text" name="{rows/content/form/value/proc_name/@name}" value="{rows/content/form/value/proc_name}"  class="" maxlength="200" /></label><label><span><xsl:value-of select="rows/content/form/label/form_proc_name"/></span><input type="text" name="{rows/content/form/value/form_proc_name/@name}" value="{rows/content/form/value/form_proc_name}"  class="" maxlength="200" /></label><label><span><xsl:value-of select="rows/content/form/label/status"/></span><input type="checkbox" name="{rows/content/form/value/status/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/status='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input></label><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/perfil" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_perfil"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/perfil/label/cp_org_fk"/></th><th><xsl:value-of select="rows/content/form/table/perfil/label/cp_prof_tp_fk"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/perfil/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><td class="table_row{$pos}"><xsl:value-of select="cp_org_fk" /></td><td class="table_row{$pos}"><xsl:value-of select="cp_prof_tp_fk" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/componentes" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_componentes"><!--CABECALHO DA TABELA--><thead><tr><th><xsl:value-of select="rows/content/form/table/componentes/label/cp_name"/></th><th><xsl:value-of select="rows/content/form/table/componentes/label/cp_orderby"/></th><th><xsl:value-of select="rows/content/form/table/componentes/label/cp_sufix"/></th><th><xsl:value-of select="rows/content/form/table/componentes/label/cp_comp_id"/></th><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_cp_delete_all" value="{value}" class="IGRP_checkall" /><xsl:value-of select="rows/content/form/table/componentes/label/cp_delete" /></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/componentes/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><td class="table_row{$pos}"><xsl:value-of select="cp_name" /></td><td class="table_row{$pos}"><xsl:value-of select="cp_orderby" /></td><td class="table_row{$pos}"><xsl:value-of select="cp_sufix" /></td><td class="table_row{$pos}"><xsl:value-of select="cp_comp_id" /></td><td class="table_row{$pos} checkbox"><input type="checkbox" name="p_cp_delete_fk" value="{cp_delete}"><xsl:if test="cp_delete_check=cp_delete"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="cp_delete_desc" /></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form></div><!--END FORM-->


	  </div>


		  <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=18"/>



</xsl:stylesheet>