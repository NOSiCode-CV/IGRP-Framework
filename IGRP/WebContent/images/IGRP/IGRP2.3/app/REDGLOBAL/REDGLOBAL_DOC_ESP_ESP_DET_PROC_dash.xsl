<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_DOC_ESP_ESP_DET_PROC_dash.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <xsl:call-template name="home-top-inc"/>
    
    <!-- DOC_ESP DOCUMENTACAO ESPECIFICACAO ESP_DET_PROC DETALHE PROCESSO -->
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
      <!-- LEFT COLUMN -->
      <div class="left-1">
        <xsl:apply-templates mode="lateral-menu" select="rows/content/menu" />
      </div>
      <!-- CENTER COLUMN -->
      <div class="center-1">
        <!--START PAGE-->
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_form"  enctype="multipart/form-data">
          <!--FORMULARIO -->
          <!--START FORM-->
          <!--TOOL BAR-->
          <xsl:apply-templates mode="tools-bar" select="rows/content/form/tools-bar" />
          
          <div class="box-content">
            <!--HIDDEN FIELDS-->
            <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
            
            <label> <span><xsl:value-of select="rows/content/form/label/nome"/></span>
              <input type="text" name="{rows/content/form/value/nome/@name}" value="{rows/content/form/value/nome}"  class="" maxlength="30" />
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/codigo"/></span>
              <input type="text" name="{rows/content/form/value/codigo/@name}" value="{rows/content/form/value/codigo}"  class="" maxlength="30" />
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/descricao_processo"/></span>
              <xsl:call-template name="text-editor">
                <xsl:with-param name="name" select="rows/content/form/value/descricao_processo/@name" />
                
                <xsl:with-param name="value" select="rows/content/form/value/descricao_processo"/>
                
              </xsl:call-template>
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/package_htlm"/></span>
              <input type="text" name="{rows/content/form/value/package_htlm/@name}" value="{rows/content/form/value/package_htlm}"  class="" maxlength="30" />
            </label>
            <label> <span><xsl:value-of select="rows/content/form/label/package_db"/></span>
              <input type="text" name="{rows/content/form/value/package_db/@name}" value="{rows/content/form/value/package_db}"  class="" maxlength="30" />
            </label>
            <xsl:call-template name="page-title">
              <xsl:with-param name="title" select="rows/content/form/label/etapas_processo" />
              
              <xsl:with-param name="class" select="'subtitle'" />
              
            </xsl:call-template>
          </div>
          <!--END FORM-->
          <!--FILTRO -->
          <!--START FORM-->
          <div class="box-content">
            <!--HIDDEN FIELDS-->
            <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" />
            
            <label> <span><xsl:value-of select="rows/content/filter/label/area"/></span>
              <select name="{rows/content/filter/list/area/@name}" class=" IGRP_change">
                <xsl:for-each select="rows/content/filter/list/area/option">
                  <option value="{value}">
                  <xsl:if test="@selected='true'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="text"/> </option>
                </xsl:for-each>
              </select>
            </label>
            <label> <span><xsl:value-of select="rows/content/filter/label/processo"/></span>
              <select name="{rows/content/filter/list/processo/@name}" class="">
                <xsl:for-each select="rows/content/filter/list/processo/option">
                  <option value="{value}">
                  <xsl:if test="@selected='true'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="text"/> </option>
                </xsl:for-each>
              </select>
            </label>
            <!--TOOLBAR FILTER-->
            <xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar" />
            
          </div>
          <!--END FORM-->
          <!-- CONTEXT-MENU -->
          <xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
          
          <!--INICIO DA TABELA-->
          <div class="table">
            <table class="sortable IGRP_table">
              <!--CABECALHO DA TABELA-->
              <thead>
                <tr>
                  <xsl:if test="rows/content/table/label/nome_etapa">
                    <th><xsl:value-of select="rows/content/table/label/nome_etapa"/></th>
                  </xsl:if>
                  <xsl:if test="rows/content/table/label/tipo_etapa">
                    <th><xsl:value-of select="rows/content/table/label/tipo_etapa"/></th>
                  </xsl:if>
                  <xsl:if test="rows/content/table/label/descricao">
                    <th><xsl:value-of select="rows/content/table/label/descricao"/></th>
                  </xsl:if>
                </tr>
              </thead>
              <!--CORPO DA TABELA-->
              <tbody>
                <xsl:for-each select="rows/content/table/value/row">
                  <xsl:variable name="pos" select="(position()+1) mod 2"/>
                  <tr class="IGRP_contextMenu">
                    <xsl:apply-templates mode="context-param" select="context-menu" />
                    
                    <xsl:if test="nome_etapa">
                      <td class="table_row{$pos}"><xsl:value-of select="nome_etapa" /></td>
                    </xsl:if>
                    <xsl:if test="tipo_etapa">
                      <td class="table_row{$pos}"><xsl:value-of select="tipo_etapa" /></td>
                    </xsl:if>
                    <xsl:if test="descricao">
                      <td class="table_row{$pos}"><xsl:value-of select="descricao" /></td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
          <!--FIM DA TABELA-->
        </form>
        <!--END PAGE-->
      </div>
    </div>
    <!-- END YOUR CODE HERE -->
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20111219"/>
  <xsl:include href="../../xsl/tmpl/IGRP-lateral-menu.tmpl.xsl?v=20111219"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-text-editor.tmpl.xsl?v=20111219"/>
</xsl:stylesheet>