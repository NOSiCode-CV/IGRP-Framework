<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="pheight"/>
	<xsl:param name="filter"/>
	<xsl:param name="library"/>
	<xsl:param name="filter_type"/>
	<xsl:param name="remote_filter"/>
	<xsl:param name="datalabels"/>
	<xsl:param name="view3d"/>
	<xsl:template match="*">
		<xsl:variable name="nheight">
			<xsl:choose>
				<xsl:when test="$pheight and $pheight != ''">
					<xsl:value-of select="$pheight"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="./height"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="library">
			<xsl:choose>
				<xsl:when test="$library and $charts_library != ''">
					<xsl:value-of select="$library"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="'chartjs'"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:call-template name="graphed">
			<xsl:with-param name="charts" select="."/>
			<xsl:with-param name="library" select="$library"/>
			<xsl:with-param name="type" select="./chart_type"/>
			<xsl:with-param name="url" select="./url"/>
			<xsl:with-param name="title" select="./@title"/>
			<xsl:with-param name="height" select="$nheight"/>
			<xsl:with-param name="filter" select="$filter"/>
			<xsl:with-param name="filter_type" select="$filter_type"/>
			<xsl:with-param name="remote_filter" select="$remote_filter"/>
			<xsl:with-param name="datalabels" select="$datalabels"/>
			<xsl:with-param name="view3d" select="$view3d"/>
		</xsl:call-template>
	</xsl:template>
	<xsl:template name="graphed">
		<xsl:param name="charts" select="''"/>
		<xsl:param name="library" select="'chartjs'"/>
		<xsl:param name="type" select="''"/>
		<xsl:param name="title"/>
		<xsl:param name="height" select="'250'"/>
		<xsl:param name="url" select="''"/>
		<xsl:param name="filter" select="'false'"/>
		<xsl:param name="filter_type"/>
		<xsl:param name="remote_filter"/>
		<xsl:param name="datalabels"/>
		<xsl:param name="view3d"/>
		<xsl:variable name="vtype">
			<xsl:choose>
				<xsl:when test="$type = 'barchart' or $type = 'BarChart'">bar</xsl:when>
				<xsl:when test="$type = 'piechart' or $type = 'PieChart'">pie</xsl:when>
				<xsl:when test="$type = 'linechart' or $type = 'LineChart'">line</xsl:when>
				<xsl:when test="$type = 'columnchart' or $type = 'ColumnChart'">column</xsl:when>
				<xsl:when test="$type = 'areachart' or $type = 'AreaChart'">area</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$type"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
		<xsl:variable name="graph-id" select="local-name($charts)"/>
		<xsl:variable name="categories">
			<xsl:for-each select="$charts/label/col[position()!=1]">
				<xsl:value-of select="."/>
				<xsl:if test="position() != last()">|</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="desc-label" select="$charts/label/col[position()=1]"/>
		<xsl:variable name="labels">
			<xsl:for-each select="$charts/value/row">
				<xsl:value-of select="col[position() = 1]"/>
				<xsl:if test="position() != last()">|</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="data">
			<xsl:for-each select="$charts/value/row">
				<xsl:for-each select="col[position() &gt; 1]">
					<xsl:choose>
						<xsl:when test=". != ''">
							<xsl:value-of select="."/>
						</xsl:when>
						<xsl:otherwise>0</xsl:otherwise>
					</xsl:choose>
					<xsl:if test="position() != last()">!</xsl:if>
				</xsl:for-each>
				<xsl:if test="position() != last()">|</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="xmlcolors">
			<xsl:for-each select="$charts/colors/col">
				<xsl:value-of select="."/>
				<xsl:if test="position() != last()">|</xsl:if>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="colorsname" select="concat('p_fwl_',$graph-id,'_color')"/>
		<xsl:variable name="colors">
			<xsl:choose>
				<xsl:when test="//rows/content/*/fields/hidden[@name=$colorsname]">
					<xsl:value-of select="//rows/content/*/fields/hidden[@name=$colorsname]"/>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="$xmlcolors"/>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:variable>
