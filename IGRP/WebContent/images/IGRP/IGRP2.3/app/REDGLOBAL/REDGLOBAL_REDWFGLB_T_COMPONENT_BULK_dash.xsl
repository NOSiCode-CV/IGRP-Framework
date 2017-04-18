<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_COMPONENT_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><xsl:call-template name="home-top-inc"/>

        <!-- REDWF.GLB_T_COMPONENT COMPONENTES BULK LISTA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><!--SIMPLE-MENU--><xsl:apply-templates mode="menu-simple" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/code"><label><span><xsl:value-of select="rows/content/filter/label/code"/></span><input type="text" name="{rows/content/filter/value/code/@name}" value="{rows/content/filter/value/code}"   maxlength="20"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/code" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/filter/label/env_fk"><label><span><xsl:value-of select="rows/content/filter/label/env_fk"/></span><select name="{rows/content/filter/list/env_fk/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/env_fk" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/env_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><xsl:call-template name="filter-az"><xsl:with-param name="name" select="rows/content/filter/value/name/@name" /><xsl:with-param name="value" select="rows/content/filter/value/name" /></xsl:call-template><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/code"><th align="left"><xsl:value-of select="rows/content/table/label/code"/></th></xsl:if><xsl:if test="rows/content/table/label/name"><th align="left"><xsl:value-of select="rows/content/table/label/name"/></th></xsl:if><xsl:if test="rows/content/table/label/proc_name"><th align="left"><xsl:value-of select="rows/content/table/label/proc_name"/></th></xsl:if><xsl:if test="rows/content/table/label/id"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_id_all" value="{value}" class="IGRP_checkall" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="code"><td class="table_row{$pos}" align="left"><xsl:value-of select="code" /></td></xsl:if><xsl:if test="name"><td class="table_row{$pos}" align="left"><xsl:value-of select="name" /></td></xsl:if><xsl:if test="proc_name"><td class="table_row{$pos}" align="left"><xsl:value-of select="proc_name" /></td></xsl:if><xsl:if test="id"><td class="table_row{$pos} checkbox" align="left"><input type="checkbox" name="p_id" value="{id}"><xsl:if test="id_check=id"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="id_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2012071912"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2012071912"/>

</xsl:stylesheet>