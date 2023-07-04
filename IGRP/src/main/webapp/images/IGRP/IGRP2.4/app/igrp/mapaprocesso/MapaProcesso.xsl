<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
  
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/panels/igrp.panels.css?v={$version}"/>
        
        <style>
          
          section.content-header.gen-container-item{
            padding:0
          }
          section.content-header h2{
            margin: 0;
            line-height: 50px;
          }

          .igrp-box-holder.box>.box-body{
            padding-top:0
          }
          .box .panel-group{
            margin-bottom:-1px;
          }
          .box .panel-group .panel-heading{
            padding:0;
          }
          .box .panel-group .panel-heading .panel-title a{
            padding:10px 15px;
          }
          .box .panel-group .panel-heading h4 a i{
            right:10px
          }
          .box .panel-body{
            padding:0
          }
          .box .nav li:not(:last-child) a{
            border-bottom:1px solid #f3f5f7
          }
          .box .nav li a:hover,
          .box .nav li a:focus{
            background:#f9f9f9
          }
        </style>

      </head>
      <body class="{$bodyClass} old-v fluid sidebar-off" >
        <xsl:call-template name="IGRP-topmenu"/>
        <form>
          <div class="container-fluid">
            <div class="row">
              <xsl:call-template name="IGRP-sidebar"/>
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main with-search" id="igrp-contents">
                <div class="content">
                  <div class="row row-fluid">
                    <nav class="navbar navbar-default" role="navigation">
                      <div class="container-fluid">
                        <div class="form-group" id="searcher">
                        <div class="input-group">
                          <input type="text" class="form-control" id="" placeholder="Pesquisar Processo"/>
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default">
                              <i class="fa fa-search"></i>
                            </button>
                          </span>
                          <span class="input-group-btn">
                            <button type="button" class="btn btn-default searcher-clean">
                              <i class="fa fa-times"></i>
                            </button>
                          </span>
                        </div>
                      </div>
                      </div>
                    </nav>
                  </div>
                  <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                      <section class="content-header gen-container-item ">
                        <h2><xsl:value-of select="rows/content/title"/></h2>
                      </section>         
                    </div>
                  </div>
                  <br/>
                  <div class="row " id="row-49e979dd">

                    <div class="gen-column col-sm-4">
                      <div class="gen-inner">
                        <xsl:call-template name="process-name"/>
                      </div>
                    </div>
  
                    <div class="gen-column col-sm-4">
                      <div class="gen-inner">
                        <xsl:call-template name="process-name">
                          <xsl:with-param name="pos" select="2"/>
                        </xsl:call-template>
                      </div>
                    </div>

                    <div class="gen-column col-sm-4">
                      <div class="gen-inner">
                        <xsl:call-template name="process-name">
                          <xsl:with-param name="pos" select="3"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
        </form>

        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>

        <script type="text/javascript" src="{$path}/plugins/panels/igrp.panels.js"/>

        <script>

            var searcher = $('#searcher input'),

                lists    = $('.panel-body .nav li'),

                procs    = $('a',lists),

                clean    = $('.searcher-clean');

            
            var cleanResults = function(){
                
                $('.panel').show();

                $('.panel-body ul li').show();
                
                $('.panel-collapse').removeClass('in');

            };

            searcher.on('keyup',function(){

              var text = $(this).val();

              if(text.length > 1){

                var results = procs.filter(":contains('"+text+"')");

                $('.panel').hide();

                  $('.panel-body ul li').hide();

                  //$('.panel-collapse').removeClass('in');

                if(results[0]){

                  $.each(results,function(i,r){

                    $(r).parents('.panel').show();

                    $(r).parent().show();

                    $(r).parents('.panel-collapse').addClass('in').removeAttr('style').attr('aria-expanded','true').height('auto');

                  });

                }

              }else
                
                cleanResults();


            });

            clean.on('click',function(){
              
              cleanResults();

              searcher.val('');

            });

        </script>

      </body>
    </html>
  </xsl:template>


  <xsl:template name="process-name">
    <xsl:param name="pos" select="1"/>
    <xsl:param name="no" select="rows/content/menus"/>

    <xsl:variable name="cont" select="count($no)"/>

    <xsl:if test="$pos &lt;= $cont">
      
      <xsl:for-each select="$no[position()=$pos]">
        
        <xsl:variable name="mPos" select="position()"/>
        
        <div class="box igrp-box-holder gen-container-item clean" gen-class="" item-name="box_1">
          <div class="box-header" bg-color="secondary">
            <h3 class="box-title" text-color="white"><xsl:value-of select="title"/></h3>
          </div>
          <div class="box-body" gen-preserve-content="true">
            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_1/fields"/>
            <div>
              <div class="row">
                <div class="gen-column col-sm-12">
                  <div class="gen-inner">
                    
                    <xsl:for-each select="menu">
                      <xsl:variable name="_id" select="concat('panels_',$mPos,'_',$pos,position())"/>
                      <div class="panel-group" id="{$_id}" template="" gen-class="" item-name="{$_id}">
                        <div class="panel panel-default no-shadow ">
                          <div class="panel-heading gen-fields-holder" rel="{$_id}_panel">
                            <h4 class="panel-title">
                              <a data-toggle="collapse" data-parent="#{$_id}" href="#{$_id}_contents" class="collapse-icon-ctrl collapsed" aria-expanded="false">
                                <span>
                                  <xsl:value-of select="title"/>
                                </span>
                                <i class="fa fa-angle-right" text-color=""/>
                              </a>
                            </h4>
                          </div>
                          <div id="{$_id}_contents" class="panel-collapse collapse">
                            <div class="panel-body">
                              <div class="gen-rows-holder" rel="{$_id}_panel">
                                <div class="row " id="row-ebc46366">
                                  <div class="gen-column col-sm-12">
                                    <div class="gen-inner">
                                      <ul class="nav nav-sidebar">
                                        <xsl:for-each select="submenu">
                                          <li><a href="{link}"><xsl:value-of select="title"/></a></li>
                                        </xsl:for-each>
                                      </ul>

                                    </div>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </xsl:for-each>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
       
      </xsl:for-each>

      <xsl:call-template name="process-name">
        <xsl:with-param name="pos" select="$pos + 3"/>
      </xsl:call-template>

    </xsl:if>
  </xsl:template>


  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>