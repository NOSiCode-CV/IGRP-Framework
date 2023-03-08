<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template name="apps-v4">
        <xsl:variable name="apps" select="document(//rows/applications/@file)/applications"></xsl:variable>
        <xsl:variable name="coummunities-url" select="concat($path,'/xml/IGRP-communities.xml')"/>
        <xsl:variable name="communities" select="document($coummunities-url)/communities"/>

        <xsl:variable name="col-apps">
            <xsl:choose>
                <xsl:when test="$communities">col-lg-8 px-0 pr-md-4 pl-md-0</xsl:when>
                <xsl:otherwise>col-lg-12</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <div class="igrp-apps bootstrap-iso">
            <div class="container-md py-0 py-md-5">
             
                <div class="igrp-welcome d-flex d-md-block flex-column justify-content-end pb-5 pb-md-0 align-items-start ">
                    <div class="time d-md-none text-white ">

                    </div>
                    <div class="order-1 order-md-0 mb-md-5">
                        <h1 class="igrp-welcome-text font-weight-bold text-neutral-900 mb-0 mb-md-1">
                            <span class="">
                                <xsl:value-of select="rows/site/welcome_note"></xsl:value-of>
                                <xsl:text>,</xsl:text>
                            </span>
                            <span class="ml-2 app-username">
                                <xsl:value-of select="rows/site/user_name"></xsl:value-of>
                            </span>
                            <img src="{$themePath}/media/icons/hello.svg" width="20" class="d-none d-md-inline-block ml-3"/>
                        </h1>
                        <div class="igrp-welcome-desc text-neutral-700 mb-5 d-none d-md-block mt-4 col-xl-8 p-0">
                            <xsl:value-of select="rows/site/description"></xsl:value-of>
                            Bem-vind@ À <u class="fw-700">igrpWeb</u>. Uma plataforma tecnológica única e robusta que permite criar e correr aplicações de governação eletrónica de forma simples, segura, integrada e sustentável.
                        </div>
                    </div>
                    <div class="igrp-logo order-0 order-md-1 mb-4 mb-md-0 d-none">
                        <img src="{$themePath}/media/logo.svg" alt="igrpweb" width="120" class="d-none d-md-block"/>
                        <img src="{$themePath}/media/logo-white.svg" alt="igrpweb" width="120" class="d-md-none"/>
                    </div>
                </div>
                  
                <div class="row igrp-home w-100"> 
                    <div class="{$col-apps}">
                        <ul class="nav nav-tabs border-0 d-flex align-items-center flex-nowrap">
                            <li class="" rel="minhas_aplicacoes">
                                <a active-text-color="primary-900" data-toggle="tab" aria-expanded="true" href="#minhas_aplicacoes" class="active">
                                    <span>
                                        <xsl:value-of select="$apps/title"/>
                                    </span>
                                </a>
                            </li>
                            <li rel="outras_apps">
                                <a active-text-color="primary-900" data-toggle="tab" aria-expanded="true" href="#outras_apps">
                                    <span>
                                        <xsl:value-of select="$apps/subtitle"/>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="tab-content bg-transparent border-0 p-0">
                            <div class="tab-pane active" id="minhas_aplicacoes">
                                <div class="row">
                                    <xsl:for-each select="$apps/application[@available='yes']"> 
                                        <div class="col-md-6 mb-4 igrp-card-app" search-content="{title}">
                                            <xsl:variable name="has-img">
                                                <xsl:if test="img"><xsl:text>has-img</xsl:text></xsl:if>
                                            </xsl:variable>
                                            <a href="{link}" class="d-flex align-items-center bg-white border-radius-4 p-4 text-decoration-none position-relative"> 
                                                <div class="igrp-card-app-logo bg-primary-200 border-radius-4 mr-3" style="min-width:44px;">
                                                    <xsl:choose>
                                                        <xsl:when test="$has-img">
                                                            <div class="igrp-app-icon bg-transparent border-radius-4 p-0">
                                                                <img src="{$path}/assets/img/iconApp/{img}" class="w-auto" height="24"/>
                                                            </div>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <div class="igrp-app-icon bg-primary-800 border-radius-4">                                
                                                                
                                                            </div>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                    
                                                    
                                                </div>
                                                <div class="igrp-app-name fw-500 text-neutral-900 mr-5">
                                                    <xsl:value-of select="title"/>
                                                </div>
                                                <i class="fa fa-arrow-right text-primary-900 position-absolute"></i>
                                            </a>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </div>
                            <div class="tab-pane " id="outras_apps">
                                <div class="row">
                                    <xsl:for-each select="$apps/application[@available='no']"> 
                                        <div class="col-md-6 mb-4 igrp-card-app not-available" search-content="{title}">
                                            <xsl:variable name="has-img">
                                                <xsl:if test="img"><xsl:text>has-img</xsl:text></xsl:if>
                                            </xsl:variable>
                                            <a href="#" class="d-flex align-items-center bg-white border-radius-4 p-4 text-decoration-none position-relative"> 
                                                <div class="igrp-card-app-logo bg-primary-200 border-radius-4 mr-3" style="min-width:44px;">
                                                    <xsl:choose>
                                                        <xsl:when test="$has-img">
                                                            <div class="igrp-app-icon bg-transparent border-radius-4 p-0">
                                                                <img src="{$path}/assets/img/iconApp/{img}" class="w-auto" height="24"/>
                                                            </div>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <div class="igrp-app-icon bg-primary-800 border-radius-4">                                
                                                                
                                                            </div>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </div>
                                                <div class="igrp-app-name fw-500 text-neutral-900 mr-5">
                                                    <xsl:value-of select="title"/>
                                                </div>
                                               
                                            </a>
                                        </div>
                                    </xsl:for-each>
                                </div>
                            </div>
                        </div>
                    </div>
                    <xsl:if test="$communities">
                        <div class="col px-0 px-lg-4">
                            <div class="bg-white igrp-community p-5">
                                <div class="igrp-community-name fw-600 text-neutral-900 mr-3 mb-2">
                                    <xsl:value-of select="$communities/title"></xsl:value-of>
                                </div>
                                <div class="igrp-community-desc text-neutral-700 mb-3">
                                    <xsl:value-of select="$communities/description"></xsl:value-of>
                                </div>
                                <div class="text-primary-900 font-weight-bold text-uppercase mb-4 d-flex align-items-center">
                                    <xsl:value-of select="$communities/subtitle"></xsl:value-of>
                                    <i class="fa fa-arrow-right ml-1"></i>
                                </div>

                                <div class="d-flex igrp-community-platform flex-wrap">
                                    <xsl:for-each select="$communities/community[@available='yes']">
                                        <a target="_newtab" href="{link}" class="d-flex align-items-center border-radius-4 py-3 px-4 text-decoration-none mr-3 mb-3 text-dark font-weight-bold">
                                            <xsl:choose>
                                                <xsl:when test="icon">
                                                    <i class="fa {icon} mr-2" style="color: {color}; font-size: 24px;"></i>
                                                </xsl:when>
                                                <xsl:when test="img">
                                                    <img src="{img}" class="mr-2" height="24"/>
                                                </xsl:when>
                                            </xsl:choose>
                                            
                                            <xsl:value-of select="title"></xsl:value-of>
                                        </a>
                                    </xsl:for-each>
                                </div>

                            </div>
                        </div>
                    </xsl:if>
                   
                </div>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="home-v4">

        <xsl:variable name="communities" select="rows/communities"/>

        <xsl:variable name="col-apps">
            <xsl:choose>
                <xsl:when test="$communities">col-lg-8</xsl:when>
                <xsl:otherwise>col-lg-12</xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <head>
            <xsl:call-template name="IGRP-head"/>
        </head>

        <body class="{$bodyClass} old-v fluid sidebar-off " style="background: #F8F9FA;">
            <div class="igrp-home">
                <div class="bootstrap-iso">
                    <div class="container py-5 my-lg-4">
        
                        <div class="igrp-welcome d-flex flex-column flex-md-row justify-content-center align-items-center align-items-md-start justify-content-md-between">
                            <div class="order-1 order-md-0 text-center text-md-left">
                                <h1 class="igrp-welcome-text font-weight-bold text-neutral-900 mb-3 mb-md-1 d-flex">
                                    <span class="mr-3">
                                        <xsl:value-of select="rows/site/welcome_note"></xsl:value-of>
                                    </span>
                                    <span>
                                        <xsl:value-of select="rows/site/user_name"></xsl:value-of>
                                    </span>
                                    <img src="https://media.giphy.com/media/hvRJCLFzcasrR4ia7z/giphy.gif" width="30" class="d-none d-md-inline-block" onerror="this.onerror=null; this.src='{$themePath}/media/icons/hello.svg';"/>
                                </h1>
                                <div class="igrp-welcome-desc text-neutral-700 mb-5 d-none d-md-block">
                                    <xsl:value-of select="rows/site/description"></xsl:value-of>
                                </div>
                            </div>
                            <div class="igrp-logo order-0 order-md-1 mb-4 mb-md-0">
                                <img src="{$themePath}/media/logo.svg" alt="igrpweb" width="120" class="d-none d-md-block"/>
                                <img src="{$themePath}/media/logo-white.svg" alt="igrpweb" width="120" class="d-md-none"/>
                            </div>
                        </div>
        
                        <div class="row pb-5 igrp-home-sep">
                            <div class="{$col-apps}">
                                <div class="d-md-flex justify-content-md-between">
                                    <h2 class="igrp-app-header text-neutral-800 font-weight-bold mb-4 mb-md-0 text-capitalize">
                                        <xsl:value-of select="document(rows/applications/@file)/applications/title"></xsl:value-of>
                                    </h2>
                                    <div class="igrp-search-app">
                                        <div class="form-group d-flex align-items-center mb-0 bg-white border-radius-4">
                                            <a class="search-clean position-absolute d-flex">   
                                                <i class="fa fa-search text-neutral-700 px-3"></i>                                                 
                                            </a>                                               
                                            <input placeholder="Pesquisar aplicação..." type="text" class="pl-5 pr-4 py-3 text-neutral-700 border-0" id="igrp-app-finder" />
                                        </div>
        
                                        <div class="not-found d-none pt-3 text-neutral-700 text-center">
                                        Nenhum resultado encontrado
                                        </div>
        
                                    </div>
                                </div>
                            </div>
                        </div>
        
                        <div class="row pt-4">
                            <div class="{$col-apps} mb-4 mb-lg-0">
                                <xsl:apply-templates mode="igrp-apps" select="document(rows/applications/@file)"/>
                            </div>
                            <xsl:if test="$communities">
                                <div class="col-lg-4 mt-4 m-lg-0">
                                    
                                        <div class="bg-white igrp-community p-5">
                                            <div class="igrp-community-name fw-500 text-neutral-900 mr-3 mb-2">
                                                <xsl:value-of select="document(rows/communities/@file)/communities/title"></xsl:value-of>
                                            </div>
                                            <div class="igrp-community-desc text-neutral-700 mb-3">
                                                <xsl:value-of select="document(rows/communities/@file)/communities/description"></xsl:value-of>
                                            </div>
                                            <div class="text-primary-900 font-weight-bold text-uppercase mb-4 d-flex align-items-center">
                                                <xsl:value-of select="document(rows/communities/@file)/communities/subtitle"></xsl:value-of>
                                                <i class="fa fa-arrow-right ml-1"></i>
                                            </div>
            
                                            <div class="d-flex igrp-community-platform flex-wrap">
                                                <xsl:for-each select="document(rows/communities/@file)/communities/community">
                                                    <a href="{link}" class="d-flex align-items-center border-radius-4 py-3 px-4 text-decoration-none mr-3 mb-3 text-dark font-weight-bold">
                                                        <i class="fa {icon} mr-2" style="color: {color}; font-size: 24px;"></i>
                                                        <xsl:value-of select="title"></xsl:value-of>
                                                    </a>
                                                </xsl:for-each>
                                            </div>
            
                                        </div>
                                    
                                </div>
                            </xsl:if>
                        </div>
        
                    </div>
                </div>
        
                <xsl:call-template name="IGRP-bottom"/>
        
            </div>
        
        
            <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/form/igrp.forms.css" media="none" onload="if(media!='all')media='all'"/>
            <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css" media="none" onload="if(media!='all')media='all'"/>
            <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css" media="none" onload="if(media!='all')media='all'"/>
            <link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css" media="none" onload="if(media!='all')media='all'"/>
            <script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js"/>
        
            <script type="text/javascript" src="{$path}/themes/ds-beta/js/igrp.home.js"></script>
        
            <!--<script type="text/javascript" src="{$path}/core/igrp/home/igrp.home.js"></script>-->
        
            <script>      
        
                
            </script>
        
        </body>
        
    </xsl:template>
</xsl:stylesheet>
