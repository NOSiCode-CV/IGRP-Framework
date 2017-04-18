<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_SEP_TAB_form.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- TESTE TESTE AD-HOC SEP_TAB TESTE SEPARADOR TAB -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START FORM--><!--Separador Tab--><xsl:apply-templates mode="workFlow_tab" select="rows/content/form/label" /><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content workFlow_tab"><form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--INICIO DO SEPARADOR "SEPARADOR_1"--><div id="{local-name(rows/content/form/label/separador_1)}" class="workFlow_content"><xsl:if test="rows/content/form/label/separador_1"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/separador_1" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/texto"><label><span><xsl:value-of select="rows/content/form/label/texto"/></span><input type="text" name="{rows/content/form/value/texto/@name}" value="{rows/content/form/value/texto}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/texto" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/numer"><label><span><xsl:value-of select="rows/content/form/label/numer"/></span><input type="number" name="{rows/content/form/value/numer/@name}" value="{rows/content/form/value/numer}"   maxlength="30"  class="number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/numer" /></xsl:call-template></input></label></xsl:if></div><!--FIM DO SEPARADOR--><!--INICIO DO SEPARADOR "SEPARADOR_2"--><div id="{local-name(rows/content/form/label/separador_2)}" class="workFlow_content"><xsl:if test="rows/content/form/label/separador_2"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/separador_2" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/nome"><label><a id="idp_nome" /><span><xsl:value-of select="rows/content/form/label/nome"/></span><input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"   maxlength="30"  class="IGRP_change"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/nome" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/combo"><label><a id="idp_combo" /><span><xsl:value-of select="rows/content/form/label/combo"/></span><select name="{rows/content/form/list/combo/@name}" class="IGRP_change"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/combo" /></xsl:call-template><xsl:for-each select="rows/content/form/list/combo/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if></div><!--FIM DO SEPARADOR--><!--INICIO DO SEPARADOR "SEPARADOR_LISTA"--><div id="{local-name(rows/content/form/label/separador_lista)}" class="workFlow_content"><xsl:if test="rows/content/form/label/separador_lista"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/form/label/separador_lista" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/separador_lista"><xsl:call-template name="tools-bar-form-group"><xsl:with-param name="rel" select="'separador_lista'" /></xsl:call-template></xsl:if><xsl:if test="rows/content/form/label/texto2"><label><span><xsl:value-of select="rows/content/form/label/texto2"/></span><input type="text" name="{rows/content/form/value/texto2/@name}" value="{rows/content/form/value/texto2}"  rel="F_separador_lista"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/texto2" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/separador_lista"><!--INICIO DA TABELA--><div class="simple-table"><table rel="T_separador_lista"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="not(rows/content/form/table/separador_lista/label/texto2/@visible)"><th><xsl:value-of select="rows/content/form/table/separador_lista/label/texto2"/></th></xsl:if><th align="center" width="10"></th><th align="center" width="10"></th></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/form/table/separador_lista/value/row"><tr><xsl:if test="not(texto2/@visible)"><td><xsl:value-of select="texto2_desc" /><input type="hidden" name="p_texto2_fk" value="{texto2}" /><input type="hidden" name="p_texto2_fk_desc" value="{texto2_desc}" /></td></xsl:if><xsl:if test="texto2/@visible='false'"><input type="hidden" name="p_texto2_fk" value="{texto2}" /><input type="hidden" name="p_texto2_fk_desc" value="{texto2_desc}" /></xsl:if><td align="center" width="10"><input type="hidden" name="p_separador_lista_id" value="{separador_lista_id}" /><xsl:if test="not(@nodelete)"><img alt="apagar" src="{$path}/img/icon/ctx-delete.png" class="IGRP_delRow" rel="separador_lista"/></xsl:if></td><td align="center" width="10"><xsl:if test="not(@noupdate)"><img alt="editar" src="{$path}/img/icon/edit.png" class="IGRP_editRow" rel="separador_lista"/></xsl:if></td></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></xsl:if></div><!--devo fachar div aqui--></form></div><!--END FORM-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2013041267"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2013041267"/><xsl:include href="../../xsl/tmpl/IGRP-workFlow.tmpl.xsl?v=2013041267"/>

</xsl:stylesheet>