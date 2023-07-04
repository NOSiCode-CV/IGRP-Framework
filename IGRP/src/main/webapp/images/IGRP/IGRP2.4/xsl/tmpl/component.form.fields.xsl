<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template name="igrp-form-field" mode="igrp-form-field" match="*">
        <xsl:param name="change" select="''"/>
        <xsl:param name="declabel" select="''"/>
        <xsl:param name="inputmask" select="''"/>
        <xsl:param name="maxlength" select="''"/>
        <xsl:variable name="type" select="@type"/>
        <label for="{@name}" class="form-label">
            <xsl:value-of select="label"/>
        </label>
        <input type="{$type}" value="{value}" class="form-control {$change} {$declabel}" inputmask="{$inputmask}" id="{@name}" name="{@name}" maxlength="{$maxlength}" placeholder="{@placeholder}">
            <xsl:call-template name="setAttributes">
                <xsl:with-param name="field" select="."/>
            </xsl:call-template>
        </input>
    </xsl:template>

    <xsl:template name="igrp-form-file-field" mode="igrp-form-file-field" match="*">
        <xsl:param name="change" select="''"/>
        <xsl:param name="declabel" select="''"/>
        <xsl:param name="inputmask" select="''"/>
        <xsl:param name="maxlength" select="''"/>
        <xsl:param name="targetrend" select="''"/>
        <xsl:param name="accept" select="''"/>
        <xsl:param name="multiple" select="''"/>
        <xsl:param name="rendvalue" select="''"/>
        
        <xsl:variable name="type" select="@type"/>

        <label for="{@name}" class="form-label">
            <xsl:value-of select="label"/>
        </label>
        <input 
            id="{@name}" 
            name="{@name}" 
            type="file" 
            value="{value}" 
            target-rend="{$targetrend}" 
            class="form-control {$rendvalue} {$change} {$declabel}" 
            placeholder="{@placeholder}"
            accept="{$accept}"
        >
            <xsl:if test="$multiple = 'true'">
                <xsl:attribute name="multiple">
                    <xsl:text>true</xsl:text>
                </xsl:attribute>
            </xsl:if>
            <xsl:call-template name="setAttributes">
                <xsl:with-param name="field" select="."/>
            </xsl:call-template>
        </input>

    </xsl:template>

    <xsl:template name="igrp-form-select-field" mode="igrp-form-select-field" match="*">
        <xsl:param name="parent-id" select="''"/>
        <xsl:param name="change" select="''"/>
        <xsl:param name="tags" select="''"/>
        <xsl:param name="maxlength" select="''"/>
        <xsl:param name="multiple" select="''"/>
        <xsl:param name="desclabel" select="''"/>
        <xsl:param name="load_service_data" select="''"/>

        <xsl:variable name="type" select="@type"/>
        <label for="{@name}">
            <xsl:value-of select="label"/>
        </label>
        <select class="form-control {$change} {$desclabel}" data-choices="" id="{$parent-id}_{name()}" name="{@name}" placeholder="{@placeholder}">
            <xsl:call-template name="setAttributes">
                <xsl:with-param name="field" select="."/>
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
            <xsl:for-each select="list/option">
                <option value="{value}" label="{text}">
                    <xsl:if test="@selected='true'">
                        <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <span>
                        <xsl:value-of select="text"/>
                    </span>
                </option>
            </xsl:for-each>
        </select>
    </xsl:template>

    <xsl:template name="igrp-form-color-field" mode="igrp-form-color-field" match="*">
        <xsl:param name="parent-id" select="''"/>
        <xsl:param name="format" select="''"/>
        <label for="{@name}">
            <xsl:value-of select="label"/>
        </label>
        <div id="{$parent-id}_{name()}_colorp">
            <div class="colorpicker-input" rel="{$parent-id}_{name()}"></div>
            <input type="hidden" value="{value}" format="{$format}" class="form-control" id="{$parent-id}_{name()}" name="{@name}" placeholder="{@placeholder}">
                <xsl:call-template name="setAttributes">
                    <xsl:with-param name="field" select="."/>
                </xsl:call-template>
            </input>
        </div>
    </xsl:template>

    <xsl:template name="igrp-form-date-field" mode="igrp-form-date-field" match="*">
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
        <label for="{./@name}">
            <xsl:value-of select="label"/>
        </label>
        <div class="input-group">
            <input type="text" value="{./value}" datefield="true" disableWeekends="{$disableWeekends}" disabledBeforetoday="{$disabledBeforetoday}" data-range="{$range}" class="form-control gen-date-picker flatpickr-input {$change}" data-provider="flatpickr" data-date-format="{$format}" data-enable-time="{$enableTime}" id="{name()}" name="{./@name}" maxlength="{$maxlength}" placeholder="{$placeholder}">
                <xsl:call-template name="setAttributes">
                    <xsl:with-param name="field" select="."/>
                </xsl:call-template>
            </input>
            <span class="input-group-text input-group-btn gen-date-icon ">
                <i class="fa fa-calendar"></i>
            </span>
        </div>
    </xsl:template>

    <xsl:template name="igrp-form-link-field" mode="igrp-form-link-field" match="*">
        <xsl:param name="change" />
        <xsl:param name="declabel" />
        <xsl:param name="inputmask" />
        <xsl:param name="maxlength" />
        <xsl:param name="request_fields" />
        <xsl:param name="adbcli" />
        <xsl:param name="closerefresh" />
        <xsl:param name="target" />
        <xsl:param name="class" />
        <xsl:param name="style" />
        <xsl:param name="icon" />
        <xsl:param name="iconPosition" />

        <xsl:variable name="type" select="@type"/>

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

        <a href="{value}" class="{$type} btn link-{$class} form-link d-flex {$reverse-clss} align-items-center" sharpadbclient="{$adbcli}" target="{$target}" request-fields="{$request_fields}" icon-position="{$iconPosition}" style="width:fit-content">
            <xsl:if test="$closerefresh = 'true'">
                <xsl:attribute name="closerefresh">true</xsl:attribute>
            </xsl:if>
            <i class="fa {$icon} {$icon-clss}"></i>
            <span class="me-2">
                <xsl:value-of select="label"/>
            </span>
        </a>

    </xsl:template>

    <xsl:template name="igrp-form-field-tmpl" mode="igrp-form-field-tmpl" match="*">
        <xsl:param name="change" select="''"/>
        <xsl:param name="declabel" select="''"/>
        <xsl:param name="inputmask" select="''"/>
        <xsl:param name="maxlength" select="''"/>
        <xsl:variable name="type" select="@type"/>


    </xsl:template>

</xsl:stylesheet>