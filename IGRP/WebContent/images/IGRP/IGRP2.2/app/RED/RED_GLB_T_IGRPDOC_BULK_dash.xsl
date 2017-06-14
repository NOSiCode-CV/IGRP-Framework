<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:output method="html" omit-xml-declaration="yes" encoding="ISO-8859-1" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"/>
 <xsl:template match="/">
  <html>
   <head>
    <xsl:call-template name="home-header"/>
   </head>
   <body class="bodyColor">
    <div class="IGRP_overlay"/>
    <xsl:call-template name="home-top-main"/>
    <div id="igrp-bodyPage">
     <xsl:call-template name="home-slide-menu"/>
     <div class="bodyPageRigth">
      <xsl:apply-templates mode="notif_messages" select="rows/content/messages"/>
      <form action="#" method="post" id="formular_default" name="formular_default" class="default_form" enctype="multipart/form-data"><div class="gen-row"><div class="gen-column col-1-1"><div class="gen-inner"><xsl:if test="rows/content/gen_form_toolsbar"><div  gen-structure="toolsbar" gen-fields="ul li" gen-field-label="span" class="gen-container-item">
	<xsl:apply-templates mode="tools-bar" select="rows/content/gen_form_toolsbar">
		<xsl:with-param name="rel" select="''"/>
		<xsl:with-param name="isTable" select="''"/>
		<xsl:with-param name="align" select="'right'"/>
	</xsl:apply-templates>
</div></xsl:if><xsl:if test="rows/content/gen_form_1"><div  class="box-content resetPadding gen-container-item" gen-id="body">
	<div class="box-collapser">
		<div class="col">
			
			<div gen-id="drop-zone">
				<xsl:apply-templates select="rows/content/gen_form_1/fields" mode="hidden-fields"/>
			<xsl:if  test="rows/content/gen_form_1/fields/env_fk"><div  class="col-1-4 item gen-fields-holder" item-name="select">
  <div class="igrp_item select">
    <label>
      <xsl:if test="string-length(rows/content/gen_form_1/fields/env_fk/label) &gt;45">
         <xsl:attribute name="title"><xsl:value-of select="rows/content/gen_form_1/fields/env_fk/label"/></xsl:attribute>
      </xsl:if>
      <span><span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_form_1/fields/env_fk/label"/></span></span>
    </label>
   
    <select name="{rows/content/gen_form_1/fields/env_fk/@name}" multiple-options="false" chosen="select" id="{rows/content/gen_form_1/fields/env_fk/@name}" data-placeholder="{rows/content/gen_form_1/fields/env_fk/list/option[position() = 1]/text}" class="select">
    
    <xsl:if test="rows/content/gen_form_1/fields/env_fk/@multiple = 'true'">
      <xsl:attribute name="multiple">true</xsl:attribute>
    </xsl:if>
      
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="field" select="rows/content/gen_form_1/fields/env_fk"/>
      </xsl:call-template>

      <xsl:for-each select="rows/content/gen_form_1/fields/env_fk/list/option[position() != 1]">
        <option value="{value}">
          <xsl:if test="@selected='true'">
            <xsl:attribute name="selected">selected</xsl:attribute>
          </xsl:if>
          <span><xsl:value-of select="text"/></span>
        </option>
      </xsl:for-each>

    </select>
    <div class="_clear"/>
  </div>
  <div class="_clear"/>
</div></xsl:if><xsl:if  test="rows/content/gen_form_1/fields/owner"><div  class="col-1-4 item gen-fields-holder" item-name="owner">
  <div class="igrp_item color">
    <label>
      <xsl:if test="string-length(rows/content/gen_form_1/fields/owner/label) &gt;45">
        <xsl:attribute name="title"><xsl:value-of select="rows/content/gen_form_1/fields/owner/label"/></xsl:attribute>
      </xsl:if>
      <span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_form_1/fields/owner/label"/></span>
    </label>
  <input type="text" name="{rows/content/gen_form_1/fields/owner/@name}" value="{rows/content/gen_form_1/fields/owner/value}" class="text" maxlength="30">
    <xsl:call-template name="FIELD_validator">
      <xsl:with-param name="field" select="rows/content/gen_form_1/fields/owner"/>
    </xsl:call-template>
  </input>
  <div class="_clear"/>
