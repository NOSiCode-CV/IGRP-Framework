<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <!-- ALL FORM FIELD GENERATOR -->
  <xsl:template name="GEN-FORM">

    <xsl:apply-templates mode="form-hidden" select="rows/content/form/value" />
    
    <xsl:apply-templates mode="form-hidden" select="rows/content/filter/value"/>
    

    <xsl:if test="rows/content/form/label/*[@type ='tab']">
      <xsl:text  disable-output-escaping="yes"><![CDATA[<div class="gen-tab-holder nav-tabs-custom gen-container-item " tab-template="default" gen-class="" item-name="tabcontent">]]></xsl:text>

      <ul class="nav nav-tabs">
        <xsl:for-each select="rows/content/form/label/*[@type='tab']">
          <xsl:variable name="pos" select="position()"/>
          <xsl:variable name="vName" select="name()"/>
          <li item-name="tab-process-{$pos}" tab-process="tab-process" class="gen-fields-holder" rel="proc-tabcontent-{$pos}">
            <xsl:if test="$pos = 1">
              <xsl:attribute name="class">gen-fields-holder active</xsl:attribute>
            </xsl:if>
            <a active-text-color="primary" data-toggle="tab" aria-expanded="true" href="#proc-tabcontent-{$pos}">
              <i class="fa fa-angle-right"/>
              <span><xsl:value-of select="../../value/*[name() = $vName]"/></span>
            </a>
          </li>
        </xsl:for-each>
      </ul>
      <xsl:text  disable-output-escaping="yes"><![CDATA[<div class="tab-content"><div id="start-content" class="box-body">]]></xsl:text>
    </xsl:if>


    <xsl:for-each select="rows/content/form/label/*[@type!='hidden']">

      <xsl:variable name="nome" select="name()" />

      <xsl:choose>
        <!-- SEPARADOR -->
        <xsl:when test="@type='tab'">
          <xsl:text  disable-output-escaping="yes"><![CDATA[</div>
          <div class="tab-pane tab-process gen-rows-holder" id="tabcontent-" rel="tabcontent-">]]></xsl:text>
        </xsl:when>
        <xsl:when test="@type='separator'">
          
          <div class="box-head subtitle separator" text-color="primary" item-name="{name()}">
            <span><xsl:value-of select="text()"/></span>
          </div>
          
        </xsl:when>
       
        <xsl:when test="@type='biometric' or @type='biometric_view'">
          <div class="fingerprint box gen-container-item " item-name="fp">
             <xsl:call-template name="box-header">
              <xsl:with-param name="title" select="."/>
              <xsl:with-param name="collapsible" select="'false'"/>
              <xsl:with-param name="collapsed" select="'false'"/>
            </xsl:call-template>
            
            <xsl:call-template name="GEN-biometric"/>

          </div> 
        </xsl:when>
       
        <xsl:when test="@type = 'mapp_esri'">
          <div class="clear">
            MAPP ESRI TO IMPLEMENT. CONTACT DIM
          </div>
        </xsl:when>
        <!-- SEPARADOR LISTA-->
        <xsl:when test="@type='separatorlist' or @type='separatordialog'">
          <xsl:call-template name="GEN-separatorlist">
            <xsl:with-param name="isDialog">
                <xsl:if test="@type = 'separatordialog'">true</xsl:if>
            </xsl:with-param>
          </xsl:call-template>
        </xsl:when>
        <!-- FORM LISTA-->
        <xsl:when test="@type='formlist'">
          <xsl:call-template name="GEN-formlist"/>
        </xsl:when>
        <!-- LISTA-->
        <xsl:when test="@type='list'">

          <xsl:call-template name="GEN-table"/>

        </xsl:when>
        <!-- OUTROS CAMPOS -->
        <xsl:otherwise>
          <xsl:if test="not(@rel)">
           <xsl:call-template name="GEN-formfield"/>
          </xsl:if>
        </xsl:otherwise>
      </xsl:choose>
    </xsl:for-each>

    <xsl:if test="rows/content/form/label/*[@type ='tab']">
      <xsl:text  disable-output-escaping="yes"><![CDATA[</div>]]></xsl:text>
    </xsl:if>

  </xsl:template>

  <xsl:template name="setlinktarget">
    <xsl:param name="target" select="'_blank'"/>
    <xsl:attribute name="target">
      <xsl:choose>
        <xsl:when test="$target = 'mcparent' or $target = 'modalpopup'">modal</xsl:when>
        <xsl:otherwise><xsl:value-of select="$target"/></xsl:otherwise>
      </xsl:choose>
    </xsl:attribute>
    <xsl:if test="$target = 'mcparent'">
      <xsl:attribute name="close">refresh</xsl:attribute>
    </xsl:if>
  </xsl:template>
  
  <xsl:include href="components/2.1/GEN-formfields.tmpl.xsl?v=1463090556312"/>

  <xsl:include href="components/2.1/GEN-table.tmpl.xsl?v=1463090556312"/>

  <xsl:include href="components/2.1/GEN-separatorlist.tmpl.xsl?v=1463090556312"/>

  <xsl:include href="components/2.1/GEN-formlist.tmpl.xsl?v=1463090556312"/>

  <xsl:include href="components/2.1/GEN-biometric.tmpl.xsl?v=1463090556312"/>
  
  <xsl:include href="components/2.1/GEN-view.tmpl.xsl?v=1463090556312"/>


</xsl:stylesheet>