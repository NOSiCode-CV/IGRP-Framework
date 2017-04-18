<?xml version="1.0" encoding="utf-8"?><!-- DWXMLSource="xml/NOSPROJ_GEST_PROJ_MIL_PROJ_dash.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
<xsl:template match="/">
<!-- START HOME TOP -->
      <html>

        <!--HOME-HEADER-->
        <xsl:call-template name="home-header"/>
        <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>

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
        <!-- END HOME TOP -->
<!-- GEST_PROJ GESTAO PROJECTO MIL_PROJ MILESTONES PROJETO -->

        <!-- START YOUR CODE HERE -->
<!--PAGE TITLE-->
     <div class="box-content">

   <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="rows/content/title" />
        </xsl:call-template>

        <!--NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages" >
          <xsl:with-param name="class" select="'notification'"/>
        </xsl:apply-templates>

        
        <!--START PAGE-->
<!--SIMPLE-MENU-->
<xsl:apply-templates mode="menu-simple" select="rows/content/menu" />
<form action="#" method="post" id="formular_default" name="formular_default" class="default_filter">
<!--FILTRO --><!--START FORM-->
<div class="box-content">
<!--HIDDEN FIELDS-->
<xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" />

<xsl:if test="rows/content/filter/label/data_de">
<label>
<span><xsl:value-of select="rows/content/filter/label/data_de"/></span>
<input type="text" name="{rows/content/filter/value/data_de/@name}" value="{rows/content/filter/value/data_de}"  class="IGRP_datepicker date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/filter/label/data_de" />
</xsl:call-template>
</input>
</label>
</xsl:if>

<xsl:if test="rows/content/filter/label/data_ate">
<label>
<span><xsl:value-of select="rows/content/filter/label/data_ate"/></span>
<input type="text" name="{rows/content/filter/value/data_ate/@name}" value="{rows/content/filter/value/data_ate}"  class="IGRP_datepicker date">
<xsl:call-template name="FIELD_validator">
<xsl:with-param name="field" select="rows/content/filter/label/data_ate" />
</xsl:call-template>
</input>
</label>
</xsl:if>
<!--TOOLBAR FILTER-->
<xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" />
</div>
<!--END FORM-->
<!--TOOL BAR-->
<xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" />
<!-- CONTEXT-MENU -->
<xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
<!--INICIO DA TABELA  -->
<div class="table">
<!--LEGENDA FINAL DA TABELA -->
<xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/>
<table class="sortable IGRP_table">
<!--CABECALHO DA TABELA -->
<thead><tr>
<xsl:if test="rows/content/table/label/designacao">
<th   align="center"><xsl:value-of select="rows/content/table/label/designacao"/></th>
</xsl:if>
<xsl:if test="rows/content/table/label/data">
<th   align="center"><xsl:value-of select="rows/content/table/label/data"/></th>
</xsl:if>
<xsl:if test="rows/content/table/label/responsavel">
<th   align="center"><xsl:value-of select="rows/content/table/label/responsavel"/></th>
</xsl:if>
<xsl:if test="rows/content/table/label/tarefas">
<th   align="center"><xsl:value-of select="rows/content/table/label/tarefas"/></th>
</xsl:if>
<xsl:if test="rows/content/table/label/classificacao">
<th   align="center"><xsl:value-of select="rows/content/table/label/classificacao"/></th>
</xsl:if>
<xsl:if test="rows/content/table/label/performance">
<th   align="center"><xsl:value-of select="rows/content/table/label/performance"/></th>
</xsl:if>
</tr></thead>
<!--CORPO DA TABELA-->
<tbody>
<xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
<xsl:variable name="pos" select="(position()+1) mod 2"/>
<tr class="IGRP_contextMenu">
<xsl:apply-templates mode="context-param" select="context-menu" />
<xsl:if test="designacao">
<td class="table_row{$pos}" ><xsl:value-of select="designacao" /></td>
</xsl:if>
<xsl:if test="data">
<td class="table_row{$pos}" align="center"><xsl:value-of select="data" /></td>
</xsl:if>
<xsl:if test="responsavel">
<td class="table_row{$pos}" ><xsl:value-of select="responsavel" /></td>
</xsl:if>
<xsl:if test="tarefas">
<td class="table_row{$pos}" align="center"><xsl:value-of select="tarefas" /></td>
</xsl:if>
<xsl:if test="classificacao">
<td class="table_row{$pos}" align="center"><xsl:value-of select="classificacao" /></td>
</xsl:if>
<xsl:if test="performance">
<td class="table_row{$pos}" style="margin:0 !important; padding:0 !important;">
	<xsl:choose>
    	<xsl:when test="performance = 100">
        	<div style="width:{performance}%; background:#060; height:99%; position:relative; color:#FFF; font-size:10px; padding:0 !important; text-align:right;">
            	<xsl:value-of select="performance" />%</div>
        </xsl:when>
        <xsl:when test="performance &gt;= 50 and performance &lt;= 99">
        	<div style="width:{performance}%; background:#009; height:99%; position:relative; color:#FFF; font-size:10px; padding:0 !important;text-align:right;">
            	<xsl:value-of select="performance" />%</div>
        </xsl:when>
        <xsl:when test="performance &lt; 50">
        	<div style="width:{performance}%; background:#F00; height:99%; position:relative; color:#FFF; font-size:10px; padding:0 !important;text-align:right;">
            	<xsl:value-of select="performance" />%</div>
        </xsl:when>
    </xsl:choose>
<!--<xsl:value-of select="performance" />--></td>
</xsl:if>
</tr>
</xsl:for-each>
</tbody>
</table>
<!--LEGENDA FINAL DA TABELA -->
<xsl:apply-templates mode="legend_color" select="rows/content/table/legend_color"/>
</div>
<!--FIM DA TABELA-->
</form>
<!--END PAGE-->


     </div>


        <!-- END YOUR CODE HERE -->
<!-- START HOME BOTTOM -->

      </div>
      <xsl:call-template name="home-side"/>
      </div></div>

        </body>

        </html>

        <!-- END HOME BOTTOM -->
</xsl:template>
<!--TEMPLATE FOR HEAD-->
<xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201311289"/>

<xsl:include href="../../xsl/tmpl/IGRP-JSvalidation.tmpl.xsl?v=201311289"/>

<xsl:include href="../../xsl/tmpl/IGRP-field-validator.tmpl.xsl?v=201311289"/>

</xsl:stylesheet>