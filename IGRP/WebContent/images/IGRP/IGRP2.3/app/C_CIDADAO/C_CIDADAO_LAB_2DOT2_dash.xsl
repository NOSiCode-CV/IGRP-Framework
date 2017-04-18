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
      <form class="default_form" name="formular_default" method="post" id="formular_default" enctype="multipart/form-data" action="#"><div class="gen-row"><div class="gen-column col-1-1"><div class="gen-inner"><xsl:if test="rows/content/toolsbar_1"><div gen-fields="ul li" gen-field-label="span" gen-structure="toolsbar">
	<xsl:apply-templates  select="rows/content/toolsbar_1" mode="tools-bar">
		<xsl:with-param name="rel" select="''" />
		<xsl:with-param name="isTable" select="''" />
		<xsl:with-param name="align" select="'right'" />
	</xsl:apply-templates>
</div></xsl:if><xsl:if test="rows/content/table_1"><div class="box-content resetPadding" gen-structure="label,values">
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
                            <xsl:with-param name="type" select="'filter_az'" />
                        </xsl:call-template> 
                   </xsl:if> 
                   
                    <table class="IGRP_table default-table" gen-id="table" data-control="table_1">
                        <thead>
                            <tr gen-id="drop-zone" gen-field-template="th"><xsl:if  test="rows/content/table_1/fields/color"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/color/label" /></span></th></xsl:if><xsl:if  test="rows/content/table_1/fields/text"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/text/label" /></span></th></xsl:if><xsl:if  test="rows/content/table_1/fields/number"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_1/fields/number/label" /></span></th></xsl:if></tr>
                        </thead>
                        <tbody>
                           <xsl:for-each  select="rows/content/table_1/table/value/row">
                                <tr class="IGRP_contextMenu" gen-id="drop-zone">
                                    <xsl:apply-templates select="context-menu" mode="context-param" /> 
                                    <xsl:apply-templates select="../../fields" mode="hidden-fields" />
                                <xsl:if test="color"><td class="color" align="" data-title="{../../label/color}" data-row="{position()}">
	<xsl:call-template name="tdcolor">
      <xsl:with-param name="color" select="color" />
    </xsl:call-template>
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
</div></xsl:if></div></div></div><div class="gen-row"><div class="gen-column col-1-3"><div class="gen-inner"><xsl:if test="rows/content/toolsbar_2"><div gen-fields="ul li" gen-field-label="span" gen-structure="toolsbar">
	<xsl:apply-templates  select="rows/content/toolsbar_2" mode="tools-bar">
		<xsl:with-param name="rel" select="''" />
		<xsl:with-param name="isTable" select="''" />
		<xsl:with-param name="align" select="'right'" />
	</xsl:apply-templates>
</div></xsl:if><xsl:if test="rows/content/table_2"><div class="box-content resetPadding" gen-structure="label,values"><xsl:call-template  name="titlecollapser"><xsl:with-param name="title" select="'table'" /><xsl:with-param name="collapsible" select="'true'" /></xsl:call-template>
    <div class="box-collapser">
        <div class="col addBorderLeftRight borderColor">
            <div class="box-table table-responsive">
                <div class="table-container">
                    <xsl:variable  name="hasContextMenu" select="rows/content/table_2/table/context-menu" />
                    
                    <xsl:if  test="$hasContextMenu">
                        <xsl:apply-templates select="rows/content/table_2/table/context-menu" mode="context-menu">
                            <xsl:with-param name="contextId" select="'table_2'" />
                        </xsl:apply-templates>
                    </xsl:if>
                
                    <xsl:if  test="rows/content/table_2/fields/*[@type='color']">
                      <xsl:apply-templates select="rows/content/table_2/table/legend_color" mode="table-legend" />
                    </xsl:if>

                    <xsl:if  test="rows/content/table_2/table/filter">
                        <xsl:call-template name="filter-az">
                            <xsl:with-param name="name" select="rows/content/table_2/table/filter/@name" />
                            <xsl:with-param name="value" select="rows/content/table_2/table/filter" />
                            <xsl:with-param name="type" select="''" />
                        </xsl:call-template> 
                   </xsl:if> 
                   
                    <table class="IGRP_table default-table" gen-id="table" data-control="table_2">
                        <thead>
                            <tr gen-id="drop-zone" gen-field-template="th"><xsl:if  test="rows/content/table_2/fields/checkbox"><th class="checkbox sorttable_nosort gen-fields-holder" align="center">
  <input class="IGRP_checkall" type="checkbox" name="p_check_all" />
