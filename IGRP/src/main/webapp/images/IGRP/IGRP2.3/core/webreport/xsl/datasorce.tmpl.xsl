<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="*">
    <xsl:call-template name="datasorce"/>
  </xsl:template>

  <xsl:template name='datasorce'>
    <ul class="nav nav-sidebar" id="datasorce">
      <xsl:for-each select="//rows/*[name() = 'content']">
        <xsl:variable name="pos" select="position()"/>
        <li class="treeview head" pos="{$pos}" type="node">
          <xsl:if test="data_source_id">
            <xsl:attribute name="data-source-id">
              <xsl:value-of select="data_source_id"/>
            </xsl:attribute>
          </xsl:if>
          <a type="node">
            <i class="fa fa-angle-right pull-right icon"></i>
            <span><xsl:value-of select="title"/></span>
          </a>
          <ul class="treeview-menu">
            <xsl:for-each select="*[name() != 'title' and name() != 'data_source_id' and name() != 'menu' and name() != 'messages' and not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and not(substring(name(),1,5) =  'p_fwl') and @type != 'sectionheader' and @type != 'toolsbar' and @type != 'tabcontent']|*[name() ='form']/table/*|*[name() ='form']|*[name() ='filter']|*[name() ='view']">
              <xsl:variable name="no" select="name()"/>
              <xsl:variable name="nohead" select="local-name(..)"/>
              <xsl:variable name="vnoType" select="@type"/>
              <xsl:variable name="tag">
                <xsl:choose>
                  <xsl:when test="$nohead = 'table'">table</xsl:when>
                  <xsl:when test="$vnoType = 'chart'">chart</xsl:when>
                  <xsl:when test="$vnoType = 'image'">image</xsl:when>
                  <xsl:otherwise><xsl:value-of select="name()"/></xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:variable name="parentType">
                <xsl:choose>
                  <xsl:when test="$vnoType = 'list'">table</xsl:when>
                  <xsl:otherwise><xsl:value-of select="$vnoType"/></xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <li class="treeview" rel="{name()}" type="node" tag="{$tag}" parentType="{$parentType}" parentPos="{$pos}">
                <xsl:if test="$parentType != 'chart' and $tag != 'table' and $tag != 'form'">
                  <xsl:attribute name="label"><xsl:value-of select="label"/></xsl:attribute>
                </xsl:if>
                <xsl:if test="$parentType = 'chart'">
                  <xsl:attribute name="charttype"><xsl:value-of select="chart_type"/></xsl:attribute>
                </xsl:if>
                <xsl:if test="$parentType = 'table'">
                  <xsl:attribute name="tagType"><xsl:value-of select="'separator'"/></xsl:attribute>
                </xsl:if>
                <xsl:if test="$no = 'form' or $no = 'filter' or $no = 'view'">
                  <xsl:attribute name="no"><xsl:value-of select="$no"/></xsl:attribute>
                  <xsl:attribute name="class">treeview no</xsl:attribute>
                </xsl:if>
                <a type="node">
                  <xsl:if test="$parentType = 'chart'">
                    <xsl:attribute name="type"><xsl:value-of select="'line'"/></xsl:attribute>
                  </xsl:if>
                  <i class="fa fa-angle-right pull-right icon"></i>
                  <span>
                    <xsl:if test="$no = 'table' or $parentType = 'chart' or $parentType = 'table'">
                      <xsl:attribute name="class"><xsl:value-of select="'drag'"/></xsl:attribute>
                      <xsl:attribute name="draggable"><xsl:value-of select="'true'"/></xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="$tag"/>
                  </span>
                </a>
                <xsl:if test="$parentType != 'chart' or not($parentType)">
                  <ul class="treeview-menu" tag="{$tag}" rel="{$no}">
                    <xsl:if test="$no = 'table' or $parentType = 'table'">
                        <xsl:attribute name="col">
                          <xsl:value-of select="count(fields/*[not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and not(substring(name(),1,5) =  'p_fwl') and @type != 'hidden']|label/*[not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and not(substring(name(),1,5) =  'p_fwl') and @type != 'hidden'])"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:for-each select="fields/*|label/*">
                      <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and not(substring(name(),1,5) =  'p_fwl') and @type !='separator' and @type != 'separatordialog' and @type != 'group' and @type != 'separatorlist' and @type != 'biometric' and @type != 'list' and @type != 'formlist' and @type != 'biometric_view' and @type != 'hidden'">
                        <xsl:variable name="vlabel">
                          <xsl:choose>
                            <xsl:when test="label"><xsl:value-of select="label"/></xsl:when>
                            <xsl:otherwise><xsl:value-of select="."/></xsl:otherwise>
                          </xsl:choose>
                        </xsl:variable>
                        <li class="treeview" rel="{name()}" noType="{@type}" tag="{$tag}" parentType="{$parentType}" parentPos="{$pos}">
                          <xsl:if test="$nohead = 'table'">
                            <xsl:attribute name="tagType">
                              <xsl:value-of select="'separator'"/>
                            </xsl:attribute>
                          </xsl:if>
                          <xsl:if test="($no != 'table' and $no != 'form') or ($no = 'table' and $vnoType = 'table')">
                            <xsl:attribute name="label">
                              <xsl:value-of select="$vlabel"/>
                            </xsl:attribute>
                          </xsl:if>
                          <a type="line">
                            <xsl:if test="$parentType = 'table'">
                              <input class="checkList" type="checkbox" name="p_{$tag}" value="{name()}" label="{$vlabel}" title="Seleccionar para Lista"/>
                            </xsl:if>
                            <span class="drag" draggable="true">
                              <i class="fa fa-angle-right"></i>
                              <xsl:value-of select="$vlabel"/>
                            </span>
                          </a>
                          <div class="tree-menu-options">
                            <div class="btn">
                              <input class="checkChave" type="checkbox" name="p_{name()}" value="{name()}" label="{$vlabel}" title="Definir como chave">
                                <xsl:if test="@key = 'true'">
                                  <xsl:attribute name="checked">
                                    <xsl:value-of select="checked"/>
                                  </xsl:attribute>
                                  <xsl:attribute name="title">
                                    <xsl:value-of select="'Remover chave'"/>
                                  </xsl:attribute>
                                </xsl:if>
                                <xsl:if test="@java-type">
                                  <xsl:attribute name="java-type">
                                    <xsl:value-of select="@java-type"/>
                                  </xsl:attribute>
                                </xsl:if>
                              </input>
                            </div>
                          </div>
                        </li>
                      </xsl:if>
                    </xsl:for-each>
                  </ul>
                </xsl:if>
              </li>
            </xsl:for-each>
          </ul>
        </li>
      </xsl:for-each>
    </ul>
  </xsl:template>
</xsl:stylesheet>