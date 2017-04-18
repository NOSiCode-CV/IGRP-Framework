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
        <link media="all" type="text/css" href="{$path}/plugins/tablefx/buttonlist/btnlist.css" rel="stylesheet"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/table-colors.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/app/SA/css/app.css"/>
        <link rel="stylesheet" type="text/css" href="{$path}/app/SA/css/services.css"/>
      </head>
      <body class="{$bodyClass} old-v" id="services" >

        <xsl:attribute name="template"><xsl:value-of select="rows/template"/></xsl:attribute>
        <xsl:attribute name="has-menu"><xsl:value-of select="$hasMenu"/></xsl:attribute>
        
        <xsl:if test="$hasMenu = 'true'">
          
          <xsl:variable name="logo">
            <xsl:choose>
              <xsl:when test="$themeConfigData/logo">
                <xsl:value-of select="concat($themePath,'/',$themeConfigData/logo)"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="concat($path,'/themes/default/img/logo.png')"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>

          <nav id="igrp-top-nav" class="navbar navbar-fixed-top" bg-color="1">
            <a class="navbar-brand col-sm-3 col-md-2" href="#" >
             <img src="{$logo}"/>
             <span class=""><b>IGRP</b></span>
            </a>

            <div id="side-bar-ctrl">
              <i class="fa fa-navicon"></i>
            </div>

            <div id="igrp-app-title" class=""><xsl:value-of select="rows/title"/></div>

            <ul id="igrp-top-menu" class="hidden-xs nav navbar-nav navbar-right">
              <li style="width:auto">
                <a href="#"><xsl:value-of select="rows/site/user_name"/></a>
              </li>

            </ul>

          </nav>

        </xsl:if>

        <form method="POST" class="IGRP-form" name="formular_default">
          <div class="container-fluid">
            <div class="row">

              <xsl:call-template name="SA-sidebar"/>

              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <xsl:call-template name="SA-toolbar"/>

                  <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                  <div class="box igrp-forms gen-container-item">
                    <div class="box-body" first-type-container="" last-type-container="true">
                      <div role="form" gen-id="drop-zone">
                        <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>

                        <xsl:variable name="conutfav" select="count(rows/content/form/table/lista_favoritos/value/row)"/>

                        <xsl:variable name="mdclass">
                          <xsl:choose>
                            <xsl:when test="$conutfav &lt; 3">6</xsl:when>
                            <xsl:when test="$conutfav &gt;= 3 and $conutfav &lt;= 6">4</xsl:when>
                            <xsl:when test="$conutfav &gt; 6 and $conutfav &lt;= 8">3</xsl:when>
                            <xsl:otherwise>2</xsl:otherwise>
                          </xsl:choose>
                        </xsl:variable>

                        <xsl:if test="rows/content/form/label/lista_favoritos">
                          <div class="table-btn-list self-boxed-item">
                            <div class="self-boxed-inner" list-style="buttonlist">
                              <xsl:for-each select="rows/content/form/table/lista_favoritos/value/row">
                                <div class="btn-list-item col-sm-3 col-xs-6 col-md-{$mdclass} ">
                                  <div class="card parent-services" data-id="{id_servico_favorito}" data-menu-type="{tipo_menu_fav}">
                                   <a href="{link_favorito}" class="card-container btn-services" data-toggle="tooltip" target="_blank">
                                       <xsl:attribute name="title">
                                        <xsl:if test="string-length(link_favorito_desc) &gt;= 27">
                                          <xsl:value-of select="link_favorito_desc"/>
                                        </xsl:if>
                                      </xsl:attribute>
                                      <div class="card-icon">
                                        <xsl:if test="icon and icon != ''">
                                          <xsl:attribute name="style">
                                           <xsl:text>background-image:url('</xsl:text><xsl:value-of select="icon"/><xsl:text>')</xsl:text>
                                          </xsl:attribute>
                                        </xsl:if>
                                      </div>
                                      <span class="card-text txt-ellipsis" bg-color="1" style="background: {cor};">
                                        <i class="fa fa-plus-circle plus open-info"/>
                                        <i class="fa fa-minus-circle minus open-info"/>
                                        <xsl:value-of select="link_favorito_desc"/>
                                      </span>
                                      <span class="app-info" bg-color="1" style="background: {cor};">
                                        <xsl:value-of select="info_fav"/>
                                      </span>
                                    </a>
                                  </div>
                                </div>
                              </xsl:for-each>
                            </div>
                          </div>
                        </xsl:if>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
        <xsl:call-template name="IGRP-bottom"/>
        <iframe class="sa-nsweb invisible" style=""></iframe>
        <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js"/>
        <script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js"/>
        <script type="text/javascript" src="{$path}/app/SA/js/utils.js"/>
        <script type="text/javascript" src="{$path}/app/SA/js/app.js"/>
      </body>
    </html>
  </xsl:template>


  <xsl:include href="tmpl/SA.includes.tmpl.xsl?v=1463090556312"/>

  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
  <xsl:include href="../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
  <xsl:include href="../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312"/>
  <xsl:include href="../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312"/>
</xsl:stylesheet>
  