<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="GEN-table">
		
		<xsl:variable name="tag" select="name()"/>
    <xsl:variable name="fields" select="../*[@rel=$tag]"/>
    
    <div class="box box-table-contents gen-container-item " item-name="{name()}">
      <xsl:call-template name="box-header">
        <xsl:with-param name="title" select="."/>
        <xsl:with-param name="collapsible" select="'true'"/>
      </xsl:call-template>
      <xsl:variable name="auxclass">
        <xsl:if test="@style = 'ordertable'">ordertable</xsl:if>
      </xsl:variable>
      <div class="box-body table-box">
        <table id="{name()}" class="table table-striped gen-data-table {$auxclass}" exports="">
          <thead>
            <xsl:for-each select="$fields[not(@type='hidden')]">
              <xsl:call-template name="GEN-table-field-head"/>
            </xsl:for-each>
          </thead>
          <tbody>
            <xsl:for-each select="//rows/content/form/table/*[name() = $tag]/value/row[not(@total='yes')]">
              <tr>
                <input type="hidden" name="p_{$tag}_id" value="{*[name() = concat($tag,'_id')]}" />
                <xsl:for-each select="*">
                  <xsl:call-template name="GEN-table-row-items">
                  	<xsl:with-param name="list" select="true()"/>
                  </xsl:call-template>
                </xsl:for-each>
              </tr>
            </xsl:for-each>
          </tbody>
        </table>
      </div>
    </div>
	</xsl:template>

	<xsl:template name="GEN-table-field-head">
		<xsl:if test="not(@visible)">		
			<th item-name="{name()}" item-type="{@type}">
				<xsl:value-of select="."/>
			</th>
		</xsl:if>
	</xsl:template>
	<xsl:template name="GEN-table-row-items">
		<xsl:param name="list" select="false()"/>
		<xsl:variable name="tag" select="name()"/>
		<xsl:variable name="value_desc" select="../*[name() = concat( $tag,'_desc' )]" />
		<xsl:variable name="value_check" select="../*[name() = concat( $tag,'_check' )]" />
		<xsl:if test="not(substring(name(),(string-length(name())-4),5) = '_desc') and not(substring(name(),(string-length(name())-5),6) = '_check')">
			<xsl:choose>
				<xsl:when test="@type='hidden' or @type='group' or @visible">
					<input type="hidden" name="{@name}_fk" value="{text()}"/>
					<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}"/>
				</xsl:when>
				<xsl:when test="@type = 'link' or @type='file'">
					<td align="{@align}" item-name="{$tag}" item-type="{@type}">
						<xsl:choose>
							<xsl:when test="text()!=''">
								<a href="{text()}">
									<xsl:call-template name="setlinktarget">
									    <xsl:with-param name="target" select="//rows/content/*/label/*[name() = $tag]/@target"/>
									</xsl:call-template>
									<xsl:value-of select="$value_desc" />
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="$value_desc" />
							</xsl:otherwise>
						</xsl:choose>
						<input type="hidden" name="{@name}_fk" value="{text()}" />
						<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:when>
				<xsl:when test="@type = 'color'">
					<td align="{@align}" item-name="{$tag}" item-type="{@type}">
						<span class="separator-list-td-val color" style="background-color:{$value_desc};height: 10px;display: block;"/>
						<input type="hidden" name="{@name}_fk" value="{text()}" />
						<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:when>
				<xsl:when test="(@type='checkbox' or @type='radio') and $list">
					<td align="{@align}" class="{@type}" item-name="{$tag}" item-type="{@type}">
						<xsl:choose>
						    <xsl:when test=". != '-0'">
						    	<label>
							    	<input type="{@type}" name="{@name}_fk" value="{text()}">
			                            <xsl:if test="$value_check=text()">
			                            	<xsl:attribute name="checked">checked</xsl:attribute>
			                        	</xsl:if>
	                        		</input>
                        			<span><xsl:value-of select="$value_desc" /></span>
                        		</label>
						    </xsl:when>
						    <xsl:otherwise>
						    	<xsl:value-of select="$value_desc" />
						        <input type="hidden" name="{@name}_fk" value="{text()}" />
						    </xsl:otherwise>
						</xsl:choose>
						<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td align="{@align}" item-name="{$tag}" item-type="{@type}">
						<xsl:value-of select="$value_desc"/>
						<input type="hidden" name="{@name}_fk" value="{text()}" />
						<input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>