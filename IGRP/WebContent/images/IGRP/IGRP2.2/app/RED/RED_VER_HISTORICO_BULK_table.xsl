<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/RED_VER_HISTORICO_BULK_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- VER_HISTORICO HISTORICO BULK LISTA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/data_de"><label><span><xsl:value-of select="rows/content/form/label/data_de"/></span><input type="text" name="{rows/content/form/value/data_de/@name}" value="{rows/content/form/value/data_de}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/data_de" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/data_ate"><label><span><xsl:value-of select="rows/content/form/label/data_ate"/></span><input type="text" name="{rows/content/form/value/data_ate/@name}" value="{rows/content/form/value/data_ate}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/data_ate" /></xsl:call-template></input></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar" /></div><!--END FORM--><!--INICIO DA TABELA  --><div class="table"><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/><table class="sortable IGRP_table"><!--CABECALHO DA TABELA --><thead><tr><xsl:if test="rows/content/table/label/dt_created"><th  ><xsl:value-of select="rows/content/table/label/dt_created"/></th></xsl:if><xsl:if test="rows/content/table/label/uti_id"><th  ><xsl:value-of select="rows/content/table/label/uti_id"/></th></xsl:if><xsl:if test="rows/content/table/label/tamanho"><th   align="center"><xsl:value-of select="rows/content/table/label/tamanho"/></th></xsl:if><xsl:if test="rows/content/table/label/historico"><th  ><xsl:value-of select="rows/content/table/label/historico"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row[not(@total='yes')]"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="dt_created"><td class="table_row{$pos}"><xsl:value-of select="dt_created" /></td></xsl:if><xsl:if test="uti_id"><td class="table_row{$pos}"><xsl:value-of select="uti_id" /></td></xsl:if><xsl:if test="tamanho"><td class="table_row{$pos}" align="center"><xsl:value-of select="tamanho" /></td></xsl:if><xsl:if test="historico"><td class="table_row{$pos} checkbox"><xsl:choose><xsl:when test="historico != ''"><a href="{historico}" class="_blank"><xsl:value-of select="historico_desc" /></a></xsl:when><xsl:otherwise><xsl:value-of select="historico_desc" /></xsl:otherwise></xsl:choose></td></xsl:if></tr></xsl:for-each></tbody></table><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2013100412"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2013100412"/>

</xsl:stylesheet>