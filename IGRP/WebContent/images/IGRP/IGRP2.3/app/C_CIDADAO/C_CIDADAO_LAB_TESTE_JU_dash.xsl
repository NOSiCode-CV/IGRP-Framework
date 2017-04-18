<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
 <xsl:output doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" encoding="ISO-8859-1" omit-xml-declaration="yes" method="html" />
 <xsl:template match="/">
  <html>
   <head>
    <xsl:call-template name="home-header" />
   </head>
   <body class="bodyColor">
    <div class="IGRP_overlay" />
    <xsl:call-template name="home-top-main" />
    <div id="igrp-bodyPage">
     <xsl:call-template name="home-slide-menu" />
     <div class="bodyPageRigth">
      <xsl:apply-templates select="rows/content/messages" mode="notif_messages" />
      <form class="default_form" name="formular_default" method="post" id="formular_default" enctype="multipart/form-data" action="#"><div class="gen-row"><div class="gen-column col-1-4"><div class="gen-inner"><xsl:if test="rows/content/table_1"><div class="box-content resetPadding" gen-structure="label,values">
    <div class="box-collapser">
        <div class="col addBorderLeftRight borderColor">
            <div class="box-table table-responsive">
                <div class="table-container">
                    <xsl:variable  name="hasContextMenu" select="rows/content/table_1/table/context-menu" />
                    
                    <xsl:if  test="$hasContextMenu">
                        <xsl:apply-templates select="rows/content/table_1/table/context-menu" mode="context-menu">
                            <xsl:with-param name="contextId" select="'table_1'" />
                        </xsl:apply-templates>
                    </xsl:if>
                
                    <xsl:if  test="rows/content/table_1/fields/*[@type='color']">
                      <xsl:apply-templates select="rows/content/table_1/table/legend_color" mode="table-legend" />
                    </xsl:if>

                    <xsl:if  test="rows/content/table_1/table/filter">
                        <xsl:call-template name="filter-az">
                            <xsl:with-param name="name" select="rows/content/table_1/table/filter/@name" />
                            <xsl:with-param name="value" select="rows/content/table_1/table/filter" />
                            <xsl:with-param name="type" select="''" />
                        </xsl:call-template> 
                   </xsl:if> 
                   
                    <table class="IGRP_table default-table" gen-id="table" data-control="table_1">
                        <thead>
                            <tr gen-id="drop-zone" gen-field-template="th"><xsl:if  test="rows/content/table_1/fields/password"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/password/label" /></span></th></xsl:if><xsl:if  test="rows/content/table_1/fields/text"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/text/label" /></span></th></xsl:if><xsl:if  test="rows/content/table_1/fields/number"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/number/label" /></span></th></xsl:if></tr>
                        </thead>
                        <tbody>
                           <xsl:for-each  select="rows/content/table_1/table/value/row">
                                <tr class="IGRP_contextMenu" gen-id="drop-zone">
                                    <xsl:apply-templates select="context-menu" mode="context-param" /> 
                                    <xsl:apply-templates select="../../fields" mode="hidden-fields" />
                                <xsl:if test="password"><td class="password" align="left" data-title="{../../fields/password/label}" data-row="{position()}">
	<xsl:value-of select="password" />
</td></xsl:if><xsl:if test="text"><td class="text" align="left" data-title="{../../fields/text/label}" data-row="{position()}">
	<xsl:value-of select="text" />
</td></xsl:if><xsl:if test="number"><td class="number" align="left" data-title="{../../fields/number/label}" data-row="{position()}">
	<xsl:value-of select="number" />
</td></xsl:if></tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
    </div>
</div></xsl:if><xsl:if test="rows/content/chart_1"><div class="col" gen-structure="graphic" style="border:1px solid #d1d1d1 !important">
	<xsl:call-template  name="igrp-graph">
        <xsl:with-param name="table" select="rows/content/chart_1" />
        <xsl:with-param name="chart_type" select="'line'" />
        <xsl:with-param name="height" select="'250'" />
        <xsl:with-param name="title" select="'chart'" />
        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'" />
    </xsl:call-template>
	<div class="_clear" />
