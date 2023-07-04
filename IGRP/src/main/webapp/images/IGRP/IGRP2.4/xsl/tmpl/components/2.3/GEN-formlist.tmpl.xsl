<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="GEN-formlist">
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="fields" select="fields/*"/>
		<xsl:param name="table" select="table"/>
		
		<xsl:variable name="table-th-fields" select="$fields[@type!='hidden' and @type!='group' and not(@visible)]"/>

		<div class="box gen-container-item" gen-class="" item-name="{$tag}" item-type="{@type}">
			<xsl:if test="@title">
				<xsl:call-template name="box-header">
					<xsl:with-param name="title" select="@title"/>
					<xsl:with-param name="collapsible" select="'true'"/>
				</xsl:call-template>
			</xsl:if>
			<xsl:variable name="auxclass">
                <xsl:if test="@style = 'ordertable'">ordertable</xsl:if>
            </xsl:variable>
			<div class="box-body table-box">
				<table id="{$tag}" class="table table-striped gen-data-table IGRP_formlist {$auxclass}" rel="T_{$tag}" data-control="data-{$tag}">
					<thead>
						<tr>
							<xsl:for-each select="$table-th-fields">
                				<xsl:if test="not(@visible)">		
									<th item-name="{name()}" item-type="{@type}">
										<xsl:value-of select="./label"/>
									</th>
								</xsl:if>
	            			</xsl:for-each>
							<xsl:if test="not(@no-delete) or not(@no-add)">
								<th class="table-btn add">
									<xsl:if test="not(@no-add)">
										<a class="formlist-row-add btn btn-primary" rel="{$tag}">
											<i class="fa fa-plus"/>
										</a>
									</xsl:if>
								</th>
							</xsl:if>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="$table/value/row">
							<xsl:variable name="currentRow" select="."></xsl:variable>
							<xsl:variable name="pos" select="position()"></xsl:variable>
							<tr row="{$pos}">
								<input type="hidden" name="p_{$tag}_id" value="{*[name() = concat($tag,'_id')]/text()}"/>
								<xsl:for-each select="*[@type = 'hidden']">
									<input type="hidden" name="{@name}_fk" value="{text()}" />
								</xsl:for-each>
								<xsl:for-each select="$fields">
									<xsl:variable name="fieldTag" select="name()"/>
									<xsl:variable name="descName" select="concat($fieldTag,'_desc')"/>
									<xsl:variable name="checkName" select="concat($fieldTag,'_check')"/>
									
									<xsl:variable name="value" select="$currentRow/*[name() =$fieldTag]/text()" />
									<xsl:variable name="value_desc" select="$currentRow/*[name()=$descName]/text()" />
              						<xsl:variable name="value_check" select="$currentRow/*[name()=$checkName]/text()" />
									<xsl:choose>
										<xsl:when test="@type = 'hidden' or @type = 'group' or @visible">
											<input type="hidden" name="{@name}_fk" value="{$value}" />
                      						<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
										</xsl:when>
										<xsl:otherwise>
											<td data-row="{$pos}">
												<xsl:call-template name="td-wrapper"/>
												<xsl:call-template name="GEN-formfield">
					                          		<xsl:with-param name="setLabel" select="false()"/>
					                          		<xsl:with-param name="isFormlist" select="true()"/>
					                          		<xsl:with-param name="valuedesc" select="$value_desc"/>
					                          		<xsl:with-param name="valuecheck" select="$value_check"/>
					                          		<xsl:with-param name="sizeClass" select="''"/>
					                          		<xsl:with-param name="fieldNameSuffix" select="'_fk'"/>
					                          		<xsl:with-param name="currentRow" select="$currentRow"/>
					                          	</xsl:call-template>
					                          	<xsl:if test="@type = 'text'">
					                          		<input type="hidden" name="{@name}_fk" value="{$value}" />
					                          	</xsl:if>
					                          	<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
											</td>
										</xsl:otherwise>
									</xsl:choose>

								</xsl:for-each>
								<xsl:if test="not(../../../@no-delete) or not(../../../@no-add)">
									<td class="table-btn delete" data-row="{position()}">
										<xsl:if test="not(@nodelete)">
											<span class="formlist-row-remove btn btn-danger" rel="{$tag}">
												<i class="fa fa-times"/>
											</span>
										</xsl:if>
									</td>
								</xsl:if>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</div>
	</xsl:template>

	<xsl:template name="td-wrapper">
		<xsl:param name="fieldTag" select="name()"/>
		<xsl:if test="@align">
			<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
		</xsl:if>
		<xsl:attribute name="data-title"><xsl:value-of select="./label"/></xsl:attribute>
		<xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
		<xsl:attribute name="item-name"><xsl:value-of select="$fieldTag"/></xsl:attribute>
		<xsl:attribute name="item-type"><xsl:value-of select="@type"/></xsl:attribute>
	</xsl:template>

</xsl:stylesheet>