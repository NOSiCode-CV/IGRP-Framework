<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" omit-xml-declaration="yes" encoding="utf-8" indent="yes" doctype-system="about:legacy-compat"/>
	
	<xsl:template match="/">
  <html data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none" data-preloader="disable">
    <head>
				<xsl:call-template name="igrp-head"/>
			</head>
			<body class="">
        <div class="auth-page-wrapper pt-5">
          <!-- auth page bg -->
          <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
              <div class="bg-overlay"></div>
  
              <div class="shape">
                  <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1440 120">
                      <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                  </svg>
              </div>
          </div>

          <!-- auth page content -->
          <div class="auth-page-content">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center mt-sm-5 mb-4 text-white-50">
                            <div>
                                <a href="index.html" class="d-inline-block auth-logo">
                                    <img src="{$themePath}/assets/images/logo-white.svg" alt="" />
                                </a>
                            </div>
                            <p class="mt-3 fs-15 fw-medium">Create and Run e-Gov Applications</p>
                        </div>
                    </div>
                </div>
                <!-- end row -->

                <div class="row justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card mt-4">

                            <div class="card-body p-4">
                                <div class="text-center mt-2">
                                    <h5 class="text-primary">Bem-vind@ !</h5>
                                    <p class="text-muted">Autentique-se para entrar no IGRP</p>
                                </div>
                                <div class="p-2 mt-4">
                                  <xsl:variable name="method">
                                    <xsl:choose>
                                      <xsl:when test="rows/content/form/@method">
                                        <xsl:value-of select="rows/content/form/@method"></xsl:value-of>
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <xsl:text>post</xsl:text>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </xsl:variable>
                                  <form action="{rows/content/action}" method="{$method}">
                                    
                                      <xsl:if test="rows/content/form/label/user">
                                        <div class="mb-3">
                                            <label for="username" class="form-label">
                                              <xsl:value-of select="rows/content/form/label/user"/>
                                            </label>
                                            <input  type="{rows/content/form/value/user/@type}" value="{rows/content/form/value/user}" class="form-control" id="{rows/content/form/value/user/@name}" name="{rows/content/form/value/user/@name}"/>
                                        </div>
                                      </xsl:if>

                                        <div class="mb-3">
                                            <div class="float-end d-none">
                                                <a href="auth-pass-reset-basic.html" class="text-muted">Forgot password?</a>
                                            </div>
                                            <label class="form-label" for="password-input">
                                              <xsl:value-of select="rows/content/form/label/password"></xsl:value-of>
                                            </label>
                                            <div class="position-relative auth-pass-inputgroup mb-3">
                                              <input type="password" value="{rows/content/form/value/password}" class="form-control password-input" id="{rows/content/form/value/password/@name}" name="{rows/content/form/value/password/@name}"/>
                                              <button class="btn btn-link position-absolute end-0 top-0 text-decoration-none text-muted password-addon" type="button" id="password-addon"><i class="ri-eye-fill align-middle"></i></button>
                                            </div>
                                        </div>

                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="auth-remember-check"/>
                                            <label class="form-check-label" for="auth-remember-check">Remember me</label>
                                        </div>

                                        <div class="mt-4">
                                            <button class="btn btn-success w-100" type="submit">Sign In</button>
                                        </div>

                                        <div class="mt-4 text-center">
                                           
                                            <div class="d-none">
                                                <button type="button" class="btn btn-primary btn-icon waves-effect waves-light"><i class="ri-facebook-fill fs-16"></i></button>
                                                <button type="button" class="btn btn-danger btn-icon waves-effect waves-light"><i class="ri-google-fill fs-16"></i></button>
                                                <button type="button" class="btn btn-dark btn-icon waves-effect waves-light"><i class="ri-github-fill fs-16"></i></button>
                                                <button type="button" class="btn btn-info btn-icon waves-effect waves-light"><i class="ri-twitter-fill fs-16"></i></button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- end card body -->
                        </div>
                        <!-- end card -->

                        <div class="mt-4 text-center">
                            <p class="mb-0">Don't have an account ? <a href="auth-signup-basic.html" class="fw-semibold text-primary text-decoration-underline"> Signup </a> </p>
                        </div>

                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
          </div>
        <!-- end auth page content -->

          <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <p class="mb-0 text-muted">
                                <script>document.write(new Date().getFullYear())</script> - IGRP 
                            </p>
                        </div>
                    </div>
                </div>
            </div>
          </footer>
        </div>
				
				<xsl:call-template name="igrp-page-helpers"/>
				<xsl:call-template name="igrp-scripts"/>

         <!-- particles js -->
        <script src="{$path}/libs/particles.js/particles.js"></script>
        <!-- particles app js -->
        <script src="{$themePath}/assets/js/pages/particles.app.js"></script>
        <!-- password-addon init -->
        <script src="{$themePath}/assets/js/pages/password-addon.init.js"></script>
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
