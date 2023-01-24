<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes"
		doctype-system="about:legacy-compat" />

	<xsl:template match="/">

		<html id="igrp-login">

		<head>
			<title>IGRP - Login</title>
			<xsl:call-template name="IGRP-head" />
			<link href="{$path}/themes/ds-beta/css/login.css" rel="stylesheet" />
			<style></style>
		</head>

		<body class="fluid igrp-bg-gradient" has-menu="false">
			<div class="bootstrap-iso">
				<form action="{rows/content/action}" method="post">

					<xsl:for-each select="rows/content/form/value/hidden">
						<input type="hidden" name="{@name}" value="{.}" />
					</xsl:for-each>

					<div id="app-login" class="container py-5 align-items-center justify-content-md-center d-flex flex-column position-relative" style="min-height:100vh">
						<div class="row position-relative" style="padding-bottom:50px;" >
							<div class="col-md-6 justify-content-center d-flex flex-column">
								<div class="box-left-login pr-lg-5 d-flex d-md-block align-items-center flex-column text-white">
									<div class="login-logo d-none">
										<img class="img-fluid" src="{$path}/themes/ds-beta/media/logo-white.svg"/>
									</div>
									<div class="login-title position-relative text-uppercase font-weight-bold text-center text-md-left mt-md-5 mb-5 mb-md-0">
										<span class="d-block">CREATE AND RUN </span>
										<span class="d-block">E-GOV APLICATTIONS</span>
										<a target="_newtab" href="https://igrp.cv/" class="mb-igrp-info d-md-none text-white" title="Saiba mais" data-toggle="tooltip">
											<ion-icon name="help-circle-outline"></ion-icon>
										</a>
									</div>

									<div class="login-desc py-5 d-none d-md-block">
										Uma plataforma tecnológica única e robusta que permite criar e correr aplicações de governação eletrónica de forma simples, segura, integrada e sustentável.
									</div>
									<a href="https://igrp.cv/" target="_newtab" class="login-more-info text-white d-none d-md-flex my-5 my-md-0 w-auto align-items-center">
										Saiba mais <ion-icon class="ml-4" name="arrow-forward-outline"></ion-icon>
									</a>
								</div>
							</div>
							<div class="col-md-6 pl-lg-5 justify-content-center d-flex flex-column">
								<div class="box-right-login  d-flex align-items-center flex-column justify-content-center">
									
									<div class="login-app">
										<img class="" src="{$path}/assets/img/instances/igrpweb/logo.png" style="height:100%;width:auto;"/>
									</div>

									<span class="font-weight-bold box-login-title text-center mt-3 d-block">
										<xsl:value-of select="rows/content/title"></xsl:value-of>
									</span>
									
									<div role="form" class="form-row w-100">
										<div class="col">
											<xsl:apply-templates select="rows/content/messages" mode="igrp-messages"/>
											<xsl:choose>
												<xsl:when test="not(rows/content/form/login-type) or rows/content/form/login-type = 'db' ">
													<div class="pt-5">
														<xsl:if test="rows/content/form/label/user">
															<div class="mb-4 px-0 form-group">
																<label class="d-none"  for="{rows/content/form/value/user/@name}"><xsl:value-of select="rows/content/form/label/user"></xsl:value-of></label>
																<div class="input-group" item-name="user" item-type="text">
																	
																	<input  placeholder="{rows/content/form/label/user}" type="{rows/content/form/value/user/@type}" value="{rows/content/form/value/user}" class="h-auto py-3 form-control" id="{rows/content/form/value/user/@name}"  name="{rows/content/form/value/user/@name}"/>
																	<div class="input-group-btn">
																		<span class="btn py-3 px-4" >
																			<ion-icon name="person-outline"></ion-icon>
																		</span>
																	</div>
																</div>
															</div>
														</xsl:if>

														<xsl:if test="rows/content/form/label/password">

															<div class="mb-5 px-0">
																<label class="d-none" for="{rows/content/form/value/password/@name}"><xsl:value-of select="rows/content/form/label/password"></xsl:value-of></label>
																<div class="input-group" item-name="password" item-type="password">
																	
																	<input  placeholder="{rows/content/form/label/password}" type="{rows/content/form/value/password/@type}" value="{rows/content/form/value/password}" class="form-control" id="{rows/content/form/value/password/@name}" style="" name="{rows/content/form/value/password/@name}"/>
																	<div class="input-group-btn">
																		<span class="btn py-3 px-4" >
																			<ion-icon name="medical-outline"></ion-icon>
																		</span>
																	</div>
																</div>
															</div>

														</xsl:if>

														<xsl:if test="rows/content/form/label/button">
															<button name="p_button" value="p_button" type="submit" class="btn btn-primary shadow d-block p-3 w-100" id="{rows/content/form/value/button/@name}" >
																<span class="font-weight-bold"><xsl:value-of select="rows/content/form/label/button"/> <i class="fa fa-sign-in pl-2"/></span>
															</button>
														</xsl:if>
														<xsl:if test="rows/content/form/label/button2">
															<div class="form-group text-center mt-3 mb-0" item-name="button2" item-type="link">
															
																<button style="margin: 0 auto;text-transform:none;" name="p_button2" value="p_button2" type="submit" class="link btn btn-link form-link" id="{rows/content/form/value/button2/@name}" >
																	<span><xsl:value-of select="rows/content/form/label/button2"/></span>
																</button>
																
															</div>
														</xsl:if>

													</div>
												</xsl:when>
												<xsl:otherwise>
													<span class="box-login-subtitle text-center my-3 d-block mb-4">
														Aceda com a sua conta Autentika, com a Chave Móvel Digital ou utilizando o seu CNI
													</span>

													<xsl:if test="rows/content/form/label/button">
														<button type="submit" class="login-autentika justify-content-center btn btn-primary shadow py-3 align-items-center w-100 mt-5 d-flex">
															<img  src="{$path}/themes/ds-beta/media/autentika_negativo.svg"/>
														</button>
														
													</xsl:if>

												</xsl:otherwise>
											</xsl:choose>
										</div>
									</div>
								
								</div>
								<div class="text-white text-center small mt-5 position-absolute w-100 " style="bottom:-45px;left:0;">
									<xsl:value-of select="rows/content/footer_note"/>
								</div>
							</div>
						</div>
					</div>
				</form>

				<xsl:call-template name="IGRP-bottom" />
			</div>

			<script type="text/javascript" src="{$path}/core/igrp/form/igrp.forms.js" />
			
		</body>

		</html>
	</xsl:template>
	<xsl:include href="../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=20150615" />
	<xsl:include href="../xsl/tmpl/IGRP-variables.tmpl.xsl?v=20150615" />
	<xsl:include href="../xsl/tmpl/IGRP-functions.tmpl.xsl?v=1463090556311" />
	<xsl:include href="../xsl/tmpl/IGRP-utils.tmpl.xsl?v=1463090556312" />
	<xsl:include href="../xsl/tmpl/IGRP-form-utils.tmpl.xsl?v=1463090556312" />
	<xsl:include href="../xsl/tmpl/IGRP-table-utils.tmpl.xsl?v=1463090556312" />
</xsl:stylesheet>