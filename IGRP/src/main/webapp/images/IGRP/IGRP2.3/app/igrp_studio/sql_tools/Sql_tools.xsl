<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes"
		encoding="utf-8" indent="yes" doctype-system="about:legacy-compat" />
	<xsl:template match="/">
		<html>
			<head>
				<xsl:call-template name="IGRP-head" />
				<link rel="stylesheet" type="text/css"
					href="{$path}/core/igrp/table/datatable/dataTables.bootstrap.css?v={$version}" />
				<link rel="stylesheet" type="text/css"
					href="{$path}/core/igrp/table/igrp.tables.css?v={$version}" />
				<link rel="stylesheet" type="text/css"
					href="{$path}/plugins/select2/select2.min.css?v={$version}" />
				<link rel="stylesheet" type="text/css"
					href="{$path}/plugins/select2/select2.style.css?v={$version}" />
				<style />
			</head>
			<body class="{$bodyClass} sidebar-off">
				<xsl:call-template name="IGRP-topmenu" />
				<form method="POST" class="IGRP-form" name="formular_default"
					enctype="multipart/form-data">
					<div class="container-fluid">
						<div class="row">
							<xsl:call-template name="IGRP-sidebar" />
							<div class="col-sm-9 col-md-10 col-md-offset-2 col-sm-offset-3 main"
								id="igrp-contents">
								<div class="content">
									<div class="row row-msg">
										<div class="gen-column col-md-12">
											<div class="gen-inner">
												<xsl:apply-templates mode="igrp-messages"
													select="rows/content/messages" />
											</div>
										</div>
									</div>
									<div class="row " id="row-a427d773">
										<div class="gen-column col-md-12">
											<div class="gen-inner">
												<xsl:if test="rows/content/form_1">
													<div class="box igrp-forms gen-container-item "
														gen-class="" item-name="form_1">
														<div class="box-body">
															<div role="form">
																<xsl:apply-templates mode="form-hidden-fields"
																	select="rows/content/form_1/fields" />
																<xsl:if test="rows/content/form_1/fields/application">
																	<div class="col-sm-3 form-group  gen-fields-holder"
																		item-name="application" item-type="select" required="required">
																		<label
																			for="{rows/content/form_1/fields/application/@name}">
																			<xsl:value-of
																				select="rows/content/form_1/fields/application/label" />
																		</label>
																		<select class="form-control select2 IGRP_change"
																			id="form_1_application" name="{rows/content/form_1/fields/application/@name}"
																			required="required">
																			<xsl:call-template name="setAttributes">
																				<xsl:with-param name="field"
																					select="rows/content/form_1/fields/application" />
																			</xsl:call-template>
																			<xsl:for-each
																				select="rows/content/form_1/fields/application/list/option">
																				<option value="{value}" label="{text}">
																					<xsl:if test="@selected='true'">
																						<xsl:attribute name="selected">selected</xsl:attribute>
																					</xsl:if>
																					<span>
																						<xsl:value-of select="text" />
																					</span>
																				</option>
																			</xsl:for-each>
																		</select>
																	</div>
																</xsl:if>
																<xsl:if test="rows/content/form_1/fields/data_source">
																	<div class="col-sm-3 form-group  gen-fields-holder"
																		item-name="data_source" item-type="select" required="required">
																		<label
																			for="{rows/content/form_1/fields/data_source/@name}">
																			<xsl:value-of
																				select="rows/content/form_1/fields/data_source/label" />
																		</label>
																		<select class="form-control select2 " id="form_1_data_source"
																			name="{rows/content/form_1/fields/data_source/@name}"
																			required="required">
																			<xsl:call-template name="setAttributes">
																				<xsl:with-param name="field"
																					select="rows/content/form_1/fields/data_source" />
																			</xsl:call-template>
																			<xsl:for-each
																				select="rows/content/form_1/fields/data_source/list/option">
																				<option value="{value}" label="{text}">
																					<xsl:if test="@selected='true'">
																						<xsl:attribute name="selected">selected</xsl:attribute>
																					</xsl:if>
																					<span>
																						<xsl:value-of select="text" />
																					</span>
																				</option>
																			</xsl:for-each>
																		</select>
																	</div>
																</xsl:if>
																<xsl:if test="rows/content/form_1/fields/separator_1">
																	<div class="box-head subtitle gen-fields-holder"
																		text-color="1">
																		<span>
																			<xsl:value-of
																				select="rows/content/form_1/fields/separator_1/label" />
																		</span>
																	</div>
																</xsl:if>
																<xsl:if test="rows/content/form_1/fields/sql">
																	<div class="form-group col-sm-12  gen-fields-holder"
																		item-name="sql" item-type="textarea" required="required">
																		<label for="{rows/content/form_1/fields/sql/@name}">
																			<xsl:value-of select="rows/content/form_1/fields/sql/label" />
																		</label>
																		<textarea name="{rows/content/form_1/fields/sql/@name}"
																			required="required" class="textarea form-control "
																			maxlength="1000000">
																			<xsl:call-template name="setAttributes">
																				<xsl:with-param name="field"
																					select="rows/content/form_1/fields/sql" />
																			</xsl:call-template>
																			<xsl:value-of select="rows/content/form_1/fields/sql/value" />
																		</textarea>
																	</div>
																</xsl:if>
															</div>
														</div>
														<xsl:apply-templates select="rows/content/form_1/tools-bar"
															mode="form-buttons" />
													</div>
												</xsl:if>
												<table id="table_1" class="table table-striped igrp-data-table  "
													exports="">
													<thead>
														<tr>
															<xsl:for-each select="rows/content/table_1/fields/*">
																<th>
																	<xsl:value-of select="label" />
																</th>
															</xsl:for-each>
														</tr>
													</thead>
													<tbody>
														<xsl:for-each select="rows/content/table_1/table/value/row">
															<xsl:variable name="pos" select="(position()+1) mod 2" />
															<xsl:variable name="nod" select="position()" />
															<tr>
																<xsl:for-each select="*">
																	<td>
																		<xsl:value-of select="." />
																	</td>
																</xsl:for-each>
															</tr>
														</xsl:for-each>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<xsl:call-template name="IGRP-bottom" />
				</form>
				<script type="text/javascript"
					src="{$path}/core/igrp/form/igrp.forms.js?v={$version}" />
				<script type="text/javascript"
					src="{$path}/core/igrp/table/datatable/jquery.dataTables.min.js?v={$version}" />
				<script type="text/javascript"
					src="{$path}/core/igrp/table/datatable/dataTables.bootstrap.min.js?v={$version}" />
				<script type="text/javascript"
					src="{$path}/core/igrp/table/igrp.table.js?v={$version}" />
				<script type="text/javascript"
					src="{$path}/plugins/select2/select2.full.min.js?v={$version}" />
				<script type="text/javascript"
					src="{$path}/plugins/select2/select2.init.js?v={$version}" />
			</body>
		</html>
	</xsl:template>
	<xsl:include
		href="../../../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1527253314347" />
	<xsl:include
		href="../../../xsl/tmpl/IGRP-variables.tmpl.xsl?v=1527253314347" />
	<xsl:include
		href="../../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=1527253314347" />
	<xsl:include href="../../../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1527253314347" />
	<xsl:include
		href="../../../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1527253314347" />
	<xsl:include
		href="../../../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1527253314348" />
</xsl:stylesheet>
