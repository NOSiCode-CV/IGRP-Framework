<?xml version="1.0" encoding="utf-8"?>
<gen:stylesheet xmlns:gen="http://www.w3.org/1999/XSL/Transform" xmlns:xsl="dim-red" version="1.0" exclude-result-prefixes="xsl">
  
  <gen:namespace-alias stylesheet-prefix="xsl" result-prefix="xsl"/>
  <gen:variable name="pathAttr" select="'{$path}'"/>
  <gen:variable name="bodyClass" select="'{$bodyClass}'"/>
  <gen:variable name="version" select="'{$version}'"/>
  <gen:template match="/">
    
    <xsl:stylesheet version="1.0">
      <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-system="about:legacy-compat"/>
      <xsl:template match="/">
        <xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
        <html>
          <head>
            <xsl:call-template name="IGRP-head"/>
            <gen:if test="rows/content/*[@type='tabcontent'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/tabs/igrp.tabs.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='panels'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/panels/igrp.panels.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='toolsbar'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='treemenu'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/treemenu/treemenu.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='view'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/view/igrp.view.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='formlist'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/formlist/igrp.formlist.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='formlist' or @type='separatorlist' or @type='table'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/igrp.tables.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='formlist' or @type='separatorlist'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='separatorlist'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/separatorlist/igrp.separatorlist.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='table'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='timeline'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/timeline/timeline.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='mapchart'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/highcharts/highmaps/highmap.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='chart'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/highcharts/igrp.charts.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='statbox'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/statbox/statbox.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='quickbuttonbox'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/quickbuttonbox/quickbuttonbox.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='circlestatbox'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/circlestatbox/circlestatbox.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='smallbox'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/smallbox/smallbox.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/calendar/3.0.1/css/fullcalendar.print.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/calendar/3.0.1/css/fullcalendar.min.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/calendar/3.0.1/css/igrp.calendar.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='fingerprint'] ">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/fingerprint/fingerprint.css?v={$version}"/>
            </gen:if>

            <gen:if test="rows/content/*/fields/*[@type='date']">
               <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/datepicker2/daterangepicker.css?v={$version}"/>
               <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/datepicker2/IGRP.daterangepicker.css?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[contains(@type,'select')]">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/select2/select2.min.css"/>
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/select2/select2.style.css"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[@type='color'] or rows/content/*/fields/*[@type='color_td']">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/core/igrp/table/table-colors.css"/>
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/colorpicker/css/bootstrap-colorpicker.min.css"/>
            </gen:if>
            <gen:if test="rows/content/*/fields/*[contains(@type,'vkb')]">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/virtualkeyboard/vkb.css?v={$version}"/>
            </gen:if>

            <gen:if test="rows/content/*/fields/*[contains(@type,'range')]">
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/bs.range/css/bootstrap.slider.min.css?v={$version}"/>
              <link rel="stylesheet" type="text/css" href="{$pathAttr}/plugins/bs.range/css/igrp.slider.css?v={$version}"/>
            </gen:if>

          </head>
          <body class="{$bodyClass} sidebar-off">
            <xsl:call-template name="IGRP-topmenu"/>
            <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
              <div class="container-fluid">
                <div class="row">
                  <xsl:call-template name="IGRP-sidebar"/>
                  <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                    <div class="content">
                      <!--SPLIT-->
                      <div class="row row-msg">
                        <div class="gen-column col-md-12">
                          <div class="gen-inner">
                            <xsl:apply-templates  mode="igrp-messages" select="rows/content/messages"/>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="gen-column col-md-12">
                          <div class="gen-inner">
                            <gen:for-each select="rows/content/*[@type]">
                              <gen:variable name="contentType" select="@type"/>
                              <gen:choose>
                                <gen:when test="@type = 'box'">
                                  <gen:call-template name="gen_box"/>
                                </gen:when>
                                <gen:when test="@type = 'tabcontent'">
                                  <gen:call-template name="gen_tabcontent"/>
                                </gen:when>
                                <gen:when test="@type = 'panels'">
                                  <gen:call-template name="gen_panels"/>
                                </gen:when>
                                <gen:when test="@type = 'sectionheader'">
                                  <gen:call-template name="gen_sectionheader"/>
                                </gen:when>
                                <gen:when test="@type = 'paragraph'">
                                  <gen:call-template name="gen_paragraph"/>
                                </gen:when>
                                <gen:when test="@type = 'toolsbar'">
                                  <gen:call-template name="gen_toolsbar"/>
                                </gen:when>
                                <gen:when test="@type = 'verticalmenu'">
                                  <gen:call-template name="gen_verticalmenu"/>
                                </gen:when>
                                <gen:when test="@type = 'treemenu'">
                                  <gen:call-template name="gen_treemenu"/>
                                </gen:when>
                                <gen:when test="@type = 'view'">
                                  <gen:call-template name="gen_view"/>
                                </gen:when>
                                <gen:when test="@type = 'form'">
                                  <gen:call-template name="gen_form"/>
                                </gen:when>
                                <gen:when test="@type = 'formlist'">
                                  <gen:call-template name="gen_formlist"/>
                                </gen:when>
                                <gen:when test="@type = 'separatorlist'">
                                  <gen:call-template name="gen_separatorlist"/>
                                </gen:when>
                                <gen:when test="@type = 'table'">
                                  <gen:call-template name="gen_table"/>
                                </gen:when>
                                <gen:when test="@type = 'timeline'">
                                  <gen:call-template name="gen_timeline"/>
                                </gen:when>
                                <gen:when test="@type = 'mapchart'">
                                  <gen:call-template name="gen_mapchart"/>
                                </gen:when>
                                <gen:when test="@type = 'map'">
                                  <gen:call-template name="gen_map"/>
                                </gen:when>
                                <gen:when test="@type = 'map_os'">
                                  <gen:call-template name="gen_map_os"/>
                                </gen:when>
                                <gen:when test="@type = 'chart'">
                                  <gen:call-template name="gen_chart"/>
                                </gen:when>
                                <gen:when test="@type = 'statbox'">
                                  <gen:call-template name="gen_statbox"/>
                                </gen:when>
                                <gen:when test="@type = 'quickbuttonbox'">
                                  <gen:call-template name="gen_quickbuttonbox"/>
                                </gen:when>
                                <gen:when test="@type = 'circlestatbox'">
                                  <gen:call-template name="gen_circlestatbox"/>
                                </gen:when>
                                <gen:when test="@type = 'smallbox'">
                                  <gen:call-template name="gen_smallbox"/>
                                </gen:when>
                                <gen:when test="@type = 'calendar'">
                                  <gen:call-template name="gen_calendar"/>
                                </gen:when>
                                <gen:when test="@type = 'carousel'">
                                  <gen:call-template name="gen_carousel"/>
                                </gen:when>
                                <gen:when test="@type = 'video'">
                                  <gen:call-template name="gen_video"/>
                                </gen:when>
                                <gen:when test="@type = 'iframe'">
                                  <gen:call-template name="gen_iframe"/>
                                </gen:when>
                                <gen:when test="@type = 'fingerprint'">
                                  <gen:call-template name="gen_fingerprint"/>
                                </gen:when>
                              </gen:choose>
                            </gen:for-each>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <xsl:call-template name="IGRP-bottom"/>
            </form>
            <gen:if test="rows/content/*[@type='tabcontent'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/tabs/igrp.tabs.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='panels'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/panels/igrp.panels.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='treemenu'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/treemenu/treemenu.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='form' or @type='formlist' or @type='separatorlist'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/form/igrp.forms.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='formlist' or @type='table'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/table/igrp.table.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='formlist'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/formlist/igrp.formlist.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='separatorlist'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/separatorlist/igrp.separatorlist.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='table'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='table'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
            </gen:if>

            <!--DATE JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type='date']">
              <script type="text/javascript" src="{$pathAttr}/core/moment/moment.min.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/datepicker2/daterangepicker.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/datepicker2/IGRP.daterangepicker.config.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/datepicker2/locale/dp.locale.pt.js?v={$version}"/>
            </gen:if>
            <!--SELECT JS INCLUDES-->
            
            <gen:if test="rows/content/*/fields/*[contains(@type,'select')]">
              <script type="text/javascript" src="{$pathAttr}/plugins/select2/select2.full.min.js"></script>
              <script type="text/javascript" src="{$pathAttr}/plugins/select2/select2.init.js?v={$version}"></script>
            </gen:if>
            <!--COLOR JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type='color']">
              <script type="text/javascript" src="{$pathAttr}/plugins/colorpicker/js/bootstrap-colorpicker.js"></script>
              <script type="text/javascript" src="{$pathAttr}/plugins/colorpicker/colorpicker.init.js?v={$version}"></script>
            </gen:if>
            <!--TEXTEDITOR JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type='texteditor']">
              <script type="text/javascript" src="{$pathAttr}/core/ckeditor/ckeditor.js"></script>
            </gen:if>
            <!--LOOKUP JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[contains(@type,'lookup')]">
              <script type="text/javascript" src="{$pathAttr}/plugins/lookup/igrp.lookup.js?v={$version}"></script>
            </gen:if>

            <!--range JS INCLUDES-->
            <gen:if test="rows/content/*/fields/*[@type = 'range']">
              <script type="text/javascript" src="{$pathAttr}/plugins/bs.range/bootstrap.slider.min.js?v={$version}"/>
              <script type="text/javascript" src="{$pathAttr}/plugins/bs.range/igrp.range.js?v={$version}"/>
            </gen:if>

            <gen:if test="rows/content/*/fields/*[contains(@type,'vkb')]">
              <script type="text/javascript" src="{$pathAttr}/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js?v={$version}"/>
            </gen:if>

            <gen:if test="rows/content/*[@type='mapchart' or @type='chart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/highcharts.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='mapchart' or @type='chart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/highcharts-more.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='mapchart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/highmaps/map.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='mapchart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/highmaps/data.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='mapchart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/highmaps/drilldown.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='mapchart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/highmaps/highmap.controller.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='mapchart' or @type='chart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/igrp.charts.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='map_os'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/gis/classes/gis.controller.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='map_os'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/gis/classes/gis.map.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='chart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/exporting.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='chart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/funnel.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='chart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/heatmap.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='chart'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/highcharts/treemap.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='circlestatbox'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/circlestatbox/jquery.knob.modified.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='circlestatbox'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/circlestatbox/igrp.circlestatbox.init.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <script type="text/javascript" src="{$pathAttr}/core/moment/moment.min.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <script type="text/javascript" src="{$pathAttr}/core/calendar/3.0.1/js/fullcalendar.min.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <script type="text/javascript" src="{$pathAttr}/core/calendar/3.0.1/js/locale-all.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/table/table.contextmenu.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='calendar'] ">
              <script type="text/javascript" src="{$pathAttr}/core/calendar/3.0.1/js/igrp.calendar.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='iframe'] ">
              <script type="text/javascript" src="{$pathAttr}/core/igrp/iframenav/com.iframe.js?v={$version}"/>
            </gen:if>
            <gen:if test="rows/content/*[@type='fingerprint'] ">
              <script type="text/javascript" src="{$pathAttr}/plugins/fingerprint/fingerprint.js?v={$version}"/>
            </gen:if>

            

          </body>
        </html>
      </xsl:template>
      <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1513184609983"></xsl:include>
      <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1513184609983"></xsl:include>
      <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1513184609983"></xsl:include>
      <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1513184609983"></xsl:include>
      <gen:if test="rows/content/*[@type='treemenu'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-treemenu.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='form' or @type='formlist' or @type='separatorlist'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='formlist' or @type='table'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='timeline'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-timeline.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='map'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-mapp.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='map'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-mapp.widgets.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='map_os'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-gis.map.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='chart'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='calendar'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-calendar.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='carousel'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-carousel.tmpl.xsl?v=1513184616594"/>
      </gen:if>
      <gen:if test="rows/content/*[@type='fingerprint'] ">
        <xsl:include href="../../../xsl/tmpl/IGRP-fingerprint.tmpl.xsl?v=1513184616594"/>
      </gen:if>
    </xsl:stylesheet>

  </gen:template>
  <gen:template name="gen_box" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box igrp-box-holder">
          <div class="box-body" gen-preserve-content="true">
            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_tabcontent" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="gen-tab-holder nav-tabs-custom " tab-template="default">
          <ul class="nav nav-tabs"></ul>
          <div class="tab-content"></div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_panels" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="panel-group" id="panels_1" template="default"></div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_sectionheader" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <section class="content-header">
          <h2>
            <xsl:value-of select="rows/content/{name()}/fields/{name()}_text/value"/>
          </h2>
        </section>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_paragraph" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="">
          <div class="box-body">
            <p>
              <xsl:value-of select="rows/content/{name()}/fields/{name()}_text/value"/>
            </p>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_toolsbar" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="toolsbar-holder default" gen-structure="toolsbar" gen-fields=".btns-holder&gt;a.btn">
          <div class="btns-holder pull-right" role="group">
            <xsl:apply-templates select="rows/content/{name()}" mode="gen-buttons">
              <xsl:with-param name="vertical" select="'true'"/>
              <xsl:with-param name="outline" select="'false'"/>
            </xsl:apply-templates>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_verticalmenu" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="igrp-vertical-menu" gen-fields=".list-group .btn">
          <div class="list-group" >
            <xsl:apply-templates select="rows/content/{name()}" mode="gen-buttons">
              <xsl:with-param name="vertical" select="'true'"/>
            </xsl:apply-templates>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_treemenu" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="treemenu box" gen-structure="treemenu">
          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
          <xsl:apply-templates select="rows/content/{name()}" mode="treemenu">
            <xsl:with-param name="target" select="'_blank'"/>
            <xsl:with-param name="style" select="'default'"/>
          </xsl:apply-templates>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_view" >
    <gen:variable name="tag" select="name()"/>
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box clearfix view-block" has-img="true">
          <div class="box-body">
            <xsl:if test="rows/content/{name()}/fields/{name()}_img">
              <img src="{concat('{rows/content/',name(),'/fields/',name(),'_img/value}')}"/>
            </xsl:if>
            <div class="view-body clearfix " gen-id="drop-zone" >
              
              <gen:for-each select="fields/*">

                <gen:variable name="fieldTag" select="name()"/> 

                <gen:variable name="type" select="@type"/> 

                <xsl:if test="rows/content/{$tag}/fields/{$fieldTag}">
                  <gen:choose>
                    <gen:when test="$type = 'link'">
                      <gen:variable name="viewlink" select="concat('{rows/content/',$tag,'/fields/',$fieldTag,'/value}')"/>
                      <div class="view-item">
                        <a href="{$viewlink}">
                          <gen:call-template name="gen_target_attr"/>
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/label"/>
                        </a>
                      </div>
                    </gen:when>
                    <gen:when test="@type = 'separator'">
                      <div class="view-item view-separator">
                        <span class="view">
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/label"/>
                        </span>
                      </div>
                    </gen:when>
                    <gen:otherwise>
                      <div class="view-item">
                        <span class="view-label">
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/label"/>
                        </span>
                        <span class="view-value">
                          <xsl:value-of select="rows/content/{$tag}/fields/{$fieldTag}/value"/>
                        </span>
                      </div>
                    </gen:otherwise>
                  </gen:choose>
                </xsl:if>

              </gen:for-each>

            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>

  <gen:template name="gen_form" >

    <gen:variable name="tag" select="name()"/>

    <xsl:if test="rows/content/{name()}">

      <div item-name="{name()}" class="gen-container-item">
        <div class="box igrp-forms">

          <gen:if test="@title and @title != ''">

            <xsl:call-template name="box-header">

              <xsl:with-param name="title" select="rows/content/{name()}/@title"/>

            </xsl:call-template>

          </gen:if>

          <div class="box-body">
            <div role="form" gen-id="drop-zone">
              
              <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>

              <gen:for-each select="fields/*[not(@type='hidden')]">

                <gen:variable name="fieldsClass" select="''"/>
                
                <gen:variable name="fieldTag" select="name()"/>

                <gen:variable name="path" select="concat('rows/content/',$tag,'/fields/',$fieldTag)"/>

                <gen:variable name="type" select="@type"/>

                <gen:variable name="labelPath" select="concat('rows/content/',$tag,'/fields/',$fieldTag,'/label')"/>
                
                <gen:variable name="valuePath" select="concat('rows/content/',$tag,'/fields/',$fieldTag,'/value')"/>

                <gen:variable name="isRequired" select="@required='true'"/>

                <gen:variable name="nameAttr">
                  <gen:choose>
                    <gen:when test="contains(@type,'select')">
                      <gen:value-of select="concat('{',concat('rows/content/',$tag,'/fields/',$fieldTag),'/@name','}')"/>
                    </gen:when>
                    <gen:otherwise>
                      <gen:value-of select="concat('{',$path,'/@name','}')"/>
                    </gen:otherwise>
                  </gen:choose>
                </gen:variable>

                <xsl:if test="rows/content/{$tag}/fields/{$fieldTag}">
                  
                <gen:choose>
                  <!-- plaintext.form -->
                  <gen:when test="$type='plaintext'">
                    <div class="col-md-12 clearfix clear form-group" item-name="{$fieldTag}" item-type="{$type}">
                      <xsl:value-of select="{$valuePath}"/>
                    </div>
                  </gen:when>
                  
                  <!-- date.form -->
                  <gen:when test="$type='date'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="isRequiredClass">
                        <gen:with-param name="isRequired" select="$isRequired"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group">
                        <input type="text" value="{concat('{',$valuePath,'}')}" data-range="false" class="form-control gen-date-picker " id="{$nameAttr}" name="{$nameAttr}" format="">
                          <gen:call-template name="gen_fields_attr">
                            <gen:with-param name="fieldPath" select="$path"/>
                          </gen:call-template>
                        </input>
                        <span class="datepicker-clear fa fa-times"/>
                        <span class="input-group-btn gen-date-icon">
                          <a class="btn btn-default">
                            <i class="fa fa-calendar"/>
                          </a>
                        </span>
                      </div>
                    </div>

                  </gen:when>
                  <!-- select.form -->
                  <gen:when test="contains($type,'select')">
                    <gen:variable name="change">
                      <gen:if test="contains($type,'change')">IGRP_change</gen:if>
                    </gen:variable>
                    <div class="form-group col-sm-4 " item-name="{name()}" item-type="select">
                      <gen:call-template name="isRequiredClass">
                        <gen:with-param name="isRequired" select="$isRequired"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <select class="form-control select2 {$change} {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}" >
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <xsl:for-each select="{$path}/list/option">
                          <option value="{'{value}'}">
                            <xsl:if test="@selected='true'">
                              <xsl:attribute name="selected">selected</xsl:attribute>
                            </xsl:if>
                            <span>
                              <xsl:value-of select="text"/>
                            </span>
                          </option>
                        </xsl:for-each>
                      </select>
                    </div>
                  </gen:when>
                  
                  <!-- link.form -->
                  <gen:when test="$type='link'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:if test="$isSeparatorList = 'true'">
                        <input type="hidden" label="{concat('{',$labelPath,'}')}" name="{$nameAttr}" value="{concat('{',$valuePath,'}')}" style="display:none;" class="{$fieldsClass}"/>
                      </gen:if>
                      <a href="{concat('{',$valuePath,'}')}" class="link form-link">
                        <gen:call-template name="gen_target_attr"/>
                        <xsl:value-of select="{$labelPath}"/>
                      </a>
                    </div>
                  </gen:when>

                  <!-- textarea.form -->
                  <gen:when test="$type='textarea'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="isRequiredClass">
                        <gen:with-param name="isRequired" select="$isRequired"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <textarea name="{$nameAttr}" class="textarea form-control {$fieldsClass}" >
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <xsl:value-of select="{$valuePath}"/>
                      </textarea>
                    </div>
                  </gen:when>

                  <!-- checkbox.form -->
                  <gen:when test="$type='checkbox'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="isRequiredClass">
                          <gen:with-param name="isRequired" select="$isRequired"/>
                        </gen:call-template>
                        <div class="checkbox form-check-offset">
                          <label>
                            <input type="checkbox" name="{$nameAttr}" value="1" class="checkbox {$fieldsClass}">
                              <gen:call-template name="gen_fields_attr">
                                <gen:with-param name="fieldPath" select="$path"/>
                              </gen:call-template>
                              <xsl:if test="{$valuePath} = '1'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                            </input>
                            <xsl:value-of select="{$labelPath}"/>
                          </label>
                        </div>
                      </div>
                    </div>
                  </gen:when>

                  <!-- radio.form -->
                  <gen:when test="$type='radio'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="isRequiredClass">
                          <gen:with-param name="isRequired" select="$isRequired"/>
                        </gen:call-template>
                        <div class="radio form-check-offset">
                          <label>
                            <input type="radio" name="{$nameAttr}" value="1" class="radio {$fieldsClass}">
                              <gen:call-template name="gen_fields_attr">
                                <gen:with-param name="fieldPath" select="$path"/>
                              </gen:call-template>
                              <xsl:if test="{$valuePath} = '1'">
                                <xsl:attribute name="checked">checked</xsl:attribute>
                              </xsl:if>
                            </input>
                            <xsl:value-of select="{$labelPath}"/>
                          </label>
                        </div>
                      </div>
                    </div>
                  </gen:when>

                  <!-- checkboxlist.form -->
                  <gen:when test="$type='checkboxlist'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <label for="{'{../@name}'}">
                          <xsl:value-of select="{$labelPath}"/>
                        </label>
                        <xsl:for-each select="{$path}/list/option">
                          <div class="checkbox">
                            <label>
                              <input type="checkbox" name="{'{../@name}'}" value="{'{value}'}" class="checkboxlist {$fieldsClass}" label="{'{text}'}">
                                <gen:call-template name="gen_fields_attr">
                                  <gen:with-param name="fieldPath" select="$path"/>
                                </gen:call-template>
                                <xsl:if test="@selected='true'">
                                  <xsl:attribute name="checked">checked</xsl:attribute>
                                </xsl:if>
                              </input>
                              <span>
                                <xsl:value-of select="text"/>
                              </span>
                            </label>
                          </div>
                        </xsl:for-each>
                      </div>
                    </div>
                  </gen:when>

                  <!-- radio.form -->
                  <gen:when test="$type='radiolist'">
                    <div class="col-sm-4" item-name="{name()}" item-type="{$type}">
                      <div class="form-group">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                        <label for="{$nameAttr}">
                          <xsl:value-of select="{$labelPath}"/>
                        </label>
                        <xsl:for-each select="{$path}/list/option">
                          <div class="radio">
                            <label>
                              <input type="radio" name="{'{../@name}'}" value="{'{value}'}" class="checkboxlist {$fieldsClass}" label="{'{text}'}">
                                <gen:call-template name="gen_fields_attr">
                                  <gen:with-param name="fieldPath" select="$path"/>
                                </gen:call-template>
                                <xsl:if test="@selected='true'">
                                  <xsl:attribute name="checked">checked</xsl:attribute>
                                </xsl:if>
                              </input>
                              <span>
                                <xsl:value-of select="text"/>
                              </span>
                            </label>
                          </div>
                        </xsl:for-each>
                      </div>
                    </div>
                  </gen:when>

                  <!-- file.form -->
                  <gen:when test="$type='file'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group">
                        <input type="text" class="form-control not-form {$fieldsClass}" readonly=""/>
                        <span class="input-group-btn">
                          <span class="btn btn-default file-btn-holder">
                            <i class="fa fa-upload"></i>
                            <input id="{$nameAttr}" name="{$nameAttr}" value="{concat('{',$valuePath,'}')}" class="transparent {$fieldsClass}" type="file" multiple="">
                              <gen:call-template name="gen_fields_attr">
                                <gen:with-param name="fieldPath" select="$path"/>
                              </gen:call-template>
                            </input>
                          </span>
                        </span>
                      </div>
                    </div>
                  </gen:when>

                  <!-- color.form -->
                  <gen:when test="$type='color'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group form-color-picker" id="{$nameAttr}_colorp">
                        <input type="text" value="{concat('{',$valuePath,'}')}" format="hex" class="form-control {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}">
                          <gen:call-template name="gen_fields_attr">
                            <gen:with-param name="fieldPath" select="$path"/>
                          </gen:call-template>
                        </input>
                        <span class="input-group-addon">
                          <i></i>
                        </span>
                      </div>
                    </div>
                  </gen:when>

                  <!-- image.form / img.form-->
                  <gen:when test="$type='image' or $type='img' ">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <img style="height:auto;width:100%;position:relative;display:block;" src="{concat('{',$valuePath,'}')}"/>
                    </div>
                  </gen:when>
                  <!-- separator.form -->
                  <gen:when test="$type='separator' or $type='group'">
                    <div class="box-head subtitle clearfix" item-name="{name()}" item-type="{$type}">
                      <span text-color="1">
                        <xsl:value-of select="{$labelPath}"/>
                      </span>
                    </div>
                  </gen:when>
                  <!-- virtualkeyboard.form -->
                  <gen:when test="$type='virtualkeyboard' or contains(@type,'vkb_')">
                    <gen:variable name="vkbType">
                      <gen:choose>
                        <gen:when test="@type = 'vkb_all'">vkb_aznum</gen:when>
                        <gen:otherwise>
                          <gen:value-of select="@type"/>
                        </gen:otherwise>
                      </gen:choose>
                    </gen:variable>
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:variable name="vkbRel" select="concat($valuePath,'/@name')"/>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <xsl:call-template name="VirtualKeyBoard">
                        <xsl:with-param name="type" select="'{$vkbType}'"/>
                        <xsl:with-param name="rel" select="{$vkbRel}"/>
                        <xsl:with-param name="input_type" select="'password'"/>
                        <xsl:with-param name="input_name" select="{$vkbRel}"/>
                        <xsl:with-param name="id" select="{$vkbRel}"/>
                      </xsl:call-template>
                    </div>
                  </gen:when>
                  <!-- texteditor.form -->
                  <gen:when test="$type='texteditor'">
                    <div class="form-group col-md-12" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <textarea id="{$nameAttr}" name="{$nameAttr}" class="gen-texteditor {$fieldsClass}">
                        <xsl:value-of select="{$valuePath}" disable-output-escaping="yes"/>
                      </textarea>
                    </div>
                  </gen:when>

                  <!-- lookup.form -->
                  <gen:when test="contains($type,'lookup') or contains($type,'LOOKUP')">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <div class="input-group">
                        <input type="text" value="{concat('{',$valuePath,'}')}" class="form-control gen-lookup {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}" >
                          <gen:call-template name="gen_fields_attr">
                            <gen:with-param name="fieldPath" select="$path"/>
                          </gen:call-template>
                        </input>
                        <gen:call-template name="gen_lookup">
                          <gen:with-param name="type" select="$type"/>
                          <gen:with-param name="name" select="concat($path,'/@name')"/>
                          <gen:with-param name="js_lookup" select="concat($path,'/lookup/',name())"/>
                          <gen:with-param name="id" select="concat($path,'/@name')"/>
                        </gen:call-template>
                      </div>
                    </div>
                  </gen:when>

                  <gen:when test="$type = 'range'">
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <input type="{$type}" value="{concat('{',$valuePath,'}')}" class="form-control {$fieldsClass} igrp-range" id="{$nameAttr}" name="{$nameAttr}">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                      </input>
                    </div>
                  </gen:when>

                  <gen:otherwise>
                    <div class="form-group col-sm-4" item-name="{name()}" item-type="{$type}">
                      <gen:call-template name="gen_fields_attr">
                        <gen:with-param name="fieldPath" select="$path"/>
                      </gen:call-template>
                      <label for="{$nameAttr}">
                        <xsl:value-of select="{$labelPath}"/>
                      </label>
                      <input type="{$type}" value="{concat('{',$valuePath,'}')}" class="form-control {$fieldsClass}" id="{$nameAttr}" name="{$nameAttr}">
                        <gen:call-template name="gen_fields_attr">
                          <gen:with-param name="fieldPath" select="$path"/>
                        </gen:call-template>
                      </input>
                    </div>
                  </gen:otherwise>

                </gen:choose>

         

                </xsl:if>

              </gen:for-each>

            </div>
          </div>
          <xsl:apply-templates select="rows/content/{name()}/tools-bar" mode="form-buttons"/>
        </div>
      </div>
    </xsl:if>
  </gen:template>

  <gen:template name="gen_formlist" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box box-table-contents">
          <div class="box-body table-box">
            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
            <table id="{name()}" class="table table-striped gen-data-table IGRP_formlist " rel="T_{name()}" data-control="data-{name()}">
              <thead>
                <tr gen-id="drop-zone" gen-field-template="table.th">
                  <xsl:if test="not(rows/content/{name()}/table/value/row[position() = 1]/@noupdate) or not(rows/content/{name()}/table/value/row[position() = 1]/@nodelete)" >
                    <th class="table-btn add">
                      <xsl:if test="not(rows/content/{name()}/table/value/row[position() = 1]/@noupdate)">
                        <a class="formlist-row-add btn btn-primary" rel="{name()}">
                          <i class="fa fa-plus"></i>
                        </a>
                      </xsl:if>
                    </th>
                  </xsl:if>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="rows/content/{name()}/table/value/row">
                  <tr gen-id="drop-zone" row="{position()}">
                    <input type="hidden" name="p_{name()}_id" value="{concat('{',name(),'_id }')}" />
                    <gen-template name="table-rows-hiddens"/>
                    <xsl:if test="not(@nodelete) or not(@noupdate)" >
                      <td class="table-btn delete" data-row="{position()}">
                        <xsl:if test="not(@nodelete)">
                          <span class="formlist-row-remove btn btn-danger" rel="{name()}">
                            <i class="fa fa-times"></i>
                          </span>
                        </xsl:if>
                      </td>
                    </xsl:if>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>

  <gen:template name="gen_separatorlist" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box">
          <div class="box-body IGRP-separatorlist" tag="{name()}" dialog="false">
            <div class="splist-form-holder">
              <div class="splist-form" role="form" gen-id="drop-zone" gen-field-template="form.field">
                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
              </div>
            </div>
            <div class="table-box box-body box-table-contents splist-table">
              <table rel="T_{name()}" id="{name()}" class="table table-striped gen-data-table">
                <thead>
                  <tr gen-id="drop-zone" gen-field-template="th">
                    <th class="table-btn">
                      <a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left" >
                        <i class="fa fa-plus"/>
                      </a>
                    </th>
                  </tr>
                </thead>
                <tbody>
                  <xsl:for-each select="rows/content/{name()}/table/value/row">
                    <tr gen-id="drop-zone" gen-field-template="td">
                      <td data-row="{position()}" class="table-btn" >
                        <xsl:if test="not(@noupdate)">
                          <span class="table-row-edit btn btn-default " rel="{name()}">
                            <i class="fa fa-pencil"></i>
                          </span>
                        </xsl:if>
                        <xsl:if test="not(@nodelete)">
                          <span class="table-row-remove btn btn-danger" rel="{name()}">
                            <i class="fa fa-times"></i>
                          </span>
                        </xsl:if>
                      </td>
                      <input type="hidden" class="sl-row-id" name="p_{name()}_id" value="{concat('{',name(),'_id }')}" />
                      <gen-template name="table-rows-hiddens"/>
                    </tr>
                  </xsl:for-each>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>

  <gen:template name="gen_table" >

    <gen:variable name="tag" select="name()"/>

    <gen:variable name="hasContextMenu">
      <gen:if test="table/context-menu">IGRP_contextmenu</gen:if>
    </gen:variable>

    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box box-table-contents">

          <gen:if test="@title and @title != ''">

            <xsl:call-template name="box-header">

              <xsl:with-param name="title" select="rows/content/{name()}/@title"/>

            </xsl:call-template>
            
          </gen:if>

          <div class="box-body ">
            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
            <div class="table-contents-head">
              <div class="table-contents-inner"></div>
            </div>
            <div class="table-box">
              <div class="table-box-inner">
                <table id="{name()}" class="table table-striped {$hasContextMenu} igrp-data-table">
                  <thead>
                    <tr gen-id="drop-zone" gen-field-template="th">
                        
                        <gen:for-each select="fields/*[not(@type='hidden')]">

                          <gen:variable name="fieldTag" select="name()"/>

                          <gen:variable name="fieldPath" select="concat( 'rows/content/',$tag,'/fields/',$fieldTag )"/>
                          
                          <xsl:if test="rows/content/{$tag}/fields/{$fieldTag}">

                            <th item-name="{name()}" item-type="{@type}">
                              <gen:choose>
                                <!-- radio.table th-->
                                <gen:when test="@type = 'radio'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <gen:attribute name="class">bs-checkbox</gen:attribute>
                                  <xsl:value-of select="{$fieldPath}/label"/>
                                </gen:when>
                                <!-- checkbox.table th-->
                                <gen:when test="@type = 'checkbox'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <gen:attribute name="class">bs-checkbox</gen:attribute>
                                  <span class="checkbox-label">
                                    <xsl:value-of select="{$fieldPath}/label"/>
                                  </span>
                                  <input type="checkbox" class="IGRP_checkall no-validation" title="" check-rel="{name()}"/>
                                </gen:when>
                                <!-- color.table th-->
                                <gen:when test="@type = 'color'">
                                  <gen:attribute name="class">color-th</gen:attribute>
                                  <xsl:value-of select="{$fieldPath}/label"/>
                                </gen:when>
                                <!-- default.table th-->
                                <gen:otherwise>
                                  <xsl:value-of select="{$fieldPath}/label"/>
                                </gen:otherwise>

                              </gen:choose>
                            </th>                          
                          </xsl:if>
                        </gen:for-each>

                        <gen:if test="table/context-menu">
                             <th class="igrp-table-ctx-th"></th>
                          </gen:if>

                    </tr>
                  </thead>
                  <tbody>
                    <xsl:for-each select="rows/content/{name()}/table/value/row[not(@total='yes')]">

                      <tr gen-id="drop-zone">

                        <xsl:apply-templates mode="context-param" select="context-menu" />

                        <gen:for-each select="fields/*[not(@type='hidden')]">
 
                          <gen:variable name="fname" select="name()"></gen:variable>
                          
                          <xsl:if test="{name()}">

                            <td item-name="{name()}" item-type="{@type}" data-row="{'{position()}'}" data-title="{concat('{../../../fields/',name(),'/label }')}">
                              
                              <gen:variable name="fvalue" select="concat('{',name(),'}')"/>

                              <gen:choose>
                                <!-- checkbox.table td-->
                                <gen:when test="@type = 'checkbox'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <xsl:if test="{name()} != '-0'">
                                    <input type="checkbox" name="p_{$fname}" value="{$fvalue}" check-rel="{name()}">
                                      <xsl:if test="{name()}_check={name()}">
                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                      </xsl:if>
                                    </input>
                                  </xsl:if>
                                </gen:when>
                                <!-- radio.table td-->
                                <gen:when test="@type = 'radio'">
                                  <gen:attribute name="align">center</gen:attribute>
                                  <xsl:if test="{name()} != '-0'">
                                    <input type="radio" name="p_{$fname}" value="{$fvalue}" check-rel="{name()}">
                                      <xsl:if test="{name()}_check={name()}">
                                        <xsl:attribute name="checked">checked</xsl:attribute>
                                      </xsl:if>
                                    </input>
                                  </xsl:if>
                                </gen:when>
                                <!-- link.table td-->
                                <gen:when test="@type = 'link'">
                                  <xsl:choose>
                                    <xsl:when test="{name()} != ''">
                                      <a href="{$fvalue}" class="link bClick" name="{name()}">
                                        <gen:call-template name="gen_target_attr"/>
                                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                      </a>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <span>
                                        <xsl:value-of select="{name()}_desc" disable-output-escaping="yes"/>
                                      </span>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </gen:when>
                                <!-- color.table td-->
                                <gen:when test="contains(@type,'color')">
                                 <xsl:call-template name="tdcolor">
                                    <xsl:with-param name="color" select="{name()}"/>
                                  </xsl:call-template>
                                </gen:when>
                                <!-- default.table td-->
                                <gen:otherwise>
                                  <span>
                                    <gen:if test="@lookup_parser='true'">
                                      <gen:attribute name="class">lookup-parser</gen:attribute>
                                    </gen:if>
                                    <xsl:value-of select="{name()}"/>
                                  </span>
                                </gen:otherwise>
                              </gen:choose>

                            </td>

                          </xsl:if>

                        </gen:for-each>

                        <gen:if test="table/context-menu">
                          <td class="igrp-table-ctx-td" >
                            <xsl:apply-templates select="../../context-menu" mode="table-context-inline">
                              <xsl:with-param name="row-params" select="context-menu"/>
                              <xsl:with-param name="use-fa" select="'true'"/>
                            </xsl:apply-templates>
                          </td>
                        </gen:if>

                      </tr>
                    </xsl:for-each>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>

  <gen:template name="gen_timeline" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="time-line box clean" gen-structure="timeline">
          <xsl:apply-templates mode="IGRP-timeline" select="rows/content/{name()}" >
            <xsl:with-param name="themes" select="'hexa-theme'"/>
            <xsl:with-param name="bg" select="'cp-cyan'"/>
          </xsl:apply-templates>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_mapchart" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box">
          <div class="box-body">
            <div id="highmap-{name()}" class="igrp-highmaps" style="margin: 0 auto" map-height="420" basemap="{ concat( '{rows/content/',name(),'/fields/',name(),'_basemap/value }' ) }" data="{ concat( '{rows/content/',name(),'/fields/',name(),'_data/value }' ) }" config="{ concat( '{rows/content/',name(),'/fields/',name(),'_config/value }' ) }" tooltip="true" legend-position="bottom" legend-size="2">
              <tooltip-format>{point.name}: {point.value}</tooltip-format>
            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_map" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box igrp-redgis-map" >
          <div class="box-body" style="padding: 0;">
            <div style="position: relative;min-height: 400px;background:white;">
              <xsl:call-template name="igrp-mapp">
                <xsl:with-param name="url"  select="rows/content/{name()}/fields/{name()}_url/value"/>
              </xsl:call-template>
            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_map_os" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box igrp-gis-map" >
          <xsl:call-template name="gis-map-view">
            <xsl:with-param name="id" select="'{name()}'"/>
            <xsl:with-param name="type" select="'openlayers'"/>
          </xsl:call-template>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_chart" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box" gen-structure="graphic">
          <xsl:call-template name="box-header">
            <xsl:with-param name="title" select="rows/content/{name()}/@title"/>
            <xsl:with-param name="collapsible" select="'false'"/>
            <xsl:with-param name="collapsed" select="'false'"/>
          </xsl:call-template>
          <div class="box-body">
            <xsl:call-template name="igrp-graph">
              <xsl:with-param name="table" select="rows/content/{name()}" />
              <xsl:with-param name="chart_type" select="rows/content/{name()}/chart_type"/>
              <xsl:with-param name="height" select="'250'"/>
              <xsl:with-param name="title" select="'Chart'"/>
              <xsl:with-param name="url" select="rows/content/{name()}/url"/>
            </xsl:call-template>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_statbox" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="statbox_container">
          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
          <div class="statbox { concat( '{rows/content/',name(),'/fields/',name(),'_bg/value }' ) }">
            <div class="boxchart">
              <canvas ></canvas>
            </div>
            <div class="number">
              <xsl:value-of select="rows/content/{name()}/fields/{name()}_val/value"/>
              <i class="fa { concat( '{rows/content/',name(),'/fields/',name(),'_icn/value }' ) }" aria-hidden="true"></i>
            </div>
            <div class="title">
              <xsl:value-of select="rows/content/{name()}/fields/{name()}_tit/value"/>
            </div>
            <div class="footer">
              <a href="{ concat( '{rows/content/',name(),'/fields/',name(),'_url/value }' ) }" target="modal">
                <xsl:value-of select="rows/content/{name()}/fields/{name()}_txt/value"/>
              </a>
            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_quickbuttonbox" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="quick-button-box">
          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
          <a href="{ concat( '{rows/content/',name(),'/fields/',name(),'_url/value }' ) }" target="modal" class="quick-button metro { concat( '{rows/content/',name(),'/fields/',name(),'_bg/value }' ) }">
            <i class="fa { concat( '{rows/content/',name(),'/fields/',name(),'_icn/value }' ) }" aria-hidden="true"></i>
            <p>
              <xsl:value-of select="rows/content/{name()}/fields/{name()}_tit/value"/>
            </p>
            <span class="badge">
              <xsl:value-of select="rows/content/{name()}/fields/{name()}_val/value"/>
            </span>
          </a>
        </div >
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_circlestatbox" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="circlestatbox-container csb-small">
          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
          <div class="circlestatbox { concat( '{rows/content/',name(),'/fields/',name(),'_bg/value }' ) }">
            <div class="header">
              <xsl:value-of select="rows/content/{name()}/fields/{name()}_tit/value"/>
            </div>
            <span class="percent">
              <xsl:value-of select="rows/content/{name()}/fields/{name()}_lbl/value"/>
            </span>
            <div class="circleStat">
              <input type="text" value="{ concat( '{rows/content/',name(),'/fields/',name(),'_val/value }' ) }" size="small" class="circlestats-chart" readonly="readonly"/>
            </div>
            <div class="footer">
              <a class="clickable" target="modal" style="display: block;" href="{ concat( '{rows/content/',name(),'/fields/',name(),'_url/value }' ) }">
                <span class="description">
                  <xsl:value-of select="rows/content/{name()}/fields/{name()}_desc/value"/>
                </span>
              </a>
            </div>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_smallbox" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="small-box panel { concat( '{rows/content/',name(),'/fields/',name(),'_bg/value }' ) }" >
          <xsl:apply-templates mode="form-hidden-fields" select="rows/content/{name()}/fields"/>
          <div class="panel-heading clearfix">
            <div class="sb-icon">
              <i class="fa { concat( '{rows/content/',name(),'/fields/',name(),'_icn/value }' ) } fa-3x"></i>
            </div>
            <div class="col-xs-12 text-right pull-right sb-contents">
              <div class="huge">
                <xsl:value-of select="rows/content/{name()}/fields/{name()}_val/value"/>
              </div>
              <div>
                <xsl:value-of select="rows/content/{name()}/fields/{name()}_tit/value"/>
              </div>
            </div>
          </div>
          <xsl:if test="rows/content/{name()}/fields/{name()}_lbl/value and rows/content/{name()}/fields/{name()}_lbl/value != ''">
            <a href="{ concat( '{rows/content/',name(),'/fields/',name(),'_url/value }' ) }" target="modal" class="{ concat( '{rows/content/',name(),'/fields/',name(),'_bg/value }' ) }-text">
              <div class="panel-footer">
                <span class="pull-left">
                  <xsl:value-of select="rows/content/{name()}/fields/{name()}_lbl/value"/>
                </span>
                <span class="pull-right">
                  <i class="fa fa-arrow-circle-right"></i>
                </span>
                <div class="clearfix"></div>
              </div>
            </a>
          </xsl:if>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_calendar" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="box">
          <div class="box-body">
            <xsl:apply-templates mode="IGRP-calendar" select="rows/content/{name()}">
              <xsl:with-param name="id" select="'{name()}'"/>
              <xsl:with-param name="lang" select="rows/content/{name()}/fields/{name()}_lang/value"/>
              <xsl:with-param name="editevents" select="'RED.'"/>
              <xsl:with-param name="addevents" select="rows/content/{name()}/fields/{name()}_add/value"/>
              <xsl:with-param name="alleditevents" select="rows/content/{name()}/fields/{name()}_edit/value"/>
              <xsl:with-param name="defaultview" select="rows/content/{name()}/fields/{name()}_view/value"/>
              <xsl:with-param name="defaultdate" select="rows/content/{name()}/fields/{name()}_date/value"/>
              <xsl:with-param name="views" select="''"/>
              <xsl:with-param name="header" select="''"/>
            </xsl:apply-templates>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_carousel" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div id="{name()}" class="carousel slide" data-ride="carousel" gen-fields=".carousel-inner .item">
          <xsl:apply-templates select="rows/content/{name()}" mode="igrp-carousel">
            <xsl:with-param name="id" select="'{name()}'"/>
          </xsl:apply-templates>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_video" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="">
          <div class="box-body">
            <iframe style="height:200px" src="{concat( '{ rows/content/',name(),'/fields/',name(),'_text/value }' )}" frameborder="0" allowfullscreen=""></iframe>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_iframe" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="igrp-iframe ">
          <div class="box-body">
            <iframe id="id-{name()}" style="min-height:250px" src="{ concat( '{rows/content/',name(),'/fields/',name(),'_src/value }' ) }"></iframe>
          </div>
        </div>
      </div>
    </xsl:if>
  </gen:template>
  <gen:template name="gen_fingerprint" >
    <xsl:if test="rows/content/{name()}">
      <div item-name="{name()}" class="gen-container-item">
        <div class="fingerprint box" gen-structure="fingerprint">
          <xsl:call-template name="box-header">
            <xsl:with-param name="title" select="rows/content/{name()}/@title"/>
            <xsl:with-param name="collapsible" select="'false'"/>
            <xsl:with-param name="collapsed" select="'false'"/>
          </xsl:call-template>
          <xsl:call-template name="fingerprint">
            <xsl:with-param name="fp" select="rows/content/{name()}/fields"/>
          </xsl:call-template>
        </div>
      </div>
    </xsl:if>
  </gen:template>

  <gen:template name="gen_target_attr">
    <gen:attribute name="target">
      <gen:choose>
        <gen:when test="@target">
          <gen:choose>
            <gen:when test="@target = '_self'">_selfOld</gen:when>
            <gen:otherwise>
              <gen:value-of select="@target"/>
            </gen:otherwise>
          </gen:choose>
        </gen:when>
        <gen:otherwise>_blank</gen:otherwise>
      </gen:choose>
    </gen:attribute>
  </gen:template>

  <gen:template name="isRequiredClass">
    
    <gen:param name="isRequired" select="false()"/>

    <gen:if test="$isRequired">
      <gen:attribute name="required">required</gen:attribute>
    </gen:if>
    
  </gen:template>

  <gen:template name="gen_fields_attr">
    <gen:param name="fieldPath"/>

    <gen:if test="./@required = 'true'">
      <gen:attribute name="required">required</gen:attribute>
    </gen:if>
    
    <gen:if test="./@maxlength">
      <gen:attribute name="maxlength"><gen:value-of select="./@maxlength"/></gen:attribute>
    </gen:if>

    <gen:if test="./@readonly='readonly' or ./@readonly='true'">
      <gen:attribute name="readonly">readonly</gen:attribute>
    </gen:if>

    <gen:if test="./@change='true'">
      <gen:attribute name="change">true</gen:attribute>
    </gen:if>

    <gen:if test="./@disabled='true' or ./@disabled='disabled'">
      <gen:attribute name="disabled">disabled</gen:attribute>
    </gen:if>

    <xsl:call-template name="setAttributes">
      <xsl:with-param name="field" select="{$fieldPath}"/>
    </xsl:call-template>


  </gen:template>


  <gen:template name="gen_lookup">
    <gen:param name="type" select="'LOOKUP'"/>
    <gen:param name="name"/>
    <gen:param name="js_lookup"/>
    <gen:param name="id"/>
    <xsl:call-template name="lookup-tool">
      <gen:variable name="isDefault">
        <gen:if test="$type='LOOKUP'">true</gen:if>
      </gen:variable>
      <gen:variable name="page">
        <gen:choose>
          <gen:when test="$isDefault='true'">rows/page</gen:when>
          <gen:otherwise>'LOOKUP'</gen:otherwise>
        </gen:choose>
      </gen:variable>
      <gen:variable name="action">
        <gen:choose>
          <gen:when test="$isDefault='true'">LOOKUP</gen:when>
          <gen:otherwise>
            <gen:value-of select="$type"/>
          </gen:otherwise>
        </gen:choose>
      </gen:variable>
      <xsl:with-param name="page" select="{$page}"/>
      <gen:if test="$isDefault='true'">
        <xsl:with-param name="ad_hoc" select="'1'"/>
      </gen:if>
      <xsl:with-param name="action" select="'{$action}'"/>
      <xsl:with-param name="name" select="{$name}"/>
      <xsl:with-param name="js_lookup" select="{$js_lookup}"/>
      <xsl:with-param name="input-id" select="{$id}"/>
      <xsl:with-param name="btnClass" select="'primary'"/>
    </xsl:call-template>
  </gen:template>

</gen:stylesheet>