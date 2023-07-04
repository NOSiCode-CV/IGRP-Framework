<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="GEN-table">
		
	<xsl:variable name="tag" select="name()"/>
	<xsl:variable name="fields" select="fields/*"/>
	
	<xsl:variable name="quotes">
        <xsl:text>'</xsl:text>
    </xsl:variable>
    
    <div class="box box-table-contents gen-container-item " item-name="{name()}">
      <xsl:call-template name="box-header">
        <xsl:with-param name="title" select="@title"/>
        <xsl:with-param name="collapsible" select="'true'"/>
      </xsl:call-template>
      

      	<div class="box-body">
			<xsl:if test="//rows/content/*[name()=$tag]/table/legend_color or $fields[name() = concat($tag,'_filter')]/value">
				<div class="table-contents-head">
					<div class="table-contents-inner">
						<xsl:if test="//rows/content/*[name()=$tag]/table/legend_color">
							<xsl:apply-templates mode="table-legend" select="//rows/content/*[name()=$tag]/table/legend_color"/>
						</xsl:if>
						
						<xsl:if test="$fields[name() = concat($tag,'_filter')]/value">
							<xsl:call-template name="table-filter">
								<xsl:with-param name="name" select="concat($quotes,'p_',$tag,'_filter',$quotes)"/>
								<xsl:with-param name="value" select="$fields[name() = concat($tag,'_filter')]/value"/>
								<xsl:with-param name="type" select="'filter_aznum'"/>
							</xsl:call-template>
						</xsl:if>
					</div>
				</div>
			</xsl:if>

			<div class="table-box">
				<div class="table-box-inner">
					<xsl:call-template name="GEN-holder-table">
						<xsl:with-param name="tag" select="$tag"/>
					</xsl:call-template>
				</div>
			</div>
      	</div>
    </div>
	</xsl:template>
	
	<xsl:template name="GEN-holder-table">
		<xsl:param name="tag"/>
		
		<xsl:variable name="fields" select="//rows/content/*[name()=$tag]/fields/*"/>
		
		<xsl:variable name="auxclass">
        	<xsl:if test="//rows/content/*[name()=$tag]/@style = 'ordertable'">ordertable</xsl:if>
	  	</xsl:variable>
	  
	  	<xsl:variable name="hascontext">
			<xsl:if test="//rows/content/*[name()=$tag]/table/context-menu">IGRP_contextmenu</xsl:if>
	  	</xsl:variable>
		
		<table id="{name()}" class="table table-striped igrp-data-table dataTable {$auxclass} {$hascontext}" exports="">
			<thead>
				<xsl:for-each select="$fields[not(@type='hidden') and name() != concat($tag,'_filter')]">
					<xsl:call-template name="GEN-table-field-head">
						<xsl:with-param name="fcount" select="count($fields[not(@type='hidden') and name() != concat($tag,'_filter')])"/>
					</xsl:call-template>
				</xsl:for-each>
			</thead>
			<tbody>
				<xsl:for-each select="//rows/content/*[name()=$tag]/table/value/row[not(@total='yes')]">
					<tr>
						<xsl:apply-templates mode="context-param" select="context-menu"/>
						
						<input type="hidden" name="p_{$tag}_id" value="{*[name() = concat($tag,'_id')]}" />
						
						<xsl:for-each select="*[name() != 'context-menu']">

							<xsl:variable name="nametag" select="name()"/>
							
							<xsl:call-template name="GEN-table-row-items">
								<xsl:with-param name="list" select="true()"/>
								<xsl:with-param name="vfilds" select="../../../../fields/*[name() = $nametag]"/>
							</xsl:call-template>
							
						</xsl:for-each>
					</tr>
				</xsl:for-each>
			</tbody>
			<xsl:if test="//rows/content/*[name()=$tag]/table/value/row[@total='yes']">
				<tfoot>	
					<xsl:for-each select="//rows/content/*[name()=$tag]/table/value/row[@total='yes']">
						<tr>	
							<xsl:for-each select="*[name() != 'context-menu']">
								<td><xsl:value-of select="."/></td>
							</xsl:for-each>
						</tr>
					</xsl:for-each>
				</tfoot>
			</xsl:if>
		</table>
		<xsl:if test="//rows/content/*[name()=$tag]/table/context-menu">
			<xsl:apply-templates select="//rows/content/*[name()=$tag]/table/context-menu" mode="table-context-menu"/>
		</xsl:if>
	</xsl:template>

	<xsl:template name="GEN-table-field-head">
		<xsl:param name="fcount"/>
		<xsl:if test="not(@visible) and not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">	
			<xsl:variable name="checkbox1Row">
				<xsl:if test="$fcount = 1">checkbox1Row</xsl:if>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="@type='checkbox'">
					<th align="{@align}" item-name="{name()}" item-type="{@type}" class="bs-checkbox no-sort {$checkbox1Row}">
						<label class="container-box">
	                    	<input type="checkbox" class="IGRP_checkall" check-rel="{name()}" title="{.}" data-toggle="tooltip"/>
	                    	<span><xsl:value-of select="label"/></span>
	                    	<span class="slider round"/>
							<span class="checkmark"/>
	                	</label>
	                </th>
				</xsl:when>
				<xsl:otherwise>
					<th align="{@align}" item-name="{name()}" item-type="{@type}">
						<xsl:value-of select="label"/>
					</th>
				</xsl:otherwise>
			</xsl:choose>

		</xsl:if>
	</xsl:template>
	<xsl:template name="GEN-table-row-items">
		<xsl:param name="list" select="false()"/>
		<xsl:param name="vfilds"/>
		<xsl:param name="tag" select="name()"/>

		<xsl:variable name="value_desc" select="../*[name() = concat( $tag,'_desc' )]" />
		<xsl:variable name="value_check" select="../*[name() = concat( $tag,'_check' )]" />

		<xsl:variable name="vtype" select="$vfilds/@type" />
		<xsl:variable name="vname" select="$vfilds/@name" />
		<xsl:variable name="valign" select="$vfilds/@align"/>

		<xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">
			<xsl:choose>
				<xsl:when test="$vtype='hidden' or $vtype='group' or @visible">
					<input type="hidden" name="{$vname}_fk" value="{text()}"/>
					<input type="hidden" name="{$vname}_fk_desc" value="{$value_desc}"/>
				</xsl:when>
				<xsl:otherwise>
					<td align="{$valign}" class="{$vtype} td-{$vtype}" item-name="{$tag}" item-type="{$vtype}"  data-title="{$vfilds/label}" data-row="{position()}">	
						<xsl:if test="$value_desc != ''">
							<xsl:attribute name="has-desc">true</xsl:attribute>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="$vtype = 'link' or $vtype='file'">
								<xsl:choose>
									<xsl:when test="text()!=''">
										<a href="{text()}">
											<xsl:call-template name="setlinktarget">
												<xsl:with-param name="target" select="$vfilds/@target"/>
											</xsl:call-template>
											<xsl:value-of select="$value_desc" />
										</a>
									</xsl:when>
									<xsl:otherwise>
										<xsl:value-of select="$value_desc" />
									</xsl:otherwise>
								</xsl:choose>
							</xsl:when>
							<xsl:when test="$vtype = 'img'">
								<img class="table-img img-rounded " src="{text()}"/>
							</xsl:when>
							<xsl:when test="$vtype = 'color'">
								
								<xsl:call-template name="tdcolor">
			                        <xsl:with-param name="color" select="text()"/>
			                        <xsl:with-param name="table-colors" select="../../../legend_color/item"/>
			                     </xsl:call-template>
							</xsl:when>
							<xsl:when test="($vtype='checkbox' or $vtype='radio') and $list">
								<xsl:if test=". != '-0'">
									<label class="container-box ">
										<input type="{$vtype}" name="{$vname}_fk" value="{text()}" check-rel="{$tag}" class="checkdcontrol">
											<xsl:if test="$value_check = text()">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
										</input>
										<xsl:choose>
											<xsl:when test="$vtype = 'radio'">
												<span class="radiomark"/>
											</xsl:when>
											<xsl:otherwise>
												<span class="slider round"/>
												<span class="checkmark"/>
											</xsl:otherwise>
										</xsl:choose>
										<xsl:if test="$value_desc != ''">
											<span class="value_desc"><xsl:value-of select="$value_desc"/></span>
										</xsl:if>
									</label>
								</xsl:if>
								<input type="hidden" name="{$vname}_check_fk" class="{$tag}_check" value_check="{$value_check}">
									<xsl:if test="$value_check = text()">
										<xsl:attribute name="value">
											<xsl:value-of select="$value_check"/>
										</xsl:attribute>
									</xsl:if>
								</input>
								<xsl:if test="$value_check != text() or not($value_check)">
									<input type="hidden" name="{$vname}_fk" value="{text()}" class="{$tag}"/>
								</xsl:if>

							</xsl:when>
							<xsl:otherwise>
								<xsl:choose>
									<xsl:when test="$value_desc != ''">
										<xsl:value-of select="$value_desc"/>
									</xsl:when>
									<xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
								</xsl:choose>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>