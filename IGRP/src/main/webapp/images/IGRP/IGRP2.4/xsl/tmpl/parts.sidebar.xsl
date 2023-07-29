<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="igrp-sidebar">
		<xsl:if test="$hasMenu = 'true'">
			<xsl:variable name="menus" select="document(rows/slide-menu/@file)/menus" />
			<div class="app-menu navbar-menu">
				<!-- LOGO -->
				<div class="navbar-brand-box">
					<!-- Dark Logo-->
					<a href="index.html" class="logo logo-dark">
						<span class="logo-sm">
							<img src="{$themePath}/assets/images/logo-white.svg" alt="" height="24" />
						</span>
						<span class="logo-lg">
							<img src="{$themePath}/assets/images/logo-white.svg" alt="" height="45" />
						</span>
					</a>
					<!-- Light Logo-->
					<a href="/" class="logo logo-light">
						<span class="logo-sm">
							<img src="{$themePath}/assets/images/logo-white.svg" alt="" height="24" />
						</span>
						<span class="logo-lg">
							<img src="{$themePath}/assets/images/logo-white.svg" alt="" height="45" />
						</span>
					</a>
					<button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover" id="vertical-hover">
						<i class="ri-record-circle-line"></i>
					</button>
				</div>

				<div id="scrollbar">
					<div class="container-fluid">
						<div id="two-column-menu"></div>
						<ul class="navbar-nav" id="navbar-nav">
							<li class="menu-title">
								<span data-key="t-menu">Menu</span>
								<div class="px-4 d-none">
									<input type="text" class="form-control igrp-menu-search " placeholder="Pesquisar..." autocomplete="off" id="search-options" value=""/>
								</div>
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