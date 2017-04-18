<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/C_CIDADAO_IR_AD_HOC_AD HOC IRINA_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><xsl:call-template name="home-top-inc"/>

        <!-- IR_AD_HOC AD HOC IRINA AD HOC IRINA AD HOC IRINA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><!--VIEW --><!--START FORM VIEW--><div class="box-content"><div class="box-entity"><div class="foto-box"><img class="foto" src="{rows/content/view/value/view_foto}" /></div><div class="info-box"><ul><li><span class="label"><xsl:value-of select="rows/content/view/label/p_nome"/>:</span><xsl:value-of select="rows/content/view/value/p_nome"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/p_nr_identificacao"/>:</span><xsl:value-of select="rows/content/view/value/p_nr_identificacao"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/p_banco"/>:</span><xsl:value-of select="rows/content/view/value/p_banco"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/p_nr_conta"/>:</span><xsl:value-of select="rows/content/view/value/p_nr_conta"/></li><li><span class="label"><xsl:value-of select="rows/content/view/label/p_nib"/>:</span><xsl:value-of select="rows/content/view/value/p_nib"/></li></ul></div></div></div><!--END FORM VIEW--><!--TAB MENU --><xsl:apply-templates mode="tab-menu" select="rows/content/menu" /><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/nome"><label><span><xsl:value-of select="rows/content/filter/label/nome"/></span><input type="text" name="{rows/content/filter/value/nome/@name}" value="{rows/content/filter/value/nome}"   maxlength="30"  class=""><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/nome" /></xsl:call-template></input></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/nome"><th><xsl:value-of select="rows/content/table/label/nome"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="nome"><td class="table_row{$pos}"><xsl:value-of select="nome" /></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201208136"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201208136"/>

</xsl:stylesheet>