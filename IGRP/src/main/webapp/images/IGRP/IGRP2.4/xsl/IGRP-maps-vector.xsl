<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

	<xsl:template match="/">
		<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
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
										<div class="col-lg-12">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Markers</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="world-map-line-markers" data-colors='["--vz-light"]' style="height: 420px"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
									</div>
									<!-- end row -->
				
									<div class="row">
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">World Vector Map with Markers</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="world-map-markers" data-colors='["--vz-light"]' style="height: 350px" dir="ltr"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
				
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">World Vector Map with Image Markers</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="world-map-markers-image" data-colors='["--vz-light"]' style="height: 350px" dir="ltr"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
									</div>
									<!-- end row -->
				
									<div class="row">
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">USA Vector Map</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="usa-vectormap" data-colors='["--vz-primary"]' style="height: 350px"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
				
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Canada Vector Map</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="canada-vectormap" data-colors='["--vz-info"]' style="height: 350px"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
									</div>
									<!-- end row -->
				
									<div class="row">
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Russia Vector Map</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="russia-vectormap" data-colors='["--vz-success"]' style="height: 350px"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
				
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Spain Vector Map</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="spain-vectormap" data-colors='["--vz-secondary"]' style="height: 350px"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
									</div>
									<!-- end row -->


								</div>
							</div>
						</div>
						<xsl:call-template name="igrp-footer"/>
					</div>
				</div>


				<xsl:call-template name="igrp-page-helpers"/>

				<!-- prismjs plugin -->
				<script src="{$path}/libs/prismjs/prism.js"></script>

				<!-- Vector map-->
				<script src="{$path}/libs/jsvectormap/js/jsvectormap.min.js"></script>
				<script src="{$path}/libs/jsvectormap/maps/world-merc.js"></script>
				<script src="{$path}/libs/jsvectormap/maps/us-merc-en.js"></script>
				<script src="{$path}/libs/jsvectormap/maps/canada.js"></script>
				<script src="{$path}/libs/jsvectormap/maps/russia.js"></script>
				<script src="{$path}/libs/jsvectormap/maps/spain.js"></script>
			
				<!-- vector-maps init -->
				<script src="{$themePath}/assets/js/pages/vector-maps.init.js"></script>

				<xsl:call-template name="igrp-scripts"/>


			</body>
		</html>
	</xsl:template>

	<xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515664208567"/>
	<xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515664208567"/>

	<xsl:include href="../xsl/tmpl/parts.common.xsl?v=1515664208567"/>
	<xsl:include href="../xsl/tmpl/parts.head.xsl?v=1515664208567"/>
	<xsl:include href="../xsl/tmpl/parts.scripts.xsl?v=1515664208567"/>
	<xsl:include href="../xsl/tmpl/parts.footer.xsl?v=1515664208567"/>
	<xsl:include href="../xsl/tmpl/parts.sidebar.xsl?v=1515664208567"/>
	<xsl:include href="../xsl/tmpl/parts.header.xsl?v=1515664208567"/>
	<xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1515664208567"/>

</xsl:stylesheet>
