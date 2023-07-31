<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<!-- this template requires GEN-formfields.tmpl  -->
	<xsl:template name="GEN-separatorlist">
		
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="isDialog" select="'false'"/>
		<xsl:param name="fields" select="ancestor::form/label/*[(@rel=$tag)]"/>

		<div class="box gen-container-item" gen-class="" item-name="{$tag}">
			<xsl:call-template name="box-header">
        <xsl:with-param name="title" select="."/>
        <xsl:with-param name="collapsible" select="'true'"/>
      </xsl:call-template>
			<div class="box-body IGRP-separatorlist" dialog="{$isDialog}">
				<div class="splist-form-holder">
					<div class="splist-form" role="form">
						<xsl:apply-templates mode="form-hidden-fields" select="rows/content/separatorlist_1/fields"/>
						
						<xsl:for-each select="$fields">
							
							<xsl:call-template name="GEN-formfields"/>

						</xsl:for-each>

					</div>
				</div>
				<div class="table-box box-body box-table-contents splist-table">
					<table rel="T_separatorlist_1" id="{$tag}" class="table table-striped gen-data-table">
						<thead>
							<tr>
								<th class="table-btn">
									<a class="table-row-add btn-xs btn btn-primary" title="Adicionar" data-toggle="tooltip" data-placement="left">
										<i class="fa fa-plus"/>
									</a>
								</th>
							</tr>
						</thead>
						<tbody>
							<xsl:for-each select="rows/content/separatorlist_1/table/value/row">
								<tr>
									<input type="hidden" class="sl-row-id" name="p_separatorlist_1_id" value="{separatorlist_1_id}"/>
									
									<td data-row="{position()}" class="table-btn">
										<xsl:if test="not(@noupdate)">
											<span class="table-row-edit btn btn-default " rel="{$tag}">
												<i class="fa fa-pencil"/>
											</span>
										</xsl:if>
										<xsl:if test="not(@nodelete)">
											<span class="table-row-remove btn btn-danger" rel="{$tag}">
												<i class="fa fa-times"/>
											</span>
										</xsl:if>
									</td>
								</tr>
							</xsl:for-each>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</xsl:template>
</xsl:stylesheet>