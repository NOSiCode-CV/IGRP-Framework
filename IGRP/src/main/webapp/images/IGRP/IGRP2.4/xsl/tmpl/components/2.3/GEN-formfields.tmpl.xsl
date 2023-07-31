<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="GEN-formfield">
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="type" select="@type"/>
		<xsl:param name="tableEdit" select="false()"/>
		<xsl:param name="isFormlist" select="false()"/>
		<xsl:param name="valuedesc"/>
		<xsl:param name="valuecheck"/>
		<xsl:param name="setLabel" select="true()"/>
		<xsl:param name="fieldNameSuffix" select="''"/>
		<xsl:param name="sizeClass" select="'col-sm-3'"/>
		<xsl:param name="currentRow" select="."/>
		<xsl:variable name="nameAttr" select="concat(@name,$fieldNameSuffix)"/>
		
		<xsl:variable name="fieldValue">
			<xsl:choose>
			    <xsl:when test="$isFormlist"><xsl:value-of select="$currentRow/*[name() = $tag]"/></xsl:when>
			    <xsl:otherwise><xsl:value-of select="./value"/></xsl:otherwise>
			</xsl:choose>
		</xsl:variable>

		<xsl:if test="@type != 'hidden'">
			<xsl:choose>
				<xsl:when test="@type = 'separator' or @type = 'group'">
					<div class="box-head subtitle" text-color="primary" item-name="{name()}">
						<span>
							<xsl:value-of select="text()"/>
						</span>
					</div>
				</xsl:when>
				<xsl:when test="contains(@type,'select')">
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<select class="form-control select2 ">
							<xsl:call-template name="field-attributes">
								<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
								<xsl:with-param name="isFormlist" select="$isFormlist"/>
							</xsl:call-template>
							
							<xsl:choose>
						       <xsl:when test="$isFormlist">
						       		<xsl:call-template name="field-options">
										<xsl:with-param name="value" select="$fieldValue"/>
									</xsl:call-template>
						       	</xsl:when>

						       <xsl:otherwise>
						       		<xsl:call-template name="field-options"/>
						       </xsl:otherwise> 
						       
						    </xsl:choose>
						</select>
					</div>
				</xsl:when>
				<xsl:when test="contains(@type,'date')">
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<div class="input-group">
							<input type="text" value="{$fieldValue}" class="form-control gen-date" format="IGRP_datePicker">
								<xsl:call-template name="field-attributes">
									<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
									<xsl:with-param name="isFormlist" select="$isFormlist"/>
								</xsl:call-template>
							</input>
							<span class="input-group-btn gen-date-icon">
								<span class="btn btn-primary">
									<i class="fa fa-calendar"></i>
								</span>
							</span>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="contains(@type,'lookup')">
					<xsl:variable name="ad_hoc">
						<xsl:choose>
							<xsl:when test="@type='lookup'">1</xsl:when>
							<xsl:otherwise>0</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<div class="input-group">
							<input type="text" value="{$fieldValue}" class="form-control">
								<xsl:call-template name="field-attributes">
									<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
									<xsl:with-param name="isFormlist" select="$isFormlist"/>
								</xsl:call-template>
							</input>
							<xsl:call-template name="lookup-tool">
								<xsl:with-param name="action" select="@type" />
								<xsl:with-param name="name" select="$nameAttr" />
								<xsl:with-param name="js_lookup" select="./lookup" />
								<xsl:with-param name="ad_hoc" select="$ad_hoc" />
								<xsl:with-param name="input-id" select="$nameAttr"/>
								<xsl:with-param name="btnClass" select="'primary'"/>
							</xsl:call-template>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="@type = 'link'">
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<a href="{$fieldValue}" class="link btn btn-primary form-link">
							<xsl:choose>
							    <xsl:when test="@rel">
							    	<xsl:attribute name="target">
							    		<xsl:value-of select="//rows/content/*/label/*[name() = $tag]/@target"/>
							    	</xsl:attribute>
							    </xsl:when>
							    <xsl:otherwise>
							        <xsl:attribute name="target">
							    		<xsl:value-of select="@target"/>
							    	</xsl:attribute>
							    </xsl:otherwise>
							</xsl:choose>

							<xsl:choose>
								<xsl:when test="$isFormlist">
								    <xsl:attribute name="class">link form-link</xsl:attribute>
								    <span><xsl:value-of select="$valuedesc"/></span>
								</xsl:when> 
								<xsl:otherwise>
									<i class="fa fa-link"/>
									<span><xsl:value-of select="./label"/></span>    
								</xsl:otherwise>   
							</xsl:choose>

						</a>
						<xsl:if test="@rel">
							<input type="link" label="{./label}"  name="{$nameAttr}" value="{$fieldValue}" style="display:none;"/>
						</xsl:if>
					</div>
				</xsl:when>
				<xsl:when test="contains(@type,'textarea')">
					<xsl:variable name="size">
						<xsl:if test="$sizeClass != ''">
							<xsl:choose>
								<xsl:when test="@type='textarea_m'">col-sm-6</xsl:when>
								<xsl:when test="@type='textarea_g'">col-sm-12</xsl:when>
								<xsl:otherwise>col-sm-3</xsl:otherwise>
							</xsl:choose>
						</xsl:if>
					</xsl:variable>
					<div class="form-group {$size}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<textarea class="textarea form-control">
							<xsl:call-template name="field-attributes">
								<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
								<xsl:with-param name="isFormlist" select="$isFormlist"/>
							</xsl:call-template>
							<xsl:value-of select="$fieldValue"/>
						</textarea>
					</div>
				</xsl:when>
				<xsl:when test="@type = 'checkbox' or @type='radio'">
					<div class="{$sizeClass}" item-name="{$tag}" item-type="checkbox">
						<div class="form-group">
							<xsl:if test="@required = 'true'">
								<xsl:attribute name="required">required</xsl:attribute>
							</xsl:if>
							<div class="{$type} form-check-offset">
								<label>
									<input type="{$type}" value="1" class="checkbox " label="{./label}">
										<xsl:call-template name="field-attributes">
											<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
											<xsl:with-param name="isFormlist" select="$isFormlist"/>
										</xsl:call-template>
										<xsl:if test="$fieldValue = '1'">
											<xsl:attribute name="checked">checked</xsl:attribute>
										</xsl:if>
									</input>
									<xsl:if test="$isFormlist != true()">
										<span>
											<xsl:value-of select="./label"/>
										</span>
									</xsl:if>
								</label>
							</div>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="@type = 'checkboxlist' or @type = 'radiolist'">
					<xsl:variable name="input-type">
						<xsl:choose>
							<xsl:when test="$type = 'checkboxlist'">checkbox</xsl:when>
							<xsl:otherwise>radio</xsl:otherwise>
						</xsl:choose>
					</xsl:variable>
					<div class="{$sizeClass}">
						<xsl:attribute name="item-name">
							<xsl:value-of select="name()"/>
						</xsl:attribute>
						<xsl:attribute name="item-type">
							<xsl:value-of select="@type"/>
						</xsl:attribute>
						<div class="form-group {$type} clear">
							<xsl:if test="@required = 'true'">
								<xsl:attribute name="required">required</xsl:attribute>
							</xsl:if>
							<xsl:if test="$setLabel">
								<xsl:call-template name="form-item-label"/>
							</xsl:if>
							<xsl:for-each select="./list/option">
								<div class="{$input-type} col-md-{../../@child_size}">
									<label>
										<input type="{$input-type}" value="{value}" class="{$type} " label="{text}">
											<xsl:call-template name="field-attributes">
												<xsl:with-param name="field" select="../.."/>
											</xsl:call-template>
											<xsl:if test="@selected='true'">
												<xsl:attribute name="checked">checked</xsl:attribute>
											</xsl:if>
										</input>
										<span>
											<xsl:value-of select="text"/>
										</span>
									</label>
								</div>
							</xsl:for-each>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="@type = 'file'">
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<div class="input-group">
							<input type="text" class="form-control not-form" readonly=""/>
							<span class="input-group-btn">
								<span class="btn btn-primary file-btn-holder">
									<i class="fa fa-upload"/>
									<input value="{$fieldValue}" target-rend="" class="transparent " type="file" accept="">
										<xsl:call-template name="field-attributes">
											<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
											<xsl:with-param name="isFormlist" select="$isFormlist"/>
										</xsl:call-template>
									</input>
								</span>
							</span>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="@type = 'color'">
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<div class="input-group form-color-picker" id="form_1_{$nameAttr}_colorp">
							<input type="text" value="{$fieldValue}" format="hex" class="form-control">
								<xsl:call-template name="field-attributes">
									<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
									<xsl:with-param name="isFormlist" select="$isFormlist"/>
								</xsl:call-template>
							</input>
							<span class="input-group-addon">
								<i/>
							</span>
						</div>
					</div>
				</xsl:when>
				<xsl:when test="@type = 'image'">
					<div class="{$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<img src="{$fieldValue}" data-label="{.}" name="{$nameAttr}" id="{$nameAttr}" class=" "/>
					</div>
				</xsl:when>
				<xsl:when test="@type = 'plaintext'">
					<div class="{$sizeClass} form-group ">
						<xsl:call-template name="field-wrapper"/>
						<xsl:value-of select="$fieldValue"/>
					</div>
				</xsl:when>
				<!-- <xsl:when test="contains(@type,'vkb_')">
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<xsl:call-template name="VirtualKeyBoard">
							<xsl:with-param name="type" select="@type"/>
							<xsl:with-param name="rel" select="concat($nameAttr,'_',position())"/>
							<xsl:with-param name="input_type" select="'password'"/>
							<xsl:with-param name="input_name" select="$nameAttr"/>
							<xsl:with-param name="id" select="$nameAttr"/>
						</xsl:call-template> 
					</div>
				</xsl:when>-->
				<xsl:when test="@type = 'texteditor'">
					<div class="form-group col-sm-12">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="$isFormlist">
								<input type="text" value="{$fieldValue}" class="form-control">
									<xsl:call-template name="field-attributes">
										<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
										<xsl:with-param name="isFormlist" select="$isFormlist"/>
									</xsl:call-template>
								</input>
							</xsl:when>
							<xsl:otherwise>
								<textarea id="{$nameAttr}" class="gen-texteditor">
									<xsl:call-template name="field-attributes">
										<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
										<xsl:with-param name="isFormlist" select="$isFormlist"/>
									</xsl:call-template>
								</textarea>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</xsl:when>

				<xsl:when test="@type = 'range'">
					<div class="form-group col-sm-3">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
					    <input id="range-{$tag}" name="{@name}" class="igrp-range" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="1" data-slider-value="{$fieldValue}">
					    </input>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="form-group {$sizeClass}">
						<xsl:call-template name="field-wrapper"/>
						<xsl:if test="$setLabel">
							<xsl:call-template name="form-item-label"/>
						</xsl:if>
						<xsl:choose>
							<xsl:when test="@type = 'text' and $isFormlist">
								<span class="separator-list-td-val"><xsl:value-of select="$valuedesc"/></span>
							</xsl:when>
							<xsl:otherwise>
							    <input type="{@type}" value="{$fieldValue}" class="form-control ">
									<xsl:call-template name="field-attributes">
										<xsl:with-param name="fieldNameSuffix" select="$fieldNameSuffix"/>
										<xsl:with-param name="isFormlist" select="$isFormlist"/>
									</xsl:call-template>
								</input>
							</xsl:otherwise>
						</xsl:choose>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:if>
	</xsl:template>
	<xsl:template name="form-item-label">
		<label for="{name(.)}">
			<span>
				<xsl:value-of select="./label"/>
			</span>
		</label>
	</xsl:template>
	<xsl:template name="field-wrapper">
		<xsl:attribute name="item-name">
			<xsl:value-of select="name()"/>
		</xsl:attribute>
		<xsl:attribute name="item-type">
			<xsl:value-of select="@type"/>
		</xsl:attribute>
		<xsl:if test="@required = 'true'">
			<xsl:attribute name="required">required</xsl:attribute>
		</xsl:if>
	</xsl:template>
	<xsl:template name="field-options">
		<xsl:param name="value" select="false()"/>
		<xsl:for-each select="./list/option">
			<xsl:choose>
				<xsl:when test="$value">
					<option value="{value}">
						<xsl:if test="value = $value">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="text"/>
					</option>
				</xsl:when>
				<xsl:otherwise>
					<option value="{value}">
						<xsl:if test="@selected='true'">
							<xsl:attribute name="selected">selected</xsl:attribute>
						</xsl:if>
						<xsl:value-of select="text"/>
					</option>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="field-attributes">
		<xsl:param name="field" select="."/>
		<xsl:param name="type" select="$field/@type"/>
		<xsl:param name="required" select="$field/@required"/>
		<xsl:param name="rel" select="$field/@rel"/>
		<xsl:param name="change" select="$field/@change"/>
		<xsl:param name="readonly" select="$field/@readonly"/>
		<xsl:param name="maxlength" select="$field/@maxlength"/>
		<xsl:param name="visible" select="$field/@visible"/>
		<xsl:param name="fieldNameSuffix" select="''"/>
		<xsl:param name="isFormlist" select="false()"/>

		<xsl:if test="$isFormlist != true() and $type != 'checkboxlist' and $type != 'radiolist'">
    		<xsl:attribute name="id"><xsl:value-of select="$field/@name"/></xsl:attribute>
    	</xsl:if>

		<xsl:if test="$field/@name">
			<xsl:attribute name="name">
				<xsl:value-of select="concat($field/@name,$fieldNameSuffix)"/>
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$required='true'">
			<xsl:attribute name="required">
				<xsl:value-of select="'required'" />
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$readonly='onchange'">
			<xsl:attribute name="change">
				<xsl:value-of select="'true'" />
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$field/@change='true'">
			<xsl:attribute name="change">
				<xsl:value-of select="'true'" />
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$readonly='true'">
			<xsl:attribute name="disabled">
				<xsl:value-of select="'disabled'" />
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$readonly='readonly'">
			<xsl:attribute name="readonly">
				<xsl:value-of select="'readonly'" />
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$visible='false'">
			<xsl:attribute name="visible">
				<xsl:value-of select="'false'" />
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$type='selectlist' or $type='selectmultdynamic'">
			<xsl:attribute name="multiple">true</xsl:attribute>
		</xsl:if>
		<xsl:if test="$type='selectdynamic' or $type='selectmultdynamic'">
			<xsl:attribute name="tags">true</xsl:attribute>
		</xsl:if>
		<xsl:if test="$type!='file'">
			<xsl:attribute name="maxlength">
				<xsl:value-of select="$maxlength" />
			</xsl:attribute>
		</xsl:if>
		<xsl:if test="$rel!=''">
			<xsl:attribute name="rel">
				<xsl:text>F_</xsl:text>
				<xsl:value-of select="$rel" />
			</xsl:attribute>
		</xsl:if>
	</xsl:template>
	<!--<xsl:include href="../../IGRP-virtualkeyboard.tmpl.xsl?v=1507218349954"/>-->
</xsl:stylesheet>