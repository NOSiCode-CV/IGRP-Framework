<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:template name="GEN-table">
		
	<xsl:variable name="tag" select="name()"/>
    <xsl:variable name="fields" select="fields/*"/>
    
    <div class="box box-table-contents gen-container-item " item-name="{name()}">
      <xsl:call-template name="box-header">
        <xsl:with-param name="title" select="@title"/>
        <xsl:with-param name="collapsible" select="'true'"/>
      </xsl:call-template>
      <xsl:variable name="auxclass">
        <xsl:if test="@style = 'ordertable'">ordertable</xsl:if>
	  </xsl:variable>
	  
	  <xsl:variable name="hascontext">
		  <xsl:if test="//rows/content/*[name()=$tag]/table/context-menu">IGRP_contextmenu</xsl:if>
	  </xsl:variable>

      	<div class="box-body table-box">
		  	<div class="table-box-inner">
				<table id="{name()}" class="table table-striped igrp-data-table {$auxclass} {$hascontext}" exports="">
					<thead>
						<xsl:for-each select="$fields[not(@type='hidden')]">
						<xsl:call-template name="GEN-table-field-head">
							<xsl:with-param name="fcount" select="count($fields[not(@type='hidden')])"/>
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
			</div>
      	</div>
    </div>
	</xsl:template>

	<xsl:template name="GEN-table-field-head">
		<xsl:param name="fcount"/>
		<xsl:if test="not(@visible)">	
			<xsl:variable name="checkbox1Row">
				<xsl:if test="$fcount = 1">checkbox1Row</xsl:if>
			</xsl:variable>
			<xsl:choose>
				<xsl:when test="@type='checkbox'">
					<th align="{@align}" item-name="{name()}" item-type="{@type}" class="bs-checkbox no-sort {$checkbox1Row}">
						<label>
	                    	<input type="checkbox" class="IGRP_checkall" check-rel="{name()}" title="{.}" data-toggle="tooltip"/>
	                    	<span><xsl:value-of select="label"/></span>
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
				<xsl:when test="$vtype = 'link' or $vtype='file'">
					<td align="{$valign}" item-name="{$tag}" item-type="{$vtype}">
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
						<input type="hidden" name="{$vname}_fk" value="{text()}" />
						<input type="hidden" name="{$vname}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:when>
				<xsl:when test="$vtype = 'color'">
					<td align="{$valign}" item-name="{$tag}" item-type="{$vtype}">
						<span class="separator-list-td-val color" style="background-color:{$value_desc};height: 10px;display: block;"/>
						<input type="hidden" name="{$vname}_fk" value="{text()}" />
						<input type="hidden" name="{$vname}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:when>
				<xsl:when test="($vtype='checkbox' or $vtype='radio') and $list">
					<td align="{$valign}" class="{$vtype}" item-name="{$tag}" item-type="{$vtype}">
						<xsl:choose>
						    <xsl:when test=". != '-0'">
						    	<label>
							    	<input type="{$vtype}" check-rel="{$tag}" name="{$vname}_fk" class="checkdcontrol" value="{text()}">
			                            <xsl:if test="$value_check=text()">
			                            	<xsl:attribute name="checked">checked</xsl:attribute>
			                        	</xsl:if>
	                        		</input>
	                        		<xsl:if test="text() != $value_check or not($value_check)">
						                <input type="hidden" class="{$vtype} {$tag}" name="{$vname}_fk"/>
						            </xsl:if>
                        			<span><xsl:value-of select="$value_desc" /></span>
                        		</label>
						    </xsl:when>
						    <xsl:otherwise>
						    	<xsl:value-of select="$value_desc" />
						        <input type="hidden" name="{$vname}_fk" value="{text()}" />
						    </xsl:otherwise>
						</xsl:choose>
						<input type="hidden" name="{$vname}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:when>
				<xsl:otherwise>
					<td align="{$valign}" item-name="{$tag}" item-type="{$vtype}" artt="{concat($value_desc,'_dd')}">
						<xsl:value-of select="$value_desc"/>
						<input type="hidden" name="{$vname}_fk" value="{text()}" />
						<input type="hidden" name="{$vname}_fk_desc" value="{$value_desc}" />
					</td>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
</xsl:stylesheet>