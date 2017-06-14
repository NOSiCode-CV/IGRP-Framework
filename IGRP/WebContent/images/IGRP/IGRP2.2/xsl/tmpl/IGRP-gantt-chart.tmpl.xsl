<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="gantt-chart" mode="gantt-chart" match="content">
		<link rel="stylesheet" type="text/css" href="{$path}/extensions/gantt-chart/css/jquery.ganttView.css"/>
		<script type="text/javascript" src="{$path}/extensions/gantt-chart/js/date.js"></script>
		<script type="text/javascript" src="{$path}/extensions/gantt-chart/js/jquery.ganttView.js"></script>
		<script type="text/javascript">
			var ganttData = [
				<xsl:for-each select="table/value/row[id_pai = '']">
						<xsl:variable name="v_code" select="id"/>
					{
						id: <xsl:value-of select='id'/>, name: "<xsl:value-of select='titulo'/>", 
						series:[
							{	
								name: "<xsl:value-of select='titulo'/>",
								start: new Date(<xsl:value-of select='inicio'/>),
								end: new Date(<xsl:value-of select='fim'/>)
								<xsl:if test="cor != ''">
									,color: "<xsl:value-of select='cor'/>"
								</xsl:if>
							},
							<xsl:call-template name="table_tr">
		                        <xsl:with-param name="id" select="$v_code"/>
		                    </xsl:call-template>	
							
						]
					}<xsl:if test="position() !=last()">,</xsl:if>
				</xsl:for-each>
			];
			$(function (){
				$("#ganttChart").ganttView({ 
					data: ganttData,
				});
				
			});
		</script>
	

	<!-- <div class="app_legenda">	 
			<span class="app_leg_label_p">Legenda: </span>
			<span class="app_leg_label">iniciado</span>
			<div class="color" style="background-color:red"></div>
			<span class="app_leg_label">finalizado</span>
			<div class="color" style="background-color:green"></div>
	
			<div class="clear"></div>
	</div> -->

		<div id="conteudo_gantt">
			<div id="ganttChart"></div>
			<br/><br/>
			
		</div>
		<!-- <xsl:for-each select=".">
				<xsl:value-of select='subtitulo'/> <br/>
			</xsl:for-each>	 -->
	</xsl:template>
	<xsl:template name="table_tr">
		<xsl:param name="id" select="''"/> 
		<xsl:for-each select="//table/value/row[id_pai = $id]">
		    <xsl:variable name="v_code" select="id"/>
	    	{ 	
	    		name: "<xsl:value-of select='subtitulo'/>",
				start: new Date(<xsl:value-of select='inicio'/>), 
				end: new Date(<xsl:value-of select='fim'/>)
				<xsl:if test="cor != ''">
					,color: "<xsl:value-of select='cor'/>"
				</xsl:if>
			},
		</xsl:for-each>
	</xsl:template> 
</xsl:stylesheet>