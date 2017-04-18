<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/REDGLOBAL_GLB_T_LOG_BULK_dash.xml" --><xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"><xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/><xsl:template match="/"><xsl:call-template name="home-top-inc"/>

        <!-- GLB_T_LOG GESTAO LOGS BULK LISTA -->

        <!-- START YOUR CODE HERE --><!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>


        <!--START PAGE--><form action="#" method="post" id="formular_default" name="formular_default" class="default_filter"><!--FILTRO --><!--START FORM--><div class="box-content"><!--HIDDEN FIELDS--><xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" /><xsl:if test="rows/content/filter/label/log_nr"><label><span><xsl:value-of select="rows/content/filter/label/log_nr"/></span><input type="number" name="{rows/content/filter/value/log_nr/@name}" value="{rows/content/filter/value/log_nr}"   maxlength="22"  class="number"><xsl:call-template name="FIELD_validator"><xsl:with-param name="field" select="rows/content/filter/label/log_nr" /></xsl:call-template></input></label></xsl:if><!--TOOLBAR FILTER--><xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" /></div><!--END FORM--><!--INICIO DA TABELA--><div class="table"><table class="sortable IGRP_table"><!--CABECALHO DA TABELA--><thead><tr><xsl:if test="rows/content/table/label/log_nr"><th align="center"><xsl:value-of select="rows/content/table/label/log_nr"/></th></xsl:if><xsl:if test="rows/content/table/label/log_date"><th align="center"><xsl:value-of select="rows/content/table/label/log_date"/></th></xsl:if><xsl:if test="rows/content/table/label/msg_type"><th align="left"><xsl:value-of select="rows/content/table/label/msg_type"/></th></xsl:if><xsl:if test="rows/content/table/label/msg"><th align="left"><xsl:value-of select="rows/content/table/label/msg"/></th></xsl:if><xsl:if test="rows/content/table/label/dad"><th align="left"><xsl:value-of select="rows/content/table/label/dad"/></th></xsl:if></tr></thead><!--CORPO DA TABELA--><tbody><xsl:for-each select="rows/content/table/value/row"><xsl:variable name="pos" select="(position()+1) mod 2"/><tr class="IGRP_contextMenu"><xsl:apply-templates mode="context-param" select="context-menu" /><xsl:if test="log_nr"><td class="table_row{$pos}" align="center"><xsl:value-of select="log_nr" /></td></xsl:if><xsl:if test="log_date"><td class="table_row{$pos}" align="center"><xsl:value-of select="log_date" /></td></xsl:if><xsl:if test="msg_type"><td class="table_row{$pos}" align="left"><xsl:value-of select="msg_type" /></td></xsl:if><xsl:if test="msg"><td class="table_row{$pos}" align="left"><xsl:value-of select="msg" /></td></xsl:if><xsl:if test="dad"><td class="table_row{$pos} checkbox" align="left"><xsl:choose><xsl:when test="dad != ''"><a href="{dad}" class="_blank"><xsl:value-of select="dad_desc" /></a></xsl:when><xsl:otherwise><xsl:value-of select="dad_desc" /></xsl:otherwise></xsl:choose></td></xsl:if></tr></xsl:for-each></tbody></table></div><!--FIM DA TABELA--></form><!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE -->



<xsl:call-template name="home-bottom-inc"/>
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=2012112712"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=2012112712"/>

</xsl:stylesheet>