</th></xsl:if><xsl:if  test="rows/content/table_2/fields/date"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_2/fields/date/label" /></span></th></xsl:if><xsl:if  test="rows/content/table_2/fields/number"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_2/fields/number/label" /></span></th></xsl:if><xsl:if  test="rows/content/table_2/fields/text"><th class=" gen-fields-holder" align="left"><span gen-lbl-setter=""><xsl:value-of select="rows/content/table_2/fields/text/label" /></span></th></xsl:if></tr>
                        </thead>
                        <tbody>
                           <xsl:for-each  select="rows/content/table_2/table/value/row">
                                <tr class="IGRP_contextMenu" gen-id="drop-zone">
                                    <xsl:apply-templates select="context-menu" mode="context-param" /> 
                                    <xsl:apply-templates select="../../fields" mode="hidden-fields" />
                                <xsl:if test="checkbox"><td class="checkbox" align="" data-title="{../../label/checkbox}" data-row="{position()}">
    <xsl:if test="checkbox != '-0'">
        <input type="checkbox" name="p_checkbox" value="{checkbox}">
            <xsl:if test="checkbox_check=checkbox">
                <xsl:attribute name="checked">checked</xsl:attribute>
            </xsl:if>
        </input>
    </xsl:if>
    <!-- <xsl:value-of select="checkbox_desc"/> -->
</td></xsl:if><xsl:if test="date"><td class="date" align="left" data-title="{../../fields/date/label}" data-row="{position()}">
	<xsl:value-of select="date" />
</td></xsl:if><xsl:if test="number"><td class="number" align="left" data-title="{../../fields/number/label}" data-row="{position()}">
	<xsl:value-of select="number" />
