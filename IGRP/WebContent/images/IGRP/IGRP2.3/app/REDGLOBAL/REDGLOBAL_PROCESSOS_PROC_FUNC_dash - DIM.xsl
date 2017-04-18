<?xml version="1.0" encoding="utf-8"?>
<!-- DWXMLSource="xml/REDGLOBAL_PROCESSOS_PROC_FUNC_dash.xml" -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <xsl:call-template name="home-top-inc"/>
    
    
    <!-- PROCESSOS PROCESSOS PROC_FUNC GESTAO FUNCIONARIOS --> 
    
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
      
      <!-- CENTER COLUMN -->
      <div class="center-1"><!--START PAGE--> 
        <!--SIMPLE-MENU-->
        <xsl:apply-templates mode="menu-simple" select="rows/content/menu" />
        
        <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter">
          <!--FILTRO --><!--START FORM-->
          <div class="box-content"> 
            <!--HIDDEN FIELDS-->
            <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value" />
            
            <label> <span><xsl:value-of select="rows/content/filter/label/data_inicio"/></span>
              <input type="date" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}" class="IGRP_datepicker date"  disabled="disabled" />
            </label>
            <label> <span><xsl:value-of select="rows/content/filter/label/data_fim"/></span>
              <input type="date" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="IGRP_datepicker date"  disabled="disabled" />
            </label>
            <label> <span><xsl:value-of select="rows/content/filter/label/numero_processo"/></span>
              <input type="number" name="{rows/content/filter/value/numero_processo/@name}" value="{rows/content/filter/value/numero_processo}"  class="number" maxlength="30" />
            </label>
            <label> <span><xsl:value-of select="rows/content/filter/label/prioridade"/></span>
              <select name="{rows/content/filter/list/prioridade/@name}" class="">
                <xsl:for-each select="rows/content/filter/list/prioridade/option">
                  <option value="{value}">
                  <xsl:if test="@selected='true'">
                    <xsl:attribute name="selected">selected</xsl:attribute>
                  </xsl:if>
                  <xsl:value-of select="text"/> </option>
                </xsl:for-each>
              </select>
            </label>
            <label> <span><xsl:value-of select="rows/content/filter/label/tipo_processo"/></span>
              <select name="{rows/content/filter/list/tipo_processo/@name}" class="">
                <xsl:for-each select="rows/content/filter/list/tipo_processo/option">
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
          <!--TOOL BAR-->
          <xsl:apply-templates mode="tools-bar" select="rows/content/table/tools-bar" />
          
          <!-- CONTEXT-MENU -->
          <xsl:apply-templates mode="context-menu" select="rows/content/table/context-menu"/>
          
        </form>
        <!--INICIO DA TABELA FUNCIONARIOS-->
        <xsl:call-template name="page-title">
          <xsl:with-param name="title" select="'Funcionarios'" />
          <xsl:with-param name="class" select="'subtitle'" />
        </xsl:call-template>
        
        <xsl:for-each select="rows/content/table/value/row">
            <!--FUNCIONÁRIOS-->
            <div class="box-func">
              <div class="func-top">
                <div class="func-photo"> <img src="{img}" /> </div>
                <div class="func-info">
                  <div class="func-info-top">
                    <div class="prograss-bar">
                      <div class="bar">
                        <xsl:choose>
                          <xsl:when test="percent>'50'">
                            <div class="bar-evolut" style=" width:{percent}%; background-color:#149f06;"></div>
                          </xsl:when>
                          <xsl:otherwise>
                            <div class="bar-evolut" style=" width:{percent}%;"></div>
                          </xsl:otherwise>
                        </xsl:choose>
                      </div>
                    </div>
                    <div class="icons">
                      <xsl:for-each select="../../context-menu/item">
                        <span><a href="{link}" title="{title}"><img src="{$path}/img/icon/{img}" /></a></span>
                      </xsl:for-each>
                    </div>
                  </div>
                  <div class="func-info-botton">
                    <table>
                      <tr>
                        <td><xsl:value-of select="../../label/n_tarefas"/></td>
                        <td><xsl:value-of select="n_tarefas"/></td>
                      </tr>
                      <tr>
                        <td><xsl:value-of select="../../label/n_atendimento"/></td>
                        <td><xsl:value-of select="n_atendimento"/></td>
                      </tr>
                      <tr>
                        <td><xsl:value-of select="../../label/media_tempo"/></td>
                        <td><xsl:value-of select="media_tempo"/></td>
                      </tr>
                      <tr>
                        <td><xsl:value-of select="../../label/ranking"/></td>
                        <td><xsl:value-of select="ranking"/></td>
                      </tr>
                    </table>
                  </div>
                </div>
              </div>
              <div class="func-botton"><xsl:value-of select="nome"/> - <xsl:value-of select="contacto"/></div>
            </div>
          </xsl:for-each>
          <!--FIM DA TABELA FUNCIONARIO-->
        <!--END PAGE-->
        </div>
      <!-- RIGHT COLUMN -->
      <div class="right-1"> 
        <!--GRAFICO-->
        <div class="graph-box"> 
          <!-- PAGE SUBTITLE -->
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="rows/content/tarefas_por_executar/caption" />
            
            <xsl:with-param name="class" select="'subtitle'" />
            
          </xsl:call-template>
          <xsl:call-template name="igrp-graph">
            <xsl:with-param name="table" select="rows/content/tarefas_por_executar" />
            
            <xsl:with-param name="chart_type" select="'PieChart'" />
            
            <xsl:with-param name="width" select="256" />
            
            <xsl:with-param name="height" select="150" />
            
          </xsl:call-template>
        </div>
        <!--GRAFICO-->
        <div class="graph-box"> 
          <!-- PAGE SUBTITLE -->
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="rows/content/tarefas_por_prioridade/caption" />
            
            <xsl:with-param name="class" select="'subtitle'" />
            
          </xsl:call-template>
          <xsl:call-template name="igrp-graph">
            <xsl:with-param name="table" select="rows/content/tarefas_por_prioridade" />
            
            <xsl:with-param name="chart_type" select="'ColumnChart'" />
            
            <xsl:with-param name="width" select="256" />
            
            <xsl:with-param name="height" select="150" />
            
          </xsl:call-template>
        </div>
        <!--GRAFICO-->
        <div class="graph-box"> 
          <!-- PAGE SUBTITLE -->
          <xsl:call-template name="page-title">
            <xsl:with-param name="title" select="rows/content/tarefas_disponiveis/caption" />
            
            <xsl:with-param name="class" select="'subtitle'" />
            
          </xsl:call-template>
          <xsl:call-template name="igrp-graph">
            <xsl:with-param name="table" select="rows/content/tarefas_disponiveis" />
            
            <xsl:with-param name="chart_type" select="'ColumnChart'" />
            
            <xsl:with-param name="width" select="256" />
            
            <xsl:with-param name="height" select="150" />
            
          </xsl:call-template>
        </div>
      </div>
    </div>
    
    <!-- END YOUR CODE HERE -->
    
    <xsl:call-template name="home-bottom-inc"/>
    
  </xsl:template>
  <!--TEMPLATE FOR HEAD-->
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl"/>
</xsl:stylesheet>