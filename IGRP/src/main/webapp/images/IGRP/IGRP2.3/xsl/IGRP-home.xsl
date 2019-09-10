<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output  method="html" doctype-system="about:legacy-compat" omit-xml-declaration="yes" encoding="utf-8" indent="yes" />

  <xsl:template match="/">
  
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>       
		<style>.col-xs-12.col-sm-12.col-md-12.col-lg-12 {box-shadow: 1px 0 10px 0px #ddd; background: white; padding-bottom: 15px;}
.igrp-home-search-res {padding-top: 50px;  margin-bottom: 0px !important;   } #igrp-apps-1 {
    margin-bottom: 0px;}</style>
      </head>
      <body class="{$bodyClass} old-v fluid sidebar-off">
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
                        <div class="form-group" id="searcher" style="position: initial;">                        
                        <div class="input-group" style="position:fixed; display: table;float:right;right: 4%;margin-top: 10px;width: 47%;z-index: 2;border-bottom: 1px solid #ddd;line-height: 0px;">
  						  <span class="input-group-btn">
                            <button type="button" class="btn btn-default" style="">
                              <i class="fa fa-search"></i>
                            </button>
                          </span>
                          <input type="text" class="form-control" id="" placeholder="Pesquisar" style="padding-top:3px;padding-bottom:0px"/>                          
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
                      
                      <xsl:apply-templates mode="igrp-apps" select="document(rows/applications/@file)"/>

                    </div>
                  </div>
                  

                </div>
              </div>
            </div>
          </div>

          <xsl:call-template name="IGRP-bottom"/>
          
        </form>
         <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" media="none" onload="if(media!='all')media='all'"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css" media="none" onload="if(media!='all')media='all'"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" media="none" onload="if(media!='all')media='all'"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css" media="none" onload="if(media!='all')media='all'"/>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        
        <script type="text/javascript" src="{$path}/core/igrp/home/igrp.home.js"></script>

      </body>
    </html>
  </xsl:template>
  <xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../xsl/tmpl/IGRP-apps.tmpl.xsl?v=1463090556312"/>

 

</xsl:stylesheet>