</td></xsl:if><xsl:if test="text"><td class="text" align="left" data-title="{../../fields/text/label}" data-row="{position()}">
	<xsl:value-of select="text" />
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
</div></xsl:if><xsl:if test="rows/content/separatorlist_1"><div class="box-content resetPadding" sep-name="separatorlist_1" gen-structure="label,value,table"><xsl:call-template  name="titlecollapser"><xsl:with-param name="title" select="'separatorlist'" /><xsl:with-param name="collapsible" select="'true'" /></xsl:call-template>
	<div class="box-collapser">
		<div class="col" gen-id="drop-zone" sep-name="group-separatorlist_1"><xsl:if  test="rows/content/separatorlist_1/fields/text"><div class="col-1-4 item gen-fields-holder" item-name="text">
    <div class="igrp_item text">
        <label>
            <xsl:if test="string-length(rows/content/separatorlist_1/fields/text/label) &gt;45">
                <xsl:attribute name="title">
                    <xsl:value-of select="rows/content/separatorlist_1/fields/text/label" />
                </xsl:attribute>
            </xsl:if><span gen-lbl-setter=""><xsl:value-of select="rows/content/separatorlist_1/fields/text/label" /></span>
        </label>
        <input class="text" type="text" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/text/@name}" value="{rows/content/separatorlist_1/fields/text/value}" maxlength="40">
            <xsl:call-template name="FIELD_validator">
                <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/text" />
            </xsl:call-template>
        </input>
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/separatorlist_1/fields/number"><div class="col-1-4 item gen-fields-holder" item-name="number">
    <div class="igrp_item number">
        <label>
            <xsl:if test="string-length(rows/content/separatorlist_1/fields/number/label) &gt;45">
                <xsl:attribute name="title">
                    <xsl:value-of select="rows/content/separatorlist_1/fields/number/label" />
                </xsl:attribute>
            </xsl:if><span gen-lbl-setter=""><xsl:value-of select="rows/content/separatorlist_1/fields/number/label" /></span>
        </label>
        <input class="number" type="number" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/number/@name}" value="{rows/content/separatorlist_1/fields/number/value}" maxlength="40">
            <xsl:call-template name="FIELD_validator">
                <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/number" />
            </xsl:call-template>
        </input>
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if><xsl:if  test="rows/content/separatorlist_1/fields/date"><div class="col-1-4 item gen-fields-holder" item-name="date">
    <div class="igrp_item date">
        <label>
            <xsl:if test="string-length(rows/content/separatorlist_1/fields/date/label) &gt;45">
                 <xsl:attribute name="title"><xsl:value-of select="rows/content/separatorlist_1/fields/date/label" /></xsl:attribute>
            </xsl:if>
            <span gen-lbl-setter=""><xsl:value-of select="rows/content/separatorlist_1/fields/date/label" /></span>
        </label>
        <div class="itemIcon">
            <input class="date" type="text" rel="F_separatorlist_1" name="{rows/content/separatorlist_1/fields/date/@name}" value="{rows/content/separatorlist_1/fields/date/value}" trel="IGRP_datePicker">
                <xsl:call-template name="FIELD_validator">
                  <xsl:with-param name="field" select="rows/content/separatorlist_1/fields/date" />
                </xsl:call-template>
            </input>
            <div class="calendar" />
        </div>
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if></div>
		<xsl:apply-templates  select="rows/content/separatorlist_1/value" mode="gen-form-hidden" />
		<xsl:call-template  name="tools-bar-form-group">
			<xsl:with-param name="class" select="'IGRP_addRow'" />
			<xsl:with-param name="rel" select="'separatorlist_1'" />
		</xsl:call-template>
		<div class="col" sep-name="list-separatorlist_1">
			<div class="box-table table-responsive">
				<ul class="contextMenu ctxSepListDialog" sep-name="btn-separatorlist_1" id="data-separatorlist_1">
					<li class="IGRP_editRow operationTable" rel="separatorlist_1" item-name="edit-separatorlist_1">
						<img src="{$path_tmpl}/img/icon/tools-bar/edit.png" />
						<span>
							<xsl:value-of  select="separatorlist_dialog/edit" disable-output-escaping="yes" />
						</span>
					</li>
					<li class="IGRP_delRow operationTable" rel="separatorlist_1" item-name="del-separatorlist_1">
						<img src="{$path_tmpl}/img/icon/tools-bar/delete.png" />
						<span>
							<xsl:value-of  select="separatorlist_dialog/delete" disable-output-escaping="yes" />
						</span>
					</li>
				</ul>
				<table rel="T_separatorlist_1" gen-id="table" data-control="data-separatorlist_1">
					<thead>
						<tr gen-id="drop-zone" gen-field-template="th">
							
						<xsl:if  test="rows/content/separatorlist_1/fields/text"><xsl:if test="//rows/content/separatorlist_1/fields/text/@table='true'">
	<th align="#[align]#"><span gen-lbl-setter=""><xsl:value-of select="rows/content/separatorlist_1/fields/text/label" /></span></th>
</xsl:if></xsl:if><xsl:if  test="rows/content/separatorlist_1/fields/number"><xsl:if test="//rows/content/separatorlist_1/fields/number/@table='true'">
	<th align="#[align]#"><span gen-lbl-setter=""><xsl:value-of select="rows/content/separatorlist_1/fields/number/label" /></span></th>
</xsl:if></xsl:if><xsl:if  test="rows/content/separatorlist_1/fields/date"><xsl:if test="//rows/content/separatorlist_1/fields/date/@table='true'">
	<th align="#[align]#"><span gen-lbl-setter=""><xsl:value-of select="rows/content/separatorlist_1/fields/date/label" /></span></th>
</xsl:if></xsl:if><th /></tr>
					</thead>
					<tbody>
						<xsl:for-each  select="rows/content/separatorlist_1/table/value/row[not(@total='yes')]">
							
							<tr gen-id="drop-zone" gen-field-template="td">
								
							<xsl:if test="text"><xsl:choose>
	<xsl:when test="//rows/content/separatorlist_1/fields/text/@table='true'">
		<td class="text" data-title="{../../fields/text/label}" data-row="{position()}">
			<span class="separator-list-td-val"><xsl:value-of select="text_desc" disable-output-escaping="yes" /></span>
			<input type="hidden" name="p_text_fk" value="{text}" />
			<input type="hidden" name="p_text_fk_desc" value="{text_desc}" />
		</td>
	</xsl:when>
	<xsl:otherwise>
		<input type="hidden" name="p_text_fk" value="{text}" />
  		<input type="hidden" name="p_text_fk_desc" value="{text_desc}" />
	</xsl:otherwise>
