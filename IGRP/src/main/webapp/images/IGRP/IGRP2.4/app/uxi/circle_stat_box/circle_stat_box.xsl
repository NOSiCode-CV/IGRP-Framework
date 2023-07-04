<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
	<xsl:template match="/">

	<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
		<!-- Layout config Js -->

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
										    <div class="card card-animate igrp-circle-stat-box">                        
                                                <div class="card-body" style="z-index:1 ;">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-grow-1 overflow-hidden">
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-3">
                                                                <xsl:value-of select="rows/content/circlestatbox_1/fields/circlestatbox_1_title/value"></xsl:value-of>
                                                            </p>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-0">
                                                                <span class="counter-value" data-target="{rows/content/circlestatbox_1/fields/circlestatbox_1_val/value}"></span>
                                                            </h4>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <div data-colors='["{rows/content/circlestatbox_1/fields/circlestatbox_1_bg/value}"]' data-series="{rows/content/circlestatbox_1/fields/circlestatbox_1_pct/value}" class="apex-charts" dir="ltr"></div>
                                                        </div>
                                                    </div>
                                                </div><!-- end card body -->
											</div><!-- end card -->
                                            chart line, using page xml
                                        </div>

                                         <div class="col-md-6">
										    <div class="card card-animate igrp-circle-stat-box">                        
                                                <div class="card-body" style="z-index:1 ;">
                                                    <div class="d-flex align-items-center">
                                                        <div class="flex-grow-1 overflow-hidden">
                                                            <p class="text-uppercase fw-medium text-muted text-truncate mb-3">
                                                                <xsl:value-of select="rows/content/circlestatbox_1/fields/circlestatbox_1_title/value"></xsl:value-of>
                                                            </p>
                                                            <h4 class="fs-22 fw-semibold ff-secondary mb-0">
                                                                <span class="counter-value" data-target="{rows/content/circlestatbox_1/fields/circlestatbox_1_val/value}"></span>
                                                            </h4>
                                                        </div>
                                                        <div class="flex-shrink-0">
                                                            <div  data-colors='["{rows/content/circlestatbox_1/fields/circlestatbox_1_bg/value}"]'  data-series="{rows/content/circlestatbox_1/fields/circlestatbox_1_pct/value}" class="apex-charts" dir="ltr"></div>
                                                        </div>
                                                    </div>
                                                </div><!-- end card body -->
											</div><!-- end card -->
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

		<!-- total jobs Charts -->
	    <script src="{$path}/plugins/apexchart/apexchart.init.js"></script>		
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