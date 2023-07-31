<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="UTF-8" doctype-system="about:legacy-compat" />
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css?v={$version}"/>

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
                        <div class="form-group" id="searcher">
                        <div class="input-group">
                          <input type="text" class="form-control" id="" placeholder="Pesquisar Aplicação"/>
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
                      
                      <xsl:apply-templates mode="igrp-apps" select="document(rows/applications/@file)"/>

                    </div>
                  </div>
                  

                </div>
              </div>
            </div>
          </div>

          <xsl:call-template name="IGRP-bottom"/>
          
        </form>
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