</div></xsl:if></div></div><div class="gen-column col-1-2"><div class="gen-inner"><xsl:if test="rows/content/custom_1"><div class="box-content resetPadding"><h1>TEST LIST CUSTOM</h1><ul><xsl:for-each  select="rows/content/custom_1/rows/row"><li><xsl:value-of select="." /></li></xsl:for-each>
</ul>
</div></xsl:if><xsl:if test="rows/content/formlist_1"><div class="box-content resetPadding" sep-name="formlist_1">
    <div class="box-collapser">
        <div class="box-table table-responsive">
            <div class="table-container">

                <xsl:variable  name="hasContextMenu" select="rows/content/formlist_1/table/context-menu" />
                <xsl:if  test="$hasContextMenu">
                    <xsl:apply-templates select="rows/content/formlist_1/table/context-menu" mode="context-menu">
                        <xsl:with-param name="contextId" select="'data-formlist_1'" />
                    </xsl:apply-templates>
                </xsl:if>

                <table class="IGRP_formlist" rel="T_formlist_1" data-control="data-formlist_1">
                    <thead>
                        <tr gen-id="drop-zone" gen-field-template="table.th">
                            
                        <xsl:if  test="rows/content/formlist_1/fields/text"><th class=" gen-fields-holder" align="#[align]#"><span gen-lbl-setter=""><xsl:value-of select="rows/content/formlist_1/fields/text/label" /></span></th></xsl:if><xsl:if  test="rows/content/formlist_1/fields/password"><th class=" gen-fields-holder" align="#[align]#"><span gen-lbl-setter=""><xsl:value-of select="rows/content/formlist_1/fields/password/label" /></span></th></xsl:if><xsl:if  test="not(rows/content/form/table/formlist/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/formlist/value/row[position() = 1]/@nodelete)">
                              <th class="fBtn">
                                <xsl:if test="not(rows/content/form/table/formlist/value/row[position() = 1]/@noupdate)">
                                  <img title="" class="IGRP_addRowForm" rel="formlist" item-name="add-formlist" src="{$path_tmpl}/img/icon/tools-bar/add.png" />
                                </xsl:if>
                              </th>
                            </xsl:if></tr>
                    </thead>
                    <tbody>
                        <xsl:for-each  select="rows/content/formlist_1/table/value/row[not(@total='yes')]">
                            <tr class="IGRP_contextMenu" gen-id="drop-zone" row="{position()}">
                                <xsl:apply-templates select="context-menu" mode="context-param" /> 
                                <input type="hidden" name="p_formlist_1_id" value="{formlist_1_id}" />
                                
                                

                            <xsl:if test="text"><xsl:if test="not(text/@visible)">
	<td class="text" data-title="{../../fields/text/label}" data-row="{position()}">
      <input type="hidden" name="p_text_fk_desc" value="{text_desc}" />
      <input class="text" type="text" rel="F_formlist_1" name="{../../fields/text/@name}_fk" value="{text}">
        <xsl:call-template name="FIELD_validator">
          <xsl:with-param name="field" select="../../fields/text" />
        </xsl:call-template>
      </input>
    </td>
</xsl:if></xsl:if><xsl:if test="password"><xsl:if test="not(password/@visible)">
	<td class="password" data-title="{../../fields/password/label}" data-row="{position()}">
      <input type="hidden" name="p_password_fk_desc" value="{password_desc}" />
      <input class="password" type="password" rel="F_formlist_1" name="{../../fields/password/@name}_fk" value="{password}">
        <xsl:call-template name="FIELD_validator">
          <xsl:with-param name="field" select="../../fields/password" />
        </xsl:call-template>
      </input>
    </td>
</xsl:if></xsl:if><xsl:if test="not(@nodelete) or not(@noupdate)">
                                    <td class="fBtn" data-title="{$lngPath/separatorlist_dialog/delete}" data-row="{position()}">
                                      <xsl:if test="not(@nodelete)">
                                        <img title="{$lngPath/separatorlist_dialog/delete}" class="IGRP_delRow" rel="formlist" item-name="del-formlist" src="{$path_tmpl}/img/icon/tools-bar/delete.png" />
                                      </xsl:if>
                                    </td>
                                </xsl:if></tr>
                        </xsl:for-each>
                    </tbody>
                </table>
            </div>
        </div>
        <!--END FORM LIST-->
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if><xsl:if test="rows/content/form_2"><div class="box-content resetPadding" gen-id="body">
	<div class="box-collapser">
		<div class="col">
			
			<div gen-id="drop-zone">
				<xsl:apply-templates  select="rows/content/form_2/fields" mode="hidden-fields" />
			<xsl:if  test="rows/content/form_2/fields/text"><div class="col-1-4 item gen-fields-holder" item-name="text">
  <div class="igrp_item color">
    <label>
      <xsl:if test="string-length(rows/content/form_2/fields/text/label) &gt;45">
        <xsl:attribute name="title"><xsl:value-of select="rows/content/form_2/fields/text/label" /></xsl:attribute>
      </xsl:if>
      <span gen-lbl-setter=""><xsl:value-of select="rows/content/form_2/fields/text/label" /></span>
    </label>
  <input class="text" type="text" name="{rows/content/form_2/fields/text/@name}" value="{rows/content/form_2/fields/text/value}" maxlength="40">
    <xsl:call-template name="FIELD_validator">
      <xsl:with-param name="field" select="rows/content/form_2/fields/text" />
    </xsl:call-template>
  </input>
  <div class="_clear" />
