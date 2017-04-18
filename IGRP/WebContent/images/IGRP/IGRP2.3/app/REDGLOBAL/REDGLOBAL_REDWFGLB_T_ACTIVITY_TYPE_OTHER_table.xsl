<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_REDWFGLB_T_ACTIVITY_TYPE_OTHER_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- REDWF.GLB_T_ACTIVITY_TYPE GESTAO ETAPA OTHER OUTRAS TAREFAS -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--INICIO DA TABELA  --><div class="table"><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/><table class="sortable IGRP_table"><!--CABECALHO DA TABELA --><thead><tr><xsl:if test="rows/content/table/label/aplicacao"><th  ><xsl:value-of select="rows/content/table/label/aplicacao"/></th></xsl:if><xsl:if test="rows/content/table/label/perfil"><th  ><xsl:value-of select="rows/content/table/label/perfil"/></th></xsl:if><xsl:if test="rows/content/table/label/assumida"><th  ><xsl:value-of select="rows/content/table/label/assumida"/></th></xsl:if><xsl:if test="rows/content/table/label/por_assumir"><th  ><xsl:value-of select="rows/content/table/label/por_assumir"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row[not(@total='yes')]"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="aplicacao"><td class="table_row{$pos}"><xsl:value-of select="aplicacao" /></td></xsl:if><xsl:if test="perfil"><td class="table_row{$pos}"><xsl:value-of select="perfil" /></td></xsl:if><xsl:if test="assumida"><td class="table_row{$pos}"><xsl:value-of select="assumida" /></td></xsl:if><xsl:if test="por_assumir"><td class="table_row{$pos}"><xsl:value-of select="por_assumir" /></td></xsl:if></tr></xsl:for-each></tbody><!--RODAPE DA TABELA --><tfoot><tr><xsl:if test="rows/content/table/label/aplicacao"><td></td></xsl:if><xsl:if test="rows/content/table/label/perfil"><td></td></xsl:if><xsl:if test="rows/content/table/label/assumida"><td><xsl:value-of select="rows/content/table/value/row[@total='yes']/assumida/text()"/></td></xsl:if><xsl:if test="rows/content/table/label/por_assumir"><td><xsl:value-of select="rows/content/table/value/row[@total='yes']/por_assumir/text()"/></td></xsl:if></tr></tfoot></table><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201309104"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201309104"/>

</xsl:stylesheet>