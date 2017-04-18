<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/themes/old-gen.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <!--  CHART CSS INCLUDES  -->
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/highcharts/igrp.charts.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/app/SA/css/app.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/app/SA/css/home.css"/>
      </head>
      <body class="old-v" has-menu="false" id="home">

        <!-- TOP SLIDER -->
        <div class="carousel slide" data-ride="carousel" item-name="carousel_1">
          <div class="carousel-inner" role="listbox">
            <div class="item active" style="background-image:url('{rows/content/form/value/imagem_fundo}')">
              <xsl:if test="rows/content/form/label/logo_inicio">
                <div class="app-logo">
                  <img src="{rows/content/form/value/logo_inicio}"/>
                </div>
                <xsl:if test="rows/content/form/label/titulo">
                  <div class="app-logo-title">
                    <h2><xsl:value-of select="rows/content/form/value/titulo"/></h2>
                    <xsl:if test="rows/content/form/label/subtitulo">
                      <p class="app-logo-subtitle">
                        <xsl:value-of select="rows/content/form/value/subtitulo"/>
                      </p>
                    </xsl:if>
                  </div>
                </xsl:if>
              </xsl:if>
            </div>
          </div>
        </div>
        <!--/TOP SLIDER -->

        <!-- TOP MENU -->
          <div id="app-top-menu">
            <xsl:if test="rows/content/form/label/configuracao">
              <a href="{rows/content/form/value/configuracao}" class="link" target="_self">
                <i class="glyphicon glyphicon-cog"></i>
              </a>
            </xsl:if>
            <xsl:if test="rows/content/form/label/logout">
              <a href="{rows/content/form/value/logout}" class="link" target="_self">
                <i class="fa fa-sign-out"></i>
              </a>
            </xsl:if>
          </div>
          <!--/TOP MENU -->
          <div class="container-fluid">

            <div class="row">
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">

                <div id="app-buttons">
                  
                  <!--INIT ATENDIMENTO-->
                  <xsl:if test="rows/content/form/label/iniciar_atendimento" >
                    <div id="init-holder" class="waiting">
                      <a id="app-init" href="{rows/content/form/value/iniciar_atendimento}" class="btn btn-lg btn-primary" data-toggle="tooltip" title="{rows/content/form/label/iniciar_atendimento}">
                        <i class="glyphicon glyphicon-play-circle"></i>
                      </a>
                   </div>
                  </xsl:if>
                  <!--INIT ATENDIMENTO-->

                  <!-- INFO ATENDIMENTO 
                  <xsl:if test="rows/content/form/label/info_atendimento">
                    <a id="app-statistics" rel="up" href="#" class="link form-link info-statistics" title="{rows/content/form/label/info_atendimento}">
                      <i class="fa fa-caret-square-o-up"/>
                    </a>
                  </xsl:if>
                  /INFO ATENDIMENTO -->
                </div>

                
                <div id="app-bottom-contents">
                  <!--<a  class="link form-link info-statistics" rel="down" title="{rows/content/form/label/info_atendimento}">
                    <i class="fa fa-caret-square-o-down icon"/>
                  </a>-->
                  <div class="title">
                    <xsl:value-of select="rows/content/atendimento/caption"/>
                    <i class="fa fa-user-o icon-user"/>
                  </div>
                  <xsl:if test="rows/content/view">
                    <div class="col-md-4 col-sm-12">
                      <div class="row">
                        <div class="col-md-12">
                          <xsl:if test="rows/content/view/label/hoje">
                            <div class="col-md-3 col-sm-3">
                              <div class="row">
                                <div class="view-hoje sacharts" type="day">
                                  <span class="view-value">
                                    <xsl:value-of select="rows/content/view/value/hoje"/>
                                  </span>
                                  <span class="view-label">
                                    <xsl:value-of select="rows/content/view/label/hoje"/>
                                  </span>
                                </div>
                              </div>
                            </div>
                          </xsl:if>
                          <div class="col-sm-9 col-md-9">
                            <div class="row">
                              <xsl:if test="rows/content/view/label/esta_semana">
                                <div class="view-mes sacharts" type="week">
                                  <span class="view-value">
                                    <xsl:value-of select="rows/content/view/value/esta_semana"/>
                                  </span>
                                  <span class="view-label">
                                    <xsl:value-of select="rows/content/view/label/esta_semana"/>
                                  </span>
                                </div>
                              </xsl:if>
                              <xsl:if test="rows/content/view/label/este_mes">
                                <div class="view-mes sacharts" type="month">
                                  <span class="view-value">
                                    <xsl:value-of select="rows/content/view/value/este_mes"/>
                                  </span>
                                  <span class="view-label">
                                    <xsl:value-of select="rows/content/view/label/este_mes"/>
                                  </span>
                                </div>
                              </xsl:if>
                              <xsl:if test="rows/content/view/label/ultimo_mes">
                                <div class="view-mes sacharts" type="lastmonth">
                                  <span class="view-value">
                                    <xsl:value-of select="rows/content/view/value/ultimo_mes"/>
                                  </span>
                                  <span class="view-label">
                                    <xsl:value-of select="rows/content/view/label/ultimo_mes"/>
                                  </span>
                                </div>
                              </xsl:if>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <xsl:if test="rows/content/view/label/tempo_total_atend">
                            <div class="view-total_atend sacharts" type="all">
                              <span class="view-value">
                                <xsl:value-of select="rows/content/view/value/tempo_total_atend"/>
                              </span>
                              <span class="view-label">
                                <xsl:value-of select="rows/content/view/label/tempo_total_atend"/>
                              </span>
                            </div>
                          </xsl:if>
                        </div>
                      </div>
                    </div>
                  </xsl:if>
                  <xsl:if test="rows/content/atendimento">
                    <div class="col-md-8 col-sm-12 " id="sacharts">
                        <div class="box" gen-structure="graphic" item-name="atendimento">
                          <div class="box-body">
                            <xsl:call-template name="igrp-graph">
                            <xsl:with-param name="table" select="rows/content/atendimento"/>
                            <xsl:with-param name="chart_type" select="rows/content/atendimento/chart_type"/>
                            <xsl:with-param name="height" select="'220'"/>
                            <xsl:with-param name="title" select="rows/content/atendimento/caption"/>
                            <xsl:with-param name="url" select="rows/content/atendimento/url"/>
                            </xsl:call-template>
                          </div>
                      </div>
                    </div>
                  </xsl:if> 


                  <!-- <xsl:if test="rows/content/form/label/cancelar_atendimento">
                          <div class="form-group col-md-3" item-name="cancelar_atendimento" item-type="link">
                            <a href="{rows/content/form/value/cancelar_atendimento}" class="link form-link" target="_blank">
                              <xsl:value-of select="rows/content/form/label/cancelar_atendimento"/>
                            </a>
                          </div>
                        </xsl:if> -->



                        

                        <!-- <xsl:if test="rows/content/form/label/info_atendimento">
                          <div class="form-group col-md-3" item-name="info_atendimento" item-type="link">
                            <a href="{rows/content/form/value/info_atendimento}" class="link form-link" target="_blank">
                              <xsl:value-of select="rows/content/form/label/info_atendimento"/>
                            </a>
                          </div>
                        </xsl:if> -->

                  <!-- <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="">
                      <div role="form" gen-id="drop-zone">
                        
                        
                        


                      </div>
                    </div>
                  </div> -->
                  
                </div>

              </div>
            </div>
          </div>
          <!-- Modal -->
          <div class="modal fade" data-backdrop="static" id="app-info-modal" role="dialog">
            <div class="modal-dialog">
              <!-- Modal content-->
              <div class="modal-content">
                <div class="modal-header">
                  <xsl:value-of select="rows/content/form/label/dados_requerente"/>
                  <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times"/></button>
                </div>
                <div class="modal-body">
                  <form method="POST" class="IGRP-form" name="formular_default">
                      <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
          
                      <input type="hidden" id="link_confirmar" value="{rows/content/form/value/confirmar}"/>
                      <input type="hidden" id="link_cancelar" value="{rows/content/form/value/cancelar_atendimento}"/>
                     
                      <div class="clearfix">
                        <xsl:if test="rows/content/form/label/nome">
                          <div class="form-group col-md-6" item-name="nome" item-type="text">
                            <label for="{rows/content/form/value/nome/@name}">
                              <xsl:value-of select="rows/content/form/label/nome"/>
                            </label>
                            <input type="text" value="{rows/content/form/value/nome}" class="form-control " id="{rows/content/form/value/nome/@name}" name="{rows/content/form/value/nome/@name}"/>
                          </div>
                        </xsl:if>
                        
                        <xsl:if test="rows/content/form/label/numero_documento">
                          <div class="form-group col-md-4" item-name="numero_documento" item-type="number">
                            <label for="{rows/content/form/value/numero_documento/@name}">
                              <xsl:value-of select="rows/content/form/label/numero_documento"/>
                            </label>
                            <input type="number" value="{rows/content/form/value/numero_documento}" class="form-control " id="{rows/content/form/value/numero_documento/@name}" name="{rows/content/form/value/numero_documento/@name}"/>
                          </div>
                        </xsl:if>
                      
                         <div class="form-group col-md-2">
                          <a id="app-search-req-btn" href="#" class="link form-link btn btn-success">
                            <i class="fa fa-search"/>
                          </a>
                          <!-- <a id="app-search-req-abort" href="#" class="link form-link btn btn-success">
                              <i class="fa fa-times"/>
                          </a> -->
                        </div> 
                        
                      </div>

                      <div id="app-search-message">
                        
                      </div>

                      <div id="app-search-result"></div>
                  </form>
                  <!-- <xsl:if test="rows/content/form/label/telemovel">
                    <div class="form-group col-md-3" item-name="telemovel" item-type="number">
                      <label for="{rows/content/form/value/telemovel/@name}">
                        <xsl:value-of select="rows/content/form/label/telemovel"/>
                      </label>
                      <input type="number" value="{rows/content/form/value/telemovel}" class="form-control " id="{rows/content/form/value/telemovel/@name}" name="{rows/content/form/value/telemovel/@name}"/>
                    </div>
                  </xsl:if>


                  <xsl:if test="rows/content/form/label/email">
                    <div class="form-group col-md-3" item-name="email" item-type="email">
                      <label for="{rows/content/form/value/email/@name}">
                        <xsl:value-of select="rows/content/form/label/email"/>
                      </label>
                      <input type="email" value="{rows/content/form/value/email}" class="form-control " id="{rows/content/form/value/email/@name}" name="{rows/content/form/value/email/@name}"/>
                    </div>
                  </xsl:if> -->


                  <!-- <xsl:if test="rows/content/form/label/confirmar">
                    <div class="form-group col-md-3" item-name="confirmar" item-type="link">
                      <a href="{rows/content/form/value/confirmar}" class="link form-link" target="_blank">
                        <xsl:value-of select="rows/content/form/label/confirmar"/>
                      </a>
                    </div>
                  </xsl:if> -->

                </div>
                
              </div>
            </div>
          </div> 
          <!--/Modal -->
          <xsl:call-template name="IGRP-bottom"/>
        
        <iframe class="sa-nsweb invisible" style=""></iframe>

        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js"/>
        <!--  CHART JS INCLUDES  -->
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js"/>
        <script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js"/>
        <script type="text/javascript" src="{$path}/core/formgen/js/xml.xsl.transform.js"/>
        <script type="text/javascript" src="{$path}/app/SA/js/utils.js"/>
        <script type="text/javascript" src="{$path}/app/SA/js/home.js"/>
        <script type="text/javascript" src="{$path}/app/SA/js/getOrganica.js"/>
      </body>
    </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-carousel.tmpl.xsl?v=1479387621622"/>
  <xsl:include href="../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1479387621622"/>
</xsl:stylesheet>
