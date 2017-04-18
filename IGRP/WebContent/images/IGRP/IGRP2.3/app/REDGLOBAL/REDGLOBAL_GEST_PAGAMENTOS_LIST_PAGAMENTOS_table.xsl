<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GEST_PAGAMENTOS_LIST_PAGAMENTOS_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- GEST_PAGAMENTOS GESTAO PAGAMENTOS LIST_PAGAMENTOS PAGAMENTOS -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/entidade"><label><span><xsl:value-of select="rows/content/form/label/entidade"/></span><input type="text" name="{rows/content/form/value/entidade/@name}" value="{rows/content/form/value/entidade}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/entidade" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/referencia"><label><span><xsl:value-of select="rows/content/form/label/referencia"/></span><input type="text" name="{rows/content/form/value/referencia/@name}" value="{rows/content/form/value/referencia}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/referencia" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/data_inicio"><label><span><xsl:value-of select="rows/content/form/label/data_inicio"/></span><input type="text" name="{rows/content/form/value/data_inicio/@name}" value="{rows/content/form/value/data_inicio}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/data_inicio" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/data_fim"><label><span><xsl:value-of select="rows/content/form/label/data_fim"/></span><input type="text" name="{rows/content/form/value/data_fim/@name}" value="{rows/content/form/value/data_fim}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/data_fim" /></xsl:call-template></input></label></xsl:if></div><!--devo fachar DIV_SEPARATOR aqui--><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar" /></div><!--END FORM--><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA  --><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA p.COUNT= 6--><thead><tr><xsl:if test="rows/content/table/label/entidade"><th><xsl:value-of select="rows/content/table/label/entidade"/></th></xsl:if><xsl:if test="rows/content/table/label/referencia"><th><xsl:value-of select="rows/content/table/label/referencia"/></th></xsl:if><xsl:if test="rows/content/table/label/valor"><th><xsl:value-of select="rows/content/table/label/valor"/></th></xsl:if><xsl:if test="rows/content/table/label/data_registo"><th><xsl:value-of select="rows/content/table/label/data_registo"/></th></xsl:if><xsl:if test="rows/content/table/label/proc_name"><th><xsl:value-of select="rows/content/table/label/proc_name"/></th></xsl:if><xsl:if test="rows/content/table/label/estado"><th><xsl:value-of select="rows/content/table/label/estado"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="entidade"><td class="table_row{$pos}"><xsl:value-of select="entidade" /></td></xsl:if><xsl:if test="referencia"><td class="table_row{$pos}"><xsl:value-of select="referencia" /></td></xsl:if><xsl:if test="valor"><td class="table_row{$pos}"><xsl:value-of select="valor" /></td></xsl:if><xsl:if test="data_registo"><td class="table_row{$pos}"><xsl:value-of select="data_registo" /></td></xsl:if><xsl:if test="proc_name"><td class="table_row{$pos}"><xsl:value-of select="proc_name" /></td></xsl:if><xsl:if test="estado"><td class="table_row{$pos}"><xsl:value-of select="estado" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201306212"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201306212"/>

</xsl:stylesheet>