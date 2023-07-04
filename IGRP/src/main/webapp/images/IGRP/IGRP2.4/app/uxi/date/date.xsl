<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
	<xsl:template match="/">
		<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
			<head>
				<xsl:call-template name="igrp-head"/>
						<!-- DATE CSS INCLUDES -->
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/daterangepicker.css?v={$version}"/>
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/datepicker2/IGRP.daterangepicker.css?v={$version}"/> 
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
														<h4 class="card-title mb-0">
															<xsl:value-of select="rows/content/form_1/fields/form_1_date_1/label"></xsl:value-of>
														</h4>
													</div><!-- end card header -->

													<div class="card-body">
														<form action="#">
															<div class="row gy-3">
																<div class="col-lg-6">
																	<div>
																		<label class="form-label mb-0">Basic</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" />
																	</div>
																</div>
																<!-- end col -->
																<div class="col-lg-6">
																	<div>
																		<label class="form-label mb-0">DateTime</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d.m.y"  /><!--//data-enable-time-->
																	</div>
																</div>
																<!-- end col -->
															</div>
															<!-- end row -->
															<div class="row">
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">Human-Friendly Dates</label>
																		<input type="text" class="form-control flatpickr-input" data-provider="flatpickr" data-altFormat="F j, Y"/>
																	</div>
																</div>
																<!-- end col -->
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">MinDate and MaxDate</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-minDate="25 12, 2021" data-maxDate="29 12,2021"/>
																	</div>
																</div>
																<!-- end col -->
															</div>
															<!-- end row -->
															<div class="row">
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">Default Date</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-deafult-date="{rows/content/form_1/fields/form_1_date_1/value}"/>
																	</div>
																</div>
																<!-- end col -->
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">Disabling Dates</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-disable-date="15 12,2021"/>
																	</div>
																</div>
																<!-- end col -->
															</div>
															<!-- end row -->

															<div class="row">
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">Selecting Multiple Dates</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-multiple-date="true"/>
																	</div>
																</div>
																<!-- end col -->
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">Range</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-range-date="true"/>
																	</div>
																</div>
																<!-- end col -->
															</div>
															<!-- end row -->

															<div class="row">
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">Inline</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" data-deafult-date="25 01,2021" data-inline-date="true"/>
																	</div>
																</div>
																<!-- end col -->
																<div class="col-lg-6">
																	<div class="mt-3">
																		<label class="form-label mb-0">Week Numbers</label>
																		<input type="text" class="form-control" data-provider="flatpickr" data-date-format="d M, Y" /> <!--data-week-number-->
																	</div>
																</div>
																<!-- end col -->
															</div>
															<!-- end row -->

														</form><!-- end form -->
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

				<script src="{$themePath}/assets/libs/flatpickr/flatpickr.min.js"></script>	
				<script src="{$themePath}/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>
				

				<xsl:call-template name="igrp-page-helpers"/>
				<xsl:call-template name="igrp-scripts"/>		
			</body>
		</html>

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