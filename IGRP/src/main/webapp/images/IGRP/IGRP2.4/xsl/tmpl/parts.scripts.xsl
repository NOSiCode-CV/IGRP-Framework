<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="igrp-scripts">



		<script src="{$path}/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="{$path}/libs/simplebar/simplebar.min.js"></script>
		<script src="{$path}/libs/node-waves/waves.min.js"></script>
		<script src="{$path}/libs/feather-icons/feather.min.js"></script>
		<script src="{$themePath}/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
		<script src="{$themePath}/assets/js/plugins.js"></script>
		<script src="{$themePath}/assets/js/app.js"></script>

		<script src="{$path}/core/jquery/{$jq-v}/jquery.min.js"></script>
		<script src="{$path}/core/bootstrap/plugins/validation/js/jquery.validate.js"></script>
		<script src="{$path}/core/moment/moment.min.js"></script>
		<!-- EVENTS class -->
		<script src="{$path}/core/igrp/IGRP.events.class.js?v={$version}"></script>
		<!-- UTILS class -->
		<script src="{$path}/core/igrp/IGRP.jsutils.js?v={$version}"></script>
		<!-- IGRP class -->
		<script src="{$path}/core/igrp/IGRP.class.js?v={$version}"></script>
		<!-- IGRP config -->
		<script src="{$path}/core/igrp/IGRP.defaults.js?v={$version}"></script>
		<!-- IGRP core functions -->
		<script src="{$path}/core/igrp/IGRP.core.js?v={$version}"></script>
		<!-- IGRP targets controller -->
		<script src="{$path}/core/igrp/targets/IGRP.targets.js?v={$version}"></script>
		<!-- IGRP targets controller -->
		<script src="{$path}/components/sidebar/sidebar.js?v={$version}"></script>

		<script>
			$.IGRP.locale = {
				current : "<xsl:value-of select="$locale"/>",
				available : ['pt','en'],
				texts : {
				<xsl:for-each select="$locale-strings/*">
					"<xsl:value-of select="name()"/>" : "<xsl:value-of select="."/>"<xsl:if test="position() != last()">,</xsl:if>
				</xsl:for-each>
				},
				get:function(string){
					return $.IGRP.locale.texts[string] || string;
				}
			}
		
		</script>

		

		<script>
			$(window).on('load', function(){
					$.IGRP.onLoad ? $.IGRP.onLoad() : null;
			});
			$(document).ready( function(){
					$.IGRP.init( );
			});
		</script>

	</xsl:template>

	<xsl:template name="igrp-chart-scripts">
		<script src="{$path}/plugins/charts/igrp.charts.utils.js"></script>
		<!-- chartjs-->
		<script src="{$path}/plugins/charts/chartjs/chartjs.min.js"></script>
		<script src="{$path}/plugins/charts/chartjs/igrp.chartjs.js"></script>

		<!-- -->
		<!-- apexcharts -->
		<script src="{$path}/plugins/charts/apexcharts2/apexcharts.min.js"></script>
		<script src="{$path}/plugins/charts/apexcharts2/igrp.apexcharts.js"></script>
	</xsl:template>

</xsl:stylesheet>