<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
    <!--XSL Generator (RED/DIM 2015)-->
    <head>
    <!--HOME-HEADER-->
    <xsl:call-template name="home-header"/>
    </head>
    <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <!--HOME TOP-->
    <xsl:call-template name="home-top-main"/>
    <!--HOME-->
    <div id="igrp-bodyPage"><!--HOME LEFT-->
      <xsl:call-template name="home-slide-menu"/>
      <!--HOME RIGTH-->
      <div class="bodyPageRigth"><!-- START YOUR CODE HERE --><!-- SHOW TABLET AND MOBILE TITLE -->
        <div class="box-head showTabMobile"> <xsl:value-of select="rows/content/title"/> </div>
        <!-- SHOW NOTIFICATION MESSAGES-->
        <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
        <div class="colCenter"><!-- START SIMPLE-MENU -->
          <xsl:apply-templates mode="simple-menu" select="rows/content/menu"/>
          <!-- END SIMPLE-MENU -->
          <form action="#" method="post" id="formular_default" name="formular_default" class="default_filter">
            <!-- SHOW HIDDEN-->
            <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
            
            <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
            <!-- START FILTER-->
            <div class="box-content resetPadding">
              <div class="col">
                <xsl:if test="rows/content/filter/label/organica">
                  <div class="col-1-4 item" item-name="organica">
                    <div class="igrp_item selectchange"> <a id="idp_organica"/>
                      <label>
                        <xsl:if test="string-length(rows/content/filter/label/organica) > 45">
                          <xsl:attribute name="title"> <xsl:value-of select="rows/content/filter/label/organica" disable-output-escaping="yes"/> </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/filter/label/organica" disable-output-escaping="yes"/> </label>
                      <select name="{rows/content/filter/list/organica/@name}" chosen="select" data-placeholder="{rows/content/filter/list/organica/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/filter/label/organica"/>
                          
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/filter/list/organica/option[position() != 1]">
                          <option value="{value}">
                          <xsl:if test="@selected='true'">
                            <xsl:attribute name="selected">selected</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="text"/> </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/filter/label/numero_processo">
                  <div class="col-1-4 item" item-name="numero_processo">
                    <div class="igrp_item number">
                      <label>
                        <xsl:if test="string-length(rows/content/filter/label/numero_processo) > 45">
                          <xsl:attribute name="title"> <xsl:value-of select="rows/content/filter/label/numero_processo" disable-output-escaping="yes"/> </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/filter/label/numero_processo" disable-output-escaping="yes"/> </label>
                      <input type="number" name="{rows/content/filter/value/numero_processo/@name}" value="{rows/content/filter/value/numero_processo}" class="number" maxlength="30">
                      <xsl:call-template name="FIELD_validator">
                        <xsl:with-param name="field" select="rows/content/filter/label/numero_processo"/>
                        
                      </xsl:call-template>
                      </input>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/filter/label/tipo_processo">
                  <div class="col-1-4 item" item-name="tipo_processo">
                    <div class="igrp_item selectchange"> <a id="idp_tipo_processo"/>
                      <label>
                        <xsl:if test="string-length(rows/content/filter/label/tipo_processo) > 45">
                          <xsl:attribute name="title"> <xsl:value-of select="rows/content/filter/label/tipo_processo" disable-output-escaping="yes"/> </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/filter/label/tipo_processo" disable-output-escaping="yes"/> </label>
                      <select name="{rows/content/filter/list/tipo_processo/@name}" chosen="select" data-placeholder="{rows/content/filter/list/tipo_processo/option[position() = 1]}" class="selectchange IGRP_change">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/filter/label/tipo_processo"/>
                          
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/filter/list/tipo_processo/option[position() != 1]">
                          <option value="{value}">
                          <xsl:if test="@selected='true'">
                            <xsl:attribute name="selected">selected</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="text"/> </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/filter/label/tipo_etapa">
                  <div class="col-1-4 item" item-name="tipo_etapa">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/filter/label/tipo_etapa) > 45">
                          <xsl:attribute name="title"> <xsl:value-of select="rows/content/filter/label/tipo_etapa" disable-output-escaping="yes"/> </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/filter/label/tipo_etapa" disable-output-escaping="yes"/> </label>
                      <select name="{rows/content/filter/list/tipo_etapa/@name}" chosen="select" data-placeholder="{rows/content/filter/list/tipo_etapa/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/filter/label/tipo_etapa"/>
                          
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/filter/list/tipo_etapa/option[position() != 1]">
                          <option value="{value}">
                          <xsl:if test="@selected='true'">
                            <xsl:attribute name="selected">selected</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="text"/> </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/filter/label/data_inicio">
                  <div class="col-1-4 item" item-name="data_inicio">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/filter/label/data_inicio) > 45">
                          <xsl:attribute name="title"> <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/> </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/filter/label/data_inicio" disable-output-escaping="yes"/> </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/filter/value/data_inicio/@name}" value="{rows/content/filter/value/data_inicio}" class="date" trel="IGRP_datePicker">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/filter/label/data_inicio"/>
                          
                        </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/filter/label/data_fim">
                  <div class="col-1-4 item" item-name="data_fim">
                    <div class="igrp_item date">
                      <label>
                        <xsl:if test="string-length(rows/content/filter/label/data_fim) > 45">
                          <xsl:attribute name="title"> <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/> </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/filter/label/data_fim" disable-output-escaping="yes"/> </label>
                      <div class="itemIcon">
                        <input type="text" name="{rows/content/filter/value/data_fim/@name}" value="{rows/content/filter/value/data_fim}" class="date" trel="IGRP_datePicker">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/filter/label/data_fim"/>
                          
                        </xsl:call-template>
                        </input>
                        <div class="calendar"/>
                      </div>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <xsl:if test="rows/content/filter/label/prioridade">
                  <div class="col-1-4 item" item-name="prioridade">
                    <div class="igrp_item select">
                      <label>
                        <xsl:if test="string-length(rows/content/filter/label/prioridade) > 45">
                          <xsl:attribute name="title"> <xsl:value-of select="rows/content/filter/label/prioridade" disable-output-escaping="yes"/> </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="rows/content/filter/label/prioridade" disable-output-escaping="yes"/> </label>
                      <select name="{rows/content/filter/list/prioridade/@name}" chosen="select" data-placeholder="{rows/content/filter/list/prioridade/option[position() = 1]}" class="select">
                        <xsl:call-template name="FIELD_validator">
                          <xsl:with-param name="field" select="rows/content/filter/label/prioridade"/>
                          
                        </xsl:call-template>
                        <option value=""/>
                        <xsl:for-each select="rows/content/filter/list/prioridade/option[position() != 1]">
                          <option value="{value}">
                          <xsl:if test="@selected='true'">
                            <xsl:attribute name="selected">selected</xsl:attribute>
                          </xsl:if>
                          <xsl:value-of select="text"/> </option>
                        </xsl:for-each>
                      </select>
                      <div class="_clear"/>
                    </div>
                    <div class="_clear"/>
                  </div>
                </xsl:if>
                <div class="_clear"/>
              </div>
              <!--START TOOL BAR FILTER-->
              <xsl:apply-templates mode="button-bar" select="rows/content/filter/tools-bar"/>
              <!--END TOOL BAR FILTER--></div>
            <!-- END FILTER--><!-- START TABELA-->
            <div class="col addBorderLeftRight borderColor">
              <div class="box-table table-responsive">
                <xsl:call-template name="filter-az">
                  <xsl:with-param name="name" select="rows/content/filter/value/name/@name"/>
                  <xsl:with-param name="value" select="rows/content/filter/value/name"/>
                  <xsl:with-param name="type" select="'filter_az'"/>
                </xsl:call-template>
                <div class="col addBorTopBottom borderColor"><!--  CONTEXT-MENU  -->
                	<xsl:for-each select="rows/content/table/value/row[not(@total='yes')]">
                    	<xsl:variable name="param" select="param" />
                    	<xsl:variable name="vimg">
                            <xsl:choose>
                                <xsl:when test="img and img!=''"><xsl:value-of select="img"/></xsl:when>
                                <xsl:otherwise><xsl:value-of select="concat($path_tmpl,'/img/funcionario.png')"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <div class="col-1-3">
                        	<div class="box-func addBorder">
                            	<div class="box-colData">
                                    <div class="box-img" style="background-image:url({$vimg})"></div>
                                    <div class="box-data">
                                    	<div class="box-colData">
                                        	<div class="title"><xsl:value-of select="nome"/></div>
                                            <div class="conctato">
                                            	<xsl:value-of select="../../label/contacto"/> - <xsl:value-of select="contacto"/>
                                            </div>
                                        </div>
                                    	<div class="box-colData color">
                                        	<div class="box-colData">
                                            	<div class="col50"><div class="label"><xsl:value-of select="../../label/n_tarefas"/></div></div>
                                                <div class="col50"><div class="value"><xsl:value-of select="n_tarefas"/></div></div>
                                            	<div class="_clear"/>
                                            </div>
                                            <div class="box-colData">
                                            	<div class="col50"><div class="label"><xsl:value-of select="../../label/n_atendimento"/></div></div>
                                                <div class="col50"><div class="value"><xsl:value-of select="n_atendimento"/></div></div>
                                            	<div class="_clear"/>
                                            </div>
                                             <div class="box-colData">
                                            	<div class="col50"><div class="label"><xsl:value-of select="../../label/media_tempo"/></div></div>
                                                <div class="col50"><div class="value"><xsl:value-of select="media_tempo"/></div></div>
                                            	<div class="_clear"/>
                                            </div>
                                             <div class="box-colData">
                                            	<div class="col50"><div class="label"><xsl:value-of select="../../label/ranking"/></div></div>
                                                <div class="col50"><div class="value"><xsl:value-of select="ranking"/></div></div>
                                            	<div class="_clear"/>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="_clear"/>
                                </div>
                                <div class="box-colData addBorTop borderColor">
                                	<div class="col50">
                                    	<div class="percent addBorder">
                                        	<xsl:if test="percent and percent != ''">
                                            	<div class="bar-evolut">
                                                    <xsl:attribute name="style">width:<xsl:value-of select="percent"/>%</xsl:attribute>
                                                    <xsl:attribute name="title"><xsl:value-of select="percent"/>%</xsl:attribute>
                                                    <xsl:attribute name="rel">
                                                        <xsl:choose>
                                                        	<xsl:when test="percent &lt; 20">20</xsl:when>
                                                            <xsl:when test="percent &lt; 50">40</xsl:when>
                                                            <xsl:otherwise>50</xsl:otherwise>    
                                                        </xsl:choose>
                                                    </xsl:attribute>
                                                </div>
                                            </xsl:if>
                                        </div>
                                    </div>
                                    <div class="col50">
                                    	<div class="icons">
                                            <xsl:for-each select="../../context-menu/item">
                                                <a title="{title}" class="bClick" target="{target}">
                                                    <xsl:call-template name="page-nav">
                                                    <xsl:with-param name="action" select="link" />
                                                    <xsl:with-param name="page" select="page" />
                                                    <xsl:with-param name="app" select="app" />
                                                    <xsl:with-param name="linkextra" select="$param" />
                                                    </xsl:call-template>
                                                    <img src="{$path_tmpl_default}/img/icon/{img}" />
                                                </a>
                                            </xsl:for-each>
                                        </div>
                                    </div>
                                	<div class="_clear"/>
                                </div>
                            </div>
                        </div>
                    </xsl:for-each>
                  <div class="_clear"/>
                </div>
              </div>
            </div>
            <!-- END TABELA-->
          </form>
        </div>
        <div class="colLR">
          <div class="box-content resetPadding">
            <div class="col">
              <xsl:if test="rows/content/primeiros_ranking">
                <!-- START CHARTS-->
                <div class="col" graph-name="primeiros_ranking">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/primeiros_ranking"/>
                    
                    <xsl:with-param name="chart_type" select="rows/content/primeiros_ranking/chart_type"/>
                    
                    <xsl:with-param name="height" select="150"/>
                    
                    <xsl:with-param name="title" select="rows/content/primeiros_ranking/caption"/>
                    
                  </xsl:call-template>
                </div>
                <!-- END CHARTS-->
              </xsl:if>
              <xsl:if test="rows/content/tarefas">
                <!-- START CHARTS-->
                <div class="col" graph-name="tarefas">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/tarefas"/>
                    
                    <xsl:with-param name="chart_type" select="rows/content/tarefas/chart_type"/>
                    
                    <xsl:with-param name="height" select="150"/>
                    
                    <xsl:with-param name="title" select="rows/content/tarefas/caption"/>
                    
                  </xsl:call-template>
                </div>
                <!-- END CHARTS-->
              </xsl:if>
              <xsl:if test="rows/content/evolucao_desempenho">
                <!-- START CHARTS-->
                <div class="col" graph-name="evolucao_desempenho">
                  <xsl:call-template name="igrp-graph">
                    <xsl:with-param name="table" select="rows/content/evolucao_desempenho"/>
                    
                    <xsl:with-param name="chart_type" select="rows/content/evolucao_desempenho/chart_type"/>
                    
                    <xsl:with-param name="height" select="150"/>
                    
                    <xsl:with-param name="title" select="rows/content/evolucao_desempenho/caption"/>
                    
                  </xsl:call-template>
                </div>
                <!-- END CHARTS-->
              </xsl:if>
              <div class="_clear"/>
            </div>
            <div class="_clear"/>
          </div>
        </div>
        <!-- END YOUR CODE HERE -->
        <div class="_clear"/>
      </div>
      <div class="_clear"/>
    </div>
    <!--FOOTER PAGE-->
    <div id="igrp-footerPage">
      <xsl:call-template name="footer"/>
      
    </div>
    </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-menu.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=20150311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=20150311"/>
</xsl:stylesheet>
