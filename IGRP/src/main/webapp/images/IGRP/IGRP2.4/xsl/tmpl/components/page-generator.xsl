<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:variable name="sourcePath" select="concat($path,'/core/formgen/util/gen.source.xml')"/>
  <xsl:variable name="gen" select="document($sourcePath)/gen"/>

  <xsl:template name="igrp-generator-sidebar">

    <div class="app-menu navbar-menu">
			<!-- LOGO -->
			<div class="navbar-brand-box">
				<!-- Dark Logo-->
				<a href="index.html" class="logo logo-dark">
					<span class="logo-sm">
						<img src="{$themePath}/assets/images/logo-sm.png" alt="" height="22" />
					</span>
					<span class="logo-lg">
						<img src="{$themePath}/assets/images/logo-dark.png" alt="" height="17" />
					</span>
				</a>
				<!-- Light Logo-->
				<a href="index.html" class="logo logo-light">
					<span class="logo-sm">
						<img src="{$themePath}/assets/images/logo-sm.png" alt="" height="22" />
					</span>
					<span class="logo-lg">
						<img src="{$themePath}/assets/images/logo-white.png" alt="" height="40" />
					</span>
				</a>
				<button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
					<i class="ri-record-circle-line"></i>
				</button>
			</div>

			<div id="scrollbar">
				<div class="container-fluid">
					<div id="two-column-menu"></div>
					
          <ul class="nav nav-tabs mb-3 mt-3" role="tablist">
            <li class="nav-item">
              <a
                class="nav-link"
                data-bs-toggle="tab"
                href="#settings"
                role="tab"
                aria-selected="false"
              >
                Definições
              </a>
            </li>
            <li class="nav-item">
              <a
                class="nav-link active"
                data-bs-toggle="tab"
                href="#components"
                role="tab"
                aria-selected="false"
              >
                Componentes
              </a>
            </li>
          </ul>

          <div class="tab-content text-muted">
            <div class="tab-pane" id="settings" role="tabpanel">
              
            </div>
            <div class="tab-pane active" id="components" role="tabpanel">
              <ul class="navbar-nav" id="navbar-nav">
                <li class="menu-title">
                  <span> UI Components</span>
                </li>
                <xsl:for-each select="$gen/containers/item">
                  <xsl:sort select="label"/>
                  <li class="gen-declared-containers nav-item" label="{label}" name="{name}" type="{type}" reject="{reject}" accept="{accept}" hasField="{hasField}">
                      <a class="nav-link menu-link" >
                        <xsl:call-template name="getComponentIcon"/>
                        <span >
                          <xsl:value-of select="label"/>
                        </span>
                      </a>
                  </li>
                </xsl:for-each>
              </ul>
            </div>
          </div>
          
          


				</div>


			</div>
			<div class="sidebar-background"></div>
		</div>
		<div class="vertical-overlay"></div>
  </xsl:template>

  <xsl:template name="igrp-generator-scripts">
    <script src="{$path}/core/codemirror/js/codemirror.js"></script>
    <script src="{$path}/core/codemirror/js/clike.js"></script>
    <script src="{$path}/core/codemirror/js/formatting.js"></script>
    <script src="{$path}/core/codemirror/js/mode/sql/sql.js"></script>
    <script src="{$path}/core/codemirror/js/mode/xml/xml.js"></script>
    <script src="{$path}/core/codemirror/js/mode/xml/xslt.js"></script>
    <script src="{$path}/core/codemirror/js/mode/css/css.js"></script>
    <script src="{$path}/core/codemirror/js/mode/javascript/javascript.js"></script>
    
    <script src="{$path}/core/codemirror/js/keymap/sublime.js"></script>
    
    <script src="{$path}/core/codemirror/js/addon/fold/foldcode.js"></script>
    <script src="{$path}/core/codemirror/js/addon/fold/foldgutter.js"></script>
    <script src="{$path}/core/codemirror/js/addon/fold/brace-fold.js"></script>
    <script src="{$path}/core/codemirror/js/addon/fold/xml-fold.js"></script>
    <script src="{$path}/core/codemirror/js/addon/fold/indent-fold.js"></script>
    <script src="{$path}/core/codemirror/js/addon/fold/markdown-fold.js"></script>
    <script src="{$path}/core/codemirror/js/addon/fold/comment-fold.js"></script>
    <script src="{$path}/core/codemirror/js/addon/edit/matchtags.js"></script>
    <script src="{$path}/core/codemirror/js/addon/edit/closebrackets.js"></script>        
    <script src="{$path}/core/codemirror/js/addon/edit/matchbrackets.js"></script> 
    <script src="{$path}/core/codemirror/js/addon/hint/xml-hint.js"></script>         
    <script src="{$path}/core/codemirror/js/addon/hint/show-hint.js"></script>
    <script src="{$path}/core/codemirror/js/addon/hint/sql-hint.js"></script>
    <script src="{$path}/core/codemirror/js/addon/search/search.js"></script>
    <script src="{$path}/core/codemirror/js/addon/search/searchcursor.js"></script>
    <script src="{$path}/core/codemirror/js/addon/search/dialog.js"></script>
    <script src="{$path}/core/codemirror/js/addon/search/jump-to-line.js"></script>
    <script src="{$path}/core/codemirror/js/addon/display/fullscreen.js"></script>
    <script>var gPATH = "<xsl:value-of select='$path' />/app/RED";</script>
    <script src="{$path}/core/formgen/js/chance.js"></script>
    <script src="{$path}/core/formgen/js/jquery-ui.min.js"></script>
    <script src="{$path}/core/formgen/js/string.js" charset="utf-8"></script>
    <script src="{$path}/core/formgen/js/GEN.converter.2dot2.js"></script>
    <script src="{$path}/core/formgen/js/GEN.vars.js"></script>
    <script src="{$path}/core/formgen/js/GEN.getdata.js"></script>
    <script src="{$path}/core/formgen/js/GEN.Xsl.js"></script>
    <script src="{$path}/core/formgen/js/GEN.XML.js"></script>
    <script src="{$path}/core/formgen/js/GEN.config.js"></script>

    <!-- Validation -->
    <script src="{$path}/core/formgen/js/GEN.validation.js"></script>
    <!-- RULEs -->
    <script src="{$path}/core/formgen/js/GEN.rules.js"></script>
    <!-- COLOR PICKER -->
    <script src="{$path}/core/formgen/js/service/jquery.jsPlumb-1.5.5.js"></script>
    <script src="{$path}/core/formgen/js/service/xsdmapper.js"></script>
    <script src="{$path}/core/formgen/js/GEN.service.js"></script>
    <script src="{$path}/core/formgen/js/GEN.layout.js"></script>
    <script src="{$path}/core/formgen/js/GEN.templates.js"></script>
    <script src="{$path}/core/xml2json/jquery.xml2json.js"></script>
    <script src="{$path}/core/formgen/js/GEN.downloadXSL.js"></script>
    
    <script src="{$path}/core/formgen/js/GEN.containers.js" charset="utf-8"></script>
    <script src="{$path}/core/formgen/js/GEN.fields.js"></script>
    <script src="{$path}/core/formgen/js/GEN.html.js"></script>

    <script src="{$path}/core/formgen/js/GEN.server.js"></script>
