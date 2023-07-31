<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />

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
											
											<xsl:if test="rows/content/*[@type='paragraph']">
												<div class="gen-container-item " gen-class="" item-name="">
					                              <p style="font-weight:400; font-size:16px;"><xsl:value-of select="rows/content/*[@type='paragraph']/fields/*/value"/></p>
						                         </div>
											</xsl:if>
											
											<xsl:apply-templates mode="igrp-messages" select="rows/content/messages"/>
										</div>
									</div>
									<div class="row">
										<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
											
											<xsl:apply-templates mode="process-flow" select="rows/content/table" />
												
											<xsl:if test="rows/content/view">
												<xsl:call-template name="GEN-view"/>
											</xsl:if>
											
											<xsl:if test="rows/content/form/tools-bar">
												<div class="toolsbar-holder boxed gen-container-item block-icons" gen-structure="toolsbar" gen-class="">
													<div class="btns-holder pull-right" role="group">
														<xsl:apply-templates select="rows/content/form/tools-bar" mode="gen-buttons">
															<xsl:with-param name="outline" select="'true'"/>
															<xsl:with-param name="use-fa" select="'false'"/>
															<xsl:with-param name="type" select="'tools-bar'"/>
														</xsl:apply-templates>
													</div>
												</div>
											</xsl:if>
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
					<xsl:call-template name="js-includes"/>
				</form>
			</body>
		</html>
	</xsl:template>

	<xsl:template name="css-includes">
		<link rel="stylesheet" href="{$path}/core/igrp/process/process.css"/>
		<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/toolsbar/toolsbar.css?v={$version}"/>
		<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/igrp.tables.css?v={$version}"/>
		<link rel="stylesheet" type="text/css" href="{$path}/core/igrp/table/dataTables.bootstrap.css?v={$version}"/>
		
		<xsl:if test="rows/content/view">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/view/igrp.view.css?v={$version}"/>
		</xsl:if>
		
		<!-- separatorlist includes -->
		<xsl:if test="rows/content/*/label/*[@type='separatorlist' or @type='separatordialog']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/separatorlist/igrp.separatorlist.css?v={$version}"/>
		</xsl:if>
		<!-- formlist includes -->
		<xsl:if test="rows/content/*/label/*[@type='formlist']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/formlist/igrp.formlist.css?v={$version}"/>
		</xsl:if>
		<!-- biometric includes -->
		<xsl:if test="rows/content/*/label/*[@type='biometric']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/fingerprint/fingerprint.css?v={$version}"/>
		</xsl:if>
		<!-- select includes -->
		<xsl:if test="rows/content/*/label/*[contains(@type,'select')]">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.min.css?v={$version}"/>
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/select2/select2.style.css?v={$version}"/>
		</xsl:if>
		<!-- date -->
		<xsl:if test="rows/content/*/label/*[contains(@type,'date')]">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/datetimepicker/css/datetimepicker.css?v={$version}"/>
		</xsl:if>
		<!-- color -->
		<xsl:if test="rows/content/*/label/*[@type='color']">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/colorpicker/css/bootstrap-colorpicker.min.css?v={$version}"/>
		</xsl:if>
		<!-- virtualkeyboard -->
		<xsl:if test="rows/content/*/label/*[contains(@type,'vkb_')]">
			<link rel="stylesheet" type="text/css" href="{$path}/plugins/virtualkeyboard/vkb.css?v={$version}"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="js-includes">
		<script type="text/javascript" src="{$path}/core/igrp/process/process.js?v={$version}"/>
		<script type="text/javascript" src="{$path}/core/igrp/table/igrp.table.js?v={$version}"/>
		<script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js?v={$version}"/>
		<!-- formlist includes -->
		<xsl:if test="rows/content/*/label/*[@type='formlist']">
			<script type="text/javascript" src="{$path}/plugins/formlist/igrp.formlist.js?v={$version}"/>
		</xsl:if>
		<!-- biometric includes -->
		<xsl:if test="rows/content/*/label/*[@type='biometric']">
			<script type="text/javascript" src="{$path}/plugins/fingerprint/fingerprint.js?v={$version}"/>
		</xsl:if>
		<!-- select includes -->
		<xsl:if test="rows/content/*/label/*[@type='separatorlist' or @type='separatordialog']">
			<script type="text/javascript" src="{$path}/plugins/separatorlist/igrp.separatorlist.js?v={$version}"/>
		</xsl:if>
		<!-- select includes -->
		<xsl:if test="rows/content/*/label/*[contains(@type,'select')]">
			<script type="text/javascript" src="{$path}/plugins/select2/select2.full.min.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/select2/select2.init.js?v={$version}"/>
		</xsl:if>
		<!-- date -->
		<xsl:if test="rows/content/*/label/*[contains(@type,'date')]">
			<script type="text/javascript" src="{$path}/plugins/datetimepicker/js/datetimepicker.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/datetimepicker/js/dtp.init.js?v={$version}"/>
		</xsl:if>
		<!-- lookup -->
		<xsl:if test="rows/content/*/label/*[contains(@type,'LOOKUP')]">
			<script type="text/javascript" src="{$path}/plugins/lookup/igrp.lookup.js?v={$version}"/>
		</xsl:if>
		<!-- color -->
		<xsl:if test="rows/content/*/label/*[@type='color']">
			<script type="text/javascript" src="{$path}/plugins/colorpicker/js/bootstrap-colorpicker.js?v={$version}"/>
			<script type="text/javascript" src="{$path}/plugins/colorpicker/colorpicker.init.js?v={$version}"/>
		</xsl:if>
		<!-- virtualkeyboard -->
		<xsl:if test="rows/content/*/label/*[contains(@type,'vkb_')]">
			<script type="text/javascript" src="{$path}/plugins/virtualkeyboard/IGRP.virtualkeyBoard.init.js?v={$version}"/>
		</xsl:if>
		<!-- texteditor -->
		<xsl:if test="rows/content/*/label/*[@type='texteditor']">
			<script type="text/javascript" src="{$path}/core/ckeditor/ckeditor.js?v={$version}"/>
		</xsl:if>

		<xsl:if test="rows/content/js_validation">
				<script src="{$path}/core/igrp/IGRP.rules.class.js"/>
			 	<script>
			 		var Arr = [];
					<xsl:for-each select="rows/content/js_validation/row[ field != '' ]">
				 		<xsl:variable name="event" select="event"/>
				 		<xsl:variable name="field" select="field"/>
				 		<xsl:variable name="operation" select="operation"/>
				 		<xsl:variable name="value" select="value"/>
				 		<xsl:variable name="action" select="action"/>
				 		<xsl:variable name="target" select="target"/>

					 			 		
				 	</xsl:for-each>

				 	<xsl:for-each select="rows/content/js_validation/row[ field = '' ]">
				 		console.log('<xsl:value-of select="event"/>')
				 	</xsl:for-each>

				</script>

		</xsl:if>
	</xsl:template>

	<xsl:include href="tmpl/IGRP-home-include.tmpl.xsl?v=20150615"/>
	<xsl:include href="tmpl/IGRP-variables.tmpl.xsl?v=20150615"/>
	<xsl:include href="tmpl/IGRP-functions.tmpl.xsl?v=1463090556311"/>
	<xsl:include href="tmpl/IGRP-utils.tmpl.xsl?v=1463090556312"/>
	<xsl:include href="tmpl/IGRP-process-utils.tmpl.xsl?v=1463090556312"/>
	<xsl:include href="tmpl/IGRP-formgen.tmpl.xsl?v=1463090556312"/>
	<xsl:include href="tmpl/IGRP-form-utils.tmpl.xsl?v=1507204691038"/>
</xsl:stylesheet>