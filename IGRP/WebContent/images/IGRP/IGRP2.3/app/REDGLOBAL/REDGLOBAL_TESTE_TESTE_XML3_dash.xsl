<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_TESTE_TESTE_XML3_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><xsl:call-template name="home-top-inc"/>

        <!-- TESTE TESTE AD-HOC TESTE_XML3 TESTE XML DOC -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!-- LEFT COLUMN --><div class="left-1"><xsl:apply-templates mode="lateral-menu" select="rows/content/menu" /></div><!-- CENTER COLUMN --><div class="center-1"><!--START PAGE--><!--VIEW --><!--START FORM VIEW--><div class="box-content"><div class="box-entity"><div class="foto-box"><img class="foto" src="{rows/content/view/value/view_foto}" /></div><div class="info-box"><ul><li><span class="label"><xsl:value-of select="rows/content/view/label/nome"/>:</span><xsl:value-of select="rows/content/view/value/nome"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/dt__nascimento"/>:</span><xsl:value-of select="rows/content/view/value/dt__nascimento"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/sexo"/>:</span><xsl:value-of select="rows/content/view/value/sexo"/></li></ul></div></div></div><!--END FORM VIEW--><form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data"><!--FORMULARIO --><!--START FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" /><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/form/value" /><xsl:if test="rows/content/form/label/teste"><label><span><xsl:value-of select="rows/content/form/label/teste"/></span><input type="text" name="{rows/content/form/value/teste/@name}" value="{rows/content/form/value/teste}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/teste" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/form/label/teste_1"><label><span><xsl:value-of select="rows/content/form/label/teste_1"/></span><input type="text" name="{rows/content/form/value/teste_1/@name}" value="{rows/content/form/value/teste_1}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/form/label/teste_1" /></xsl:call-template></input></label></xsl:if></div><!--END FORM--><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/data_inicio"><label><span><xsl:value-of select="rows/content/filter/label/data_inicio"/></span><input type="text" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/data_inicio" /></xsl:call-template></input></label></xsl:if><xsl:if test="rows/content/filter/label/data_fim"><label><span><xsl:value-of select="rows/content/filter/label/data_fim"/></span><input type="text" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}"  class="IGRP_datepicker date"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/data_fim" /></xsl:call-template></input></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--TOOL BAR--><xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" /><!-- CONTEXT-MENU --><xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/nome"><th><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if><xsl:if test="rows/content/table/label/dt__nascimento"><th><xsl:value-of select="rows/content/table/label/dt__nascimento"/></th></xsl:if><xsl:if test="rows/content/table/label/n_conta"><th><xsl:value-of select="rows/content/table/label/n_conta"/></th></xsl:if><xsl:if test="rows/content/table/label/banco"><th><xsl:value-of select="rows/content/table/label/banco"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="nome"><td class="table_row{$pos}"><xsl:value-of select="nome" /></td></xsl:if><xsl:if test="dt__nascimento"><td class="table_row{$pos}"><xsl:value-of select="dt__nascimento" /></td></xsl:if><xsl:if test="n_conta"><td class="table_row{$pos}"><xsl:value-of select="n_conta" /></td></xsl:if><xsl:if test="banco"><td class="table_row{$pos}"><xsl:value-of select="banco" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><xsl:if test="rows/content/teste"><!--GRAFICO--><div class="graph-box"><xsl:call-template name="page-title"><xsl:with-param name="title" select="rows/content/teste/caption" /><xsl:with-param name="class" select="'subtitle'" /></xsl:call-template><xsl:call-template name="igrp-graph"><xsl:with-param name="table" select="rows/content/teste" /><xsl:with-param name="chart_type" select="'PieChart'" /><xsl:with-param name="width" select="273" /><xsl:with-param name="height" select="150" /></xsl:call-template></div></xsl:if><!--END PAGE--></div>


     </div>


        <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201301224"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201301224"/><xsl:include href="../../xsl/tmpl/IGRP-lateral-menu.tmpl.xsl?v=201301224"/>

</xsl:stylesheet>