<script src="{$path}/core/formgen/js/GEN.controller.js"></script>
    <script src="{$path}/core/formgen/js/GEN.structures.js"></script>

    <script src="{$path}/core/formgen/js/GEN.xsl.templates.utils.js"></script>

    <script src="{$path}/core/formgen/js/GEN.subversion.js"></script>
    <script src="{$path}/core/formgen/js/vkbeautify.0.99.00.beta.js"></script>
    <script>

      this[VARS.name] = new GENERATOR({
      
        sourcePath : "<xsl:value-of select="$sourcePath"/>",

        dataSrc    : "<xsl:value-of select="rows/content/form/value/page_form"/>",

        imagesURL  : "<xsl:value-of select="rows/content/form/value/link_image"/>",

        configURL  : "<xsl:value-of select="rows/content/form/value/gen_elements"/>",

        server     : {

          java : {

              basePath : '<xsl:value-of select="$path"/>/core/formgen/util/java',

              codes : [
                  {
                      name : 'CONTROLLER',
                      xsl  : '/mvc/XSL_CONTROLLER.xsl'
                  },
                  {
                      name : 'MODEL',
                      xsl  : '/mvc/XSL_MODEL.xsl'
                  },

                  {
                      name : 'VIEW',
                      xsl  : '/mvc/XSL_VIEW.xsl'
                  }

                  

              ]

          }

      }


      });

      var __GEN = this[VARS.name];

    </script>
    
    <!-- GEN Java Auto Complete -->
    <script src="{$path}/core/formgen/js/GEN.autocomplete.js"></script>

    <script src="{$path}/core/formgen/js/GEN.attributes.js"></script>

    <script src="{$path}/core/formgen/js/GEN.importTemplates.js"></script>

    <script src="{$path}/core/formgen/js/GEN.includeFiles.js"></script>
    
    <script src="{$path}/core/formgen/js/GEN.lookupMap.js"></script>
    
    <script src="{$path}/core/formgen/js/classes/Requests.js"></script>

    <xsl:for-each select="$gen/containers/item">
        <xsl:if test="not(@js) or @js!='false'">
            <script src="{$path}/core/formgen/types/containers/{name}/js/{name}.js"></script>
        </xsl:if>
    </xsl:for-each>
    <xsl:for-each select="$gen/fields/item">
        <script src="{$path}/core/formgen/types/fields/{type}/{type}.js"></script>
    </xsl:for-each>

    <script id="custom-js"></script>
  </xsl:template>

  <xsl:template name="getComponentIcon">
    <xsl:choose>
        <xsl:when test="icon/@type = 'fa'">
            <i class="fa fa-{icon}"></i>
        </xsl:when>
        <xsl:when test="icon/@type = 'gly'">
            <i class="glyphicon glyphicon-{icon}"></i>
        </xsl:when>
        <xsl:when test="icon/@type = 'img'">
            <img src="{$path}/core/formgen/img/components/{.}"/>
        </xsl:when>
        <xsl:otherwise>
            <i class="fa fa-angle-right"></i>
        </xsl:otherwise>
    </xsl:choose>
</xsl:template>

</xsl:stylesheet>
