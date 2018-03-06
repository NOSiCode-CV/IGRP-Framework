<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--Generate LOAD GROUP-->
    <xsl:template name="genBodyLoad">
        <xsl:variable name="procName" select="'LOAD'" />
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$entertab"/>
        <xsl:text>-----</xsl:text>
        <xsl:value-of  select="concat($procName,': load parameters')"/>
        <xsl:call-template name="genProcedureCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
        <xsl:value-of select="$entertab"/>
        <xsl:text>BEGIN</xsl:text>
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'load simple type'"/>
        </xsl:call-template>
        
        <xsl:for-each select="$all_fields">

            <xsl:variable name="tag">
                <xsl:choose>
                    <xsl:when test="@type = 'hidden'">
                        <xsl:value-of select="@tag"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="name()"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
        
            <xsl:call-template name="genLoadParameter">
                <xsl:with-param name="tag" select="$tag"/>
                <xsl:with-param name="type" select="@type"/>
            </xsl:call-template>

        </xsl:for-each>
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'------------------------------------------------------------------------------------------------------'"/>
        </xsl:call-template>
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="'load complex type'"/>
        </xsl:call-template>
        <xsl:for-each select="$all_fields_group">
            <xsl:call-template name="genLoadArrayParameter">
                <xsl:with-param name="tag" select="concat(name(),'_id')"/>
                <xsl:with-param name="type" select="@type"/>
                <xsl:with-param name="rel" select="''"/>
            </xsl:call-template>
            <xsl:call-template name="genLoadArrayParameter">
                <xsl:with-param name="tag" select="concat(name(),'_del')"/>
                <xsl:with-param name="type" select="@type"/>
                <xsl:with-param name="rel" select="''"/>
            </xsl:call-template>
        </xsl:for-each>

        <xsl:for-each select="$all_fields_array">
            <xsl:call-template name="genLoadArrayParameter">
                <xsl:with-param name="tag" select="name()"/>
                <xsl:with-param name="type" select="@type"/>
                <xsl:with-param name="rel" select="'_fk'"/>
            </xsl:call-template>
            <xsl:call-template name="genLoadArrayParameter">
                <xsl:with-param name="tag" select="concat(name(),'_desc')"/>
                <xsl:with-param name="type" select="@type"/>
                <xsl:with-param name="getArray" select="concat('p_',name(),'_fk_desc')"/>
            </xsl:call-template>

        </xsl:for-each>
        <xsl:call-template name="genProcedureEndCab">
            <xsl:with-param name="procedureName" select="$procName"/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template name="genLoadParameter">
        <xsl:param name="tag" />
        <xsl:param name="type" />
        <xsl:variable name="whattype">
            <xsl:call-template name="plsql_type">
                <xsl:with-param name="type" select="$type"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="isPersist" select="@persist='true'"/>

        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="concat('column: ',$tag)"/>
        </xsl:call-template>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>BEGIN</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$packageDBName"/>
        <xsl:text>.tp_record.</xsl:text>
        <xsl:value-of select="$tag"/>

        <xsl:text>:=NVL(</xsl:text>

        <xsl:if test="$isPersist">NVL(</xsl:if>
        
        <xsl:if test="$whattype='DATE'">
            <xsl:text>TO_DATE(</xsl:text>
        </xsl:if>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.get(</xsl:text>
        <xsl:value-of select="$quotes"/>
        <xsl:value-of select="concat('p_',$tag)"/>
        <xsl:value-of select="$quotes"/>
        <xsl:text>)</xsl:text>
        <xsl:if test="$whattype='DATE'">
            <xsl:value-of select="$comma"/>
            <xsl:value-of select="$quotes"/>
            <xsl:value-of select="$date_format"/>
            <xsl:value-of select="$quotes"/>
            <xsl:text>)</xsl:text>
        </xsl:if>
        <xsl:value-of select="$comma"/>
        <xsl:value-of select="$packageDBName"/>
        <xsl:text>.tp_record.</xsl:text>
        <xsl:value-of select="$tag"/>
        <xsl:text>)</xsl:text>

        <xsl:if test="$isPersist">,'<xsl:value-of select="value"/>')</xsl:if>

        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>EXCEPTION</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>WHEN</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:value-of select="$error_others"/>
        <xsl:value-of select="$space"/>
        <xsl:text>THEN</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:text>NULL</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>END</xsl:text>
        <xsl:value-of select="$endline"/>
    </xsl:template>
    <xsl:template name="genLoadArrayParameter">
        <xsl:param name="tag" />
        <xsl:param name="type" />
        <xsl:param name="rel" select="''"/>
        <xsl:param name="getArray" select="''"/>
        <xsl:variable name="name" select="concat('v_',$tag)" />
        
        <xsl:call-template name="genComment">
            <xsl:with-param name="comment" select="concat('column: ',$tag)"/>
        </xsl:call-template>

        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>IF</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:value-of select="concat($packageDBName,'.',$name,'.COUNT=0')"/>
        <xsl:value-of select="$space"/>
        <xsl:text>THEN</xsl:text>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="concat($packageDBName,'.',$name)"/>
        <xsl:text>:=</xsl:text>
        <xsl:value-of select="$pkg_core"/>
        <xsl:text>.get_array(</xsl:text>
        <xsl:value-of select="$quotes"/>
        
        <xsl:choose>
            <xsl:when test="$getArray != ''"><xsl:value-of select="$getArray"/></xsl:when>
            <xsl:otherwise><xsl:value-of select="concat('p_',$tag, $rel)"/></xsl:otherwise>
        </xsl:choose>

        <xsl:value-of select="$quotes"/>
        <xsl:text>)</xsl:text>
        <xsl:value-of select="$endline"/>
        <xsl:value-of select="$enter"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:text>END</xsl:text>
        <xsl:value-of select="$space"/>
        <xsl:text>IF</xsl:text>
        <xsl:value-of select="$endline"/>
    </xsl:template>
</xsl:stylesheet>