</xsl:choose></xsl:if><xsl:if test="number"><xsl:choose>
	<xsl:when test="//rows/content/separatorlist_1/fields/number/@table='true'">
		<td class="number" data-title="{../../fields/number/label}" data-row="{position()}">
			<span class="separator-list-td-val"><xsl:value-of select="number_desc" disable-output-escaping="yes" /></span>
			<input type="hidden" name="p_number_fk" value="{number}" />
			<input type="hidden" name="p_number_fk_desc" value="{number_desc}" />
		</td>
	</xsl:when>
	<xsl:otherwise>
		<input type="hidden" name="p_number_fk" value="{number}" />
  		<input type="hidden" name="p_number_fk_desc" value="{number_desc}" />
	</xsl:otherwise>
</xsl:choose></xsl:if><xsl:if test="date"><xsl:choose>
	<xsl:when test="//rows/content/separatorlist_1/fields/date/@table='true'">
		<td class="date" data-title="{../../fields/date/label}" data-row="{position()}">
			<span class="separator-list-td-val"><xsl:value-of select="date_desc" disable-output-escaping="yes" /></span>
			<input type="hidden" name="p_date_fk" value="{date}" />
			<input type="hidden" name="p_date_fk_desc" value="{date_desc}" />
		</td>
	</xsl:when>
	<xsl:otherwise>
		<input type="hidden" name="p_date_fk" value="{date}" />
  		<input type="hidden" name="p_date_fk_desc" value="{date_desc}" />
	</xsl:otherwise>
</xsl:choose></xsl:if><td /></tr>
						
						</xsl:for-each>
					</tbody>
				</table>
			</div>
		</div>
		<div class="_clear" />
	</div>
	<div class="_clear" />
</div></xsl:if></div></div><div class="gen-column col-1-3"><div class="gen-inner"><xsl:if test="rows/content/view_1"><div class="box-content resetPadding" gen-id="body"><xsl:call-template  name="titlecollapser"><xsl:with-param name="title" select="'view'" /><xsl:with-param name="collapsible" select="'true'" /></xsl:call-template>    
    <div class="box-collapser">
        <div class="col">
            <div gen-id="view-content">
                <div class="col" gen-id="view-data">
                    <div class="viewDados addPaddingBottom10" gen-id="drop-zone">
                    <xsl:if  test="rows/content/view_1/fields/email"><div class="groupView borderColor gen-fields-holder">
    <span class="viewLabel"><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/email/label" /></span></span>
    <span class="viewValue"><xsl:value-of select="rows/content/view_1/fields/email/value" /></span>
</div></xsl:if><xsl:if  test="rows/content/view_1/fields/text"><div class="groupView borderColor gen-fields-holder">
    <span class="viewLabel"><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/text/label" /></span></span>
    <span class="viewValue"><xsl:value-of select="rows/content/view_1/fields/text/value" /></span>
</div></xsl:if><xsl:if  test="rows/content/view_1/fields/date"><div class="groupView borderColor gen-fields-holder">
    <span class="viewLabel"><span gen-lbl-setter=""><xsl:value-of select="rows/content/view_1/fields/date/label" /></span></span>
    <span class="viewValue"><xsl:value-of select="rows/content/view_1/fields/date/value" /></span>
</div></xsl:if></div>
                    <div class="_clear" />
                </div>
                <div class="_clear" />
            </div>
            <div class="_clear" />
        </div>
        <div class="_clear" />
    </div>
    <div class="_clear" />
</div></xsl:if><xsl:if test="rows/content/chart_2"><div class="col" gen-structure="graphic" style="border:1px solid #d1d1d1 !important">
	<xsl:call-template  name="igrp-graph">
        <xsl:with-param name="table" select="rows/content/chart_2" />
        <xsl:with-param name="chart_type" select="'pie'" />
        <xsl:with-param name="height" select="'250'" />
        <xsl:with-param name="title" select="'chart'" />
        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'" />
    </xsl:call-template>
	<div class="_clear" />
