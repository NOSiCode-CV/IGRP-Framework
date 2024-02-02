<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
	<xsl:template match="/">
		<html>
			<xsl:call-template name="igrp-page-attributes"/>
			<head>
				<xsl:call-template name="igrp-head"/>
			</head>
			<body class="">
				<div id="layout-wrapper">
					<xsl:call-template name="igrp-header"/>
					<xsl:call-template name="igrp-sidebar"/>
					<div class="main-content">
						<form method="POST" class="IGRP-form page-content" name="formular_default" enctype="multipart/form-data">
							<div class="container-fluid">
								<div class="igrp-page-header">
									<!--page-header-->
								</div>
								<div class="igrp-page-contents">
									<!--SPLIT-->
								</div>
							</div>
							<xsl:apply-templates mode="form-hidden-fields" select="rows/content/hidden_form_igrp/fields"/>
						</form>
						<xsl:call-template name="igrp-footer"/>
					</div>
				</div>
				<xsl:call-template name="igrp-page-helpers"/>
				<xsl:call-template name="igrp-scripts"/>
			</body>
		</html>
	</xsl:template>
	<!--INCLUDES-->
</xsl:stylesheet>
