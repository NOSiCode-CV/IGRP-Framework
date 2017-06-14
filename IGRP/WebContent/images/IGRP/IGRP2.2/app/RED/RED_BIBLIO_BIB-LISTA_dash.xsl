<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/RED_BIBLIO_BIB-LISTA_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
      <html>

        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
        <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>

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
        <!-- END HOME TOP --><!-- BIBLIO BIBLIOTECA BIB-LISTA LISTA  ECRA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>

        
        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/env_fk"><label><span><xsl:value-of select="rows/content/filter/label/env_fk"/></span><select name="{rows/content/filter/list/env_fk/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/env_fk" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/env_fk/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/filter/label/nome"><label><span><xsl:value-of select="rows/content/filter/label/nome"/></span><input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}"   maxlength="500"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/nome" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/filter/label/tipo_pagina"><label><span><xsl:value-of select="rows/content/filter/label/tipo_pagina"/></span><select name="{rows/content/filter/list/tipo_pagina/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/tipo_pagina" /></xsl:call-template><xsl:for-each select="rows/content/filter/list/tipo_pagina/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><xsl:call-template name="filter-az"><xsl:with-param name="name" select="rows/content/filter/value/nomeaz/@name" /><xsl:with-param name="value" select="rows/content/filter/value/nomeaz" /><xsl:with-param name="type" select="'filter_az'" /></xsl:call-template><!--INICIO DA TABELA  --><div class="table"><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/><table class="sortable IGRP_table"><!--CABECALHO DA TABELA --><thead><tr><xsl:if test="rows/content/table/label/nome"><th   align="left"><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/tipo"><th  ><xsl:value-of select="rows/content/table/label/tipo"/></th></xsl:if><xsl:if test="rows/content/table/label/n_aplicacoes"><th   align="left"><xsl:value-of select="rows/content/table/label/n_aplicacoes"/></th></xsl:if><xsl:if test="rows/content/table/label/preview"><th  ><xsl:value-of select="rows/content/table/label/preview"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row[not(@total='yes')]"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="nome"><td class="table_row{$pos}" align="left"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="tipo"><td class="table_row{$pos}"><xsl:value-of select="tipo" /></td></xsl:if><xsl:if test="n_aplicacoes"><td class="table_row{$pos}" align="left"><xsl:value-of select="n_aplicacoes" /></td></xsl:if><xsl:if test="preview"><td class="table_row{$pos} checkbox"><xsl:choose><xsl:when test="preview != ''"><a href="{preview}" class="_blank"><xsl:value-of select="preview_desc" /></a></xsl:when><xsl:otherwise><xsl:value-of select="preview_desc" /></xsl:otherwise></xsl:choose></td></xsl:if></tr></xsl:for-each></tbody></table><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201312173"/>

<xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=201312173"/><xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201312173"/>

</xsl:stylesheet>