<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	
	<xsl:template name="igrp-scripts">

		<script src="{$path}/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="{$path}/libs/simplebar/simplebar.min.js"></script>
		<script src="{$path}/libs/node-waves/waves.min.js"></script>
		<script src="{$path}/libs/feather-icons/feather.min.js"></script>
		<script src="{$themePath}/assets/js/pages/plugins/lord-icon-2.1.0.js"></script>
		<script src="{$themePath}/assets/js/plugins.js"></script>
		<script src="{$themePath}/assets/js/app.js" async=""></script>

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
		
		<script src="{$path}/core/igrp/iframenav/IGRP.iframeNav.js?v={$version}"></script>

		<script src="{$path}/core/igrp/IGRP.handler.js?v={$version}"></script>

		<script src="{$path}/core/igrp/xml.xslt/xml.xsl.transform.js"></script>

		<xsl:call-template name="igrp-global-scripts"></xsl:call-template>

	</xsl:template>

	<xsl:template name="igrp-theme-colors-script" mode="igrp-theme-colors-script" match="*">
        <script>
            $.IGRP.theme = {
                name:"<xsl:value-of select="$defined-template"/>",
                colors : {
                <xsl:for-each select="colors/color">
                    <xsl:value-of select="@name"/>:"<xsl:value-of select="."/>"<xsl:if test="position() != last()">,</xsl:if>
                </xsl:for-each>
                }
            };
        </script>
    </xsl:template>

	<xsl:template name="igrp-global-scripts">

        <script id="igrp-locale-js">
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

		<xsl:if test="$themeConfigData">
            <xsl:apply-templates mode="igrp-theme-colors-script" select="$themeConfigData"/>
        </xsl:if>

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