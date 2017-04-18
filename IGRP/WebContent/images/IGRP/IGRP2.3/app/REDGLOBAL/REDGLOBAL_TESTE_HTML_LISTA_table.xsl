<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_HTML_LISTA_table.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><!-- START HOME TOP -->
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
        <!-- END HOME TOP --><!-- TESTE_HTML TESTE PAGINAS SERVIDOR LISTA PAGINA LISTA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><!--Devo abrir uma div aqui --><div id="startPage"><xsl:if test="rows/content/form/label/texto"><label><span><xsl:value-of select="rows/content/form/label/texto"/></span><input type="text" name="{rows/content/form/value/texto/@name}" value="{rows/content/form/value/texto}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/texto" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/numero"><label><span><xsl:value-of select="rows/content/form/label/numero"/></span><input type="number" name="{rows/content/form/value/numero/@name}" value="{rows/content/form/value/numero}"   maxlength="30"  class="number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/numero" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/data"><label><span><xsl:value-of select="rows/content/form/label/data"/></span><input type="text" name="{rows/content/form/value/data/@name}" value="{rows/content/form/value/data}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/data" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/chekbox"><label><span><xsl:value-of select="rows/content/form/label/chekbox"/></span><input type="checkbox" name="{rows/content/form/value/chekbox/@name}" value="1"  class=""><xsl:if test="rows/content/form/value/chekbox='1'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/chekbox" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/radiolist"><label><span><xsl:value-of select="rows/content/form/label/radiolist"/></span><xsl:for-each select="rows/content/form/list/radiolist/option"><br /><input type="radio" name="{../@name}" value="{value}" class=""><xsl:if test="@selected='true'"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="text"/></xsl:for-each></label></xsl:if><xsl:if test="rows/content/form/label/combobox"><label><span><xsl:value-of select="rows/content/form/label/combobox"/></span><select name="{rows/content/form/list/combobox/@name}" class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/combobox" /></xsl:call-template><xsl:for-each select="rows/content/form/list/combobox/option"><option value="{value}"><xsl:if test="@selected='true'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if><xsl:value-of select="text"/></option></xsl:for-each></select></label></xsl:if><xsl:if test="rows/content/form/label/email"><label><span><xsl:value-of select="rows/content/form/label/email"/></span><input type="email" name="{rows/content/form/value/email/@name}" value="{rows/content/form/value/email}"   maxlength="30"  class="email"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/email" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/pesquisa"><label><span><xsl:value-of select="rows/content/form/label/pesquisa"/></span><input type="text" name="{rows/content/form/value/pesquisa/@name}" value="{rows/content/form/value/pesquisa}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/pesquisa" /></xsl:call-template></input><xsl:call-template name="lookup-tool"><xsl:with-param name="page" select="rows/page" /><xsl:with-param name="ad_hoc" select="'1'" /><xsl:with-param name="action" select="'LOOKUP'" /><xsl:with-param name="name" select="rows/content/form/value/pesquisa/@name" /><xsl:with-param name="js_lookup" select="rows/content/form/lookup/pesquisa" /></xsl:call-template></label></xsl:if></div><!--devo fachar div aqui--><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/form/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><xsl:call-template name="filter-az"><xsl:with-param name="name" select="rows/content/form/value/fil_a_z/@name" /><xsl:with-param name="value" select="rows/content/form/value/fil_a_z" /><xsl:with-param name="type" select="'filter_aznum'" /></xsl:call-template><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/texto"><th><xsl:value-of select="rows/content/table/label/texto"/></th></xsl:if><xsl:if test="rows/content/table/label/numero"><th><xsl:value-of select="rows/content/table/label/numero"/></th></xsl:if><xsl:if test="rows/content/table/label/data"><th><xsl:value-of select="rows/content/table/label/data"/></th></xsl:if><xsl:if test="rows/content/table/label/email"><th><xsl:value-of select="rows/content/table/label/email"/></th></xsl:if><xsl:if test="rows/content/table/label/hiperlynk"><th><xsl:value-of select="rows/content/table/label/hiperlynk"/></th></xsl:if><xsl:if test="rows/content/table/label/radio"><th><xsl:value-of select="rows/content/table/label/radio"/></th></xsl:if><xsl:if test="rows/content/table/label/checkbox"><th class="checkbox sorttable_nosort" align="center"><input type="checkbox" name="p_checkbox_all" value="{value}" class="IGRP_checkall" /><xsl:value-of select="rows/content/table/label/checkbox" /></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="texto"><td class="table_row{$pos}"><xsl:value-of select="texto" /></td></xsl:if><xsl:if test="numero"><td class="table_row{$pos}"><xsl:value-of select="numero" /></td></xsl:if><xsl:if test="data"><td class="table_row{$pos}"><xsl:value-of select="data" /></td></xsl:if><xsl:if test="email"><td class="table_row{$pos}"><xsl:value-of select="email" /></td></xsl:if><xsl:if test="hiperlynk"><td class="table_row{$pos} checkbox"><xsl:choose><xsl:when test="hiperlynk != ''"><a href="{hiperlynk}" class="_blank"><xsl:value-of select="hiperlynk_desc" /></a></xsl:when><xsl:otherwise><xsl:value-of select="hiperlynk_desc" /></xsl:otherwise></xsl:choose></td></xsl:if><xsl:if test="radio"><td class="table_row{$pos} checkbox"><input type="radio" name="p_radio" value="{radio}"><xsl:if test="radio_check=radio"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="radio_desc" /></td></xsl:if><xsl:if test="checkbox"><td class="table_row{$pos} checkbox"><input type="checkbox" name="p_checkbox" value="{checkbox}"><xsl:if test="checkbox_check=checkbox"><xsl:attribute name="checked">checked</xsl:attribute></xsl:if></input><xsl:value-of select="checkbox_desc" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE --><!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM --></xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2013052913"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2013052913"/>

</xsl:stylesheet>