</div>
<div class="_clear"/>
</div></xsl:if><xsl:if  test="rows/content/gen_form_1/fields/object_name"><div  class="col-1-4 item gen-fields-holder" item-name="object_name">
  <div class="igrp_item color">
    <label>
      <xsl:if test="string-length(rows/content/gen_form_1/fields/object_name/label) &gt;45">
        <xsl:attribute name="title"><xsl:value-of select="rows/content/gen_form_1/fields/object_name/label"/></xsl:attribute>
      </xsl:if>
      <span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_form_1/fields/object_name/label"/></span>
    </label>
  <input type="text" name="{rows/content/gen_form_1/fields/object_name/@name}" value="{rows/content/gen_form_1/fields/object_name/value}" class="text" maxlength="30">
    <xsl:call-template name="FIELD_validator">
      <xsl:with-param name="field" select="rows/content/gen_form_1/fields/object_name"/>
    </xsl:call-template>
  </input>
  <div class="_clear"/>
</div>
<div class="_clear"/>
</div></xsl:if><xsl:if  test="rows/content/gen_form_1/fields/object_type"><div  class="col-1-4 item gen-fields-holder" item-name="select">
  <div class="igrp_item select">
    <label>
      <xsl:if test="string-length(rows/content/gen_form_1/fields/object_type/label) &gt;45">
         <xsl:attribute name="title"><xsl:value-of select="rows/content/gen_form_1/fields/object_type/label"/></xsl:attribute>
      </xsl:if>
      <span><span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_form_1/fields/object_type/label"/></span></span>
    </label>
   
    <select name="{rows/content/gen_form_1/fields/object_type/@name}" multiple-options="false" chosen="select" id="{rows/content/gen_form_1/fields/object_type/@name}" data-placeholder="{rows/content/gen_form_1/fields/object_type/list/option[position() = 1]/text}" class="select">
    
    <xsl:if test="rows/content/gen_form_1/fields/object_type/@multiple = 'true'">
      <xsl:attribute name="multiple">true</xsl:attribute>
    </xsl:if>
      
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="field" select="rows/content/gen_form_1/fields/object_type"/>
      </xsl:call-template>

      <xsl:for-each select="rows/content/gen_form_1/fields/object_type/list/option[position() != 1]">
        <option value="{value}">
          <xsl:if test="@selected='true'">
            <xsl:attribute name="selected">selected</xsl:attribute>
          </xsl:if>
          <span><xsl:value-of select="text"/></span>
        </option>
      </xsl:for-each>

    </select>
    <div class="_clear"/>
  </div>
  <div class="_clear"/>
</div></xsl:if><xsl:if  test="rows/content/gen_form_1/fields/remarks"><div  class="col-1-4 item gen-fields-holder" item-name="remarks">
    <div class="igrp_item textarea">
        <label>
            <xsl:if test="string-length(rows/content/gen_form_1/fields/remarks/label) &gt; 45">
                 <xsl:attribute name="title"><xsl:value-of select="rows/content/gen_form_1/fields/remarks/label"/></xsl:attribute>
            </xsl:if>
            <span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_form_1/fields/remarks/label"/></span>
        </label>
        <textarea name="{rows/content/gen_form_1/fields/remarks/@name}" class="textarea" maxlength="undefined">
            <xsl:call-template name="FIELD_validator">
                <xsl:with-param name="field" select="rows/content/gen_form_1/fields/remarks/label"/>
            </xsl:call-template>
            <xsl:value-of select="rows/content/gen_form_1/fields/remarks/value"/>
        </textarea>
        <div class="_clear"/>
    </div>
    <div class="_clear"/>
</div></xsl:if><xsl:if  test="rows/content/gen_form_1/fields/importar"><div  class="col-1-4 item gen-fields-holder" item-name="importar">
    <div class="igrp_item checkbox">
        <div class="col-1-1">
            <input type="checkbox" name="{rows/content/gen_form_1/fields/importar/@name}" value="1" class="checkbox">
                <xsl:call-template name="FIELD_validator">
                    <xsl:with-param name="field" select="rows/content/gen_form_1/fields/importar"/>
                </xsl:call-template>
                <xsl:if test="rows/content/gen_form_1/fields/importar/value = '1'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
            <span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_form_1/fields/importar/label"/></span>
        </div>
        <div class="_clear"/>
    </div>
    <div class="_clear"/>
</div></xsl:if></div>
			
			<div class="_clear"/>

			<xsl:if test="rows/content/gen_form_1/tools-bar">
				<xsl:apply-templates mode="button-bar" select="rows/content/gen_form_1/tools-bar"/>
			</xsl:if>
		</div>
		<div class="_clear"/>
	</div>
</div></xsl:if><xsl:if test="rows/content/gen_table_toolsbar"><div  gen-structure="toolsbar" gen-fields="ul li" gen-field-label="span" class="gen-container-item">
	<xsl:apply-templates mode="tools-bar" select="rows/content/gen_table_toolsbar">
		<xsl:with-param name="rel" select="''"/>
		<xsl:with-param name="isTable" select="''"/>
		<xsl:with-param name="align" select="'right'"/>
	</xsl:apply-templates>
