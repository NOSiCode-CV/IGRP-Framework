<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_02774_CONSERVADOR_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- 02774 TESTE_GABRIELA CONSERVADOR MULTI_CONSERVADOR -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"></div><!--FIM DO SEPARADOR--><!--INICIO DO SEPARADOR "MULTI_CONSERVADOR"--><div id="{local-name(rows/content/form/label/multi_conservador)}"><xsl:if test="rows/content/form/label/multi_conservador"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/multi_conservador" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/multi_conservador"><!--INICIO DA TABELA--><div class="simple-table"><table class="editable-table" rel="T_multi_conservador"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/form/table/multi_conservador/label/servico"><th><xsl:value-of select="rows/content/form/table/multi_conservador/label/servico"/></th></xsl:if><xsl:if test="rows/content/form/table/multi_conservador/label/conservador"><th><xsl:value-of select="rows/content/form/table/multi_conservador/label/conservador"/></th></xsl:if><th align="center" width="10"><img alt="adicionar" src="{$path_tmpl}/img/icon/tools-bar/add.png" rel="multi_conservador" class="IGRP_addRow_form"/></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/multi_conservador/value/row"><tr><xsl:if test="servico"><td><xsl:value-of select="servico_desc" /><input type="hidden" name="p_servico_fk" value="{servico}" /><input type="hidden" name="p_servico_fk_desc" value="{servico_desc}" /></td></xsl:if><xsl:if test="conservador"><td><xsl:variable name="v_conservador" select="conservador" /><select name="{../../label/conservador/@name}_fk" rel="F_multi_conservador"  class=""><xsl:for-each select="../../../../list/conservador/option"><option value="{value}"><xsl:if test="$v_conservador=value"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></td></xsl:if><td align="center" width="10"><input type="hidden" name="p_multi_conservador_id" value="{multi_conservador_id}" /><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow_form" rel="multi_conservador"/></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></xsl:if></div><!-- "FORM" devo fachar DIV_SEPARATOR aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201311112"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201311112"/>

</xsl:stylesheet>