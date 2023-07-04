<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
	<xsl:template match="/">
	<xsl:if test="rows/content/statbox_1/fields/statbox_1_pct"></xsl:if>

		<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
			    <!-- Layout config Js -->
    <script src="assets/js/layout.js"></script>
			<head>
				<xsl:call-template name="igrp-head"/>
			</head>
			<body class="">
				<div id="layout-wrapper">
					<xsl:call-template name="igrp-header"/>
					<xsl:call-template name="igrp-sidebar"/>
					<div class="main-content">
						<div class="page-content">
							<div class="container-fluid">
								<xsl:call-template name="igrp-page-title"/>
								<div class="igrp-page-contents">          
                                    <div class="row">
                                        <div class="col-md-6">
											<xsl:if test="rows/content/statbox_1">
												<xsl:variable name="hasPercentage" select="center">
													<xsl:if test="rows/content/statbox_1/fields/statbox_1_pct">
														
													
													</xsl:if>
												</xsl:variable>
                                            	<div class="card card-animate">
													<xsl:if test="rows/content/statbox_1/fields/statbox_1_pct">
														<xsl:attributes-set name="card card-animate">															
														</xsl:attributes-set>
													</xsl:if>
												<div class="card-body">
													<div class="d-flex align-items-center">
														<div class="flex-grow-1">
															<p class="text-uppercase fw-medium text-muted mb-0">
																<xsl:value-of select="rows/content/statbox_1/fields/statbox_1_title/value" ></xsl:value-of>
															</p>
														</div>
														<xsl:if test="rows/content/statbox_1/fields/statbox_1_pct">
															<div class="flex-shrink-0">
																<h5 class="text-success fs-14 mb-0">
																	<i class="ri-arrow-right-up-line fs-13 align-middle"></i>
																	<xsl:value-of select="rows/content/statbox_1/fields/statbox_1_pct/value"></xsl:value-of>%
																</h5>
															</div>
														</xsl:if>
													</div>
													<div class="d-flex align-items-end justify-content-between mt-4">
														<div>
															<h4 class="fs-22 fw-semibold ff-secondary mb-4">
																<xsl:value-of select="rows/content/statbox_1/fields/statbox_1_val/value"></xsl:value-of>
															</h4>
															<a href="{rows/content/statbox_1/fields/statbox_1_url/value}" class="text-decoration-underline">Read more...</a>
														</div>
														
														<div class="avatar-sm flex-shrink-0">
															<span class="avatar-title bg-soft-success rounded fs-3">
																<i class="{rows/content/statbox_1/fields/statbox_1_icn/value} text-{rows/content/statbox_1/fields/statbox_1_bg/value}"></i>
															</span>														
														</div>
													</div>
												</div><!-- end card body -->
												</div><!-- end card -->
											</xsl:if>


                                            chart line, using page xml
                                        </div>
                                    </div>
								</div>
							</div>
						</div>
						<xsl:call-template name="igrp-footer"/>
					</div>
				</div>
				<xsl:call-template name="igrp-page-helpers"/>
				<xsl:call-template name="igrp-scripts"/>

        <!-- apexcharts -->
        <script src="{$path}/libs/apexcharts/apexcharts.min.js"></script>

        <!-- Vector map-->
        <script src="{$path}/libs/jsvectormap/js/jsvectormap.min.js"></script>
        <script src="{$path}/libs/jsvectormap/maps/world-merc.js"></script>

        <!-- gridjs js -->
        <script src="{$path}/libs/gridjs/gridjs.umd.js"></script>

        <!-- Dashboard init -->
        <script src="{$themePath}/assets/js/pages/dashboard-job.init.js"></script>

        <!-- App js -->
        <script src="{$themePath}/assets/js/app.js"></script>

		<!-- Dashboard-job init -->
		<script src="{$themePath}/assets/js/pages/dashboard-job.init.js"></script>
		
			</body>
		</html>
	</xsl:template>

	<xsl:template name="charts-attributes">
		<xsl:param name="data"/>
		<xsl:attribute name="data-colors">
			<xsl:text>[</xsl:text>
				<xsl:for-each select="$data/colors/col">
					<xsl:text>&quot;</xsl:text>
					<xsl:value-of select="."/>
					<xsl:text>&quot;</xsl:text>
					<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
			<xsl:text>]</xsl:text>
 		</xsl:attribute>
	</xsl:template>

	<xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515664208567"/>
	
	<xsl:include href="../../../xsl/tmpl/parts.common.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.head.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.scripts.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.footer.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.sidebar.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/parts.header.xsl?v=1515664208567"/>

</xsl:stylesheet>
