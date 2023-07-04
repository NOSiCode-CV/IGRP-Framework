<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
	<xsl:template match="/">
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
                                        <h5 class="text-decoration-underline mb-3 pb-1">Line</h5>
												<div class="card">
													<div class="card-header">
														<h4 class="card-title mb-0">Line Chart</h4>
													</div>
													<div class="card-body">
														<canvas id="lineChart" class="chartjs-chart">
															<xsl:call-template name="charts-attributes">
																<xsl:with-param name="data" select="rows/content/chart_1"/>
															</xsl:call-template>
														</canvas>														
													</div>
												</div>
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

				<!-- Chart JS -->
    <script src="{$path}/libs/chart.js/chart.min.js"></script>

    <!-- chartjs init -->
    <script src="{$themePath}/assets/js/pages/chartjs.init.js"></script>
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
