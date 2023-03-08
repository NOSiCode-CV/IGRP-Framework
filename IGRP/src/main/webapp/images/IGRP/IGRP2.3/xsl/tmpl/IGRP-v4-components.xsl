<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

   <xsl:template name="sidebar-v4">
      <xsl:variable name="menus" select="document(rows/slide-menu/@file)/menus" />
      <xsl:variable name="top-menus" select="document(rows/top_menu/@file)/top_menu/button"/>
      <xsl:variable name="settings-url" select="$top-menus[title = 'Settings']/link"/>
     
      <xsl:variable name="logo">
         <xsl:choose>
            <xsl:when test="$themeConfigData/logo">
               <xsl:value-of select="concat($themePath,'/',$themeConfigData/logo)"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="concat($path,'/themes/default/img/logo2.svg')"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>

      <div class="col-md-2 col-sm-3 sidebar tree-list" id="igrp-sidebar">
         <div class="bootstrap-iso">
            <div class="d-flex flex-column sidebar-wrapper">
               <div class="logo-wrapper d-flex align-items-center px-4">   
                  <div class="app-logo d-flex align-items-center justify-content-center">
                     <a class="d-flex align-items-center justify-content-center logo text-white"  href="{$top-menus[title='Home']/link}">
                        <ion-icon name="finger-print-sharp"></ion-icon>
                     </a>
                  </div>
                  <div class="app-name text-wrap">
                     <a href="{$top-menus[title='Home']/link}" class="text-reset">
                        <xsl:value-of select="rows/title"></xsl:value-of>
                     </a>
                  </div>
                  <div class="app-context-menu ml-auto">
                     <div class="dropdown position-static">
                        <a class="text-reset text-decoration-none dropdown-toggle" id="dropdownMenuButton" data-toggle="dropdown">
                           <ion-icon name="apps-sharp"></ion-icon>
                        </a>
                        <div class="dropdown-menu context-dropdown p-4 go-to-wrapper" >
                           <div class="d-flex align-items-center ">
                              <b>Mudar para</b>
                              <div class="ml-auto">
                                 <a href="{rows/link}" class="d-flex align-items-center go-home">
                                    <span class="mr-2">Ir para início</span>
                                    <ion-icon name="home-outline"></ion-icon>
                                 </a>
                              </div>
                           </div>
                           <div class="mt-3">

                              <div class="d-flex align-items-center go-to-app-item">
                                 <div class="app-logo d-flex align-items-center justify-content-center">
                                    <div class="d-flex align-items-center justify-content-center logo">
                                       <ion-icon name="information-outline"></ion-icon>
                                    </div>
                                 </div>
                                 <div>
                                    <a href="https://docs.igrp.cv/" target="_newtab" class="go-to-app-name">Documentação IGRP</a>
                                 </div>
                              </div>
                              
                                 <div class="d-flex align-items-center go-to-app-item">
                                    <div class="app-logo d-flex align-items-center justify-content-center">
                                       <div class="d-flex align-items-center justify-content-center logo">
                                          <ion-icon name="code-outline"></ion-icon>
                                       </div>
                                    </div>
                                    <div>
                                       <span class="go-to-app-name">IGRP Studio</span>
                                    </div>
                                 </div>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>  
               <div class="sidebar-content p-4">
                  <div class="input-group sidebar-search mb-4">
                     <div class="input-group-prepend ">
                        <div class="input-group-text bg-transparent border-0">
                           <ion-icon name="search-outline"></ion-icon>
                        </div>
                     </div>
                     <input 
                        type="text" 
                        class="form-control bg-transparent border-0 shadow-none igrp-search-list" 
                        search-list="#igrp-sidebar .menu-item>a, #igrp-sidebar .sidebar-menu>a"
                        search-attr="text"
                        search-item-parent=".menu-item"
                        search-item-wrapper=".sidebar-menu"
                        placeholder="" 
                     />
                  </div>
                  <div id="sidebar-menu-wrapper">
                     <xsl:for-each select="$menus/menu">
                        <xsl:variable name="menu-link">
                           <xsl:choose>
                              <xsl:when test="link"><xsl:value-of select="link"/></xsl:when>
                              <xsl:otherwise>javascript:return false;</xsl:otherwise>
                           </xsl:choose>
                        </xsl:variable>
                        <div class="mb-2 menu-item">
                           <a href="{$menu-link}" text="{title}" class="text-reset text-decoration-none d-flex align-items-center pr-3 cursor-pointer" >
                              <xsl:choose>
                                 <xsl:when test="not(link) ">
                                    <xsl:attribute name="data-toggle"><xsl:text>collapse</xsl:text></xsl:attribute>
                                    <xsl:attribute name="data-target"><xsl:value-of select="concat('#sidebar-menu-', position() )"/></xsl:attribute>
                                    <xsl:attribute name="aria-expanded"><xsl:text>false</xsl:text></xsl:attribute>
                                 </xsl:when>
                                 <xsl:otherwise>
                                    <xsl:attribute name="target">
                                       <xsl:choose>
                                          <xsl:when test="target"><xsl:value-of select="target"/></xsl:when>
                                          <xsl:otherwise>_self</xsl:otherwise>
                                       </xsl:choose>
                                    </xsl:attribute>
                                    
                                 </xsl:otherwise>
                              </xsl:choose>
                              
                             
                              <xsl:if test="icon">
                                 <xsl:call-template name="get-icon">
                                    <xsl:with-param name="value" select="icon" />
                                    <xsl:with-param name="default" select="'ellipsis-vertical-sharp'" />
                                 </xsl:call-template>
                              </xsl:if>
                              

                              <span class="ml-2"><xsl:value-of select="title"/></span>
                              <xsl:if test="not(link)">
                                 <div class="submenu-caret d-flex ml-auto">
                                    <ion-icon name="caret-down-outline"></ion-icon>
                                 </div>
                              </xsl:if>
                           </a>
                           
                           <xsl:if test="not(link) and submenu">
                              <div id="sidebar-menu-{position()}" class="collapse px-3 sidebar-menu" data-parent="#sidebar-menu-wrapper">
                                 <xsl:for-each select="submenu">
                                    <xsl:sort select="order"/>
                                    <a href="{link}" class="d-block text-reset text-decoration-none" text="{title}"><xsl:value-of select="title"/></a>
                                 </xsl:for-each>
                              </div>
                              
                           </xsl:if>
                        </div>
                     </xsl:for-each>
                  </div>
               </div>
               <div class="sidebar-footer mt-auto px-0 py-4">
                  <div class="d-flex align-items-center pb-3 px-4">
                     <a href="{$settings-url}" class="d-block igrp-user-avatar"></a>
                     <a class="d-flex flex-column ml-2 text-decoration-none user-settings" href="{$settings-url}">
                       <span class="user-name app-username"><xsl:value-of select="//rows/site/user_name"/></span>
                       <span class="user-profile d-none">Perfil</span>
                     </a>
                     <div class="ml-auto">
                        <a title="Sair"  href="{rows/site/button/link}" target="{rows/site/button/target}" class="text-decoratigrp-sidebar-collapse
                        none h1 m-0 logout">
                           <xsl:call-template name="get-icon">
                              <xsl:with-param name="value" select="'log-out-outline'"></xsl:with-param>
                           </xsl:call-template>
                        </a>
                     </div>
                  </div>
                  <div class="pt-3 border-top px-4">
                     <div class="d-flex align-items-center">
                        <div class="mr-2 small">Dark Mode</div>
                        <div class="form-group mb-0 ml-auto">
                           <div class="checkbox p-0 form-check-offset">
                              <label class="container-box checkbox-switch switch position-relative" style="top:0;">
                                 <input type="checkbox"  class="checkbox dark-mode-toggle"  label="label"/>
                                 <span class="slider round"/>
                                 <span class="checkmark"/>
                              </label>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <div class="bootstrap-iso sidebar-collapse-wrapper">
         <div class="d-flex align-items-center">
            <div class="d-md-none igrp-sidebar-collapse d-flex align-items-center">
               <ion-icon class="d-block d-md-none " src="{$themePath}/media/icons/sidebar-toggle.svg"></ion-icon>
               <ion-icon class="d-none d-md-block" src="{$themePath}/media/icons/sidebar-toggle-white.svg"></ion-icon>
            </div>
         </div>
      </div>
      <div class="sidebar-overlay"></div>
      <xsl:call-template name="common-bottom-v4"/>
   </xsl:template>

   <xsl:template name="header-v4">   
      <!--<div class="igrp-header ">
         <xsl:value-of select="rows/content/title"/>
         <div><xsl:value-of select="rows/title"/></div>
      </div>-->
   </xsl:template>

   <xsl:template name="common-bottom-v4">
      <div class="bootstrap-iso">
         <div class="loading-wrapper d-flex flex-column align-items-center justify-content-center">
            <img src="{$themePath}/media/logo.svg"/>
            <div class="lds-ellipsis"><div></div><div></div><div></div><div></div></div>
            <div class="small px-4 refresh-page d-none" target="reload">Parece que algo não correu bem... <a href="#" class="text-primary-400">Recarregue a página.</a></div>
         </div>
      </div>
   </xsl:template>

   <xsl:template name="get-icon">
      <xsl:param name="type" select="'ion'"/>
      <xsl:param name="value" select="''"/>
      <xsl:param name="default" select="''"/>
      <xsl:variable name="defaultValue" >
         <xsl:choose>
            <xsl:when test="$value = '' or not($value)">
               <xsl:value-of select="$default"/>
            </xsl:when>
            <xsl:otherwise>
               <xsl:value-of select="$value"/>
            </xsl:otherwise>
         </xsl:choose>
      </xsl:variable>
      <span class="icon-wrapper">
         <xsl:choose>
            <xsl:when test="$type = 'ion'">
               <ion-icon name="{$defaultValue}"></ion-icon>
            </xsl:when>
            <xsl:when test="$type = 'fa'">
               <i class="{$defaultValue}"></i>
            </xsl:when>
         </xsl:choose>
      </span>
   </xsl:template>
</xsl:stylesheet>