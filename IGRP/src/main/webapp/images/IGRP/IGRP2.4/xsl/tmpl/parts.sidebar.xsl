<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="igrp-sidebar">
		<xsl:if test="$hasMenu = 'true'">
			<xsl:variable name="menus" select="document(rows/slide-menu/@file)/menus" />
			<div class="app-menu navbar-menu">
			<xsl:variable name="logo">
            <xsl:choose>
         	  <xsl:when test="$themeConfigData/logo">
             	<xsl:value-of select="concat($themePath,'/',$themeConfigData/logo)"/>
              </xsl:when>
     		  <xsl:otherwise>
                 <xsl:choose>
	            	<xsl:when test="rows/logo">
			           <xsl:value-of select="rows/logo"/>              
<!-- 			            <xsl:value-of select="concat($path,'/themes/',$defined-template,'/assets/images/logo-white.svg')"/>            -->
		             </xsl:when>
		             <xsl:otherwise>
		                <xsl:value-of select="concat($path,'/themes/default/img/logo3.svg')"/>
		             </xsl:otherwise>
           		</xsl:choose>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
				<!-- LOGO -->
				<div class="navbar-brand-box" style="display: flex;">
					<!-- Dark Logo-->
					<a href="{rows/link}" class="logo logo-dark" style="align-items: center;">
						<div class="d-flex">
							<span class="logo-sm">
								<img src="{$logo}" alt="" height="24" style="max-width: 80px;max-height: 50px;min-width: 45px;"/>
							</span>
							<span class="logo-lg">
								<img src="{$logo}" alt="" style="max-width: 80px;max-height: 50px;min-width: 60px;"/>
							</span>
							<div class="text-center text-whit"	style="line-height: normal;font-size: 15px;padding-left: 10px;font-weight: bold;align-self: center;">
								<xsl:value-of select="rows/title" />
							</div>
						</div>
					</a>
					<!-- Light Logo-->
					<a href="{rows/link}" class="logo logo-light" style="align-items: center;">
						<div class="d-flex">
							<span class="logo-sm">
								<img src="{$logo}" alt="" height="24" style="max-width: 80px;max-height: 50px;min-width: 45px;"/>
							</span>
							<span class="logo-lg">
								<img src="{$logo}" alt="" style="max-width:80px;max-height: 50px;min-width: 60px;"/>
							</span>
							<div class="text-center text-white"	style="line-height: normal;font-size: 15px;padding-left: 10px;font-weight: bold;align-self: center;">
								<xsl:value-of select="rows/title" />
							</div>
						</div>
					</a>
					<button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
						<i class="ri-record-circle-line"></i>
					</button>
				</div>

<!-- 				<div class="text-center text-light mb-3">Sistema Integrado de Gestão do Tribunal de Contas</div> -->

				<div id="scrollbar">
					<div class="container-fluid app-search">
						<div id="two-column-menu"></div>
							<div class="position-relative px-2">
									<input type="text" class="form-control " style="background: #ffffff14;" placeholder="Pesquisar..." autocomplete="off" id="search-options" value=""/>
									<span class="mdi mdi-magnify search-widget-icon" style="left: 24px;"></span>								
							</div>
						
						<ul class="navbar-nav" id="navbar-nav">
							<li class="menu-title">
								<span class="d-none" data-key="t-menu">Menu</span>
			
							</li>
							<xsl:for-each select="$menus/menu">
								<xsl:variable name="menu-position" select="position()"/>
								<li class="nav-item menu-wrapper">
									<xsl:choose>
										<xsl:when test="link and link != ''">

										<a class="nav-link menu-link" href="{link}" role="button" >
											<xsl:call-template name="igrp-icon">
												<xsl:with-param name="icon" select="icon"/>
											</xsl:call-template>
											<span >
												<xsl:value-of select="title"/>
											</span>
										</a>

										</xsl:when>
										<xsl:otherwise>
											<a class="nav-link menu-link" href="#sidebar-menu-{$menu-position}" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebar-menu-{$menu-position}">
												<xsl:call-template name="igrp-icon">
													<xsl:with-param name="icon" select="icon"/>
												</xsl:call-template>
												<span >
													<xsl:value-of select="title"/>
												</span>
											</a>
											<xsl:if test="submenu">
												<div class="collapse menu-dropdown" id="sidebar-menu-{$menu-position}">
													<ul class="nav nav-sm flex-column submenu-wrapper">
														<xsl:for-each select="submenu">
															<li class="nav-item">
																<a href="{link}" class="nav-link" data-key="t-sidebar-submenu-{$menu-position}-{position()}">
																	<xsl:value-of select="title"/>
																</a>
															</li>
														</xsl:for-each>
													</ul>
												</div>
											</xsl:if>
											
										</xsl:otherwise>
									</xsl:choose>
									


								</li>
							</xsl:for-each>
						</ul>
					</div>
				</div>
				<div class="sidebar-background"></div>
			</div>
			<div class="vertical-overlay"></div>
		</xsl:if>
	</xsl:template>

</xsl:stylesheet>