</div>
<div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/form_2/fields/select"><div class="col-1-4 item gen-fields-holder" item-name="select">
  <div class="igrp_item select">
    <label>
      <xsl:if test="string-length(rows/content/form_2/fields/select/label) &gt;45">
         <xsl:attribute name="title"><xsl:value-of select="rows/content/form_2/fields/select/label" /></xsl:attribute>
      </xsl:if>
      <span><span gen-lbl-setter=""><xsl:value-of select="rows/content/form_2/fields/select/label" /></span></span>
    </label>
   
    <select class="select" name="{rows/content/form_2/fields/select/@name}" data-placeholder="{rows/content/form_2/fields/select/list/option[position() = 1]/text}" chosen="select" id="{rows/content/form_2/fields/select/@name}" multiple-options="false">
    
    <xsl:if test="rows/content/form_2/fields/select/@multiple = 'true'">
      <xsl:attribute name="multiple">true</xsl:attribute>
    </xsl:if>
      
      <xsl:call-template name="FIELD_validator">
        <xsl:with-param name="field" select="rows/content/form_2/fields/select" />
      </xsl:call-template>

      <xsl:for-each select="rows/content/form_2/fields/select/list/option[position() != 1]">
        <option value="{value}">
          <xsl:if test="@selected='true'">
            <xsl:attribute name="selected">selected</xsl:attribute>
          </xsl:if>
          <span><xsl:value-of select="text" /></span>
        </option>
      </xsl:for-each>

    </select>
    <div class="_clear" />
  </div>
  <div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/form_2/fields/link"><div class="col-1-4 item gen-fields-holder">
	<div class="igrp_item link">
    	<a class="link" href="{rows/content/form_2/fields/link/value}" target="_blank"><span gen-lbl-setter=""><xsl:value-of select="rows/content/form_2/fields/link/label" /></span></a>
    </div>
    <div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/form_2/fields/number"><div class="col-1-4 item gen-fields-holder" item-name="number">
  <div class="igrp_item color">
    <label>
      <xsl:if test="string-length(rows/content/form_2/fields/number/label) &gt;45">
        <xsl:attribute name="title"><xsl:value-of select="rows/content/form_2/fields/number/label" /></xsl:attribute>
      </xsl:if>
      <span gen-lbl-setter=""><xsl:value-of select="rows/content/form_2/fields/number/label" /></span>
    </label>
  <input class="number" type="number" name="{rows/content/form_2/fields/number/@name}" value="{rows/content/form_2/fields/number/value}" maxlength="40">
    <xsl:call-template name="FIELD_validator">
      <xsl:with-param name="field" select="rows/content/form_2/fields/number" />
    </xsl:call-template>
  </input>
  <div class="_clear" />
</div>
<div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/form_2/fields/date"><div class="col-1-4 item gen-fields-holder" item-name="date">
    <div class="igrp_item date">
        <label>
            <xsl:if test="string-length(rows/content/form_2/fields/date/label) &gt;45">
                 <xsl:attribute name="title"><xsl:value-of select="rows/content/form_2/fields/date/label" /></xsl:attribute>
            </xsl:if>
            <span gen-lbl-setter=""><xsl:value-of select="rows/content/form_2/fields/date/label" /></span>
        </label>
        <div class="itemIcon">
            <input class="date" type="text" name="{rows/content/form_2/fields/date/@name}" trel="IGRP_datePicker" value="{rows/content/form_2/fields/date/value}">
                <xsl:call-template name="FIELD_validator">
                  <xsl:with-param name="field" select="rows/content/form_2/fields/date" />
                </xsl:call-template>
            </input>
            <div class="calendar" />
        </div>
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if></div>
			
			<div class="_clear" />

			<xsl:if  test="rows/content/form_2/tools-bar">
				<xsl:apply-templates select="rows/content/form_2/tools-bar" mode="button-bar" />
			</xsl:if>
		</div>
		<div class="_clear" />
	</div>
