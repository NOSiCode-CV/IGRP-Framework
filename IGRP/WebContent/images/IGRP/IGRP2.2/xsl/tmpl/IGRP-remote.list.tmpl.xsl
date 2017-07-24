<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:param name="type"/>
	<xsl:param name="path_tmpl"/>
    
    <xsl:variable name="lng">
  	<xsl:choose>
    	<xsl:when test="rows/language"><xsl:value-of select="rows/language/@file"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="concat($path,'/xml/IGRP-language.xml')"/></xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
   <xsl:variable name="lngPath" select="document($lng)/language"/>
    
	<xsl:template match="/">
   		<xsl:for-each select="rows/content/form/table/*[name() = $type]">
        	<xsl:choose>
            	<xsl:when test="@type = 'list'">
                	<xsl:call-template name="GEN-LIST-TABLE">
                        <xsl:with-param name="rel" select="name()"/>
                        <xsl:with-param name="table" select="."/>
                        <xsl:with-param name="path_tmpl" select="$path_tmpl"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                	<xsl:variable name="dialog">
                        <xsl:if test="@type ='separatordialog'">
                            <xsl:text>_diag</xsl:text>
                        </xsl:if>
                    </xsl:variable>
                    
                	<xsl:call-template name="GEN-SIMPLE-TABLE">
                        <xsl:with-param name="rel" select="name()"/>
                        <xsl:with-param name="table" select="."/>
                        <xsl:with-param name="dialog" select="$dialog"/>
                        <xsl:with-param name="path_tmpl" select="$path_tmpl"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
	</xsl:template>
    
    
    
    <xsl:template name="GEN-LIST-TABLE">
        <xsl:param name="rel" select="''" />
        <xsl:param name="path_tmpl" select="''" />
        <xsl:param name="table" />
        
        <div class="box-table table-responsive">  
        <table rel="T_{rel}" data-control="data-{$rel}" class="IGRP_table default-table">
            <thead>
                <tr>
                    <xsl:for-each select="$table/label/*[@type!='hidden' and not(@visible)]">
                        <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and @type!='hidden'">
                        
                            <xsl:choose>
                                <xsl:when test="@type='checkbox'">
                                    <th class="checkbox sorttable_nosort" align="center">
                                        <input type="checkbox" name="{@name}_all" value="" class="IGRP_checkall" />
                                        <xsl:value-of select="text()" disable-output-escaping="yes"/>
                                    </th>
                                </xsl:when>
                                <xsl:otherwise>                   	
                                	<th> <xsl:value-of select="text()" disable-output-escaping="yes"/></th>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </tr>
            </thead>
            
            <tbody>
                <xsl:for-each select="$table/value/row">
                    <xsl:variable name="pos" select="position()"/>
                    <tr row="{$pos}" class="default">
                        <xsl:for-each select="*"> 
                            <xsl:variable name="nome" select="@name" />
                                <xsl:variable name="nome_desc">
                                <xsl:value-of select="name()" />
                                <xsl:text>_desc</xsl:text>
                            </xsl:variable>
                            
                            <xsl:variable name="nome_check">
                                <xsl:value-of select="name()" />
                                <xsl:text>_check</xsl:text>
                            </xsl:variable>
                            
                            <xsl:variable name="separator_id"><xsl:value-of select="concat($rel,'_id')" /></xsl:variable>
                            
                            <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check')">
                            
                                <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
                                <xsl:variable name="value_check" select="../*[name()=$nome_check]/text()" />
                                <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                                
                                <xsl:variable name="v_type">
                                    <xsl:choose>
                                        <xsl:when test="@visible"><xsl:value-of select="'hidden'"/></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                
                                <xsl:choose>
                                    <xsl:when test="$v_type='hidden'"></xsl:when>
                                    <xsl:when test="$v_type='checkbox' or $v_type='radio'">
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}" class="checkbox">
                                            <xsl:if test="text()!='-0'">
                                                <input type="{@type}" name="{@name}" value="{text()}">
                                                <xsl:if test="$value_check=text()">
                                                	<xsl:attribute name="checked">checked</xsl:attribute>
                                            	</xsl:if>
                                            	</input>
                                            </xsl:if>
                                            <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                            <xsl:if test="position()=1">
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:when>
                                    <xsl:when test="$v_type='link' or $v_type='file'">
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                                            <xsl:choose>
                                                <xsl:when test="text()!=''">
                                                    <a href="{text()}" class="link bClick" target="_blank">
                                                    	<xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                    </a>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                	<xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:if test="position()=1">
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                                            <xsl:value-of select="." disable-output-escaping="yes"/>
                                            <xsl:if test="position()=1">
                                                <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                            </xsl:if>
                                        </td>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:if>
                        </xsl:for-each>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>   
    </div>
 </xsl:template>
    
