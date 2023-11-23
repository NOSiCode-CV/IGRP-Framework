<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-page-title">
        <xsl:variable name="messages" select="//rows/content/messages/message[ not(@type='debug') and not(@type='confirm')]"/>
  
        <div class="row">
            <div class="col-12">
                <div class="page-title-box ">
                    <div class="d-sm-flex align-items-center justify-content-between ">
                        <h4 class="mb-sm-0">
                            <xsl:value-of select="rows/content/title"/>
                        </h4>
                        <div class="page-title-right d-none">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item">
                                    <a href="javascript: void(0);">Pages</a>
                                </li>
                                <li class="breadcrumb-item active">Starter</li>
                            </ol>
                        </div>
                    </div>
                </div>
                <xsl:if test="$messages">
                    <xsl:call-template name="igrp-page-messages">
                        <xsl:with-param name="messages" select="$messages"/>
                    </xsl:call-template>
                </xsl:if>
                
            </div>
        </div>
    </xsl:template>

    <xsl:template mode="igrp-page-header-basic" name="igrp-page-header-basic" match="*">
        <xsl:variable name="messages" select="//rows/content/messages/message[ not(@type='debug') and not(@type='confirm')]"/>
        <div class="page-title-box">
            <div class="row align-items-center">
                <div class="col">
                    <div class="d-sm-flex align-items-center justify-content-between ">
                        <h4 class="mb-sm-0">
                            <xsl:value-of select="//rows/content/title"/>
                        </h4>
                    </div>
                </div>
                <xsl:if test="tools-bar/item">
                    <div class="col-4 justify-content-end">
                        <div class="ms-auto d-flex gap-3 align-items-center buttons-holder" style="width:fit-content;">
                            <xsl:apply-templates select="tools-bar/item" mode="igrp-button-item">
                                <xsl:with-param name="rounded" select="'false'"/>
                            </xsl:apply-templates>
                        </div>
                    </div>
                </xsl:if>
            </div>
        </div>
        <xsl:if test="$messages">
            <xsl:call-template name="igrp-page-messages">
                <xsl:with-param name="messages" select="$messages"/>
            </xsl:call-template>
        </xsl:if> 
    </xsl:template>

    <xsl:template mode="igrp-page-header-tabs" name="igrp-page-header-tabs" match="*">
        <xsl:variable name="messages" select="//rows/content/messages/message[ not(@type='debug') and not(@type='confirm')]"/>
        <xsl:variable name="page-title">
            <xsl:choose>
                <xsl:when test="@title">
                    <xsl:value-of select="@title"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="//rows/content/title"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <div class="card mt-n4 mx-n4">
            <div class="bg-warning-subtle border-top">
              <div class="card-body pb-0 px-4">
                <div class="row mb-2 align-items-center">
                  <div class="col-md">
                    <div class="row align-items-center g-3">
                      <div class="col-md">
                        <div>
                          <h5 class="text-uppercase fs-15 fw-bold m-0"><xsl:value-of select="$page-title"/></h5>
                          <xsl:if test="fields/*">
                            <div class="hstack gap-3 flex-wrap mt-3">
                                <xsl:for-each select="fields/*">
                                    <div>
                                        <span class="header-field-label">
                                            <xsl:value-of select="label"></xsl:value-of>
                                        </span> 
                                        <span class="header-field-symbol"> : </span>
                                        <span class="header-field-value fw-medium">
                                            <xsl:value-of select="value"></xsl:value-of>
                                        </span>
                                    </div>
                                    <xsl:if test="position() != last()">
                                        <div class="vr"></div>
                                    </xsl:if>
                                </xsl:for-each>
                            </div>
                        </xsl:if>
                          
                        </div>
                      </div>
                    </div>
                  </div>
                  <xsl:if test="tools-bar/item">
                    <div class="col-md-auto d-flex align-items-center">
                        <div class="hstack gap-1 flex-wrap">
                            <xsl:for-each select="tools-bar/item">
                                <xsl:apply-templates select="." mode="igrp-button-item"/>
                            </xsl:for-each>
                        </div>
                  </div>
                  </xsl:if>
                 

                </div>
          
              </div>
            </div>
          </div>
          

        <xsl:if test="$messages">
            <xsl:call-template name="igrp-page-messages">
                <xsl:with-param name="messages" select="$messages"/>
            </xsl:call-template>
        </xsl:if> 
    </xsl:template>

    <xsl:template name="igrp-card-header" mode="igrp-card-header" match="*">
        <xsl:param name="title" select="@title"/>
        <xsl:param name="show-title" select="'false'"/>
        <xsl:param name="has-filter" select="'true'"/>
        <xsl:param name="filter-type" select="'default'"/>

        <xsl:if test="$show-title = 'true' and $title != ''">
            <div class="card-header d-flex align-items-center">
                <h3 class="card-title">
                    <xsl:value-of select="$title"/>
                </h3>
            </div>
        </xsl:if>

    </xsl:template>

    <xsl:template name="igrp-icon">
        <xsl:param name="type" select="''"/>
        <xsl:param name="icon" select="''"/>
        <xsl:param name="default" select="'ri-radio-button-line'"/>
        <xsl:choose>
            <xsl:when test="$icon">
                <i class="{$icon}"></i>
            </xsl:when>
            <xsl:otherwise>
                <i class="{$default}"></i>
            </xsl:otherwise>
        </xsl:choose>
        
    </xsl:template>

    <xsl:template name="igrp-page-helpers">
        <button onclick="topFunction()" class="btn btn-danger btn-icon d-none" id="back-to-top">
            <i class="ri-arrow-up-line"></i>
        </button>
        <div id="preloader">
            <div id="status">
                <div class="spinner-border text-primary avatar-sm" role="status">
                    <span class="visually-hidden">Aguarde...</span>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="igrp-buttons" match="*" mode="igrp-buttons">
        <xsl:param name="style" select="'btn'"/>
        <xsl:param name="rounded" select="'false'"/>
        <xsl:param name="type"/>
        <xsl:param name="use-fa" select="'true'"/>
        <xsl:param name="fixed-target"/>
        <xsl:param name="fixed-btn-class" select="''"/>
       
        <xsl:variable name="img-folder">
            <xsl:choose>
                <xsl:when test="$type='tools-bar'">tools-bar</xsl:when>
                <xsl:otherwise>menu</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:for-each select="item">
            <xsl:choose>
                <xsl:when test="$style = 'btn'">
                    <xsl:apply-templates mode="igrp-button-item" select=".">
                        <xsl:with-param name="type" select="$type"/>
                        <xsl:with-param name="use-fa" select="$use-fa"/>
                        <xsl:with-param name="fixed-target" select="$fixed-target"/>
                        <xsl:with-param name="style" select="$style"/>
                        <xsl:with-param name="rounded" select="$rounded"/>
                        <xsl:with-param name="position" select="position()"/>
                        <xsl:with-param name="fixed-btn-class" select="$fixed-btn-class"/>
                    </xsl:apply-templates>
                </xsl:when>
                <xsl:when test="$style = 'list-group-item'">
                    <xsl:apply-templates mode="igrp-action-list-item" select=".">
                        <xsl:with-param name="type" select="$type"/>
                        <xsl:with-param name="use-fa" select="$use-fa"/>
                        <xsl:with-param name="fixed-target" select="$fixed-target"/>
                        <xsl:with-param name="style" select="$style"/>
                        <xsl:with-param name="rounded" select="$rounded"/>
                        <xsl:with-param name="position" select="position()"/>
                        <xsl:with-param name="fixed-btn-class" select="$fixed-btn-class"/>
                    </xsl:apply-templates>
                </xsl:when>
            </xsl:choose>
            

        </xsl:for-each>
    </xsl:template>

    <xsl:template name="igrp-button-item" mode="igrp-button-item" match="item">
        <xsl:param name="type"/>
        <xsl:param name="use-fa" select="'true'"/>
        <xsl:param name="fixed-target"/>
        <xsl:param name="style" select="'btn'"/>
        <xsl:param name="rounded"/>
        <xsl:param name="position"/>
        <xsl:param name="size"/>
        <xsl:param name="fixed-btn-class" select="'btn-default'"/>

        <xsl:variable name="refresh_components" select="@refresh_components"></xsl:variable>

        <xsl:variable name="btn-class">
            <xsl:choose>
                <xsl:when test="@class">
                    <xsl:value-of select="@class"/>
                </xsl:when>
                <xsl:otherwise>default</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="target">
            <xsl:choose>
                <xsl:when test="$fixed-target">
                    <xsl:value-of select="$fixed-target"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="target"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="img-folder">
            <xsl:choose>
                <xsl:when test="$type='tools-bar'">tools-bar</xsl:when>
                <xsl:otherwise>menu</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <a target="{$target}" use-fa="{$use-fa}" position="{./@rel}" icon-position="{./img/@position}">

            <xsl:if test="$refresh_components != ''">
                <xsl:attribute name="refresh-components">
                    <xsl:value-of select="$refresh_components"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@labelConfirm">
                <xsl:attribute name="label-confirm">
                    <xsl:value-of select="@labelConfirm"/>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@notvalidatefields = 'true'">
                <xsl:attribute name="notvalidatefields">
                    <xsl:value-of select="@notvalidatefields"/>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="target = 'sharpadbclient'">
                <xsl:attribute name="sharpadbclient">
                    <xsl:value-of select="@sharpadbclient"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="img!=''">
                <xsl:attribute name="has-img">true</xsl:attribute>
            </xsl:if>

            <xsl:if test="$use-fa = 'false'">
                <xsl:attribute name="class">btn btn-label
                    <xsl:choose>
                        <xsl:when test="$target = 'submit' or $target = 'alert_submit'">btn-default</xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$fixed-btn-class"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="contains($target, '|')">
                <xsl:call-template name="get-target-params">
                    <xsl:with-param name="list" select="$target"/>
                </xsl:call-template>
            </xsl:if>

            <xsl:call-template name="page-nav">
                <xsl:with-param name="action" select="link" />
                <xsl:with-param name="page" select="page" />
                <xsl:with-param name="app" select="app" />
                <xsl:with-param name="linkextra" select="parameter" />
            </xsl:call-template>

            <xsl:if test="img">
                <xsl:choose>
                    <xsl:when test="$use-fa != 'false'">
                        <xsl:call-template name="igrp-get-icon-item-with-color">
                            <xsl:with-param name="list" select="img"/>
                            <xsl:with-param name="use-fa" select="$use-fa"/>
                            <xsl:with-param name="img-folder" select="$img-folder"/>
                            <xsl:with-param name="style" select="$style"/>
                            <xsl:with-param name="rounded" select="$rounded"/>
                            <xsl:with-param name="size" select="$size"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <img src="{$path}/assets/img/v1/icon/{$img-folder}/{img}"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <span class="btn-text text-truncate">
                <xsl:value-of select="title"/>
            </span>
        </a>
    </xsl:template>

    <xsl:template name="igrp-lookup-tool">  
      <xsl:param name="page" select="'LOOKUP'" />
      <xsl:param name="action" select="''" />
      <xsl:param name="name" select="''" />
      <xsl:param name="js_lookup" select="''" />    
      <xsl:param name="ad_hoc" select="'0'" />
      <xsl:param name="input-id" select="$name"/>
      <xsl:param name="btnClass" select="'default'"/>
      <xsl:param name="lookupClass" select="''"/>
      <xsl:param name="getparams" select="''"/>
      
      <span href="#" input-rel="{$input-id}" class="input-group-text gen-date-icon IGRP_lookupPopup {$lookupClass}" ctx_param="{$name}">
        <xsl:if test="$getparams != ''">
          <xsl:attribute name="getparams"><xsl:value-of select="$getparams"/></xsl:attribute>
        </xsl:if>
        <xsl:call-template name="page-nav">
           <xsl:with-param name="action" select="$action" />
           <xsl:with-param name="page" select="$page" />
           <xsl:with-param name="linkextra" select="$js_lookup" />
           <xsl:with-param name="ad_hoc" select="$ad_hoc" />
          </xsl:call-template> 
          <span class="">
            <i class="ri-search-line"></i>
          </span>
      </span>
      
  </xsl:template>

    <xsl:template name="igrp-action-list-item" mode="igrp-action-list-item" match="item">
        <xsl:param name="type"/>
        <xsl:param name="use-fa" select="'true'"/>
        <xsl:param name="fixed-target"/>
        <xsl:param name="style" select="'btn'"/>
        <xsl:param name="rounded"/>
        <xsl:param name="position"/>
        <xsl:param name="size"/>
        <xsl:param name="fixed-btn-class" select="''"/>

        <xsl:variable name="refresh_components" select="@refresh_components"></xsl:variable>

        <xsl:variable name="btn-class">
            <xsl:choose>
                <xsl:when test="@class">
                    <xsl:value-of select="@class"/>
                </xsl:when>
                <xsl:otherwise>default</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="target">
            <xsl:choose>
                <xsl:when test="$fixed-target">
                    <xsl:value-of select="$fixed-target"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="target"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="img-folder">
            <xsl:choose>
                <xsl:when test="$type='tools-bar'">tools-bar</xsl:when>
                <xsl:otherwise>menu</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <a class="list-group-item" target="{$target}" use-fa="{$use-fa}" position="{./@rel}" icon-position="{./img/@position}">

            <xsl:if test="$refresh_components != ''">
                <xsl:attribute name="refresh-components">
                    <xsl:value-of select="$refresh_components"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@labelConfirm">
                <xsl:attribute name="label-confirm">
                    <xsl:value-of select="@labelConfirm"/>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="@notvalidatefields = 'true'">
                <xsl:attribute name="notvalidatefields">
                    <xsl:value-of select="@notvalidatefields"/>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="target = 'sharpadbclient'">
                <xsl:attribute name="sharpadbclient">
                    <xsl:value-of select="@sharpadbclient"></xsl:value-of>
                </xsl:attribute>
            </xsl:if>

            <xsl:if test="img!=''">
                <xsl:attribute name="has-img">true</xsl:attribute>
            </xsl:if>

            <xsl:if test="contains($target, '|')">
                <xsl:call-template name="get-target-params">
                    <xsl:with-param name="list" select="$target"/>
                </xsl:call-template>
            </xsl:if>

            <xsl:call-template name="page-nav">
                <xsl:with-param name="action" select="link" />
                <xsl:with-param name="page" select="page" />
                <xsl:with-param name="app" select="app" />
                <xsl:with-param name="linkextra" select="parameter" />
            </xsl:call-template>

            <xsl:if test="img">
                <xsl:choose>
                    <xsl:when test="$use-fa != 'false'">
                        <xsl:call-template name="igrp-get-icon-item-with-color">
                            <xsl:with-param name="list" select="img"/>
                            <xsl:with-param name="use-fa" select="$use-fa"/>
                            <xsl:with-param name="img-folder" select="$img-folder"/>
                            <xsl:with-param name="style" select="$style"/>
                            <xsl:with-param name="rounded" select="$rounded"/>
                            <xsl:with-param name="size" select="$size"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <img src="{$path}/assets/img/v1/icon/{$img-folder}/{img}"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <span class="btn-text ">
                <xsl:value-of select="title"/>
            </span>
        </a>
    </xsl:template>

    <xsl:template name="igrp-get-icon-item-with-color">
        <!--passed template parameter -->
        <xsl:param name="list"/>
        <xsl:param name="delimiter" select="'|'"/>
        <xsl:param name="use-fa" select="'true'"/>
        <xsl:param name="img-folder" select="''"/>
        <xsl:param name="size" select="'normal'"/>
        <xsl:param name="btnClass">
            <xsl:text>btn-label </xsl:text>
        </xsl:param>
        <xsl:param name="text-class" select="''"/>
        <xsl:param name="icon-class" select="''"/>
        <xsl:param name="classes" select="'btn'"/>

        <xsl:param name="style" select="'btn'"/>
        <xsl:param name="rounded" select="'false'"/>

        <xsl:choose>
            <xsl:when test="contains($list, $delimiter)">
                <xsl:variable name="btn-prefix">
                    <xsl:choose>
                        <xsl:when test="$style != ''">
                            <xsl:text></xsl:text>
                            <xsl:value-of select="$style"></xsl:value-of>
                            <xsl:text>-</xsl:text>
                        </xsl:when>
                        <xsl:otherwise></xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:attribute name="class">
                    <xsl:value-of select="concat($btnClass,' ',$style,' ',substring-before($list,$delimiter))"/>
                    <xsl:if test="$rounded = 'true'">
                        <xsl:value-of select="' rounded-pill'"/>
                    </xsl:if>
                    <xsl:if test="$size != ''">
                        <xsl:value-of select="concat(' btn-',$size)"/>
                    </xsl:if>
                </xsl:attribute>
                <xsl:call-template name="igrp-get-icon-item-with-color">
                    <xsl:with-param name="list" select="substring-after($list,$delimiter)"/>
                    <xsl:with-param name="delimiter" select="$delimiter"/>
                    <xsl:with-param name="use-fa" select="$use-fa"/>
                    <xsl:with-param name="text-class" select="$text-class"/>
                    <xsl:with-param name="icon-class" select="$icon-class"/>
                    <xsl:with-param name="img-folder" select="$img-folder"/>
                    <xsl:with-param name="style" select="$style"/>
                    <xsl:with-param name="rounded" select="$rounded"/>
                    <xsl:with-param name="size" select="$size"/>
                    
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="$list != ''">
                        <xsl:choose>
                            <xsl:when test="$use-fa = 'true'">
                                <xsl:variable name="icon-rounded">
                                    <xsl:if test="$rounded = 'true'">
                                        <xsl:value-of select="' rounded-pill'"/>
                                    </xsl:if>
                                </xsl:variable>
                                <i class="fa {$list} {$icon-class} label-icon align-middle fs-16 {$icon-rounded}"></i>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:attribute name="class">
                                    <xsl:value-of select="concat($btnClass,'-',$size,' ')"/>
                                    <xsl:value-of select="concat($btnClass,' ',$btnClass,'-default')"/>
                                    <xsl:value-of select="concat(' ',$classes)"/>
                                </xsl:attribute>
                                
                                <div class="icon-item-holder">
                                    <img src="{$path}/assets/img/v1/icon/{$img-folder}/{img}"/>
                                </div>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:attribute name="has-icon">false</xsl:attribute>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>


    </xsl:template>
    
    <xsl:template name="igrp-page-messages">
        <xsl:param name="messages"></xsl:param>
        <xsl:for-each select="$messages">
            <xsl:if test=". and . != ''">
                <xsl:variable name="msg-type">
                    <xsl:call-template name="igrp-msg-transform"/>
                </xsl:variable>
                <xsl:variable name="msg-icon">
                    <xsl:call-template name="igrp-msg-icon"/>
                </xsl:variable>
                <div class="alert alert-{$msg-type} alert-border-left alert-dismissible fade show" role="alert">
                    <span class="disable-output-escaping ">
                        <xsl:value-of select="." disable-output-escaping="yes"/>
                    </span>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="igrp-page-attributes">
        <xsl:attribute name="page-target">
            <xsl:value-of select="//rows/target"/>
        </xsl:attribute>
        <xsl:attribute name="page-theme">
            <xsl:value-of select="//rows/template"/>
        </xsl:attribute>
        <xsl:attribute name="base-path">
            <xsl:value-of select="$path"/>
        </xsl:attribute>
        <xsl:attribute name="app">
            <xsl:value-of select="//rows/app"/>
        </xsl:attribute>
        <xsl:attribute name="page">
            <xsl:value-of select="//rows/page"/>
        </xsl:attribute>
        
        <xsl:attribute name="lang">pt</xsl:attribute>
        <xsl:attribute name="data-layout">vertical</xsl:attribute>
        <xsl:attribute name="data-topbar">light</xsl:attribute>
        <xsl:attribute name="data-sidebar">dark</xsl:attribute>
        <xsl:attribute name="data-sidebar-size">lg</xsl:attribute>
        <xsl:attribute name="data-sidebar-image">none</xsl:attribute>
        <xsl:attribute name="data-preloader">disable</xsl:attribute>

    </xsl:template>

</xsl:stylesheet>
