<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--Generate TABLE GROUP-->
    <xsl:template name="genDbTableGroup">
        <xsl:param name="title" />
        <xsl:param name="type" />
        <xsl:param name="tag" />
        <xsl:param name="fields" />
        <xsl:param name="type_pkg" select="'html'"/>
        <xsl:variable name="procName" select="concat('VALUE_',$tag)" />
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="concat($entertab,'-----',$procName,': list for',$tag)"/>       
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
            <xsl:with-param name="params" select="concat(concat('p',$space,'OUT',$space,$pkg_type,'.T_FIELD,',$space),concat('params',$space,'OUT',$space,$pkg_type,'.T_PARAM'))"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>r</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:value-of select="concat($pkg_type,'.r_field')"/>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>t</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:value-of select="concat($pkg_type,'.t_field')"/>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>r_param</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:text>OWA.VC_ARR</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>V_COUNT</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:text>NUMBER:=0</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        <xsl:call-template name="genDbValueList">
            <xsl:with-param name="tag" select="$tag"/>
            <xsl:with-param name="type" select="$type"/>
            <xsl:with-param name="fields" select="$fields"/>
        </xsl:call-template>
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
    </xsl:template>
    <xsl:template name="genDbValueList">
        <xsl:param name="tag" />
        <xsl:param name="type" />
        <xsl:param name="fields" />
        <xsl:call-template name="genPreserveYourCode">
            <xsl:with-param name="procName" select="concat('VALUE_',$tag,'_BEFORELOOP')" />
        </xsl:call-template>
        <xsl:variable name="name" select="concat('tbl_',$tag)" />

        <xsl:choose>
            <xsl:when test="$type='table'">
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="concat('V_COUNT:=',$name,'.COUNT')"/>
                <xsl:value-of select="$endline"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="concat('V_COUNT:=','GREATEST(')"/>
                <xsl:value-of select="concat('v_',$tag,'_id.COUNT')"/>
                <xsl:value-of select="$comma"/>
                <xsl:call-template name="implode">
                    <xsl:with-param name="items" select="$fields"/>
                    <xsl:with-param name="prefix" select="'v_'"/>
                    <xsl:with-param name="sufix" select="'.COUNT'"/>
                </xsl:call-template>
                <xsl:value-of select="$comma"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$tab"/>
                <xsl:value-of select="$tab"/>
                <xsl:call-template name="implode">
                    <xsl:with-param name="items" select="$fields"/>
                    <xsl:with-param name="prefix" select="'v_'"/>
                    <xsl:with-param name="sufix" select="'_desc.COUNT'"/>
                </xsl:call-template>
                <!-- <xsl:value-of select="$comma"/> -->
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$tab"/>
                <xsl:value-of select="$tab"/>
                <xsl:call-template name="implode">
                    <xsl:with-param name="items" select="$fields[@check='true']"/>
                    <xsl:with-param name="prefix" select="'v_'"/>
                    <xsl:with-param name="sufix" select="'_check.COUNT'"/>
                </xsl:call-template>
                <xsl:value-of select="')'"/>
                <xsl:value-of select="$endline"/>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>FOR</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:text>I</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:text>IN</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:text>1..</xsl:text>
        <xsl:value-of select="concat('V_COUNT',$space,'LOOP')"/>
        
        <!-- R PARAM DELETE - WILLY 23.01.17 -->
 
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="'r.delete;'"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="'r_param.delete;'"/>

        <xsl:call-template name="genPreserveYourCode">
            <xsl:with-param name="procName" select="concat('VALUE_',$tag,'_CTXMENU')" />
        </xsl:call-template>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="'params(params.count+1):=r_param'"/>
        <xsl:value-of select="$endline"/>
        <xsl:if test="$type!='table'">
            <xsl:call-template name="genComment">
                <xsl:with-param name="comment" select="concat('column: ',$tag)"/>
            </xsl:call-template>
            <xsl:value-of select="$enter"/>
            <xsl:value-of select="$enter2tab"/>
            <xsl:value-of select="$tab"/>
            <xsl:value-of select="concat('IF',$space,'v_',$tag,'_id.count>=i',$space,'THEN')"/>
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$tab"/>
                <xsl:value-of select="$tab"/>
                <xsl:value-of select="concat('r(',$quotes,$tag,'_id',$quotes,'):=')"/>
                <xsl:value-of select="concat('v_',$tag,'_id(i)')"/>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="$enter"/>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="$tab"/>
                <xsl:value-of select="concat('END',$space,'IF')"/>
                <xsl:value-of select="$endline"/>
            </xsl:if>
            <xsl:for-each select="$fields">

                <xsl:call-template name="genComment">
                    <xsl:with-param name="comment" select="concat('column: ',name())"/>
                </xsl:call-template>

                <xsl:choose>
                    <xsl:when test="$type='table'">
                        
                        <xsl:value-of select="$enter"/>
                        <xsl:value-of select="$enter2tab"/>
                        <xsl:value-of select="$tab"/>
                        <xsl:value-of select="concat('r(',$quotes,name(),$quotes,'):=')"/>
                        <xsl:value-of select="concat($name,'(i).',name())"/>
                        <xsl:value-of select="$endline"/>

                        <xsl:if test="@desc = 'true'"> 
                            
                            <xsl:call-template name="genComment">
                                <xsl:with-param name="comment" select="concat('column: ',name(),'_desc')"/>
                            </xsl:call-template>

                            <xsl:value-of select="$enter"/>
                            <xsl:value-of select="$enter2tab"/>
                            <xsl:value-of select="$tab"/>
                            <xsl:value-of select="concat('r(',$quotes,name(),'_desc',$quotes,'):=')"/>
                            <xsl:value-of select="concat($name,'(i).',name(),'_desc')"/>
                            <xsl:value-of select="$endline"/>

                        </xsl:if>

                        <xsl:if test="@check = 'true'"> 
                            
                            <xsl:call-template name="genComment">
                                <xsl:with-param name="comment" select="concat('column: ',name(),'_check')"/>
                            </xsl:call-template>

                            <xsl:value-of select="$enter"/>
                            <xsl:value-of select="$enter2tab"/>
                            <xsl:value-of select="$tab"/>
                            <xsl:value-of select="concat('r(',$quotes,name(),'_check',$quotes,'):=')"/>
                            <xsl:value-of select="concat($name,'(i).',name(),'_check')"/>
                            <xsl:value-of select="$endline"/>

                        </xsl:if>

                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$enter"/>
                        <xsl:value-of select="$enter2tab"/>
                        <xsl:value-of select="$tab"/>
                        <xsl:value-of select="concat('IF',$space,'v_',name(),'.count>=i',$space,'THEN')"/>
                            <xsl:value-of select="$enter"/>
                            <xsl:value-of select="$enter2tab"/>
                            <xsl:value-of select="$tab"/>
                            <xsl:value-of select="$tab"/>
                            <xsl:value-of select="concat('r(',$quotes,name(),$quotes,'):=')"/>
                            <xsl:value-of select="concat('v_',name(),'(i)')"/>
                            <xsl:value-of select="$endline"/>
                            <xsl:value-of select="$enter"/>
                            <xsl:value-of select="$enter2tab"/>
                            <xsl:value-of select="$tab"/>
                            <xsl:value-of select="concat('END',$space,'IF')"/>
                            <xsl:value-of select="$endline"/>
                            <xsl:value-of select="$enter"/>
                            <xsl:value-of select="$enter2tab"/>
                            <xsl:value-of select="$tab"/>
                            <xsl:value-of select="concat('IF',$space,'v_',name(),'_desc.count>=i',$space,'THEN')"/>
                                <xsl:value-of select="$enter"/>
                                <xsl:value-of select="$enter2tab"/>
                                <xsl:value-of select="$tab"/>
                                <xsl:value-of select="$tab"/>
                                <xsl:value-of select="concat('r(',$quotes,name(),'_desc',$quotes,'):=')"/>
                                <xsl:value-of select="concat('v_',name(),'_desc(i)')"/>
                                <xsl:value-of select="$endline"/>
                                <xsl:value-of select="$enter"/>
                                <xsl:value-of select="$enter2tab"/>
                                <xsl:value-of select="$tab"/>
                                <xsl:value-of select="concat('END',$space,'IF')"/>
                                <xsl:value-of select="$endline"/>

                            <xsl:if test="@check='true'">
                                <xsl:value-of select="$enter"/>
                                <xsl:value-of select="$enter2tab"/>
                                <xsl:value-of select="$tab"/>
                                <xsl:value-of select="concat('IF',$space,'v_',name(),'_check.count>=i',$space,'THEN')"/>
                                    <xsl:value-of select="$enter"/>
                                    <xsl:value-of select="$enter2tab"/>
                                    <xsl:value-of select="$tab"/>
                                    <xsl:value-of select="$tab"/>
                                    <xsl:value-of select="concat('r(',$quotes,name(),'_check',$quotes,'):=')"/>
                                    <xsl:value-of select="concat('v_',name(),'_check(i)')"/>
                                    <xsl:value-of select="$endline"/>
                                    <xsl:value-of select="$enter"/>
                                    <xsl:value-of select="$enter2tab"/>
                                    <xsl:value-of select="$tab"/>
                                    <xsl:value-of select="concat('END',$space,'IF')"/>
                                    <xsl:value-of select="$endline"/>

                            </xsl:if>

                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:for-each>
                    <xsl:call-template name="genPreserveYourCode">
                        <xsl:with-param name="procName" select="concat('VALUE_',$tag)" />
                    </xsl:call-template>
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$enter2tab"/>
                    <xsl:value-of select="$tab"/>
                    <xsl:value-of select="'t(t.count+1):=r'"/>
                    <xsl:value-of select="$endline"/>
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$enter2tab"/>
                    <xsl:text>END</xsl:text>
                    <xsl:value-of select="$space"/>
                    <xsl:text>LOOP</xsl:text>
                    <xsl:value-of select="$endline"/>
                    <xsl:call-template name="genPreserveYourCode">
                        <xsl:with-param name="procName" select="concat('VALUE_',$tag,'_AFTERLOOP')" />
                    </xsl:call-template>
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$enter2tab"/>
                    <xsl:value-of select="'p:=t'"/>
                    <xsl:value-of select="$endline"/>
                    <xsl:value-of select="$enter"/>
                </xsl:template>

                <xsl:template name="implode">
                    <xsl:param name="items" />
                    <xsl:param name="separator" select="', '" />
                    <xsl:param name="prefix" select="''" />
                    <xsl:param name="sufix" select="''" />
                    <xsl:for-each select="$items">
                        <xsl:if test="position() &gt; 1">
                            <xsl:value-of select="$separator" />
                        </xsl:if>
                        <xsl:value-of select="concat($prefix,name(),$sufix)" />
                    </xsl:for-each>
                </xsl:template>


            </xsl:stylesheet>