<xsl:template name="GEN-SIMPLE-TABLE">
    <xsl:param name="rel" select="''" />
    <xsl:param name="dialog" />
    <xsl:param name="path_tmpl" select="''" />
    <xsl:param name="table" />

    <div class="box-table table-responsive">
    <ul class="contextMenu ctxSepListDialog" id="data-{$rel}" sep-name="btn-{$rel}">
        <li rel="{$rel}" class="IGRP_editRow operationTable" item-name="edit-{$rel}">
            <xsl:if test="$dialog != ''">
                <xsl:attribute name="type"><xsl:value-of select="$dialog"/></xsl:attribute>
            </xsl:if>
            <img src="{$path_tmpl}/img/icon/tools-bar/edit.png"/>
            <span><xsl:value-of select="$lngPath/separatorlist_dialog/edit" disable-output-escaping="yes"/></span>
        </li>
        <li rel="{$rel}" class="IGRP_delRow operationTable" item-name="del-{$rel}">
            <xsl:if test="$dialog != ''">
                <xsl:attribute name="type"><xsl:value-of select="$dialog"/></xsl:attribute>
            </xsl:if>
            <img src="{$path_tmpl}/img/icon/tools-bar/delete.png"/>
            <span><xsl:value-of select="$lngPath/separatorlist_dialog/delete" disable-output-escaping="yes"/></span>
        </li>
    </ul>
    <table rel="T_{$rel}" data-control="data-{$rel}">
        <thead>
            <tr>
                <xsl:for-each select="$table/label/*[@type!='hidden' and @type!='group' and not(@visible)]">
                    <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check') and @type!='hidden'">
                        <th> <xsl:value-of select="text()" disable-output-escaping="yes"/> </th>
                    </xsl:if>
                </xsl:for-each>
                <xsl:if test="not($table/value/row[position() = 1]/@nodelete) or not($table/value/row[position() = 1]/@noupdate)">
                    <th class="bEdDel"></th>
                </xsl:if>
            </tr>
        </thead>
        
        <tbody>
            <xsl:for-each select="$table/value/row">
                <xsl:variable name="pos" select="position()"/>             
                <tr row="{$pos}">
                    <xsl:for-each select="*"> 
                        <xsl:variable name="nome" select="@name" />
                            <xsl:variable name="nome_desc">
                            <xsl:value-of select="name()" />
                            <xsl:text>_desc</xsl:text>
                        </xsl:variable>
                        
                        <xsl:variable name="separator_id"><xsl:value-of select="concat($rel,'_id')" /></xsl:variable>
                        
                        <xsl:if test="not(substring(name(),(string-length(name())-4),5) =  '_desc') and not(substring(name(),(string-length(name())-5),6) =  '_check')"> 
                        
                            <xsl:variable name="value_desc" select="../*[name()=$nome_desc]/text()" />
                            <xsl:variable name="value_id" select="../*[name()=$separator_id]/text()" />
                            
                            <xsl:variable name="v_type">
                                <xsl:choose>
                                    <xsl:when test="@visible or @type='group'"><xsl:value-of select="'hidden'"/></xsl:when>							
                                    <xsl:otherwise><xsl:value-of select="@type"/></xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            
                            <xsl:choose> 
                                <xsl:when test="$v_type='hidden'">
                                    <input type="hidden" name="{@name}_fk" value="{text()}" />
                                    <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                    <xsl:if test="position()=1">
                                        <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                    </xsl:if>
                                </xsl:when>
                                
                                <xsl:when test="$v_type='link' or $v_type='file'">
                                    <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">   
                                        <xsl:choose>
                                            <xsl:when test="text()!=''">
                                                <a href="{text()}" class="link bClick" target="_blank">
                                                <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                                </a>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                            </xsl:otherwise>
                                        </xsl:choose>                                 
                                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                        <xsl:if test="position()=1">
                                            <span class="showResponsiveTable ctxmenu"></span>
                                            <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                        </xsl:if>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>        
                                    <td data-title="{../../../label/*[name()=$nome_desc]/text()}" data-row="{$pos}">
                                        <xsl:value-of select="$value_desc" disable-output-escaping="yes"/>
                                        <input type="hidden" name="{@name}_fk" value="{text()}" />
                                        <input type="hidden" name="{@name}_fk_desc" value="{$value_desc}" />
                                        <xsl:if test="position()=1">
                                            <span class="showResponsiveTable ctxmenu"></span>
                                            <input type="hidden" name="p_{$rel}_id" value="{$value_id}" />
                                        </xsl:if>
                                    </td>
                                </xsl:otherwise> 
                            </xsl:choose>                        
                        </xsl:if>
                    </xsl:for-each>
                    <td data-title="{$lngPath/separatorlist_dialog/edit}/{$lngPath/separatorlist_dialog/delete}"  data-row="{$pos}" class="bEdDel">
                        <xsl:if test="not(@noupdate)">
                            <img title="{$lngPath/separatorlist_dialog/edit}" src="{$path_tmpl}/img/icon/tools-bar/edit.png" item-name="edit-{$rel}" rel="{$rel}" class="IGRP_editRow{$dialog}"/>
                        </xsl:if>
                        <xsl:if test="not(@nodelete)">
                            <img title="{$lngPath/separatorlist_dialog/delete}" src="{$path_tmpl}/img/icon/tools-bar/delete.png" item-name="del-{$rel}" rel="{$rel}" class="IGRP_delRow{$dialog}"/>
                        </xsl:if>					 
                    </td>
                </tr>
            </xsl:for-each>
        </tbody>
    </table>   
</div>
</xsl:template>
</xsl:stylesheet>