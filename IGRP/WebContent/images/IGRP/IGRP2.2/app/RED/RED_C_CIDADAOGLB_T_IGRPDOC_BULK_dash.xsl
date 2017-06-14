<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/RED_C_CIDADAOGLB_T_IGRPDOC_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- C_CIDADAO.GLB_T_IGRPDOC IGRP JAVA DOC BULK LISTA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/env_fk"><label><span><xsl:value-of select="rows/content/filter/label/env_fk"/></span><select name="{rows/content/filter/list/env_fk/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/env_fk" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/env_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/filter/label/object_type"><label><span><xsl:value-of select="rows/content/filter/label/object_type"/></span><select name="{rows/content/filter/list/object_type/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/object_type" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/object_type/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/filter/label/owner"><label><span><xsl:value-of select="rows/content/filter/label/owner"/></span><input type="text" name="{rows/content/filter/value/owner/@name}" value="{rows/content/filter/value/owner}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/owner" /></xsl:call-template></input></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA  --><div class="table"><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/><table class="sortable IGRP_table"><!--CABECALHO DA TABELA --><thead><tr><xsl:if test="rows/content/table/label/owner"><th   align="left"><xsl:value-of select="rows/content/table/label/owner"/></th></xsl:if><xsl:if test="rows/content/table/label/object_name"><th   align="left"><xsl:value-of select="rows/content/table/label/object_name"/></th></xsl:if><xsl:if test="rows/content/table/label/object_type"><th   align="left"><xsl:value-of select="rows/content/table/label/object_type"/></th></xsl:if><xsl:if test="rows/content/table/label/remarks"><th   align="left"><xsl:value-of select="rows/content/table/label/remarks"/></th></xsl:if><xsl:if test="rows/content/table/label/ver_doc"><th   align="left"><xsl:value-of select="rows/content/table/label/ver_doc"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row[not(@total='yes')]"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="owner"><td class="table_row{$pos}" align="left"><xsl:value-of select="owner" /></td></xsl:if><xsl:if test="object_name"><td class="table_row{$pos}" align="left"><xsl:value-of select="object_name" /></td></xsl:if><xsl:if test="object_type"><td class="table_row{$pos}" align="left"><xsl:value-of select="object_type" /></td></xsl:if><xsl:if test="remarks"><td class="table_row{$pos}" align="left"><xsl:value-of select="remarks" /></td></xsl:if><xsl:if test="ver_doc"><td class="table_row{$pos} checkbox" align="left"><xsl:choose><xsl:when test="ver_doc != ''"><a href="{ver_doc}" class="_blank"><xsl:value-of select="ver_doc_desc" /></a></xsl:when><xsl:otherwise><xsl:value-of select="ver_doc_desc" /></xsl:otherwise></xsl:choose></td></xsl:if></tr></xsl:for-each></tbody></table><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201310165"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201310165"/>

</xsl:stylesheet>