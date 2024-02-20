<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-formlist-field" mode="igrp-formlist-field" match="*">

        <xsl:param name="parent-id" select="name(../../../..)"/>
        <xsl:param name="change" select="''"/>
        <xsl:param name="declabel" select="''"/>
        <xsl:param name="placeholder" select="''"/>
        <xsl:param name="inputmask" select="''"/>
        <xsl:param name="maxlength" select="''"/>

        <xsl:variable name="tag" select="name()"/>
        <xsl:variable name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:variable name="type" select="$field/@type"/>
        <xsl:variable name="desc" select="../*[name() = concat($tag,'_desc')]"/>

        <input type="hidden" name="{$field/@name}_fk_desc" value="{$desc}"/>
        <div class="form-group" item-name="{$tag}" item-type="{$type}">
            <input type="{$type}" name="{$field/@name}_fk" inputmask="{$inputmask}" value="{.}" class="{$field/@type} form-control" rel="F_{$parent-id}" placeholder="{$field/@placeholder}">
                <xsl:call-template name="setAttributes">
                    <xsl:with-param name="field" select="$field"/>
                </xsl:call-template>
            </input>
        </div>
    </xsl:template>

    <xsl:template name="igrp-formlist-color-field" mode="igrp-formlist-color-field" match="*">
        <xsl:param name="parent-id" select="name(../../../..)"/>
        <xsl:param name="change" select="''"/>
        <xsl:param name="format" select="''"/>

        <xsl:variable name="tag" select="name()"/>
        <xsl:variable name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:variable name="type" select="$field/@type"/>
        <xsl:variable name="desc" select="../*[name() = concat($tag,'_desc')]"/>

        <input type="hidden" name="{$field/@name}_fk_desc" value="{$desc}"/>
        <div class="form-group">
            <div class="" format="{$format}">
                <div class="colorpicker-input" rel="#{$parent-id}_{name()}"></div>
                <input type="hidden" value="{.}" format="{$format}" class="form-control {$change}" id="{$parent-id}_{name()}" name="{$field/@name}" placeholder="{$field/@placeholder}">
                    <xsl:call-template name="setAttributes">
                        <xsl:with-param name="field" select="$field"/>
                    </xsl:call-template>
                </input>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="igrp-formlist-link-field" mode="igrp-formlist-link-field" match="*">
        <xsl:param name="parent-id" select="name(../../../..)"/>
        <xsl:param name="request_fields" />
        <xsl:param name="list_source" />
        <xsl:param name="adbcli" />
        <xsl:param name="closerefresh" />
        <xsl:param name="target" />
        <xsl:param name="target_fields" />
        <xsl:param name="class" />
        <xsl:param name="style" />
        <xsl:param name="icon" />
        <xsl:param name="iconPosition" />

        <xsl:variable name="tag" select="name()"/>
        <xsl:variable name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:variable name="type" select="$field/@type"/>
        <xsl:variable name="desc" select="../*[name() = concat($tag,'_desc')]"/>
        <xsl:variable name="reverse-clss">
            <xsl:if test="$iconPosition = 'right'">
                <xsl:text>flex-row-reverse</xsl:text>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="icon-clss">
            <xsl:if test="$iconPosition = 'left'">
                <xsl:text>me-2</xsl:text>
            </xsl:if>
        </xsl:variable>

        <input type="hidden" name="{$field/@name}_fk_desc" value="{$desc}"/>
        <input type="hidden" name="{$field/@name}_fk" value="{.}" rel="F_{$parent-id}"/>
        <xsl:choose>
            <xsl:when test=" . != ''">
                <a href="{.}" name="p_{name()}" class="{$type} link-{$class} form-link d-flex align-items-center {$reverse-clss}" sharpadbclient="{$adbcli}" target-fields="{$target_fields}" target="{$target}" request-fields="{$request_fields}" list-association-src="{$list_source}" style="width:fit-content">
                    <xsl:if test="$closerefresh = 'true'">
                        <xsl:attribute name="closerefresh">true</xsl:attribute>
                    </xsl:if>
                    <i class="fa {$icon} {$icon-clss}"></i>
                    <span class="me-2">
                        <xsl:value-of select="$desc"/>
                    </span>
                </a>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$desc"/>
            </xsl:otherwise>
        </xsl:choose>

    </xsl:template>

    <xsl:template name="igrp-formlist-date-field" mode="igrp-formlist-date-field" match="*">
        <xsl:param name="parent-id" select="name(../../../..)"/>
        <xsl:param name="format" select="'d-m-Y'"/>
        <xsl:param name="enableTime" select="'false'"/>
        <xsl:param name="disableWeekends"/>
        <xsl:param name="disabledBeforetoday"/>
        <xsl:param name="range"/>
        <xsl:param name="change"/>
        <xsl:param name="disable"/>
        <xsl:param name="readonly"/>
        <xsl:param name="maxlength"/>
        <xsl:param name="placeholder"/>

        <xsl:variable name="tag" select="name()"/>
        <xsl:variable name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:variable name="type" select="$field/@type"/>
        <xsl:variable name="desc" select="../*[name() = concat($tag,'_desc')]"/>

        <input type="hidden" name="{$field/@name}_fk_desc" value="{$desc}"/>

        <div class="form-group gen-date-picker-wrapper" item-name="{name()}" item-type="{$type}">
            <div class="input-group d-flex">
                <input rel="F_{$parent-id}" type="text" value="{.}" datefield="true" disableWeekends="{$disableWeekends}" disabledBeforetoday="{$disabledBeforetoday}" data-range="{$range}" class="form-control gen-date-picker -input {$change}" data-provider="flatpickr" data-date-format="{$format}" data-enable-time="{$enableTime}" tag="{name()}" name="{$field/@name}_fk" maxlength="{$maxlength}" placeholder="{$field/@placeholder}" style="width:1%">
                    <xsl:call-template name="setAttributes">
                        <xsl:with-param name="field" select="$field"/>
                    </xsl:call-template>
                </input>
                <span class="input-group-text input-group-btn gen-date-icon ">
                    <i class="fa fa-calendar"></i>
                </span>
            </div>
        </div>
    </xsl:template>

    <xsl:template name="igrp-formlist-select-field" mode="igrp-formlist-select-field" match="*">

        <xsl:param name="parent-id" select="name(../../../..)"/>
        <xsl:param name="change" select="''"/>
        <xsl:param name="maxlength" select="''"/>
        <xsl:param name="load_service_data" select="''"/>
        <xsl:param name="multiple" select="''"/>
        <xsl:param name="tags" select="''"/>
        <xsl:param name="delimiter" select="''"/>

        <xsl:variable name="tag" select="name()"/>
        <xsl:variable name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:variable name="type" select="$field/@type"/>
        <xsl:variable name="desc" select="../*[name() = concat($tag,'_desc')]"/>

        <xsl:variable name="selectedValue" select="."/>

        <input type="hidden" name="{$field/@name}_fk_desc" value="{$desc}"/>

        <div class="form-group" item-name="{$tag}" item-type="{$type}">

            <select name="{$field/@name}_fk" class="form-control select2 {$change}"  input-rel="{$field/@name}_fk" rel="F_{$parent-id}">
                <xsl:call-template name="setAttributes">
                    <xsl:with-param name="field" select="$field"/>
                </xsl:call-template>
                <xsl:if test="$load_service_data = 'true'">
                    <xsl:attribute name="load_service_data"></xsl:attribute>
                </xsl:if>
                <xsl:if test="$tags = 'true'">
                    <xsl:attribute name="tags">true</xsl:attribute>
                </xsl:if>
                <xsl:if test="$multiple = 'true'">
                    <xsl:attribute name="multiple">true</xsl:attribute>
                </xsl:if>
                <xsl:for-each select="$field/list/option">
                    <option value="{value}">
                        <xsl:call-template name="select-multiple-value">
                            <xsl:with-param name="value" select="value"/>
                            <xsl:with-param name="selected" select="$selectedValue"/>
                            <xsl:with-param name="delimiter" select="$delimiter"/>
                        </xsl:call-template>
                        <span>
                            <xsl:value-of select="text"/>
                        </span>
                    </option>
                </xsl:for-each>
            </select>
        </div>
    </xsl:template>

    <xsl:template name="igrp-formlist-file-field" mode="igrp-formlist-file-field" match="*">
        <xsl:param name="parent-id" select="name(../../../..)"/>
        <xsl:param name="change" select="''"/>
        <xsl:param name="maxlength" select="''"/>
        <xsl:param name="targetrend" select="''"/>
        <xsl:param name="accept" select="''"/>
        <xsl:param name="multiple" select="''"/>
        <xsl:param name="rendvalue" select="''"/>
        <xsl:param name="class" select="''"/>
        <xsl:param name="declabel" select="''"/>
        

        <xsl:variable name="tag" select="name()"/>
        <xsl:variable name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:variable name="type" select="$field/@type"/>
        <xsl:variable name="desc" select="../*[name() = concat($tag,'_desc')]"/>

        <input type="hidden" name="{$field/@name}_fk_desc" value="{$desc}"/>
        <div class="form-group w-100" item-name="{$tag}" item-type="{$type}">
            <div class="input-group w-100">
                <input type="text" class="form-control form-hidden d-none" readonly="">
                    <xsl:if test="@temp-value">
                        <xsl:attribute name="value">
                            <xsl:value-of select="@temp-value"/>
                        </xsl:attribute>
                    </xsl:if>
                </input>
                <div class="file-btn-holder w-100">
                    <input 
                        id="{$field/@name}_fk" 
                        name="{$field/@name}_fk" 
                        value="{.}" 
                        class="form-control {$rendvalue} {$change} {$declabel}" 
                        type="file" 
                        accept="{$accept}" 
                        rel="F_{$parent-id}"
                    >
                        <xsl:call-template name="setAttributes">
                            <xsl:with-param name="field" select="$field"/>
                        </xsl:call-template>
                    </input>
                </div>
             
            </div>
        </div>
    </xsl:template>

    <xsl:template name="igrp-formlist-field-tmpl" mode="igrp-form-field-tmpl" match="*">

        <xsl:param name="parent-id" select="name(../../../..)"/>
        <xsl:param name="change" select="''"/>
        <xsl:param name="declabel" select="''"/>
        <xsl:param name="inputmask" select="''"/>
        <xsl:param name="maxlength" select="''"/>

        <xsl:variable name="tag" select="name()"/>
        <xsl:variable name="field" select="../../../../fields/*[name() = $tag]"/>
        <xsl:variable name="type" select="$field/@type"/>
        <xsl:variable name="desc" select="../*[name() = concat($tag,'_desc')]"/>

    </xsl:template>

</xsl:stylesheet>