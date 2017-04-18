<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_02774_NOVO_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- 02774 TESTE_GABRIELA NOVO CONSERVADOR -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"></div><!--FIM DO SEPARADOR--><!--INICIO DO SEPARADOR "CONSERVADOR"--><div id="{local-name(rows/content/form/label/conservador)}"><xsl:if test="rows/content/form/label/conservador"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/conservador" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/servico"><label><span><xsl:value-of select="rows/content/form/label/servico"/></span><select name="{rows/content/form/list/servico/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/servico" /></xsl:call-template><xsl:for-each select="rows/content/form/list/servico/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/conservador"><label><span><xsl:value-of select="rows/content/form/label/conservador"/></span><select name="{rows/content/form/list/conservador/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/conservador" /></xsl:call-template><xsl:for-each select="rows/content/form/list/conservador/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/lista_conservador"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/lista_conservador" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/lista_conservador"><!--INICIO DA TABELA  rows/content/form/table/lista_conservador/--><div class="simple-table"><table rel="T_lista_conservador"><!--CABECALHO DA TABELA --><thead><tr><xsl:if test="rows/content/form/table/lista_conservador/label/servico_lista"><xsl:if test="not(rows/content/form/table/lista_conservador/label/servico_lista/@visible)"><th  ><xsl:value-of select="rows/content/form/table/lista_conservador/label/servico_lista"/></th></xsl:if></xsl:if><xsl:if test="rows/content/form/table/lista_conservador/label/conservador_lista"><xsl:if test="not(rows/content/form/table/lista_conservador/label/conservador_lista/@visible)"><th  ><xsl:value-of select="rows/content/form/table/lista_conservador/label/conservador_lista"/></th></xsl:if></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/lista_conservador/value/row[not(@total='yes')]"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:if test="servico_lista"><xsl:if test="not(servico_lista/@visible)"><td class="table_row{$pos}"><xsl:value-of select="servico_lista" /></td></xsl:if></xsl:if><xsl:if test="servico_lista/@visible='false'"><input type="hidden" name="p_servico_lista_fk" value="{servico_lista}" /><input type="hidden" name="p_servico_lista_fk_desc" value="{servico_lista_desc}" /></xsl:if><xsl:if test="conservador_lista"><xsl:if test="not(conservador_lista/@visible)"><td class="table_row{$pos}"><xsl:value-of select="conservador_lista" /></td></xsl:if></xsl:if><xsl:if test="conservador_lista/@visible='false'"><input type="hidden" name="p_conservador_lista_fk" value="{conservador_lista}" /><input type="hidden" name="p_conservador_lista_fk_desc" value="{conservador_lista_desc}" /></xsl:if></tr></xsl:for-each></tbody></table><!--LEGENDA FINAL DA TABELA --><xsl:apply-templates mode="legend_color" select="rows/content/form/table/lista_conservador/legend_color"/></div><!--FIM DA TABELA--></xsl:if></div><!-- "FORM" devo fachar DIV_SEPARATOR aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201311114"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201311114"/>

</xsl:stylesheet>