<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="igrp-footer">

		<!-- IFRAME NAVIGATION MODAL -->
		<xsl:call-template name="iframe-nav"/>
		<!--/IFRAME NAVIGATION MODAL -->
	
		<!-- DEBUG -->
		<xsl:call-template name="IGRP-debug"/>
		<!--/DEBUG -->

		<footer class="footer">
			<div class="container-fluid">
				<div class="row">
					<div class="col-sm-6">
						<script>document.write(new Date().getFullYear())</script> © igrpweb.
					</div>
					<div class="col-sm-6">
						<div class="text-sm-end d-none d-sm-block">
            	Todos os direitos reservados.
						</div>
					</div>
				</div>
			</div>
		</footer>
	</xsl:template>
</xsl:stylesheet>