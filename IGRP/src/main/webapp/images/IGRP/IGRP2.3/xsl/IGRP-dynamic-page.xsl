	<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="IGRP-head"/>
				<xsl:call-template name="css-includes"/>
			</head>
			<body class="{$bodyClass} old-v fluid sidebar-off">
				<xsl:call-template name="IGRP-topmenu"/>
				<form action="#" method="POST" id="formular_default" name="formular_default" class="default_form IGRP-form" enctype="multipart/form-data">
					<div class="container-fluid">
						<div class="row">
							<xsl:call-template name="IGRP-sidebar"/>
							<div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main" id="igrp-contents">
								<div class="content" id="IGRP-process">
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											<section class="content-header gen-container-item ">
												<h2>
													<xsl:value-of select="rows/content/title"/>
												</h2>
											</section>
											<xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											
											<xsl:apply-templates mode="process-flow" select="rows/content/*[@type='workflow']" />

											
											<div id="IGRP-process-contents">
												<xsl:call-template name="GEN-FORM"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<xsl:call-template name="IGRP-bottom"/>
				</form>
				<xsl:call-template name="js-includes"/>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="css-includes">
		<!--<link rel="stylesheet" href="{$path}/core/igrp/process/process.css"/>-->
		<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
		<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
		<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>

		<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
        <!-- TABLE CSS INCLUDES -->
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}"/>
        <link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
		
		<!-- separatorlist includes -->
		<xsl:if test="rows/content/*[@type='separatorlist' or @type='separatordialog']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css?v={$version}"/>
		</xsl:if>
		<!-- formlist includes -->
		<xsl:if test="rows/content/*[@type='formlist']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/>
		</xsl:if>
		<!-- biometric includes -->
		<xsl:if test="rows/content/*[@type='biometric']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/fingerprint/fingerprint.css?v={$version}"/>
		</xsl:if>
		<!-- select includes -->
		<xsl:if test="rows/content/*/fields/*[contains(@type,'select')]">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
		</xsl:if>
		<!-- date -->
		<xsl:if test="rows/content/*/fields/*[contains(@type,'date')]">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css?v={$version}"/>
		</xsl:if>
		<!-- color -->
		<xsl:if test="rows/content/*/fields/*[@type='color']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css?v={$version}"/>
		</xsl:if>
		<!-- virtualkeyboard -->
		<xsl:if test="rows/content/*/fields/*[contains(@type,'vkb_')]">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/virtualkeyboard/vkb.css?v={$version}"/>
		</xsl:if>

		<!-- RANGE CSS INCLUDES -->
		<xsl:if test="rows/content/*/fields/*[@type='range']">
        	<link rel="stylesheet" type="text/css" href="{$path}/plugins/bs.range/css/bootstrap.slider.min.css?v={$version}"/>
        	<link rel="stylesheet" type="text/css" href="{$path}/plugins/bs.range/css/igrp.slider.css?v={$version}"/>
		</xsl:if>

		<!-- Tabs -->
		<xsl:if test="rows/content/*[@type='tabcontent']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/tabs/igrp.tabs.css?v={$version}"/>
		</xsl:if>

		<xsl:if test="rows/content/*[@type='treemenu']">
			<!-- TREEMENU JS INCLUDES -->
        	<link rel="stylesheet" type="text/css" href="{$path}/plugins/treemenu/treemenu.css?v={$version}"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="js-includes">
		<!--<script type="text/javascript" src="{$path}/core/igrp/process/process.js?v={$version}"/>-->
		<script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>

		<xsl:if test="rows/content/*[@type='table']">
			<script type="text/javascript" src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}"/>
		</xsl:if>

		<script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>

		<xsl:if test="rows/content/*[@type='table']">
			<script type="text/javascript" src="{$path}/core/igrp/table/bootstrap-contextmenu.js?v={$version}"/>
        	<script type="text/javascript" src="{$path}/core/igrp/table/table.contextmenu.js?v={$version}"/>
		</xsl:if>
		<!-- formlist includes -->
		<xsl:if test="rows/content/*[@type='formlist']">
			<script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>
		</xsl:if>
		<!-- biometric includes -->
		<xsl:if test="rows/content/*[@type='biometric']">
			<script type="text/javascript" src="{$path}/plugins/fingerprint/fingerprint.js?v={$version}"/>
		</xsl:if>
		<!-- select includes -->
		<xsl:if test="rows/content/*[@type='separatorlist' or @type='separatordialog']">
			<script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js?v={$version}"/>
		</xsl:if>
		<!-- select includes -->
		<xsl:if test="rows/content/*/fields/*[contains(@type,'select')]">
			<script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
		</xsl:if>
		<!-- date -->
		<xsl:if test="rows/content/*/fields/*[contains(@type,'date')]">
			<script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js?v={$version}"/>
		</xsl:if>
		<!-- lookup -->
		<xsl:if test="rows/content/*/fields/*[contains(@type,'LOOKUP')]">
			<script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js?v={$version}"/>
		</xsl:if>
		<!-- color -->
		<xsl:if test="rows/content/*/fields/*[@type='color']">
			<script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js?v={$version}"/>
		</xsl:if>
		<!-- RANGE JS INCLUDES -->
		<xsl:if test="rows/content/*/fields/*[@type='range']">
        	<script type="text/javascript" src="{$path}/plugins/bs.range/bootstrap.slider.min.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/bs.range/igrp.range.js?v={$version}"/>
		</xsl:if>
		<!-- virtualkeyboard -->
		<xsl:if test="rows/content/*/fields/*[contains(@type,'vkb_')]">
			<script type="text/javascript" src="{$path}/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js?v={$version}"/>
		</xsl:if>
		<!-- texteditor -->
		<xsl:if test="rows/content/*/fields/*[@type='texteditor']">
			<script type="text/javascript" src="{$path}/core/ckeditor/ckeditor.js?v={$version}"/>
		</xsl:if>

		<!-- Tabs -->
		<xsl:if test="rows/content/*[@type='tabcontent']">
			<script type="text/javascript" src="{$path}/plugins/tabs/igrp.tabs.js?v={$version}"/>
		</xsl:if>

		<!-- ordertable -->
		<xsl:if test="rows/content/*[@style='ordertable']">
			<script type="text/javascript" src="{$path}/core/formgen/js/jquery-ui.min.js"/>
		</xsl:if>

		<xsl:if test="rows/content/*[@type='chart']">
			<!-- CHART JS INCLUDES -->
			<script type="text/javascript" src="{$path}/plugins/highcharts/highcharts.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-more.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/highcharts/exporting.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/highcharts/funnel.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/highcharts/heatmap.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/highcharts/treemap.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/highcharts/highcharts-3d.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/highcharts/igrp.charts.js?v={$version}"/>
		</xsl:if>

		<xsl:if test="rows/content/*[@type='treemenu']">
			<!-- TREEMENU JS INCLUDES -->
        	<script type="text/javascript" src="{$path}/plugins/treemenu/treemenu.js?v={$version}"/>
		</xsl:if>
	</xsl:template>

	<xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-webformgen.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-charts.tmpl.xsl?v=1"/>
	<xsl:include href="../xsl/tmpl/IGRP-treemenu.tmpl.xsl?v=1"/>
</xsl:stylesheet>