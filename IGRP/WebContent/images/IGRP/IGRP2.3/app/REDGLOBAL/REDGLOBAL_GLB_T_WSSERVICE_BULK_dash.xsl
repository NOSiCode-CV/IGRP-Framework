<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_WSSERVICE_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- GLB_T_WSSERVICE WEB SERVICES BULK LISTA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/env_fk"><label><span><xsl:value-of select="rows/content/filter/label/env_fk"/></span><select name="{rows/content/filter/list/env_fk/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/env_fk" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/env_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/filter/label/code"><label><span><xsl:value-of select="rows/content/filter/label/code"/></span><input type="text" name="{rows/content/filter/value/code/@name}" value="{rows/content/filter/value/code}"   maxlength="50"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/code" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/filter/label/type"><label><span><xsl:value-of select="rows/content/filter/label/type"/></span><select name="{rows/content/filter/list/type/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/type" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/type/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA  --><div class="table"><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/><table class="sortable IGRP_table"><!--CABECALHO DA TABELA --><thead><tr><xsl:if test="rows/content/table/label/env_dad"><th   align="left"><xsl:value-of select="rows/content/table/label/env_dad"/></th></xsl:if><xsl:if test="rows/content/table/label/code"><th   align="left"><xsl:value-of select="rows/content/table/label/code"/></th></xsl:if><xsl:if test="rows/content/table/label/descr"><th   align="left"><xsl:value-of select="rows/content/table/label/descr"/></th></xsl:if><xsl:if test="rows/content/table/label/proc_name"><th   align="left"><xsl:value-of select="rows/content/table/label/proc_name"/></th></xsl:if><xsl:if test="rows/content/table/label/type"><th   align="left"><xsl:value-of select="rows/content/table/label/type"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row[not(@total='yes')]"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="env_dad"><td class="table_row{$pos}" align="left"><xsl:value-of select="env_dad" /></td></xsl:if><xsl:if test="code"><td class="table_row{$pos} checkbox" align="left"><xsl:choose><xsl:when test="code != ''"><a href="{code}" class="_blank"><xsl:value-of select="code_desc" /></a></xsl:when><xsl:otherwise><xsl:value-of select="code_desc" /></xsl:otherwise></xsl:choose></td></xsl:if><xsl:if test="descr"><td class="table_row{$pos}" align="left"><xsl:value-of select="descr" /></td></xsl:if><xsl:if test="proc_name"><td class="table_row{$pos}" align="left"><xsl:value-of select="proc_name" /></td></xsl:if><xsl:if test="type"><td class="table_row{$pos}" align="left"><xsl:value-of select="type" /></td></xsl:if></tr></xsl:for-each></tbody></table><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201309307"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201309307"/>

</xsl:stylesheet>