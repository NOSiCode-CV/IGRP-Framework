<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <!-- HEAD -->
  <xsl:template name="IGRP-head">

    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    
    <link REL="SHORTCUT ICON" HREF="{$path}/assets/img/favicon.ico" />
    
    <title><xsl:value-of select="rows/title"/></title>
    <!-- Normalize -->
    <link rel="stylesheet" href="{$path}/core/normalize/normalize.css"/>
    <!-- FontAwesome -->
    <link rel="stylesheet" href="{$path}/core/fontawesome/4.7/css/font-awesome.css"/>
    <!-- BS CSS -->
    <xsl:if test="not($themeConfigData/css/@bootstrap) or $themeConfigData/css/@bootstrap!='false'">
      <link rel="stylesheet" href="{$path}/core/bootstrap/{$bs-v}/css/bootstrap.min.css"/>
      <link rel="stylesheet" href="{$path}/themes/bs.columns.css"/>
      <link rel="stylesheet" href="{$path}/themes/bs.class.css"/>
    </xsl:if>
    <!-- BS CSS -->

    <!-- DEFAULT CSS -->
    <xsl:if test="not($themeConfigData/css/@default) or $themeConfigData/css/@default != 'false'">
      <!-- <link rel="stylesheet" href="{$path}/themes/globals.css"/>
      <link rel="stylesheet" href="{$path}/themes/base.css"/>
      <link rel="stylesheet" href="{$path}/themes/topnav.css"/>
      <link rel="stylesheet" href="{$path}/themes/sidebar.css"/> -->
      <link rel="stylesheet" href="{$path}/themes/style.css"/>

    </xsl:if>
    <!--/DEFAULT CSS -->
    
    <!-- THEME CSS -->
    <xsl:for-each select="$themeConfigData/css/file">
      <xsl:choose>
        <xsl:when test="@external = 'true'">
          <link href="{.}" rel="stylesheet"/>
        </xsl:when>
        <xsl:otherwise>
          <link href="{$themePath}/{.}" rel="stylesheet"/>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>

    <xsl:if test="$themeConfigData">
      <xsl:apply-templates mode="theme-colors-config" select="$themeConfigData"/>
    </xsl:if>
    <!-- /THEME CSS -->

    <!-- COLOR PALETTES -->
    <xsl:call-template name="colorpalettes-css"/>
    <!-- /COLOR PALETTES -->
    <!-- FORM -->
    <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css"/>

    <script src="{$path}/core/jquery/{$jq-v}/jquery.min.js"></script>
    <script src="{$path}/core/bootstrap/{$bs-v}/js/bootstrap.min.js"></script>
    <script src="{$path}/core/bootstrap/plugins/notify/bootstrap-notify.min.js"></script>
    <script src="{$path}/core/bootstrap/plugins/validation/js/jquery.validate.js"></script>
    
    <!-- THEME JS -->
    <xsl:for-each select="$themeConfigData/js/file">
      <script src="{$themePath}/{.}"></script>
    </xsl:for-each>
    <!-- /THEME JS -->

    <!-- EVENTS class -->
    <script src="{$path}/core/igrp/IGRP.events.class.js?v={$version}"></script>
    <!-- UTILS class -->
    <script src="{$path}/core/igrp/IGRP.jsutils.js?v={$version}"></script>
    <!-- IGRP class -->
    <script src="{$path}/core/igrp/IGRP.class.js?v={$version}"></script>
    <!-- IGRP config -->
    <script src="{$path}/core/igrp/IGRP.defaults.js?v={$version}"></script>
    <!-- IGRP core functions -->
    <script src="{$path}/core/igrp/IGRP.core.js?v={$version}"></script>
    <!-- IGRP globalModal -->
    <script src="{$path}/core/igrp/globalmodal/IGRP.globalModal.js?v={$version}"></script>
    <!-- IGRP iframeNavigation -->
    <script src="{$path}/core/igrp/iframenav/IGRP.iframeNav.js?v={$version}"></script>
    
    <!-- IGRP targets controller -->
    <script src="{$path}/core/igrp/targets/IGRP.targets.js?v={$version}"></script>
    <!-- IGRP targets controller -->
    <script src="{$path}/core/igrp/tree/IGRP.tree.js?v={$version}"></script>
    <!-- IGRP targets controller -->
    <script src="{$path}/core/igrp/sidebar/IGRP.sidebar.js?v={$version}"></script>
    <!-- IGRP color palettes -->
    <script src="{$path}/core/colorpalettes/palettes.js?v={$version}"></script>
    <!-- IGRP XML XSL Transform -->
    <script src="{$path}/core/igrp/xml.xslt/xml.xsl.transform.js?v={$version}"></script>
    
    <!-- IGRP handler -->
    <script encode="utf-8" src="{$path}/core/igrp/IGRP.handler.js?v={$version}"></script>

    <script>
      var path = '<xsl:value-of select="$path"/>';
      $(document).ready( $.IGRP.init );
    </script>

  </xsl:template>
  <!-- TOPMENU -->
  <xsl:template name="IGRP-topmenu">
    <xsl:attribute name="template"><xsl:value-of select="rows/template"/></xsl:attribute>
    <xsl:attribute name="has-menu"><xsl:value-of select="$hasMenu"/></xsl:attribute>
    <xsl:attribute name="page"><xsl:value-of select="rows/page"/></xsl:attribute>
    <xsl:attribute name="app"><xsl:value-of select="rows/app"/></xsl:attribute>
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
        <a class="navbar-brand col-sm-3 col-md-2" href="{rows/link}" >
         <img src="{$logo}"/>
         <span class=""><b>IGRP</b></span>
        </a>

        <div id="side-bar-ctrl">
          <i class="fa fa-navicon"></i>
        </div>

        <div id="igrp-app-title" class=""><xsl:value-of select="rows/title"/></div>

        <xsl:variable name="topMenus" select="document(rows/top_menu/@file)/top_menu/button"/>

        <xsl:variable name="settingsURL" select="$topMenus[title = 'Settings']"/>

        <ul id="igrp-top-menu" class="hidden-xs nav navbar-nav navbar-right">
          
          <xsl:for-each select="$topMenus[not(title = 'Settings')]">
            
            <xsl:variable name="fa-icon">
              <xsl:call-template name="topMenuIconsMap"/>
            </xsl:variable>

            <xsl:choose>
              <xsl:when test="@type='mytask' or @type='availtask'">
                <li alt="Tasks" title="Tasks">
                  <a href="{link}" target="{target}">
                    <i class="fa {$fa-icon}"></i>
                    <xsl:if test="title and title!=''">
                      <small class="badge" bg-color="2"><xsl:value-of select="title"/></small>
                    </xsl:if>
                  </a>
                </li>
              </xsl:when>
              <xsl:otherwise>
                <li alt="{title}" title="{title}">
                  <a href="{link}" target="{target}">
                    <i class="fa {$fa-icon}"></i>
                  </a>
                </li>
              </xsl:otherwise>
            </xsl:choose>

          </xsl:for-each>
         
          <li alt="{$settingsURL/title}" title="{$settingsURL/title}">
            <a href="{$settingsURL/link}"><xsl:value-of select="rows/site/user_name"/></a>
          </li>

          <li alt="{rows/site/button/title}" title="{rows/site/button/title}">
            <a href="{rows/site/button/link}" target="{rows/site/button/target}">
              <i class="fa fa-sign-out"></i>
            </a>
          </li>

        </ul>

      </nav>
    </xsl:if>
  </xsl:template>
  <!-- SIDERBAR -->
  <xsl:template name="IGRP-sidebar">
    <xsl:if test="$hasMenu = 'true'">
      <xsl:variable name="APP" select="rows/app"/>
      <xsl:variable name="menus" select="document(rows/slide-menu/@file)/menus"/>
      <div class="col-md-2 col-sm-3 sidebar tree-list" id="igrp-sidebar">
        <!-- <h4><xsl:value-of select="$menus/title"/></h4> -->
        <ul class="nav nav-sidebar">
          <xsl:for-each select="$menus/menu">
            <xsl:variable name="parentId" select="concat($APP,'-',position())"/>
            <li parent-id="{$parentId}">
              <xsl:if test="submenu">
                <xsl:attribute name="class">treeview</xsl:attribute>
              </xsl:if>
              <a href="#">
                <xsl:value-of select="title"/>
                <i class="fa fa-angle-right pull-right"></i>
                <span class="nav-bar-active" bg-color="2"/>
              </a>
              <xsl:if test="submenu">
                <ul class="treeview-menu">
                  <xsl:for-each select="submenu">
                    <li>
                      <a href="{link}" item-id="{$parentId}-{position()}">
                          <i class="fa fa-angle-right"></i>
                          <span><xsl:value-of select="title"/></span>
                      </a>
                    </li>
                  </xsl:for-each>
                </ul>
              </xsl:if>
            </li>
          </xsl:for-each>
        </ul>
      </div>
    </xsl:if>
  </xsl:template>
  <!-- BOTTOM -->
  <xsl:template name="IGRP-bottom">
    
    <!-- GLOBAL MODAL -->
    <div id="igrp-global-modal" class="modal fade" data-backdrop="static" tabindex="-1" role="dialog">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <span class="title"></span>
            <button type="button" class="close" data-dismiss="modal">×</button>
          </div>
          <div class="modal-body">
           
          </div>
          <div class="modal-footer">
            
          </div>
        </div>
      </div>
      <div style="display:none!important">
        <text id="confirm-text"><xsl:value-of select="rows/content/messages/message[@type='confirm']"/></text>
      </div>
    </div>
    <!--/GLOBAL MODAL -->

    <igrp-variables class="hidden invisible">
      <igrp-page-title class="hidden"><xsl:value-of select="rows/content/title"/></igrp-page-title>
    </igrp-variables>

    <!-- IFRAME NAVIGATION MODAL -->
    <xsl:call-template name="iframe-nav"/>
    <!--/IFRAME NAVIGATION MODAL -->

    <!-- DEBUG -->
    <xsl:call-template name="IGRP-debug"/>
    <!--/DEBUG -->
  </xsl:template>
  <!-- DEBUG -->
  <xsl:template name="IGRP-debug">
    <xsl:if test="rows/content/messages/message[@type='debug'] != ''">
      <xsl:variable name="contDebug" select="count(rows/content/messages/message[@type='debug'])"/>
      <a class="igrp-debug-ctrl">
        <i class="fa fa-chevron-up"></i>
      </a>
      <div class="modal fade " id="igrp-debugger" role="dialog" >
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h3>Debugger</h3>
              <button type="button" class="close" data-dismiss="modal">×</button>
            </div>
            <div class="modal-body">
               <div class="igrp-debug-contents clearfix">
                  <xsl:if test="$contDebug &gt; 9">
                      <div class="igrp-debug-search form-group col-md-4 clearfix pull-right">
                          <input placeholder="Pesquisar" type="text" class="not-form form-control"/>
                      </div>
                  </xsl:if>
                  <ul class="clear igrp-debug-list">
                      <xsl:for-each select="rows/content/messages/message[@type='debug']">
                        <li value="{.}"><xsl:value-of select="." /></li>
                      </xsl:for-each>
                  </ul>
              </div>
            </div>

          </div>
        </div>
      </div>
    </xsl:if>
  </xsl:template>
  <!-- MESSAGES -->
  <xsl:template name="igrp-messages" match="messages" mode="igrp-messages">
    <xsl:param name="dismiss" select="'true'"/>
    <xsl:variable name="dismissClass">
      <xsl:if test="$dismiss = 'true' "><xsl:value-of select="alert-dismissible"/></xsl:if>
    </xsl:variable>
    <!--<xsl:if test="message">-->
      <div class="igrp-msg-wrapper">
        <xsl:for-each select="message[ not(@type='debug') and not(@type='confirm')]">
          
          <xsl:variable name="msg-type">
              <xsl:call-template name="igrp-msg-transform"/>
          </xsl:variable>

          <xsl:variable name="msg-icon">
              <xsl:call-template name="igrp-msg-icon"/>
          </xsl:variable>

          <div class="alert alert-{$msg-type} {$dismissClass}" role="alert">
            
            <i class="fa fa-{$msg-icon} igrp-msg-icon"></i>
            
            <xsl:if test="$dismiss = 'true'">
              <a class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true"><i class="fa fa-times"></i></span>
              </a>
            </xsl:if>
            <xsl:value-of select="." disable-output-escaping="yes"/>
          </div>

        </xsl:for-each>
      </div>
    <!--</xsl:if>-->
  </xsl:template>
  <!-- IFRAME NAV -->
  <xsl:template name="iframe-nav">
    <div class="modal fade" data-backdrop="static" tabindex="-1" id="igrp-iframe-nav" role="dialog" >
      
      <div class="iframe-nav-close"><i class="fa fa-close"></i></div>
      
      <div class="modal-dialog">
        <iframe></iframe>
      </div>

      <div class="loader"></div>

    </div>
  </xsl:template>
  
  <!-- COLOR PALLETES -->
  <xsl:template name="colorpalettes-css">
    <style>
      <xsl:variable name="palettesXML" select="concat($path,'/core/colorpalettes/palettes.xml')"/>
      <xsl:for-each select="document($palettesXML)/palettes/color">
        .cp-<xsl:value-of select="@name"/> {
          background: <xsl:value-of select="."/>!important;
          border-color: <xsl:value-of select="."/>!important;
          color: <xsl:value-of select="@bg-text-color"/>!important;
        }
        .cp-<xsl:value-of select="@name"/>-text {
          color: <xsl:value-of select="."/>!important;
        }
      </xsl:for-each>
    </style>
  </xsl:template>
  <!-- COLORS -->
  <xsl:template name="theme-colors" mode="theme-colors" match="*">
    <style>
      .box .box-title{
        color:<xsl:value-of select="color[1]"/>;
      }
      *[bg-color="template"]{
        background-color: <xsl:value-of select="color[1]"/>;
      }
      <xsl:if test="link">
        a,.clickable{
          color:<xsl:value-of select="link"/>;
        }
        <xsl:if test="link/@hover">
        a:hover, 
        a:focus, 
        a:active, 
        a.active,
        a.active.focus, 
        a.active:focus, 
        a.active:hover, 
        a:active.focus, 
        a:active:focus
        {
          color: <xsl:value-of select="link/@hover"/>;
        }
        </xsl:if>

      </xsl:if>

      <xsl:if test="button">
        <xsl:for-each select="button/*">
          
          <xsl:variable name="color">
            <xsl:if test="@color">
             <xsl:text>color: </xsl:text><xsl:value-of select="@color"/>
            </xsl:if>
          </xsl:variable>

          <xsl:variable name="hoverBg">
            <xsl:if test="@hover">
             <xsl:text>background: </xsl:text><xsl:value-of select="@hover"/>
            </xsl:if>
          </xsl:variable>

          <xsl:variable name="borderColor">
            <xsl:if test="@border-color">
             <xsl:text>border-color: </xsl:text><xsl:value-of select="@border-color"/>
            </xsl:if>
          </xsl:variable>

          .btn-<xsl:value-of select="name()"/> {
            background: <xsl:value-of select="."/>;
            <xsl:value-of select="$color"/>;
            <xsl:value-of select="$borderColor"/>
             
          }

          <xsl:if test="@hover">
          .btn-<xsl:value-of select="name()"/>:hover, 
          .btn-<xsl:value-of select="name()"/>:focus, 
          .btn-<xsl:value-of select="name()"/>:active, 
          .btn-<xsl:value-of select="name()"/>.active,
          .btn-<xsl:value-of select="name()"/>.active.focus, 
          .btn-<xsl:value-of select="name()"/>.active:focus, 
          .btn-<xsl:value-of select="name()"/>.active:hover, 
          .btn-<xsl:value-of select="name()"/>:active.focus, 
          .btn-<xsl:value-of select="name()"/>:active:focus, 
          .btn-<xsl:value-of select="name()"/>:active:hover{
              <xsl:value-of select="$hoverBg"/>;
              <xsl:value-of select="$color"/>
          }
          </xsl:if>
        </xsl:for-each>
      </xsl:if>

      .btn-secondary:hover,
      .btn-secondary.active{
        color:#fff;
      }

      <xsl:for-each select="color">
        *[bg-color="<xsl:value-of select="@name"/>"]{
          background-color: <xsl:value-of select="."/>;
        }

        *[active-bg-color="<xsl:value-of select="@name"/>"].active,
        [style-listener="true"].active *[active-bg-color="<xsl:value-of select="@name"/>"]{
          background-color: <xsl:value-of select="."/>!important;
        }

        *[text-color="<xsl:value-of select="@name"/>"],
        *[txt-color="<xsl:value-of select="@name"/>"]{
          color: <xsl:value-of select="."/>;
        }

        *[active-text-color="<xsl:value-of select="@name"/>"].active,
        [style-listener="true"].active *[active-text-color="<xsl:value-of select="@name"/>"]{
          color: <xsl:value-of select="."/>!important;
        }

        *[border-color="<xsl:value-of select="@name"/>"]{
          border-color: <xsl:value-of select="."/>;
        }

        *[active-border-color="<xsl:value-of select="@name"/>"].active,
        [style-listener="true"].active *[active-border-color="<xsl:value-of select="@name"/>"]{
          border-color: <xsl:value-of select="."/>!important;
        }

        /* style listeners - fica à escuta de uma alteração do elemento*/

      </xsl:for-each>
    </style>
  </xsl:template>
  <!-- COLORS Config -->
  <xsl:template name="theme-colors-config" mode="theme-colors-config" match="*">
    
    <style>

        <xsl:if test="nav">
          <xsl:if test="nav/background">
            #igrp-top-nav{
              background-color:<xsl:value-of select="nav/background"/>
            }
          </xsl:if>
        </xsl:if>

 
        <xsl:if test="colors/color">
          <!--  -->
          a,.clickable,.btn-link{
            color:<xsl:value-of select="colors/color[@link='true']"/>;
          }
          <xsl:variable name="link-hover-color">
            <xsl:choose>
              <xsl:when test="colors/color[@link='true']/@bg-hover">
                <xsl:value-of select="colors/color[@link='true']/@bg-hover"/>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="colors/color[@link='true']"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          
          a:hover,
          .clickable:hover,
          a:focus,
          .clickable:focus,
          .btn-link:focus,
          .btn-link:hover{
            color:<xsl:value-of select="$link-hover-color"/>;
          }
          
          <xsl:for-each select="colors/color">
            
            [bg-color="<xsl:value-of select="@name"/>"]{
              background-color:<xsl:value-of select="."/>!important;
              <xsl:if test="@text-color">
                color: <xsl:value-of select="@text-color"/>!important;
              </xsl:if>
            }

            <xsl:if test="@bg-hover">
              [bg-hover="<xsl:value-of select="@name"/>"]:hover{
                background-color:<xsl:value-of select="@bg-hover"/>;
              }
            </xsl:if>

           
            [border-color="<xsl:value-of select="@name"/>"]{
              border-color:<xsl:value-of select="@border-hover"/>;
            }
    
            
            [text-color="<xsl:value-of select="@name"/>"]{
              color:<xsl:value-of select="."/>;
            }

            [active-text-color="<xsl:value-of select="@name"/>"].active,
            .active [active-text-color="<xsl:value-of select="@name"/>"]{
              color:<xsl:value-of select="."/>!important;
            }

            <!-- BUTTONS -->
            .btn.btn-<xsl:value-of select="@name"/>{
              <xsl:if test="@text-color">
                color:<xsl:value-of select="@text-color"/>;
              </xsl:if>
              background-color:<xsl:value-of select="."/>;
              <xsl:choose>
                <xsl:when test="@border-color">
                  border-color:<xsl:value-of select="@border-color"/>;
                </xsl:when>
                <xsl:otherwise>
                  border-color:transparent;
                </xsl:otherwise>
              </xsl:choose>

            }

            <xsl:if test="@bg-hover">
              .btn.btn-<xsl:value-of select="@name"/>:hover,
              .btn.btn-<xsl:value-of select="@name"/>.focus, 
              .btn.btn-<xsl:value-of select="@name"/>:focus{
                background-color:<xsl:value-of select="@bg-hover"/>
              }
            </xsl:if>

            <xsl:if test="@text-hover">
              .btn.btn-<xsl:value-of select="@name"/>:hover,
              .btn.btn-<xsl:value-of select="@name"/>.focus, 
              .btn.btn-<xsl:value-of select="@name"/>:focus{
                color:<xsl:value-of select="@text-hover"/>
              }
            </xsl:if>

          </xsl:for-each>
        </xsl:if>

    </style>
 
  </xsl:template>
  <!-- COLORS2 -->
  <xsl:template name="theme-colors2" mode="theme-colors2" match="*">
    <style>
      *[bg-color="template"]{
        background-color: <xsl:value-of select="color[1]"/>;
      }
      .btn-primary {
         background: <xsl:value-of select="color[1]"/>;
      }
      <xsl:if test="not(color[2])">
        .btn-primary:hover, 
        .btn-primary:focus, 
        .btn-primary:active, 
        .btn-primary.active,
        .btn-primary.active.focus, 
        .btn-primary.active:focus, 
        .btn-primary.active:hover, 
        .btn-primary:active.focus, 
        .btn-primary:active:focus, 
        .btn-primary:active:hover{
            background: <xsl:value-of select="color[1]"/>;
        }
      </xsl:if>
      <xsl:if test="color[2]">
      .btn-primary:hover, 
      .btn-primary:focus, 
      .btn-primary:active, 
      .btn-primary.active,
      .btn-primary.active.focus, 
      .btn-primary.active:focus, 
      .btn-primary.active:hover, 
      .btn-primary:active.focus, 
      .btn-primary:active:focus, 
      .btn-primary:active:hover{
          background: <xsl:value-of select="color[2]"/>;
      }
      </xsl:if>
      <xsl:for-each select="color">
        *[bg-color="<xsl:value-of select="@name"/>"],{
          background-color: <xsl:value-of select="."/>;
        }

        *[text-color="<xsl:value-of select="@name"/>"],
        *[txt-color="<xsl:value-of select="@name"/>"]{
          color: <xsl:value-of select="."/>;
        }

        *[border-color="<xsl:value-of select="@name"/>"]{
          border-color: <xsl:value-of select="."/>;
        }
      </xsl:for-each>
    </style>
  </xsl:template>


  <!--TEMPLATE FOR  NAVIGATION-->
  <xsl:include href="IGRP-navigation.tmpl.xsl?v=1"/>

</xsl:stylesheet>