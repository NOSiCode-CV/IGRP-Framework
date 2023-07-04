<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-system="about:legacy-compat"/>
  <xsl:template match="/">
    <html>
      <head>
        <xsl:call-template name="IGRP-head"/>

        <link href="{$path}/core/codemirror/css/codemirror.css" rel="stylesheet"/>
        <link rel="stylesheet" href="{$path}/core/codemirror/css/show-hint.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/dialog.css" />
        <link rel="stylesheet" href="{$path}/core/codemirror/js/addon/search/matchesonscrollbar.css" />
        
        <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/fileeditor/assets/css/fileeditor.css?v={$version}"/>
        
      </head>
      <body class="fluid sidebar-off" has-menu="false">
       <!--<xsl:call-template name="IGRP-topmenu"/> -->
        <form method="POST" class="IGRP-form" name="formular_default" enctype="multipart/form-data">
          <div class="container-fluid">
            <div class="row">
              <!--<xsl:call-template name="IGRP-sidebar"/>-->
              <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
                <div class="content">
                  <!--<div class="row row-msg">
                    <div class="gen-column col-md-12">
                      <div class="gen-inner">
                        <xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
                      </div>
                    </div>
                  </div>-->
                  <div class="row" id="row-3a5482b4">
                    <div class="gen-column col-sm-12">
                      <div class="gen-inner">
                        <xsl:call-template name="IGRP-fileeditor">
                          <xsl:with-param name="dataURL" select="rows/content/form_1/fields/json_data/value"/>
                          <xsl:with-param name="saveURL" select="rows/content/form_1/fields/save_url/value"/>
                          <xsl:with-param name="saveLabel" select="rows/content/form_1/fields/save_url/label"/>
                          <xsl:with-param name="createURL" select="rows/content/form_1/fields/create_url/value"/>
                        </xsl:call-template>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <xsl:call-template name="IGRP-bottom"/>
          
          <div> <a id="igrp-doc" href="{rows/content/form_1/fields/link_doc/value}" class="bpmn-controller link btn btn-link pull-right" target="_newtab" request-fields="">
                 <i class="fa fa-question-circle" style="margin-right:5px"></i>Help
                 </a></div>
      
        </form>       

        <!-- CODE MIRROR -->
        <script src="{$path}/core/codemirror/js/codemirror.js"></script>
          <script src="{$path}/core/codemirror/js/addon/fold/xml-fold.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/matchtags.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/closebrackets.js"></script>
          <script src="{$path}/core/codemirror/js/mode/css/css.js"></script>
          <script src="{$path}/core/codemirror/js/addon/edit/matchbrackets.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xml.js"></script>
          <script src="{$path}/core/codemirror/js/mode/xml/xslt.js"></script>
          <script src="{$path}/core/codemirror/js/formatting.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/xml-hint.js"></script>
          <script src="{$path}/core/codemirror/js/mode/sql/sql.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/show-hint.js"></script>
          <script src="{$path}/core/codemirror/js/addon/hint/sql-hint.js"></script>

          <script src="{$path}/core/codemirror/js/addon/search/search.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/searchcursor.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/dialog.js"></script>
          <script src="{$path}/core/codemirror/js/addon/search/jump-to-line.js"></script>

        <script src="{$path}/core/codemirror/js/clike.js"></script>

        <script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/fileeditor/igrp.fileeditor.js?v={$version}"/>
        <script type="text/javascript" src="{$path}/core/fileeditor/classes/templates.clss.js?v={$version}"/>
      </body>           		
		
    </html>
  </xsl:template>
  <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1525862739638"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1525862739638"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1525862739638"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1525862739638"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1525862739638"/>
  <xsl:include href="../../../xsl/tmpl/IGRP-fileeditor.tmpl.xsl?v=1525862739638"/>

</xsl:stylesheet>