</div></xsl:if><xsl:if test="rows/content/filter_1"><div  class="box-content resetPadding gen-container-item" gen-id="body">
	<div class="box-collapser">
		<div class="col">
			
			<div gen-id="drop-zone">
				<xsl:apply-templates select="rows/content/filter_1/fields" mode="hidden-fields"/>
			<xsl:if  test="rows/content/filter_1/fields/env_fk"><div  class="col-1-4 item gen-fields-holder" item-name="select">
  <div class="igrp_item select">
    <label>
      <xsl:if test="string-length(rows/content/filter_1/fields/env_fk/label) &gt;45">
         <xsl:attribute name="title"><xsl:value-of select="rows/content/filter_1/fields/env_fk/label"/></xsl:attribute>
      </xsl:if>
      <span><span gen-lbl-setter=""><xsl:value-of select="rows/content/filter_1/fields/env_fk/label"/></span></span>
    </label>
   
    <select name="{rows/content/filter_1/fields/env_fk/@name}" multiple-options="false" chosen="select" id="{rows/content/filter_1/fields/env_fk/@name}" data-placeholder="{rows/content/filter_1/fields/env_fk/list/option[position() = 1]/text}" class="select">
    
    <xsl:if test="rows/content/filter_1/fields/env_fk/@multiple = 'true'">
      <xsl:attribute name="multiple">true</xsl:attribute>
    </xsl:if>
      
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="field" select="rows/content/filter_1/fields/env_fk"/>
      </xsl:call-template>

      <xsl:for-each select="rows/content/filter_1/fields/env_fk/list/option[position() != 1]">
        <option value="{value}">
          <xsl:if test="@selected='true'">
            <xsl:attribute name="selected">selected</xsl:attribute>
          </xsl:if>
          <span><xsl:value-of select="text"/></span>
        </option>
      </xsl:for-each>

    </select>
    <div class="_clear"/>
  </div>
  <div class="_clear"/>
</div></xsl:if><xsl:if  test="rows/content/filter_1/fields/object_type"><div  class="col-1-4 item gen-fields-holder" item-name="select">
  <div class="igrp_item select">
    <label>
      <xsl:if test="string-length(rows/content/filter_1/fields/object_type/label) &gt;45">
         <xsl:attribute name="title"><xsl:value-of select="rows/content/filter_1/fields/object_type/label"/></xsl:attribute>
      </xsl:if>
      <span><span gen-lbl-setter=""><xsl:value-of select="rows/content/filter_1/fields/object_type/label"/></span></span>
    </label>
   
    <select name="{rows/content/filter_1/fields/object_type/@name}" multiple-options="false" chosen="select" id="{rows/content/filter_1/fields/object_type/@name}" data-placeholder="{rows/content/filter_1/fields/object_type/list/option[position() = 1]/text}" class="select">
    
    <xsl:if test="rows/content/filter_1/fields/object_type/@multiple = 'true'">
      <xsl:attribute name="multiple">true</xsl:attribute>
    </xsl:if>
      
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="field" select="rows/content/filter_1/fields/object_type"/>
      </xsl:call-template>

      <xsl:for-each select="rows/content/filter_1/fields/object_type/list/option[position() != 1]">
        <option value="{value}">
          <xsl:if test="@selected='true'">
            <xsl:attribute name="selected">selected</xsl:attribute>
          </xsl:if>
          <span><xsl:value-of select="text"/></span>
        </option>
      </xsl:for-each>

    </select>
    <div class="_clear"/>
  </div>
  <div class="_clear"/>
</div></xsl:if><xsl:if  test="rows/content/filter_1/fields/owner"><div  class="col-1-4 item gen-fields-holder" item-name="owner">
  <div class="igrp_item color">
    <label>
      <xsl:if test="string-length(rows/content/filter_1/fields/owner/label) &gt;45">
        <xsl:attribute name="title"><xsl:value-of select="rows/content/filter_1/fields/owner/label"/></xsl:attribute>
      </xsl:if>
      <span gen-lbl-setter=""><xsl:value-of select="rows/content/filter_1/fields/owner/label"/></span>
    </label>
  <input type="text" name="{rows/content/filter_1/fields/owner/@name}" value="{rows/content/filter_1/fields/owner/value}" class="text" maxlength="30">
    <xsl:call-template name="FIELD_validator">
      <xsl:with-param name="field" select="rows/content/filter_1/fields/owner"/>
    </xsl:call-template>
  </input>
  <div class="_clear"/>
</div>
<div class="_clear"/>
</div></xsl:if></div>
			
			<div class="_clear"/>

			<xsl:if test="rows/content/filter_1/tools-bar">
				<xsl:apply-templates mode="button-bar" select="rows/content/filter_1/tools-bar"/>
			</xsl:if>
		</div>
		<div class="_clear"/>
	</div>
