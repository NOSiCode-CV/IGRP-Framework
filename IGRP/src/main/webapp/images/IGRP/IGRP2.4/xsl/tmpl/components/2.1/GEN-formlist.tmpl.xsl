<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="GEN-formlist">
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="fields" select="ancestor::form/label/*[(@rel=$tag)]"/>
		<xsl:param name="table" select="//rows/content/form/table/*[name() = $tag]"/>
		
		<xsl:variable name="table-th-fields" select="$fields[@type!='hidden' and @type!='group' and not(@visible)]"/>

		<div class="box gen-container-item" gen-class="" item-name="{$tag}" item-type="{@type}">
			<xsl:call-template name="box-header">
				<xsl:with-param name="title" select="."/>
				<xsl:with-param name="collapsible" select="'true'"/>
			</xsl:call-template>
			<xsl:variable name="auxclass">
                <xsl:if test="@style = 'ordertable'">ordertable</xsl:if>
            </xsl:variable>
			<div class="box-body table-box">
				<table id="{$tag}" class="table table-striped gen-data-table IGRP_formlist {$auxclass}" rel="T_{$tag}" data-control="data-{$tag}">
					<thead>
						<tr>
							<xsl:for-each select="$table-th-fields">
                <xsl:call-template name="GEN-table-field-head"/>
	            </xsl:for-each>
							<xsl:if test="not($table/value/row[position() = 1]/@nodelete) or not($table/value/row[position() = 1]/@noupdate)">
								<th class="table-btn add">
									<xsl:if test="not($table/value/row[position() = 1]/@noupdate)">
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
							<tr row="{position()}">
								<input type="hidden" name="p_{$tag}_id" value="{../*[name() = concat($tag,'_id')]}"/>
								<xsl:for-each select="*">
									<xsl:variable name="fieldTag" select="name()"/>
									<xsl:variable name="descName" select="concat($fieldTag,'_desc')"/>
									<xsl:variable name="checkName" select="concat($fieldTag,'_check')"/>
									<xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">
										<xsl:variable name="value_desc" select="../*[name()=$descName]/text()" />
                  	<xsl:variable name="value_check" select="../*[name()=$checkName]/text()" />
										<xsl:choose>
											<xsl:when test="@type = 'hidden' or @type = '@group' or @visible">
												<input type="hidden" name="{@name}_fk" value="{text()}" />
	                      <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
											</xsl:when>
											<xsl:when test="@type = 'texteditor'">
												<td>
													<xsl:call-template name="td-wrapper"/>
													<input type="texteditor" value="{.}" class="form-control " id="{@name}_fk">
														<xsl:call-template name="field-attributes">
															<xsl:with-param name="fieldNameSuffix" select="'_fk'"/>
														</xsl:call-template>
													</input>
												</td>
											</xsl:when>
											<xsl:otherwise>
												<td>
													<xsl:call-template name="td-wrapper"/>
													<xsl:call-template name="GEN-formfield">
						                          		<xsl:with-param name="setLabel" select="false()"/>
						                          		<xsl:with-param name="isFormlist" select="true()"/>
						                          		<xsl:with-param name="sizeClass" select="''"/>
						                          		<xsl:with-param name="fieldNameSuffix" select="'_fk'"/>
						                          	</xsl:call-template>
												</td>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:if>
								</xsl:for-each>
								<xsl:if test="not(@nodelete) or not(@noupdate)">
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
		<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
		<xsl:attribute name="data-row"><xsl:value-of select="position()"/></xsl:attribute>
		<xsl:attribute name="data-title"><xsl:value-of select="../../../label/*[name() = $fieldTag]"/></xsl:attribute>
		<xsl:attribute name="class"><xsl:value-of select="@type"/></xsl:attribute>
		<xsl:attribute name="item-name"><xsl:value-of select="$fieldTag"/></xsl:attribute>
		<xsl:attribute name="item-type"><xsl:value-of select="@type"/></xsl:attribute>

		<xsl:variable name="value_desc" select="../*[name()= concat($fieldTag,'_desc')]/text()" />

		<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />

	</xsl:template>

</xsl:stylesheet>