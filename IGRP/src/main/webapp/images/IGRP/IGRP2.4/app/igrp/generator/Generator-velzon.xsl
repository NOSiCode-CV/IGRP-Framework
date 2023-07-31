<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" doctype-system="about:legacy-compat"/>
   
    <xsl:template match="/">
		<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
			<head>
				<link rel="stylesheet" href="{$path}/core/fontawesome/4.7/css/font-awesome.min.css" media="none" onload="if(media!='all')media='all'"/>
     
				<xsl:call-template name="igrp-head"/>
			</head>
			<body class="">
				<div id="layout-wrapper">
					<xsl:call-template name="igrp-header"/>
					<xsl:call-template name="igrp-generator-sidebar"/>
					<div class="main-content">
						<div class="page-content">
							<div class="container-fluid">
								<xsl:call-template name="igrp-page-title"/>
								<div class="igrp-page-contents">
									
										gen


								</div>
							</div>
						</div>
						<xsl:call-template name="igrp-footer"/>
					</div>
				</div>
				<xsl:call-template name="igrp-page-helpers"/>
				<xsl:call-template name="igrp-scripts"/>
				<xsl:call-template name="igrp-generator-scripts"/>
				
			</body>
		</html>
	</xsl:template>

    <xsl:include href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl-2/common.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl-2/head.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl-2/scripts.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl-2/footer.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl-2/sidebar.xsl?v=1515664208567"/>
	<xsl:include href="../../../xsl/tmpl-2/header.xsl?v=1515664208567"/>

	<xsl:include href="../../../xsl/tmpl-2/components/page-generator.xsl?v=1515664208567"/>

</xsl:stylesheet>
