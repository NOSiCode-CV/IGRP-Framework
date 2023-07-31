<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 
  <!-- CAROUSEL -->
  <xsl:template name="igrp-carousel" mode="igrp-carousel" match="*">

    <xsl:param name="id" select="'carousel-id'"/>
    
    <xsl:if test="table/value/row">
      <ol class="carousel-indicators">
        <xsl:for-each select="table/value/row">
          <xsl:variable name="pos" select="position()-1"/>
          <xsl:variable name="isActive">
            <xsl:if test="$pos = 0">active</xsl:if>
          </xsl:variable>

          <li data-target="#{$id}" data-slide-to="{$pos}" class="{$isActive}"></li>
          
        </xsl:for-each>
      </ol>
      <!-- Wrapper for slides -->
      <div class="carousel-inner" role="listbox">
        <xsl:for-each select="table/value/row">
          <xsl:variable name="pos" select="position()"/>
          <xsl:variable name="isActive">
            <xsl:if test="$pos = 1">active</xsl:if>
          </xsl:variable>
          <xsl:variable name="imgTag" select="concat($id,'_img')"/>
          <xsl:variable name="labelTag" select="concat($id,'_label')"/>
          <div class="item {$isActive}" >
            <img src="{*[ name() = $imgTag ]}"/>
          </div>
        </xsl:for-each>
      </div>
      <!-- Left and right controls -->
      <a class="left carousel-control" href="#{$id}" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="right carousel-control" href="#{$id}" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </xsl:if>

  </xsl:template>



  

</xsl:stylesheet>