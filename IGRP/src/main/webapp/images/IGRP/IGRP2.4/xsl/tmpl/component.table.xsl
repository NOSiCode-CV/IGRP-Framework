<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="igrp-table-fields-checkbox-td" mode="igrp-table-fields-checkbox-td" match="*">
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="tag_check" select="../*[name() = concat($tag,'_check')]"/>
		<xsl:param name="field" select="../../../../fields/*[name() = $tag]"/>
		<xsl:param name="switch"/>

		<xsl:if test="$tag != '-0'">
			<div class="form-check {$switch}">
				<input type="checkbox" name="p_{$tag}_fk" value="{.}" check-rel="{$tag}" class="checkdcontrol form-check-input">
					<xsl:if test="$tag_check=.">
						<xsl:attribute name="checked">checked</xsl:attribute>
					</xsl:if>
					<xsl:call-template name="setAttributes">
						<xsl:with-param name="field" select="$field"/>
					</xsl:call-template>
				</input>
			</div>
		</xsl:if>

		<input type="hidden" name="p_{$tag}_check_fk" class="{$tag}_check">
			<xsl:if test="$tag_check=.">
				<xsl:attribute name="value">
					<xsl:value-of select="$tag_check"/>
				</xsl:attribute>
			</xsl:if>
		</input>

		<xsl:if test="$tag_check!=$tag">
			<input type="hidden" name="p_{$tag}_fk" value="{.}" class="{$tag}"/>
		</xsl:if>


	</xsl:template>

	<xsl:template name="igrp-table-fields-color-td" mode="igrp-table-fields-color-td" match="*">
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="field" select="../../../../fields/*[name() = $tag]"/>
		<xsl:param name="color" select="."/>
		<xsl:param name="table-colors" select="../../../legend_color/item"/>
		<xsl:attribute name="class">tdcolor</xsl:attribute>

		<div class="td-badge">
			<span class="badge rounded-pill " style="background:{ concat( $table-colors[value=$color]/color, '1a' )  }; color:{$table-colors[value=$color]/color}">
				<xsl:value-of select="$table-colors[value=$color]/label"/>
			</span>
		</div>

	</xsl:template>

	<xsl:template name="igrp-table-link-field-td" mode="igrp-table-link-field-td" match="*">
		<xsl:param name="tag" select="name()"/>
		<xsl:param name="field" select="../../../../fields/*[name() = $tag]"/>
		<xsl:param name="class" select="''"/>
		<xsl:param name="icon" select="'ri-arrow-right-line'"/>
		<xsl:param name="icon-lib" select="''"/>
		<xsl:param name="icon-position" select="'right'"/>
		<xsl:param name="adbcli" select="''"/>
		<xsl:param name="target_fields" select="''"/>
		<xsl:param name="request_fields" select="''"/>
		<xsl:param name="target" select="''"/>


		<xsl:variable name="description-name" select="concat($tag,'_desc')"/>
		<xsl:variable name="description" select="../*[name() = $description-name]"/>

		<a href="{normalize-space(.)}" class=" link-{$class} d-flex align-items-center" sharpadbclient="{$adbcli}" target-fields="{$target_fields}" target="{$target}" request-fields="{$request_fields}" name="{$tag}">
			<xsl:if test="$icon-lib and $icon-position = 'left'">
				<i class=" fa {$icon} me-2"/>
			</xsl:if>
			<span><xsl:value-of select="$description"/></span>
			<xsl:if test="$icon-lib and $icon-position = 'right'">
				<i class=" fa {$icon} ms-2"/>
			</xsl:if>
		</a>

	</xsl:template>

	<xsl:template name="igrp-table-header" mode="igrp-table-header" match="*">
		<xsl:param name="title" select="@title"/>
		<xsl:param name="show-title" select="@title"/>
		<xsl:param name="has-filter" select="'false'"/>
		<xsl:param name="length-change" select="'false'"/>
		<xsl:param name="search" select="'true'"/>
		<xsl:param name="filter-type" select="'default'"/>

		<xsl:if test=" $show-title = 'true' or $search = 'true' or $has-filter='true' or table/context-menu/item[@type='action']">
			<div class="card-header d-flex align-items-center py-2">

				<xsl:if test="$show-title = 'true'">
					<h3 class="card-title me-auto my-2">
						<xsl:value-of select="$title"/>
					</h3>
				</xsl:if>

				<div class="ms-auto d-flex gap-2 align-items-center">
					<xsl:if test="$length-change = 'true'">
						<div class="d-flex align-items-center">
							<b class="small bold me-2">Mostrar</b>
							<select class="form-control ">
								<option value="10">10</option>
								<option value="20">20</option>
								<option value="30">30</option>
								<option value="50">50</option>
							</select>
						</div>
					</xsl:if>

					<xsl:if test="$search = 'true'">
						<div>
							<input class="form-control igrp-table-searcher" placeholder="Pesquisar..."/>
						</div>
					</xsl:if>

					<xsl:if test="$has-filter = 'true' and ./fields/*[@filter='true']">
						<div>
							<a   class="btn btn-light  d-flex align-items-center" href="#{name()}-filter-fields" data-bs-toggle="collapse" aria-controls="{name()}-filter-fields" aria-expanded="false">
								<i class="ri-sound-module-line"></i>
							</a>
						</div>
					</xsl:if>
					<xsl:if test="table/context-menu/item[@type='action']">
						<xsl:apply-templates select="table/context-menu/item[@type='action']" mode="igrp-button-item"/>
					</xsl:if>
				</div>
			</div>
		</xsl:if>

	</xsl:template>

	<xsl:template mode="igrp-table-form-filter" name="igrp-table-form-filter" match="*">

		<xsl:variable name="fields" select="./fields/*[@filter='true' and not(@type='hidden')]"/>

		<xsl:if test="$fields">
			<xsl:variable name="field-col-class" select="'col-12 col-sm-6 col-md-4 col-lg-3 '"/>
			<div class="card-filter border-top pb-3 px-3 collapse bg-light-subtle" id="{name(.)}-filter-fields" remote-filter="Gestao_de_expedientes.xml">
				<div class=" row py-3 clearfix fields gy-3" role="form">
					<xsl:for-each select="$fields">
						<xsl:choose>
							<xsl:when test="@type = 'checkbox'">
								<div class="{$field-col-class}">
									<xsl:apply-templates mode="igrp-form-checkbox-field" select="."/>
								</div>
							</xsl:when>
							<xsl:when test="@type = 'color'">
								<xsl:variable name="table-legend" select="../../table/legend_color"/>
								<div class="{$field-col-class}">
									<label for="{@name}">
										<xsl:value-of select="label"/>
									</label>
									<select class="form-control" data-choices="" id="{name(../..)}_{name()}" name="{@name}" placeholder="{@placeholder}">
										<xsl:call-template name="setAttributes">
											<xsl:with-param name="field" select="."/>
										</xsl:call-template>
										<xsl:if test="@tags = 'true'">
											<xsl:attribute name="tags">true</xsl:attribute>
										</xsl:if>
										<xsl:if test="@multiple = 'true'">
											<xsl:attribute name="multiple">true</xsl:attribute>
										</xsl:if>
										<option>--</option>
										<xsl:for-each select="$table-legend/item">
											<option value="{value}" label="{label}">
												<xsl:if test="@selected='true'">
													<xsl:attribute name="selected">selected</xsl:attribute>
												</xsl:if>
												<span>
													<xsl:value-of select="label"/>
												</span>
											</option>
										</xsl:for-each>
									</select>
								</div>
							</xsl:when>
							<xsl:when test="@type = 'date'">
								<div class="{$field-col-class}">
									<xsl:apply-templates mode="igrp-form-date-field" select=".">
										<xsl:with-param name="format" select="@format"/>
										<xsl:with-param name="enableTime" select="@enableTime"/>
										<xsl:with-param name="disableWeekends" select="@disableWeekends"/>
										<xsl:with-param name="disabledBeforetoday" select="@disabledBeforetoday"/>
										<xsl:with-param name="range" select="@range"/>
										<xsl:with-param name="change" select="@change"/>
										<xsl:with-param name="maxlength" select="@maxlength"/>
										<xsl:with-param name="placeholder" select="@placeholder"/>
									</xsl:apply-templates>
								</div>
							</xsl:when>
							<xsl:when test="@type = 'lookup'">
								<div class="{$field-col-class}">
									<xsl:apply-templates mode="igrp-form-lookup-field" select=".">
										<xsl:with-param name="change" select="@change"/>
										<xsl:with-param name="declabel" select="@declabel"/>
										<xsl:with-param name="inputmask" select="@inputmask"/>
										<xsl:with-param name="maxlength" select="@maxlength"/>
										<xsl:with-param name="field_param" select="@field_param"/>
										<xsl:with-param name="input-id" select="concat(name(../..),'_',name(.))"/>
									</xsl:apply-templates>
								</div>
							</xsl:when>

                            <!-- #select -->
							<xsl:when test="@type = 'select'">
								<div class="{$field-col-class}">
									<xsl:apply-templates mode="igrp-form-select-field" select=".">
										<xsl:with-param name="parent-id" select="name(../..)"/>
										<xsl:with-param name="change" select="@change"/>
										<xsl:with-param name="tags" select="@tags"/>
										<xsl:with-param name="maxlength" select="@maxlength"/>
										<xsl:with-param name="multiple" select="@multiple"/>
									</xsl:apply-templates>
								</div>
							</xsl:when>
                            <!-- ##select -->

							<xsl:otherwise>
								<div class="{$field-col-class}">
									<xsl:apply-templates mode="igrp-form-field" select=".">
										<xsl:with-param name="change" select="@change"/>
										<xsl:with-param name="declabel" select="@desclabel"/>
										<xsl:with-param name="inputmask" select="@inputmask"/>
										<xsl:with-param name="maxlength" select="@maxlength"/>
									</xsl:apply-templates>
								</div>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:for-each>
				</div>
				<div class="row">
					<div class="col d-flex justify-content-end gap-2 align-items-center">
						<a href="#" class="btn btn-sm btn-light igrp-table-reset-action text-capitalize d-flex align-items-center">
							<i></i>
						</a>
						<button class="text-capitalize btn-theme-primary btn-sm btn igrp-table-filter-action d-flex align-items-center">
							<span>Aplicar</span>
						</button>
					</div>
				</div>
			</div>

		</xsl:if>


	</xsl:template>


</xsl:stylesheet>