</div></xsl:if><xsl:if test="rows/content/gen_table"><div  class="box-content resetPadding gen-container-item" gen-structure="label,values">
    <div class="box-collapser">
        <div class="col addBorderLeftRight borderColor">
            <div class="box-table table-responsive">
                <div class="table-container">
                    <xsl:variable name="hasContextMenu" select="rows/content/gen_table/table/context-menu"/>
                    
                    <xsl:if test="$hasContextMenu">
                        <xsl:apply-templates mode="context-menu" select="rows/content/gen_table/table/context-menu">
                            <xsl:with-param name="contextId" select="'gen_table'"/>
                        </xsl:apply-templates>
                    </xsl:if>
                
                    <xsl:if test="rows/content/gen_table/fields/*[@type='color']">
                      <xsl:apply-templates mode="table-legend" select="rows/content/gen_table/table/legend_color"/>
                    </xsl:if>

                    <xsl:if test="rows/content/gen_table/table/filter">
                        <xsl:call-template name="filter-az">
                            <xsl:with-param name="name" select="rows/content/gen_table/table/filter/@name"/>
                            <xsl:with-param name="value" select="rows/content/gen_table/table/filter"/>
                            <xsl:with-param name="type" select="''"/>
                        </xsl:call-template> 
                   </xsl:if> 
                   
                    <table class="IGRP_table default-table" data-control="gen_table" gen-id="table">
                        <thead>
                            <tr gen-id="drop-zone" gen-field-template="th"><xsl:if  test="rows/content/gen_table/fields/owner"><th  align="left" class=" gen-fields-holder"><span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_table/fields/owner/label"/></span></th></xsl:if><xsl:if  test="rows/content/gen_table/fields/object_name"><th  align="left" class=" gen-fields-holder"><span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_table/fields/object_name/label"/></span></th></xsl:if><xsl:if  test="rows/content/gen_table/fields/object_type"><th  align="left" class=" gen-fields-holder"><span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_table/fields/object_type/label"/></span></th></xsl:if><xsl:if  test="rows/content/gen_table/fields/remarks"><th  align="left" class=" gen-fields-holder"><span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_table/fields/remarks/label"/></span></th></xsl:if><xsl:if  test="rows/content/gen_table/fields/ver_doc"><th  align="left" class=" gen-fields-holder"><span gen-lbl-setter=""><xsl:value-of select="rows/content/gen_table/fields/ver_doc/label"/></span></th></xsl:if></tr>
                        </thead>
                        <tbody>
                           <xsl:for-each select="rows/content/gen_table/table/value/row">
                                <tr gen-id="drop-zone" class="IGRP_contextMenu">
                                    <xsl:apply-templates mode="context-param" select="context-menu"/> 
                                    <xsl:apply-templates select="../../fields" mode="hidden-fields"/>
                                <xsl:if  test="owner"><td  align="left" data-row="{position()}" data-title="{../../fields/owner/label}" class="text">
	<xsl:value-of select="owner"/>
</td></xsl:if><xsl:if  test="object_name"><td  align="left" data-row="{position()}" data-title="{../../fields/object_name/label}" class="text">
	<xsl:value-of select="object_name"/>
</td></xsl:if><xsl:if  test="object_type"><td  align="left" data-row="{position()}" data-title="{../../fields/object_type/label}" class="text">
	<xsl:value-of select="object_type"/>
</td></xsl:if><xsl:if  test="remarks"><td  align="left" data-row="{position()}" data-title="{../../fields/remarks/label}" class="text">
	<xsl:value-of select="remarks"/>
</td></xsl:if><xsl:if  test="ver_doc"><td  align="left" data-row="{position()}" data-title="{../../label/ver_doc}" class="link">
<xsl:choose>
    <xsl:when test="ver_doc != ''">
        <a href="{ver_doc}" class="link bClick" target="_blank" name="ver_doc">
            <xsl:value-of select="ver_doc_desc" disable-output-escaping="yes"/>
        </a>
    </xsl:when>
    <xsl:otherwise>
        <span><xsl:value-of select="ver_doc_desc" disable-output-escaping="yes"/></span>
    </xsl:otherwise>
</xsl:choose>
</td></xsl:if></tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div></xsl:if></div></div></div></form>
       <div class="_clear"/>
      </div>
      <xsl:call-template name="link-opener"/>
      <div class="_clear"/>
     </div>
     <div id="igrp-footerPage">
      <xsl:call-template name="footer"/>
     </div>
    </body>
   </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201508031"/><xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=201508031"/><xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=201508031"/><xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=201508031"/>
 </xsl:stylesheet>