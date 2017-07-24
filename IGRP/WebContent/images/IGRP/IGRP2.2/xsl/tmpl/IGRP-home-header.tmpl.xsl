<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template name="home-header">
    <meta http-equiv="X-UA-Compatible" content="IE=10" />
    <meta http-equiv="X-UA-Compatible" content="chrome=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0" />
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link REL="SHORTCUT ICON" HREF="{$path_tmpl_default}/img/icon/favicon.ico" />
    <title><xsl:value-of select="rows/title" /></title>
    <link media="all" type="text/css" href="{$path_tmpl_default}/css/IGRP-reset.css?v={$version}" rel="stylesheet"/>
    <link media="all" type="text/css" href="{$path}/extensions/ckeditor/sample.css?v={$version}" rel="stylesheet"/>
    <link media="all" type="text/css" href="{$path}/extensions/dateTimePicker/css/datetimepicker.css?v={$version}" rel="stylesheet"/>
    <link media="all" type="text/css" href="{$path}/extensions/colorPicker/css/colorPicker.css?v={$version}" rel="stylesheet"/>
    <link media="all" type="text/css" href="{$path_tmpl_default}/css/chosen.css?v={$version}" rel="stylesheet"/>
    <link media="all" type="text/css" href="{$path_tmpl_default}/css/IGRP-style.css?v={$version}" rel="stylesheet"/>
    <link media="all" type="text/css" href="{$path_tmpl_default}/css/IGRP-desktop.css?v={$version}" rel="stylesheet"/>
    <link media="all and (max-width:1023px)" type="text/css" href="{$path_tmpl_default}/css/IGRP-tabletStyle.css?v={$version}" rel="stylesheet"/>
    <link media="all and (max-width:500px)" type="text/css" href="{$path_tmpl_default}/css/IGRP-mobileStyle.css?v={$version}" rel="stylesheet"/>
    <link media="all and (max-width:780px)" type="text/css" href="{$path_tmpl_default}/css/IGPR-tableResponsive.css?v={$version}" rel="stylesheet"/>
    <link media="all" type="text/css" href="{$path_tmpl}/css/IGRP-theme.css?v={$version}" rel="stylesheet"/>
    
    <!--script javascript--> 
    <!--[if lt IE 9]>
     <script type="text/javascript" src="{$path}/js/jquery-1.9.0.min.js"></script>
    <![endif]--> 
    <!--[if gte IE 9]><!--> 
    <script type="text/javascript" src="{$path}/js/jquery-2.1.1.min.js"></script> 
    <!--[endif]--> 
    <!--Variaveis JS que recebem valores do XML-->
    <xsl:call-template name="JSlog_messages"/>
    <!--JS Validetions-->
    <xsl:apply-templates mode="js_validation" select="rows/content/js_validation"/>
    <!-- XML XSL JS T --> 
    <script type="text/javascript" src="{$path}/js/xml.xsl.transform.js"></script>
        
    <script type="text/javascript" src="{$path}/extensions/ckeditor/ckeditor.js"></script> 
    <script type="text/javascript" src="{$path}/extensions/ckeditor/adapters/jquery.js"></script> 
    <script type="text/javascript" src="{$path}/extensions/highcharts/js/highcharts.js"></script>
    <script type="text/javascript" src="{$path}/extensions/highcharts/js/highcharts-more.js"></script> 
    <script type="text/javascript" src="{$path}/extensions/highcharts/js/exporting.js"></script> 
    <script type="text/javascript" src="{$path}/extensions/highcharts/js/funnel.js"></script> 
    
    <!--VALIDATE --> 
    <script type="text/javascript" src="{$path}/js/jquery.validate.min.js"></script> 
    <script type="text/javascript" src="{$path}/js/IGRP.validate.messages.js?v={$version}"></script> 
    <!--CONFIRR JQUERY UI--> 
    <script type="text/javascript" src="{$path}/extensions/ui/jquery-ui.js"></script> 
    <!-- VIRTUALKEYBOARD-->
    <script type="text/javascript" src="{$path}/js/IGRP.virtualkeyBoard.init.js?v={$version}" charset="utf-8"></script>
    <!--SAM--> 
    <script type="text/javascript" src="{$path}/extensions/nosiSam/js/NosiSAM.js?v={$version}"></script>
    <script type="text/javascript" src="{$path}/extensions/nosiSam/js/NosiSAMLogin.js?v={$version}"></script>
    <!--HANDLER GLOBAL FUNCTION JS IGRP--> 
    <script type="text/javascript" src="{$path}/js/IGRP.handler.js?v={$version}"></script> 
    <script type="text/javascript" src="{$path}/js/IGRP.page.controller.init.js?v={$version}"></script> 
    <!-- DATETIMEPICKER --> 
    <script type="text/javascript" src="{$path}/extensions/dateTimePicker/js/datetimepicker.js"></script> 
    <script type="text/javascript" src="{$path}/js/IGRP.dateTimePicker.init.js?v={$version}"></script> 
    <!-- CHOSEN --> 
    <script type="text/javascript" src="{$path}/js/chosen.jquery.min.js"></script> 
    <script type="text/javascript" src="{$path}/js/IGRP.chosen.init.js?v={$version}"></script> 
    <!--COlORPICKER--> 
    <script type="text/javascript" src="{$path}/extensions/colorPicker/js/colorPicker.js"></script> 
    <script type="text/javascript" src="{$path}/js/IGRP.colorPicker.init.js?v={$version}"></script> 
    <!--TABLE--> 
    <script type="text/javascript" src="{$path}/extensions/slizy/js/sly.min.js?v={$version}"></script>
    <script type="text/javascript" src="{$path}/js/IGRP.table.init.js?v={$version}"></script> 
    <!--FORM LISTA--> 
    <script type="text/javascript" src="{$path}/js/IGRP.formLista.init.js?v={$version}"></script> 
    <!--SEPARATOR LISTA AND DIALOG--> 
    <script type="text/javascript" src="{$path}/js/IGRP.separatorListDialog.init.js?v={$version}"></script>
    <!--LOOKUP--> 
    <script type="text/javascript" src="{$path}/js/IGRP.lookup.init.js?v={$version}"></script>
  </xsl:template>
</xsl:stylesheet>