//TODO: header reload but chat not

		<div class="card IGRP-charts-{$library} IGRP-charts-component gen-container-item" item-name="{$graph-id}" chart-categories="{$categories}" chart-id="{$graph-id}" chart-type="{$vtype}" chart-desc-label="{$desc-label}" chart-datasets="{$labels}" chart-colors="{$colors}" chart-data="{$data}" chart-url="{$url}">
			<xsl:if test="$datalabels = 'true'">
				<xsl:attribute name="chart-datalabels">
					<xsl:value-of select="$datalabels"/>
				</xsl:attribute>
			</xsl:if>

			<xsl:if test="$view3d = 'true'">
				<xsl:attribute name="chart-3d">
					<xsl:value-of select="$view3d"/>
				</xsl:attribute>
			</xsl:if>
			<div class="card-header">
				<h4 class="card-title mb-0">
					<xsl:value-of select="$title"/>
				</h4>
				<xsl:if test="$filter = 'true'">
					<xsl:if test="$filter_type != ''">
						<xsl:attribute name="filter-type">
							<xsl:value-of select="$filter_type"/>
						</xsl:attribute>
					</xsl:if>
					<xsl:if test="$remote_filter != ''">
						<xsl:attribute name="remote-filter">
							<xsl:value-of select="$remote_filter"/>
						</xsl:attribute>
					</xsl:if>
					<div class="toggleChart btn-group dropdown">
						<button type="button" class="active-chart btn btn-default dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
						<div class="dropdown-menu"></div>
					</div>
				</xsl:if>
			</div>

			<div id="holder-{$graph-id}" class="card-body">
				<xsl:choose>
					<xsl:when test="$type != 'tablecharts'">
						<xsl:choose>
							<xsl:when test="$library = 'chartjs'">
								<canvas id="{$graph-id}" class="chartjs-chart"></canvas>
							</xsl:when>
							<xsl:otherwise>

								<div id="{$graph-id}" class="{$library}-chart"></div>
								
							</xsl:otherwise>
						</xsl:choose>
						
					</xsl:when>
					<xsl:otherwise>
						<xsl:attribute name="style">
							<xsl:value-of select="concat('height:',$height,'px;overflow: scroll;')"/>
						</xsl:attribute>
					</xsl:otherwise>
				</xsl:choose>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="igrp-charts">

		<xsl:param name="charts" select="''" />
		<xsl:param name="library" select="'chartjs'" />
		<xsl:param name="type" select="'bar'" />
		<xsl:param name="height" select="'250'" />
		<xsl:param name="url" select="''"/>
		<xsl:param name="title" select="'charts'"/>
		<xsl:param name="filter" select="'false'"/>
		<xsl:param name="filter_type"/>
		<xsl:param name="remote_filter"/>
		<xsl:param name="datalabels"/>
		<xsl:param name="view3d"/>

		<xsl:variable name="vheight" select="$height+50"/>

		<xsl:call-template name="graphed">
			<xsl:with-param name="charts" select="$charts"/>
			<xsl:with-param name="library" select="$library"/>
			<xsl:with-param name="type" select="$charts/chart_type"/>
			<xsl:with-param name="title" select="$charts/@title"/>
			<xsl:with-param name="height" select="$vheight"/>
			<xsl:with-param name="url" select="$charts/url"/>
			<xsl:with-param name="filter" select="$filter"/>
			<xsl:with-param name="filter_type" select="$filter_type"/>
			<xsl:with-param name="remote_filter" select="$remote_filter"/>
			<xsl:with-param name="datalabels" select="$datalabels"/>
			<xsl:with-param name="view3d" select="$view3d"/>
		</xsl:call-template>

	</xsl:template>

	<xsl:template name="charts-attributes">
		<xsl:param name="data"/>
		<xsl:attribute name="data-colors">
			<xsl:text>[</xsl:text>
			<xsl:for-each select="$data/colors/col">
				<xsl:text>&quot;</xsl:text>
				<xsl:value-of select="."/>
				<xsl:text>&quot;</xsl:text>
				<xsl:if test="position() != last()">,</xsl:if>
			</xsl:for-each>
			<xsl:text>]</xsl:text>
		</xsl:attribute>
	</xsl:template>

	
</xsl:stylesheet>