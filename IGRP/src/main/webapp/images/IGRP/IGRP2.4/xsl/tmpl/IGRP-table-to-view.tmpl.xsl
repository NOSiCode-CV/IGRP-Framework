<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <xsl:template mode="table.to.view" name="table.to.view" match="*">

    <xsl:param name="fields" select="fields/*"/>

    <xsl:param name="table" select="table"/>

    <xsl:param name="rows" select="$table/value/row"/>

    <xsl:param name="imageTag" select="false()"/>

    <xsl:param name="md-size" select="'12'"/>

    <xsl:param name="sm-size" select="'12'"/>

    <xsl:param name="xs-size" select="'12'"/>

    <div class="row table-view-blocks">
      <xsl:for-each select="$rows">
        <div class="gen-column col-sm-{$sm-size} col-xs-{$xs-size} col-md-{$md-size}" >
          <div class="gen-column-inner gen-inner">
            <xsl:variable name="row" select="."/>
            <div class="box clearfix view-block gen-container-item" >
              
              <xsl:if test="$imageTag">
                <xsl:attribute name="has-img">true</xsl:attribute>
              </xsl:if>

              <xsl:apply-templates mode="context-param" select="$row/context-menu"/>
              
              <div class="box-body">
                
                <xsl:if test="$imageTag">
                  <img src="{*[name() = $imageTag]}"/>
                </xsl:if>

                <div class="view-body clearfix ">

                  <xsl:for-each select="$fields[not( name() = $imageTag )]">

                    <xsl:variable name="fieldName" select="name()"/>

                    <div class="view-item gen-fields-holder" item-name="{name()}" item-index="{position()}">
                     
                      <span class="view-label">
                        <xsl:value-of select="label"/>
                      </span>

                      <span class="view-value">
                        <xsl:value-of select="$row/*[name() = $fieldName]"/>
                      </span>

                    </div>

                  </xsl:for-each>

                </div>
                
              </div>
              <xsl:if test="$row/context-menu">
                <div class="box-footer">
                  <div class="clear table-view-buttons">
                    <div class="pull-right clearfix">
                      <xsl:apply-templates select="$table/context-menu" mode="table-context-inline">
                        <xsl:with-param name="row-params" select="$row/context-menu"/>
                      </xsl:apply-templates>
                    </div>
                  </div>
                </div>
              </xsl:if>
            </div>
          </div>
        </div>
      </xsl:for-each>
    </div>
  </xsl:template>

</xsl:stylesheet>