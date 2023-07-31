<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
	<xsl:template match="/">
		<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
			<head>
				<xsl:call-template name="igrp-head"/>
				<!-- TABLE CSS INCLUDES -->
				<style/>
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
									<div class="row " id="row-a59e0deb">
										<div class="gen-column col-sm-12">
											<div class="gen-inner">
												<xsl:if test="rows/content/paragraph_1">
													<div class="disable-output-escaping text-muted igrp-paragraph gen-container-item " gen-class="" item-name="paragraph_1">
														<xsl:value-of disable-output-escaping="yes" select="rows/content/paragraph_1/fields/paragraph_1_text/value"/>
													</div>
												</xsl:if>

												<div class="row">
													<div class="py-3 col-12 fw-bold fs-2">ChartJs</div>
													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_1"/>
														</xsl:call-template>
													</div> <!-- end col -->

													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_2"/>
														</xsl:call-template>
													</div> <!-- end col -->
												</div> <!-- end row -->

												<div class="row">
													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_3"/>
														</xsl:call-template>
													</div> <!-- end col -->

													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_4"/>
														</xsl:call-template>
													</div> <!-- end col -->
												</div> <!-- end row -->

												<div class="row">
													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_5"/>
														</xsl:call-template>
													</div> <!-- end col -->

													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_6"/>
														</xsl:call-template>
													</div> <!-- end col -->
												</div> <!-- end row -->	
												
												
												<div class="row">
													<div class="py-3 col-12 fw-bold fs-2">Apex Charts</div>
													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_7"/>
															<xsl:with-param name="library" select="'apexcharts'"/>
														</xsl:call-template>
													</div>

													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_8"/>
															<xsl:with-param name="library" select="'apexcharts'"/>
														</xsl:call-template>
													</div>

													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_9"/>
															<xsl:with-param name="library" select="'apexcharts'"/>
														</xsl:call-template>
													</div>

													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_10"/>
															<xsl:with-param name="library" select="'apexcharts'"/>
														</xsl:call-template>
													</div>

													<div class="col-xl-6">
														<xsl:call-template name="igrp-charts">
															<xsl:with-param name="charts" select="rows/content/chart_11"/>
															<xsl:with-param name="library" select="'apexcharts'"/>
														</xsl:call-template>
													</div>
												</div>
											</div>
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
				<xsl:call-template name="igrp-chart-scripts"/>
			</body>
		</html>
	</xsl:template>
	<xsl:include href="tmpl/IGRP-functions.tmpl.xsl?v=16"/>
	<xsl:include href="tmpl/IGRP-variables.tmpl.xsl?v=16"/>
	<xsl:include href="tmpl/parts.common.xsl?v=16"/>
	<xsl:include href="tmpl/parts.head.xsl?v=16"/>
	<xsl:include href="tmpl/parts.header.xsl?v=16"/>
	<xsl:include href="tmpl/parts.scripts.xsl?v=16"/>
	<xsl:include href="tmpl/parts.footer.xsl?v=16"/>
	<xsl:include href="tmpl/parts.sidebar.xsl?v=16"/>
	<xsl:include href="tmpl/IGRP-table-utils.tmpl.xsl?v=16"/>
	<xsl:include href="tmpl/parts.charts.xsl?v=1" />
</xsl:stylesheet>