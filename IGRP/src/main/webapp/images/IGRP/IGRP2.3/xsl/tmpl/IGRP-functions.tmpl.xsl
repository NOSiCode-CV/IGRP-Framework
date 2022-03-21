<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <xsl:template name="get-icon-item">
    <xsl:attribute name="class">fa <xsl:value-of select="img"/></xsl:attribute>
  </xsl:template>

  <xsl:template name="get-icon-item-with-color">
    <!--passed template parameter -->
      <xsl:param name="list"/>
      <xsl:param name="delimiter" select="'|'"/>
      <xsl:param name="use-fa" select="'true'"/>
      <xsl:param name="img-folder" select="''"/>
      <xsl:param name="size" select="'normal'"/>
      <xsl:param name="btnClass"  select="'btn'"/>
      <xsl:param name="text-class"  select="''"/>
      <xsl:param name="classes"  select="'btn'"/>

      <xsl:choose>
          <xsl:when test="contains($list, $delimiter)">                
              <xsl:attribute name="class">
                <xsl:value-of select="concat($btnClass,'-',$size,' ')"/> 
                <xsl:value-of select="concat($btnClass,' ',$btnClass,'-')"/>
                <xsl:value-of select="substring-before($list,$delimiter)"/>
                <xsl:value-of select="concat(' ',$classes)"/>
              </xsl:attribute>
              <xsl:call-template name="get-icon-item-with-color">
                  <xsl:with-param name="list" select="substring-after($list,$delimiter)"/>
                  <xsl:with-param name="delimiter" select="$delimiter"/>
                  <xsl:with-param name="use-fa" select="$use-fa"/>
                  <xsl:with-param name="text-class" select="$text-class"/>
                  <xsl:with-param name="img-folder" select="$img-folder"/>
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
              <xsl:if test="$list != ''">
                <xsl:choose>
                  <xsl:when test="$use-fa = 'true'">
                    <div class="icon-item-holder text-{$text-class}">
                      <i class="fa {$list}"></i>
                    </div>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:attribute name="class">
                      <xsl:value-of select="concat($btnClass,'-',$size,' ')"/> 
                      <xsl:value-of select="concat($btnClass,' ',$btnClass,'-default')"/>
                      <xsl:value-of select="concat(' ',$classes)"/>
                    </xsl:attribute>
                    <div class="icon-item-holder">
                      <img src="{$path}/assets/img/v1/icon/{$img-folder}/{img}"/>
                    </div>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
          </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

  <xsl:template name="get-target-params">
   
      <xsl:param name="list"/>
      <xsl:param name="delimiter" select="'|'"/>

      <xsl:choose>
          <xsl:when test="contains($list, $delimiter)">                
              <xsl:attribute name="target">
                <xsl:value-of select="substring-before($list,$delimiter)"/>
              </xsl:attribute>
              <xsl:call-template name="get-target-params">
                  <xsl:with-param name="list" select="substring-after($list,$delimiter)"/>
                  <xsl:with-param name="delimiter" select="$delimiter"/>
              </xsl:call-template>
          </xsl:when>
          <xsl:otherwise>
              <xsl:if test="$list != ''">
                <xsl:choose>
                  <xsl:when test="$list = 'refresh' or $list = 'refresh_submit'">
                    <xsl:attribute name="close">
                      <xsl:value-of select="$list"/>
                    </xsl:attribute>
                  </xsl:when> 
                  <xsl:otherwise>
                    <xsl:attribute name="target-fields">
                      <xsl:value-of select="$list"/>
                    </xsl:attribute>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:if>
          </xsl:otherwise>
      </xsl:choose>
  </xsl:template>

  <xsl:template name="select-multiple-value">
    <xsl:param name="value"/>
    <xsl:param name="selected"/>
    <xsl:param name="delimiter" select="';'"/>

     <xsl:choose>
      
      <xsl:when test="contains($selected, $delimiter)">                
          
          <xsl:variable name="item" select="substring-before($selected,$delimiter)"/>

          <xsl:if test="$item = $value">
            <xsl:attribute name="selected">true</xsl:attribute>
          </xsl:if>

          <xsl:call-template name="select-multiple-value">
              <xsl:with-param name="value" select="$value"/>
              <xsl:with-param name="selected" select="substring-after($selected,$delimiter)"/>
              <xsl:with-param name="delimiter" select="$delimiter"/>
          </xsl:call-template>

      </xsl:when>

      <xsl:otherwise>
        
        <xsl:if test="$selected = $value">
          <xsl:attribute name="selected">true</xsl:attribute>
        </xsl:if>

      </xsl:otherwise>

    </xsl:choose> 
  </xsl:template>

  <xsl:template name="get-active-tab">
    
    <xsl:param name="value"/>
    <xsl:param name="class" select="''"/>
    
    <xsl:attribute name="class">
      <xsl:choose>
        <xsl:when test="$value = '1'">
          active <xsl:value-of select="$class"/>
        </xsl:when>
        <xsl:otherwise><xsl:value-of select="$class"/></xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
  </xsl:template>

  <xsl:template name="setAttributes">
    <xsl:param name="field"/>

    <xsl:if test="$field/@readonly='true' or $field/@readonly='readonly'">
      <xsl:attribute name="readonly">
        <xsl:value-of select="'readonly'" />
      </xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@disabled='true' or $field/@disabled='disabled'">
      <xsl:attribute name="disabled">
        <xsl:value-of select="'disabled'" />
      </xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@readonly='readonly' and ($field/@type != 'file' or not($field/@type))">
      <xsl:attribute name="readonly">
        <xsl:value-of select="'readonly'" />
      </xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@maxlength and ($field/@type != 'radio' or $field/@type != 'checkbox' or not($field/@type))">
      <xsl:attribute name="maxlength">
        <xsl:value-of select="$field/@maxlength" />
      </xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@required = 'true'">
      <xsl:attribute name="required">
        <xsl:value-of select="$field/@required" />
      </xsl:attribute>
    </xsl:if>
    
     <xsl:if test="$field/@remote and $field/@remote != ''">
      <xsl:attribute name="igrp-remote">
        <xsl:value-of select="$field/@remote" />
      </xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@temp-value and $field/@temp-value != ''">
      <xsl:attribute name="value">
        <xsl:value-of select="$field/@temp-value" />
      </xsl:attribute>
      <xsl:attribute name="temp-store">true</xsl:attribute>
    </xsl:if>
    
    <xsl:if test="$field/@mathcal and $field/@mathcal != ''">
      <xsl:attribute name="mathcal">
        <xsl:value-of select="$field/@mathcal"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="$field/@numberformat and $field/@numberformat != ''">
      <xsl:attribute name="numberformat">
        <xsl:value-of select="$field/@numberformat"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="$field/@daysoff and $field/@daysoff != ''">
      <xsl:attribute name="daysoff">
        <xsl:value-of select="$field/@daysoff"/>
      </xsl:attribute>
    </xsl:if>

    <xsl:if test="$field/@load_service_data and $field/@load_service_data != '' and $field/@load_service_data != 'true' and $field/@load_service_data != 'false'">
      <xsl:attribute name="load_service_data">
        <xsl:value-of select="$field/@load_service_data"/>
      </xsl:attribute>
    </xsl:if>
    
  </xsl:template>

  <xsl:template name="setTooltip">
    <xsl:param name="field"/>

    <xsl:if test="$field/@tooltip and $field/@tooltip != '' and $field/@tooltip != 'true' and $field/@tooltip != 'false'">
      <span class="box-label-tooltip">
        <i class="fa fa-question-circle" data-toggle="tooltip" title="{$field/@tooltip}"></i>
      </span>
    </xsl:if>
    
  </xsl:template>

</xsl:stylesheet>