</div></xsl:if><xsl:if test="rows/content/formlist_1"><div class="box-content resetPadding" sep-name="formlist_1"><xsl:call-template  name="titlecollapser"><xsl:with-param name="title" select="'formlist'" /><xsl:with-param name="collapsible" select="'true'" /></xsl:call-template>
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
                            
                        <xsl:if  test="rows/content/formlist_1/fields/email"><th class=" gen-fields-holder" align="#[align]#"><span gen-lbl-setter=""><xsl:value-of select="rows/content/formlist_1/fields/email/label" /></span></th></xsl:if><xsl:if  test="rows/content/formlist_1/fields/text"><th class=" gen-fields-holder" align="#[align]#"><span gen-lbl-setter=""><xsl:value-of select="rows/content/formlist_1/fields/text/label" /></span></th></xsl:if><xsl:if  test="rows/content/formlist_1/fields/checkbox"><th class="checkbox sorttable_nosort gen-fields-holder" align="center">
  <input class="IGRP_checkall" type="checkbox" name="p_check_all" />
</th></xsl:if><xsl:if  test="not(rows/content/form/table/formlist/value/row[position() = 1]/@noupdate) or not(rows/content/form/table/formlist/value/row[position() = 1]/@nodelete)">
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
                                
                                

                            <xsl:if test="email"><xsl:if test="not(email/@visible)">
	<td class="email" data-title="{../../fields/email/label}" data-row="{position()}">
      <input type="hidden" name="p_email_fk_desc" value="{email_desc}" />
      <input class="email" type="email" rel="F_formlist_1" name="{../../fields/email/@name}_fk" value="{email}">
        <xsl:call-template name="FIELD_validator">
          <xsl:with-param name="field" select="../../fields/email" />
        </xsl:call-template>
      </input>
    </td>
</xsl:if></xsl:if><xsl:if test="text"><xsl:if test="not(text/@visible)">
	<td class="text" data-title="{../../fields/text/label}" data-row="{position()}">
      <input type="hidden" name="p_text_fk_desc" value="{text_desc}" />
      <input class="text" type="text" rel="F_formlist_1" name="{../../fields/text/@name}_fk" value="{text}">
        <xsl:call-template name="FIELD_validator">
          <xsl:with-param name="field" select="../../fields/text" />
        </xsl:call-template>
      </input>
    </td>
</xsl:if></xsl:if><xsl:if test="checkbox"><xsl:if test="not(checkbox/@visible)">
    <td class="checkbox" data-title="{../../fields/checkbox/label}" data-row="{position()}">
        <input type="hidden" name="p_checkbox_fk_desc" value="{checkbox_desc}" />
        <xsl:if test="checkbox != '-0'">
            <input class="checkbox" type="checkbox" rel="F_formlist_1" name="{../../fields/checkbox/@name}_fk" value="{checkbox}">
                <xsl:call-template name="FIELD_validator">
                    <xsl:with-param name="field" select="../../fields/checkbox" />
                </xsl:call-template>
                <xsl:if test="checkbox_check= checkbox">
                    <xsl:attribute name="checked">checked</xsl:attribute>
                </xsl:if>
            </input>
        </xsl:if>
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
</div></xsl:if></div></div><div class="gen-column col-1-3"><div class="gen-inner"><xsl:if test="rows/content/chart_3"><div class="col" gen-structure="graphic" style="border:1px solid #d1d1d1 !important">
	<xsl:call-template  name="igrp-graph">
        <xsl:with-param name="table" select="rows/content/chart_3" />
        <xsl:with-param name="chart_type" select="'area'" />
        <xsl:with-param name="height" select="'250'" />
        <xsl:with-param name="title" select="'chart'" />
        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'" />
    </xsl:call-template>
	<div class="_clear" />
</div></xsl:if><xsl:if test="rows/content/chart_4"><div class="col" gen-structure="graphic" style="border:1px solid #d1d1d1 !important">
	<xsl:call-template  name="igrp-graph">
        <xsl:with-param name="table" select="rows/content/chart_4" />
        <xsl:with-param name="chart_type" select="'area'" />
        <xsl:with-param name="height" select="'250'" />
        <xsl:with-param name="title" select="'chart'" />
        <xsl:with-param name="url" select="'http://igrpresp.teste.gov.cv/images/IGRP/xml/IGRP-biblia-all.xml'" />
    </xsl:call-template>
	<div class="_clear" />
</div></xsl:if></div></div></div></form>
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
  <xsl:include href="../../xsl/tmpl/IGRP-home-include.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-slide-menu.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-others.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-context.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-graph.tmpl.xsl?v=201508027"/><xsl:include href="../../xsl/tmpl/IGRP-setAttribute.tmpl.xsl?v=201508027"/>
 </xsl:stylesheet>