<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  
  <xsl:template name="process-flow" mode="process-flow" match="*">
    
    <xsl:variable name="totalRow" select="count(table/value/row)"/>
    
    <xsl:variable name="max">
      <xsl:choose>
        <xsl:when test="$totalRow &gt;= 12">12</xsl:when>
        <xsl:otherwise>6</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <xsl:variable name="itemSize">
      <xsl:choose>
        <xsl:when test="$totalRow &gt;= 12">col-sm-1</xsl:when>
        <xsl:otherwise>col-sm-2</xsl:otherwise>
      </xsl:choose>
    </xsl:variable>

    <div class="gen-container-item">
      <xsl:call-template name="process-flow-loop">
        <xsl:with-param name="wiz-max-item" select="$max"/>
        <xsl:with-param name="itemSize" select="$itemSize"/>
      </xsl:call-template>
    </div>

  </xsl:template>

  <xsl:template name="process-flow-loop">
    
    <xsl:param name="wiz-max-item" select="12"/>

    <xsl:param name="start" select="1"/>

    <xsl:param name="end" select="$wiz-max-item"/>

    <xsl:param name="itemSize" select="'col-sm-1'"/>

    <xsl:if test="table/value/row[position() = $start]">
      
      <xsl:variable name="rows" select="table/value/row[position() &gt;= $start and position() &lt;= $end]"/>

      <div class="f1">
        <div class="f1-steps clearfix">
          <div class="f1-progress">
            <div class="f1-progress-line" data-now-value="100" data-number-of-steps="5" style="width: 100%;"></div>
          </div>

          <xsl:for-each select="$rows">

          <xsl:variable name="itemClss">
            <xsl:choose>
              <xsl:when test="type = 'curent'">active</xsl:when>
              <xsl:otherwise><xsl:value-of select="type"/></xsl:otherwise>
            </xsl:choose>
          </xsl:variable>


          <a href="{link}" class="f1-step {$itemClss} {$itemSize} col-xs-12 wiz-step" style-listener="true" target="_newtab">
            <div class="f1-step-icon" active-bg-color="primary">
              <span><xsl:value-of select="position() - 1 + $start"/></span>
            </div>
            <p active-text-color="primary" class="txt-ellipsis"><xsl:value-of select="title"/></p>
          </a>

        </xsl:for-each>

        </div>
      </div>

      <xsl:call-template name="process-flow-loop">
        <xsl:with-param name="wiz-max-item" select="$wiz-max-item"/>
        <xsl:with-param name="itemSize" select="$itemSize"/>
        <xsl:with-param name="start" select="$start + $wiz-max-item"/>
        <xsl:with-param name="end" select="$end + $wiz-max-item"/>
      </xsl:call-template>

    </xsl:if>
  </xsl:template>

    <!-- d = DYNAMIC  t = TMPL s = start -->
    <xsl:template name="dynamic-tmpl-start">

        <xsl:if test="rows/content/*[@type='workflow']">
            <div class="row">
                <div class="col-md-12">
                    <xsl:apply-templates mode="process-flow" select="rows/content/*[@type='workflow']" />
                </div>
            </div>
        </xsl:if>

        <xsl:if test="rows/content/toolsbar and count(rows/content/toolsbar/item) &gt; 0">
            <div class="row">
                <div class="col-md-12">
                    <div class="toolsbar-holder boxed gen-container-item" item-name="toolsbar">
                        <div class="btns-holder  pull-right" role="group">
                            <xsl:apply-templates select="rows/content/toolsbar" mode="gen-buttons">
                                <xsl:with-param name="vertical" select="'true'"/>
                                <xsl:with-param name="outline" select="'false'"/>
                            </xsl:apply-templates>
                        </div>
                    </div>
                </div>
            </div>
        </xsl:if>

        <xsl:if test="rows/content/*[@type='workflow_taskview'] and count(rows/content/*[@type='workflow_taskview']/fields/*) &gt; 0">
            <div class="row">
                <div class="col-md-12">
                    <xsl:for-each select="rows/content/*[@type='workflow_taskview']">
                        <xsl:call-template name="GEN-view"/>
                    </xsl:for-each>
                </div>
            </div>
        </xsl:if>

    </xsl:template>
  
  <!-- d = DYNAMIC  t = TMPL e = END -->
  <xsl:template name="dynamic-tmpl-end">
    <xsl:if test="rows/content/*[@type='workflow_document'] and count(rows/content/*[@type='workflow_document']/fields/*)  &gt; 0">
        <div class="row">
            <div class="col-md-12">
                <xsl:for-each select="rows/content/*[@type='workflow_document']">
                    <xsl:call-template name="GEN-formlist"/>
                </xsl:for-each>
            </div>
        </div>
    </xsl:if>
  </xsl:template>

	<!-- GEN-others.tmpl -->

	<xsl:template name="GEN-view">
		<xsl:variable name="tag" select="name()"/>
		<div class="box clearfix view-block gen-container-item " template="2cols" gen-class="" item-name="{$tag}">
			<xsl:attribute name="has-img">
				<xsl:choose>
					<xsl:when test="fields/*[name() = concat($tag,'_img')]">true</xsl:when>
					<xsl:otherwise>false</xsl:otherwise>
				</xsl:choose>
			</xsl:attribute>
			
			<xsl:if test="@title">			
	            <xsl:call-template name="box-header">
	                <xsl:with-param name="title" select="@title"/>
	                <xsl:with-param name="collapsible" select="'true'"/>
	                <xsl:with-param name="collapsed" select="'true'"/>
	            </xsl:call-template>
            </xsl:if>
            <div class="box-body">
            	<xsl:apply-templates mode="form-hidden-fields" select="fields"/>
            	<xsl:if test="fields/*[name() = concat($tag,'_img')]">
                    <img src="{fields/*[name() = concat($tag,'_img')]/value}"/>
                </xsl:if>
                <div class="view-body clearfix ">
	                <xsl:for-each select="fields/*[not(name() = concat($tag,'_img'))]">
	                	<div class="view-item gen-fields-holder" item-name="{name(.)}">
	                		<xsl:if test="@type = 'separator'">
                            	<xsl:attribute name="class">view-item view-separator gen-fields-holder</xsl:attribute>
                            </xsl:if>
		                	<xsl:choose>
		                		<xsl:when test="@type = 'link'">
		                			<a href="{./value}" target="@target" target-fields="" request-fields="">
	                                    <i class="fa {@img}"/>
	                                    <span>
	                                        <xsl:value-of select="./label"/>
	                                    </span>
	                                </a>
		                		</xsl:when>
		                		<xsl:otherwise>
		                		    <span class="view-label">
		                		    	<xsl:if test="@type = 'separator'">
			                            	<xsl:attribute name="class">view</xsl:attribute>
			                            </xsl:if>
	                                    <xsl:value-of select="./label"/>
	                                </span>
	                                <xsl:if test="@type != 'separator'">
	                                	<span class="view-value">
	                                        <xsl:value-of select="./value"/>
	                                    </span>
	                                </xsl:if>
		                		</xsl:otherwise>
		                	</xsl:choose>
	                	</div>
	                </xsl:for-each>
            	</div>
            </div>
        </div>
</xsl:template>

	<!-- GEN-formfields.tmpl  -->


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
				<!--<xsl:when test="contains(@type,'vkb_')">
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
	
	<!-- GEN-formlist.tmpl -->

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