</div></xsl:if><xsl:if test="rows/content/form_1"><div class="box-content resetPadding" gen-id="body">
	<div class="box-collapser">
		<div class="col">
			
			<div gen-id="drop-zone">
				<xsl:apply-templates  select="rows/content/form_1/fields" mode="hidden-fields" />
			<xsl:if  test="rows/content/form_1/fields/file"><div class="col-1-4 item gen-fields-holder" item-name="file">
    <div class="igrp_item file">
        <label>
            <xsl:if test="string-length(rows/content/form_1/fields/file/label) &gt;45">
                <xsl:attribute name="title"><xsl:value-of select="rows/content/form_1/fields/file/label" /></xsl:attribute>
            </xsl:if>
            <span gen-lbl-setter=""><xsl:value-of select="rows/content/form_1/fields/file/label" /></span>
        </label>
        <div class="itemIcon">
            <input disabled="disabled" class="notForm" file="id_{rows/content/form_1/fields/file/@name}" placeholder="Choose File" />
            <span class="upload" />
            <input class="file uploadFile" type="file" name="{rows/content/form_1/fields/file/@name}" id="id_{rows/content/form_1/fields/file/@name}" value="{rows/content/form_1/fields/file/value}">
                <xsl:call-template name="FIELD_validator">
                    <xsl:with-param name="field" select="rows/content/form_1/fields/file" />
                </xsl:call-template>
            </input>
        </div>
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/form_1/fields/email"><div class="col-1-4 item gen-fields-holder" item-name="email">
  <div class="igrp_item color">
    <label>
      <xsl:if test="string-length(rows/content/form_1/fields/email/label) &gt;45">
        <xsl:attribute name="title"><xsl:value-of select="rows/content/form_1/fields/email/label" /></xsl:attribute>
      </xsl:if>
      <span gen-lbl-setter=""><xsl:value-of select="rows/content/form_1/fields/email/label" /></span>
    </label>
  <input class="email" type="email" name="{rows/content/form_1/fields/email/@name}" value="{rows/content/form_1/fields/email/value}" maxlength="40">
    <xsl:call-template name="FIELD_validator">
      <xsl:with-param name="field" select="rows/content/form_1/fields/email" />
    </xsl:call-template>
  </input>
  <div class="_clear" />
</div>
<div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/form_1/fields/checkbox"><div class="col-1-4 item gen-fields-holder" item-name="checkbox">
    <div class="igrp_item checkbox">
        <div class="col-1-1">
            <input class="checkbox" type="checkbox" name="{rows/content/form_1/fields/checkbox/@name}" value="1">
                <xsl:call-template name="FIELD_validator">
                    <xsl:with-param name="field" select="rows/content/form_1/fields/checkbox" />
                </xsl:call-template>
                <xsl:if test="rows/content/form_1/fields/checkbox/value = '1'">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
            <span gen-lbl-setter=""><xsl:value-of select="rows/content/form_1/fields/checkbox/label" /></span>
        </div>
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if></div>
			
			<div class="_clear" />

			<xsl:if  test="rows/content/form_1/tools-bar">
				<xsl:apply-templates select="rows/content/form_1/tools-bar" mode="button-bar" />
			</xsl:if>
		</div>
		<div class="_clear" />
	</div>
</div></xsl:if></div></div><div class="gen-column col-1-4"><div class="gen-inner"><xsl:if test="rows/content/chart_2"><div class="col" gen-structure="graphic" style="border:1px solid #d1d1d1 !important">
	<xsl:call-template  name="igrp-graph">
        <xsl:with-param name="table" select="rows/content/chart_2" />
        <xsl:with-param name="chart_type" select="'line'" />
        <xsl:with-param name="height" select="'250'" />
        <xsl:with-param name="title" select="'chart'" />
        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'" />
    </xsl:call-template>
	<div class="_clear" />
</div></xsl:if></div></div></div><div class="gen-row"><div class="gen-column col-1-1"><div class="gen-inner"></div></div></div></form>
       <div class="_clear" />
      </div>
      <xsl:call-template name="link-opener" />
      <div class="_clear" />
     </div>
     <div id="igrp-footerPage">
      <xsl:call-template name="footer" />
     </div>
    </body>
   </html>
  </xsl:template>
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=201508027"/>
 </xsl:stylesheet>