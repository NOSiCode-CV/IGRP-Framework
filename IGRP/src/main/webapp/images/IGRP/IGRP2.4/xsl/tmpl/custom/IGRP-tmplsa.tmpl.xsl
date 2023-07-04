<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template name="tmplsatv">
        <div class="box igrp-box-holder gen-container-item clean" gen-class="" item-name="box_controll">
            <div class="box-body box-tmpltv" gen-preserve-content="true">
                <xsl:variable name="tvtmpl" select="rows/content/extrafields/fields/hidden[@name = 'p_template']/text()"/>
                <xsl:attribute name="template">
                    <xsl:choose>
                        <xsl:when test="$tvtmpl = 2">rigthPartners</xsl:when>
                        <xsl:when test="$tvtmpl = 3">notPartners</xsl:when>
                        <xsl:otherwise>default</xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <div class="holder-hidden">
                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_controll/fields"/>
                    <xsl:apply-templates mode="form-hidden-fields" select="rows/content/controll/fields"/>
                </div>
                <div class="col-sm-12 holder-box-controll">
                    <div class="row holder-header letter-spacing" id="row-4c01a7ae">
                        <xsl:if test="rows/content/controll">
                            <div class="col-sm-7 holder-title-today height-header">
                                <div class="col-sm-12">
                                    <xsl:if test="rows/content/controll/fields/title">
                                        <div class="holder-title" item-name="title" item-type="plaintext">
                                            <xsl:value-of select="rows/content/controll/fields/title/value"/>
                                        </div>
                                    </xsl:if>
                                </div>
                                <!--<div class="col-sm-2">
                                    <xsl:if test="rows/content/controll/fields/today">
                                        <div class="holder-today text-right" item-name="today" item-type="plaintext">
                                            <xsl:value-of select="rows/content/controll/fields/today/value"/>
                                        </div>
                                    </xsl:if>
                                </div>-->
                            </div>
                            <div class="col-sm-5 holder-time-stringdate height-header holder-grey-color">
                                <xsl:if test="rows/content/controll/fields/time">
                                    <div class="holder-time" item-name="time" item-type="plaintext">
                                        <xsl:value-of select="rows/content/controll/fields/time/value"/>
                                    </div>
                                </xsl:if>
                                <xsl:if test="rows/content/controll/fields/stringdate">
                                    <div class="holder-stringdate" item-name="stringdate" item-type="plaintext">
                                        <xsl:value-of select="rows/content/controll/fields/stringdate/value"/>
                                    </div>
                                </xsl:if>
                            </div>
                        </xsl:if>
                    </div>
                    <div class="row " id="row-7f10e897">
                        <div class="gen-column holder-left col-sm-7 mt-7 mb-4">
                            <div class="gen-inner letter-spacing">
                                <xsl:if test="rows/content/infotoday">
                                    <div class="igrp-infopanel gen-container-item holder-infotoday" gen-class="" item-name="infotoday">
                                        <a class="quick-stats__item" style="box-shadow: 0px 0px 2px 0px {rows/content/infotoday/fields/infotoday_bg/value};">
                                            <div class="infotoday-icon box-icon">
                                                <img src="{rows/content/infotoday/fields/infotoday_icn/value}"/>
                                            </div>
                                            <div class="quick-stats__info text-uppercase">
                                                <xsl:if test="rows/content/controll/fields/updated">
                                                    <div class="infotoday-updated text-right" item-name="updated" item-type="plaintext">
                                                        <span class="updated-label"><i class="fa fa-clock" /></span>
                                                        <span class="updated-label"><xsl:value-of select="rows/content/controll/fields/updated/label"/>:</span>
                                                        <span class="updated-value"><xsl:value-of select="rows/content/controll/fields/updated/value"/></span>
                                                    </div>
                                                </xsl:if>
                                                <div class="infotoday-title">
                                                    <xsl:value-of select="rows/content/infotoday/fields/infotoday_title/value"/>
                                                </div>
                                                <div class="infotoday-desc">
                                                    <xsl:value-of select="rows/content/infotoday/fields/infotoday_val/value"/>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </xsl:if>
                                <xsl:if test="rows/content/ratingweek">
                                    <xsl:for-each select="rows/content/ratingweek/table/value/row[not(@total='yes')]">
                                        <div class="igrp-infopanel holder-ratingweek col-sm-4" gen-class="" item-name="infobox-{position()}">
                                            <div class="row">
                                                <div class="ratingweek-icon box-icon" style="background-color:{bgcolor}">
                                                    <img src="{icon}"/>
                                                    <!--<i class="fa {icon} fa-3x"/>-->
                                                </div>
                                                <a class="holder-h-15 quick-stats__item" style="box-shadow: 0px 0px 2px 0px {bgcolor};">
                                                    <div class="quick-stats__info text-capitalizer">
                                                        <div class="ratingweek-day">
                                                            <xsl:value-of select="day"/>
                                                        </div>
                                                        <div class="ratingweek-ratingdate">
                                                            <xsl:value-of select="ratingdate"/>
                                                        </div>
                                                        <div class="ratingweek-rating">
                                                            <xsl:value-of select="rating"/>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </xsl:for-each>
                                </xsl:if>
                            </div>
                        </div>
                        <div class="gen-column col-sm-5">
                            <div class="row">
                                <xsl:if test="rows/content/video_1">
                                    <div class="holder-video" gen-class="" item-name="video_1">
                                        <xsl:variable name="url" select="rows/content/video_1/fields/video_1_text/value"/>
                                        <xsl:variable name="urlvideo">
                                            <xsl:choose>
                                                <xsl:when test="contains($url, '?')">
                                                    <xsl:value-of select="concat($url,'&amp;version=3&amp;autoplay=1&amp;loop=1')"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:value-of select="concat($url,'?version=3&amp;autoplay=1&amp;loop=1')"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>
                                        <iframe src="{$urlvideo}" allow="autoplay" frameborder="0" allowfullscreen=""/>
                                    </div>
                                </xsl:if>
                            </div>
                            <xsl:if test="$tvtmpl = 2">
                                <xsl:call-template name="tmplpartners">
                                    <xsl:with-param name="sizelogo" select="3" />
                                </xsl:call-template>
                            </xsl:if>
                        </div>
                    </div>

                    <xsl:if test="$tvtmpl = 1 or not($tvtmpl)">
                        <xsl:call-template name="tmplpartners"/>
                    </xsl:if>
                    
                    <div class="row holder-footer letter-spacing" id="row-9362848f">
                        <div class="col-sm-1 holder-usefulinfo">
                            <span class="text-center"><xsl:value-of select="rows/content/usefulinfo/@title"/>:
                            </span>
                        </div>
                        <div class="col-sm-11 holder-info">
                            <div class="holder-slide text-right">
                                <div class="holder-slide-item">
                                    <xsl:for-each select="rows/content/usefulinfo/table/value/row[not(@total='yes')]">
                                        <span id="item-{position()}">
                                            <xsl:if test="position() = 1">
                                                <xsl:attribute name="class">active</xsl:attribute>
                                            </xsl:if>
                                            <xsl:value-of select="info"/>
                                        </span>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="tmplpartners">
        <xsl:param name="height" select="17"/>
        <xsl:param name="sizelogo" select="2"/>
        <div class="row holder-rating holder-grey-color" id="row-54744f84">
                        
            <div class="holder-h-{$height}">
                <xsl:for-each select="rows/content/listlogo/table/value/row[not(@total='yes')]">
                    <div class="col-sm-{$sizelogo} holder-logo-icon">
                        <img src="{logo}"/>
                    </div>
                </xsl:for-each>
            </div>

        </div>
    </xsl:template>
    
    <xsl:template name="tmplsarating">
        <div class="row holder-sarating" item-name="box_controll"  id="row-c5bb0235">
            <div class="holder-hidden">
                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_controll/fields"/>
            </div>
            <div class="container" item-name="rating">
                <div class="satitle disable-output-escaping text-center letter-spacing">
                    <xsl:value-of disable-output-escaping="yes" select="rows/content/rating_title/fields/rating_title_text/value"/>
                </div>

                <div class="container-sarating">
                    <xsl:for-each select="rows/content/rating/table/value/row[not(@total='yes')]">
                        <xsl:if test="rating_link != ''">
                            <a href="{normalize-space(rating_link)}" class="link bClick btn btn-link sarating-img flex-fill" style="background-image:url('{rating_logo}')" target="submit" name="rating_link">
                                <span class="sarating-desc letter-spacing"><xsl:value-of select="rating_link_desc"/></span>
                            </a>
                        </xsl:if>
                    </xsl:for-each>
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="tmplattendance">
        <div class="row" id="row-28769b6b">
            <div class="holder-hidden">
                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_controll/fields"/>
                <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_controll/fields"/>
            </div>
            <div class="holder-top">
                <div class="holder-bg" style="background-image:url('{rows/content/form_controll/fields/bg_image/value}')">
                </div>
            </div>

            <div class="holder-logo">
                <xsl:if test="rows/content/form_controll/fields/logo_entity">
                    <img class="sa-logo" src="{rows/content/form_controll/fields/logo_entity/value}"/>
                </xsl:if> 
                <xsl:if test="rows/content/form_controll/fields/entity">
                    <div class="sa-entity"><xsl:copy-of select="rows/content/form_controll/fields/entity/value"/></div>
                </xsl:if>
                <xsl:if test="rows/content/form_controll/fields/agency">
                    <div class="sa-agency"><xsl:copy-of select="rows/content/form_controll/fields/agency/value"/></div>
                </xsl:if>   
            </div>

            <div id="app-top-menu">
                <xsl:if test="rows/content/form_controll/fields/config">
                    <a href="{rows/content/form_controll/fields/config/value}" item-name="config" id="app-config"  class="btn btn-link" target="_self">
                        <i class="fa fa-cog" title="{rows/content/form_controll/fields/config/label}" data-toggle="tooltip"></i>
                    </a>
                </xsl:if>
                <xsl:if test="rows/content/form_controll/fields/logout">
                    <a href="{rows/content/form_controll/fields/logout/value}" item-name="logout" id="app-logout" class="btn btn-link" target="_self">
                        <i class="fa fa-sign-out" title="{rows/content/form_controll/fields/logout/label}" data-toggle="tooltip" />
                    </a>
                </xsl:if>
            </div>

            <xsl:if test="rows/content/form_controll/fields/start_service">
                <div id="holder-init">
                    <a id="app-init" href="{rows/content/form_controll/fields/start_service/value}" item-name="start_service" title="{rows/content/form_controll/fields/start_service/label}" class="btn btn-lg btn-primary" data-toggle="tooltip">
                        <i class="fa fa-arrow-right icon-active"></i>
                        <i class="fa fa-circle-notch icon-waiting fa-spin"></i>
                    </a>
                </div>
            </xsl:if>

            <div id="holder-bottom">
                <xsl:if test="rows/content/attendance">
                    <div class="col-md-6">
                        <div class="row">
                            <div class="holder-attendance attendance-box">
                                <div class="box-title">
                                    <span><xsl:value-of select="rows/content/attendance/@title"/></span>
                                    <i class="fa icon fa-user"></i>
                                </div>
                                <div class="box-body">
                                    <div class="col-md-6">
                                        <xsl:if test="rows/content/attendance/fields/today">
                                            <div class="holder-today">
                                                <div class="today-content">
                                                    <span class="show-value"><xsl:value-of select="rows/content/attendance/fields/today/value"/></span>
                                                    <span class="show-label"><xsl:value-of select="rows/content/attendance/fields/today/label"/></span>
                                                </div>
                                            </div>
                                        </xsl:if>

                                        <xsl:if test="rows/content/service_graphic">
                                            <div class="holder-graphic" gen-structure="graphic" item-name="service_graphic" style="margin-top: 120px;">
                                                <xsl:call-template name="igrp-graph">
                                                    <xsl:with-param name="table" select="rows/content/service_graphic"/>
                                                    <xsl:with-param name="chart_type" select="rows/content/service_graphic/chart_type"/>
                                                    <xsl:with-param name="height" select="'150'"/>
                                                    <xsl:with-param name="title" select="'Chart'"/>
                                                    <xsl:with-param name="url" select="rows/content/service_graphic/url"/>
                                                </xsl:call-template>
                                            </div>
                                        </xsl:if>
                                    </div>
                                    <div class="col-md-6">
                                        <xsl:if test="rows/content/attendance/fields/this_month">
                                            <div class="today-bar rm-r">
                                                <span class="bar-value">
                                                    <xsl:value-of select="rows/content/attendance/fields/this_month/value"/>
                                                </span>
                                                <span class="bar-label">
                                                    <xsl:value-of select="rows/content/attendance/fields/this_month/label"/>
                                                </span>
                                            </div>
                                        </xsl:if>
                                        
                                        <xsl:if test="rows/content/attendance/fields/last_month">
                                            <div class="today-bar rm-r">
                                                <span class="bar-value">
                                                    <xsl:value-of select="rows/content/attendance/fields/last_month/value"/>
                                                </span>
                                                <span class="bar-label">
                                                    <xsl:value-of select="rows/content/attendance/fields/last_month/label"/>
                                                </span>
                                            </div>
                                        </xsl:if>

                                        <xsl:if test="rows/content/attendance/fields/total_service_time">
                                            <div class="today-time rm-r">
                                                <span class="bar-value">
                                                    <xsl:value-of select="rows/content/attendance/fields/total_service_time/value"/>
                                                </span>
                                                <span class="bar-label">
                                                    <xsl:value-of select="rows/content/attendance/fields/total_service_time/label"/>
                                                </span>
                                            </div>
                                        </xsl:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </xsl:if>
                <xsl:if test="rows/content/service_history">
                    <div class="col-md-6 ">
                        <div class="holder-history attendance-box rm-r">
                            <div class="box-title">
                                <span><xsl:value-of select="rows/content/service_history/@title"/></span>
                                <i class="fa icon fa-list"></i>
                            </div>
                            <div class="box-body">
                                <xsl:if test="rows/content/service_history">
                                    <xsl:for-each select="rows/content/service_history/table/value/row[not(@total='yes')]">
                                        <div class="holder-history-item">
                                            <xsl:if test="description">
                                                <i class="icon fa fa-check"  style="background-color:{color}"></i>
                                                <div class="item-description" style="color:{color}">
                                                    <span class="title"><xsl:value-of select="description"/></span>
                                                    <span class="status"><xsl:value-of select="status"/></span>
                                                </div>
                                                <span class="item-time"><xsl:value-of select="time"/></span>
                                            </xsl:if>
                                        </div>
                                    </xsl:for-each>
                                </xsl:if>
                            </div>
                        </div>
                    </div>
                </xsl:if>
                <xsl:if test="rows/content/team_messages  and 2 = 1">
                    <div class="col-md-4">
                        <div class="row">
                            <div class="holder-messages attendance-box">
                                <div class="box-title">
                                    <span><xsl:value-of select="rows/content/team_messages/@title"/></span>
                                    <i class="fa icon fa-comments"></i>
                                </div>
                                <div class="box-body"></div>
                            </div>
                        </div>
                    </div>
                </xsl:if>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="SA-sidebar">
        <xsl:param name="drag" select="false()"/>

        <xsl:variable name="drag-class">
            <xsl:if test="$drag">drag-handler</xsl:if>
        </xsl:variable>

        <div class="col-md-2 col-sm-3 sidebar tree-list SA-sidebar" id="igrp-sidebar">

            <div class="holder-logo"></div>
          
            <div class="sa-sidebar-search col-md-2 col-sm-3" bg-color="1">
                <input type="text" id="sa-service-searcher" class="form-control" placeholder="Pesquisar..."/>
            </div>

            <ul class="nav nav-sidebar" id="sa-service-list" style="clear:both;top: 100px;">
                <xsl:for-each select="rows/content/lista_menu/table/value/row[not(@total='yes')]/menu_id[not(.=preceding::*)]">
                    <xsl:variable name="menuid" select="."/>
                    <xsl:variable name="menu" select=".."/>
                    <xsl:variable name="submenus" select="../../row[not(@total='yes')][menu_id = $menuid]"/>
                    <li>
                        <xsl:if test="$submenus">
                            <xsl:attribute name="class">treeview</xsl:attribute>
                        </xsl:if>
                        
                        <a href="#" class="service-parent">
                            <xsl:value-of select="$menu/menu"/>
                            <i class="fa fa-angle-right pull-right"></i>
                            <span class="nav-bar-active"/>
                        </a>

                        <xsl:if test="$submenus">
                            <ul class="treeview-menu">
                                <xsl:for-each select="$submenus">
                                    <li class="parent-services" data-icon="{icon_serv}" data-id="{id_servico}" data-menu-type="{tipo_menu_serv}">
                                        <a class="service-item {$drag-class} btn-services">
                                            <xsl:choose>
                                                <xsl:when test="$drag">
                                                    <xsl:attribute name="rel">
                                                        <xsl:value-of select="link_servico"/>
                                                    </xsl:attribute>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:attribute name="href">
                                                        <xsl:value-of select="link_servico"/>
                                                    </xsl:attribute>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <i class="fa fa-circle-o"></i>
                                            <span class="card-text"><xsl:value-of select="submenu"/></span>
                                            <span class="app-info"><xsl:value-of select="info_serv"/></span>
                                        </a>
                                    </li>
                                </xsl:for-each>
                            </ul>
                        </xsl:if>
                    </li>
                </xsl:for-each>
            </ul>
        </div>
    </xsl:template>

    <xsl:template name="SA-favapp">
        <xsl:param name="isconfi" select="true()"/>

        <div id="sa-btns-holder" class="clearfix">
            <xsl:if test="rows/content/sectionheader_1/fields/sectionheader_1_text/value">
                <div class="page-title disable-output-escaping">
                    <xsl:value-of disable-output-escaping="yes" select="rows/content/sectionheader_1/fields/sectionheader_1_text/value"></xsl:value-of>
                </div>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="$isconfi">
                    <xsl:if test="rows/content/form_controll/fields/voltar_inicio">
                    <a href="{rows/content/form_controll/fields/voltar_inicio/value}" class="btn btn-warning" target="_self">
                        <i class="fa fa-chevron-left"></i><xsl:value-of select="rows/content/form_controll/fields/voltar_inicio/label"/>
                    </a>
                    </xsl:if>
                    <xsl:if test="rows/content/form_controll/fields/save_favorites">
                    <a href="{rows/content/form_controll/fields/save_favorites/value}" id="sa-save-favs" class="btn btn-success">
                        <i class="fa fa-check"></i><xsl:value-of select="rows/content/form_controll/fields/save_favorites/label"/>
                    </a>
                    </xsl:if>
                </xsl:when>
                <xsl:otherwise>
                    <div class="sa-toolbar clearfix">
                        <ul class="nav navbar-nav navbar-right">
                            <xsl:if test="rows/content/form_controll/fields/tempo">
                                <li>
                                    <div id="sa-time-tracker" text-color="1">
                                        <div id="hour">00</div>
                                        <div class="divider">:</div>
                                        <div id="minute">00</div>
                                        <div class="divider">:</div>
                                        <div id="second">00</div>                
                                    </div>
                                </li>
                            </xsl:if>

                            <xsl:if test="rows/content/form_controll/fields/pause">
                                <li>
                                    <a href="{rows/content/form_controll/fields/pause/value}" data-toggle="tooltip" title="{rows/content/form_controll/fields/pause/label}" class="btn-toolbar" action="finishstart">
                                        <i class="fa fa-fast-forward"></i>
                                    </a>
                                </li>
                            </xsl:if>
                            <xsl:if test="rows/content/form_controll/fields/link_terminar_atend">
                                <li>
                                    <a href="{rows/content/form_controll/fields/link_terminar_atend/value}" data-toggle="tooltip" title="{rows/content/form_controll/fields/link_terminar_atend/label}" class="btn-toolbar" action="finish">
                                        <!--glyphicon glyphicon-copy-->
                                        <i class="fa fa-stop-circle-o"></i>
                                    </a>
                                </li>
                            </xsl:if>
                        </ul>
                    </div>
                </xsl:otherwise>
            </xsl:choose>
        </div>

        <div class="holder-hidden">
            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/box_controll/fields"/>
            <xsl:apply-templates mode="form-hidden-fields" select="rows/content/form_controll/fields"/>
        </div>

        <xsl:if test="rows/content/lista_favoritos">
            <div class="box-body" first-type-container="" last-type-container="true">
                <div role="form" gen-id="drop-zone">
                    <xsl:apply-templates mode="form-hidden" select="rows/content/form/value"/>
                    
                    <xsl:variable name="conutfav" select="count(rows/content/lista_favoritos/table/value/row[not(@total='yes')])"/>

                    <xsl:variable name="mdclass">
                        <xsl:choose>
                        <xsl:when test="$conutfav &lt; 3">6</xsl:when>
                        <xsl:when test="$conutfav &gt;= 3 and $conutfav &lt;= 6">4</xsl:when>
                        <xsl:otherwise>3</xsl:otherwise>
                        </xsl:choose>
                    </xsl:variable>

                    <div class="sa-favorites-holder">
                        <div class="table-btn-list self-boxed-item">
                            <div class="self-boxed-inner" list-style="buttonlist" id="sa-favorites-list">
                                <xsl:for-each select="rows/content/lista_favoritos/table/value/row[not(@total='yes')]">
                                    <div class="sa-list-item col-sm-3 col-xs-6 col-md-{$mdclass}" data-id="{id_servico_favorito}" data-menu-type="{tipo_menu_fav}">
                                        
                                        <input type="hidden" name="p_id_favorito_fk" value="{id_favorito}"/>
                                        <input type="hidden" name="p_id_favorito_fk_desc" value="{id_favorito_desc}"/>
                                        <input type="hidden" name="p_id_servico_favorito_fk" value="{id_servico_favorito}"/>
                                        <input type="hidden" name="p_id_servico_favorito_fk_desc" value="{id_servico_favorito_desc}"/>
                                        
                                        <xsl:choose>
                                            <xsl:when test="$isconfi">
                                                <input type="hidden" name="p_tipo_menu_fav_fk" value="{tipo_menu_fav}"/>
                                                <input type="hidden" name="p_tipo_menu_fav_fk_desc" value="{tipo_menu_fav_desc}"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <input type="hidden" name="p_info_menu_fav_fk" value="{info_menu_fav}"/>
                                                <input type="hidden" name="p_info_menu_fav_fk_desc" value="{info_menu_fav_desc}"/>
                                            </xsl:otherwise>
                                        </xsl:choose>

                                        <div class="row">
                                            <div class=" btn-list-item">
                                                <xsl:if test="$isconfi">
                                                    <a class="sa-icon sa-resize-favorite">
                                                        <i class="fa fa-arrows"></i>
                                                    </a>
                                                    <a class="sa-icon sa-remove-favorite">
                                                        <i class="fa fa-times"></i>
                                                    </a>
                                                </xsl:if>
                                                <div class="card">
                                                    <a href="{link_favorito}" class="card-container btn-services" data-toggle="tooltip">
                                                        <xsl:attribute name="title">
                                                            <xsl:if test="string-length(link_favorito_desc) &gt;= 27">
                                                                <xsl:value-of select="link_favorito_desc"/>
                                                            </xsl:if>
                                                        </xsl:attribute>
                                                        <xsl:if test="icon and icon != ''">
                                                            <div class="card-icon" style="background-image:url('{icon}');background: {cor};"></div>
                                                        </xsl:if>
                                                        <div class="card-title"><xsl:value-of select="link_favorito_desc"/></div>
                                                        <!--<span class="card-text txt-ellipsis" bg-color="1" style="background: {cor};">
                                                            <i class="fa fa-plus-circle plus open-info"/>
                                                            <i class="fa fa-minus-circle minus open-info"/>
                                                            <xsl:value-of select="link_favorito_desc"/>
                                                        </span>
                                                        <span class="app-info" bg-color="1" style="background: {cor};">
                                                            <xsl:value-of select="info_fav"/>
                                                        </span>-->
                                                    </a>
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

            <xsl:if test="$isconfi">
                <div class="hidden" id="tmpl-favoritos">
                    <div class="sa-list-item col-sm-3 col-xs-6" data-id="" data-menu-type="" ><div class="row"><div class=" btn-list-item"><a class="sa-icon sa-resize-favorite"><i class="fa fa-expand-arrows-alt"></i></a><a class="sa-icon sa-remove-favorite"><i class="fa fa-times"></i></a><div class="card"><a href="" class="card-container btn-services" data-toggle="tooltip" title=""><div class="card-icon"></div><div class="card-title"></div></a></div></div></div></div>
                </div>
            </xsl:if>
        </xsl:if>
    </xsl:template> 

    <xsl:template name="tmplconfigfav">
        <xsl:param name="isconfi" select="true()"/>
    
        <xsl:choose>
            <xsl:when test="rows/target and rows/target = '_blank'">
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
                
                <nav id="igrp-top-nav" class="navbar navbar-fixed-top SA-navbar" bg-color="1">
                    <a class="navbar-brand col-sm-3 col-md-2" id="goToHome">
                        <img src="{$logo}"/>
                        <span class=""><b>IGRP</b></span>
                    </a>
                    <div id="side-bar-ctrl"><i class="fa fa-navicon"></i></div>
                    <div id="igrp-app-title"><xsl:value-of select="rows/title"/></div>
                    <ul id="igrp-top-menu" class="hidden-xs nav navbar-nav navbar-right">
                        <li>
                            <a href="#"><xsl:value-of select="rows/site/user_name"/></a>
                        </li>
                    </ul>
                </nav>

                <div class="row">
                    <xsl:call-template name="SA-sidebar">
                        <xsl:with-param name="drag" select="$isconfi" />
                    </xsl:call-template>

                    <div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="sa-contents">

                        <xsl:call-template name="SA-favapp">
                            <xsl:with-param name="isconfi" select="$isconfi" />
                        </xsl:call-template>

                    </div>
                </div>
            </xsl:when>

            <xsl:otherwise>
                <xsl:call-template name="SA-favapp">
                    <xsl:with-param name="isconfi" select="$isconfi" />
                </xsl:call-template>
            </xsl:otherwise>

        </xsl:choose>

    </xsl:template>

</xsl:stylesheet>