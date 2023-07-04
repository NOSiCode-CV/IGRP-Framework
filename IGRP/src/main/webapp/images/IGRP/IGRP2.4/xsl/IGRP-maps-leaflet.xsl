<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>

	<xsl:template match="/">
		<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
			<head>
				  <!-- leaflet Css -->
				  <link href="{$path}/libs/leaflet/leaflet.css" rel="stylesheet" type="text/css" />
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
													<h4 class="card-title mb-0">Markers with Custom Icons</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="leaflet-map-custom-icons" class="leaflet-map"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<div class="col-lg-6 d-none">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Example</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="leaflet-map" class="leaflet-map"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
				
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Markers, Circles and Polygons</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="leaflet-map-marker" class="leaflet-map"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->

										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Interactive Choropleth Map</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="leaflet-map-interactive-map" class="leaflet-map"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
									</div>
									<!-- end row -->
				
									<div class="row d-none">
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Working with Popups</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="leaflet-map-popup" class="leaflet-map"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
				
										
										<!-- end col -->
									</div>
									<!-- end row -->
				
									<div class="row d-none">
										
										<!-- end col -->
				
										<div class="col-lg-6">
											<div class="card">
												<div class="card-header">
													<h4 class="card-title mb-0">Layer Groups and Layers Control</h4>
												</div><!-- end card header -->
				
												<div class="card-body">
													<div id="leaflet-map-group-control" class="leaflet-map"></div>
												</div><!-- end card-body -->
											</div><!-- end card -->
										</div>
										<!-- end col -->
									</div>

								</div>
							</div>
						</div>
						<xsl:call-template name="igrp-footer"/>
					</div>
				</div>


				<xsl:call-template name="igrp-page-helpers"/>

				 <!-- prismjs plugin -->
				 <script src="{$path}/libs/prismjs/prism.js"></script>

				 <!-- leaflet plugin -->
				 <script src="{$path}/libs/leaflet/leaflet.js"></script>
			 
				 <!-- leaflet map.init -->
				 <script src="{$themePath}/assets/js/pages/leaflet-us-states.js"></script>
				 <script src="{$themePath}/assets/js/pages/leaflet-map.init.js"></script>

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

</xsl:stylesheet>
