<?xml version="1.0"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0" xmlns:xs="http://www.w3.org/2001/XMLSchema"
  >

  <xsl:output method="html"/>

  <xsl:template match="xs:schema">
    <xsl:variable name="element" select="xs:element"/>
    <ul class="global tree">
      <xsl:apply-templates mode="element" select="$element">
      <xsl:with-param name="Pclass" select="''"/>
      <xsl:with-param name="Cclass" select="''"/>
      </xsl:apply-templates>
    </ul>
  </xsl:template>

  <xsl:template mode="element" name="element" match="xs:element">
    <xsl:param name="Pclass" select="'has-child'"/>
    <xsl:param name="Cclass" select="'child'"/>

    <xsl:choose>
      <xsl:when test="xs:complexType/xs:sequence">
        <xsl:choose>
          <xsl:when test="./@name = 'row'">
            <xsl:apply-templates mode="complexType" select="xs:complexType"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:variable name="name" select="./@name"/>
            <xsl:if test="$name != 'status' and $name != 'status_text' and $name != 'mimetype'">
              <li name="{$name}" class="{$Pclass}">
                <span class="row-symbol"></span>
                <span class="row-name"><xsl:value-of select="$name"/></span>
                <xsl:choose>
                  <xsl:when test="$name = 'rows'">
                    <ul class="row {$Cclass}">
                      <xsl:apply-templates mode="complexType" select="xs:complexType"/>
                    </ul>
                  </xsl:when>
                  <xsl:otherwise>
                    <ul class="row {$Cclass}"  parent="{$name}">
                      <xsl:apply-templates mode="complexType" select="xs:complexType"/>
                    </ul>
                  </xsl:otherwise>
                </xsl:choose>
              </li> 
            </xsl:if>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:variable name="name" select="./@name"/>
        <xsl:if test="$name != 'status' and $name != 'status_text' and $name != 'mimetype'">
          <li name="{$name}">
            <span class="row-name">
              <span class="row-symbol"></span>
              <xsl:value-of select="$name"/>
            </span>
          </li>
        </xsl:if>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>


  <xsl:template mode="complexType" name="complexType" match="xs:complexType">
    <xsl:choose>
      <xsl:when test="xs:sequence">
        <xsl:apply-templates mode="sequence" select="xs:sequence"/>
      </xsl:when>
    </xsl:choose>
  </xsl:template>


  <xsl:template name="sequence" mode="sequence" match="xs:sequence">
    <xsl:for-each select="xs:element">
      <xsl:apply-templates mode="element" select="."/>
    </xsl:for-each>
  </xsl:template>

</xsl:transform>