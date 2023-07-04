<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--PLSQL Type-->
    <xsl:template name="plsql_type">
        <xsl:param name="type" select="'text'"/>
        <xsl:param name="size" select="'0'"/>
        <xsl:param name="rel" select="''"/>
        <xsl:choose>
            <xsl:when test="$rel!=''">
                <xsl:text>OWA.VC_ARR</xsl:text>
            </xsl:when>
            <xsl:when test="($type='number' or $type='vkb_num' or $type='filter_num')">
                <xsl:text>NUMBER</xsl:text>
            </xsl:when>
            <xsl:when test="$type='date'">
                <xsl:text>DATE</xsl:text>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>VARCHAR2(</xsl:text>
                <xsl:choose>
                    <xsl:when test="$size='0' or $size='' or not($size)">
                        <xsl:value-of select="'30'"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$size"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:text>)</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--LowerCase-->
    <xsl:template name="LowerCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')"/>
    </xsl:template>
    <!--UpperCase-->
    <xsl:template name="UpperCase">
        <xsl:param name="text"/>
        <xsl:value-of select="translate($text, 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ')"/>
    </xsl:template>
    <!--InitCap-->
    <xsl:template name="InitCap">
        <xsl:param name="text"/>
        <xsl:value-of
            select="concat(translate(substring(text, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(text, 2))"
        />
    </xsl:template>
    <!--SanitizeTag-->
    <xsl:template name="sanitizeTag">
        <xsl:param name="tag"/>
        <xsl:call-template name="LowerCase">
            <xsl:with-param name="text" select="translate(translate($tag,' .-','___'),'-\/','')" />
        </xsl:call-template>
    </xsl:template>
    <!--SanitizeNoVogal-->
    <xsl:template name="sanitizeNoVogal">
        <xsl:param name="tag"/>
        <xsl:call-template name="sanitizeTag">
            <xsl:with-param name="tag" select="translate($tag,'aeiouAEIOU','')" />
        </xsl:call-template>
    </xsl:template>
    <!--SanitizeToolbar-->
    <xsl:template name="sanitizeToolbar">
        <xsl:param name="title"/>
        <xsl:param name="selfaction"/>
        <xsl:param name="page"/>
        <xsl:param name="action"/>

        <xsl:call-template name="LowerCase">
            <xsl:with-param name="text" select="@proc_name" />
        </xsl:call-template>

        <!-- <xsl:variable name="v">
            <xsl:choose>
                <xsl:when test="string-length($selfaction) &lt;= 6">
                    <xsl:call-template name="sanitizeTag">
                        <xsl:with-param name="tag" select="$selfaction" />
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="v1">
                        <xsl:call-template name="sanitizeTag">
                            <xsl:with-param name="tag" select="$selfaction" />
                        </xsl:call-template>
                    </xsl:variable>
					<xsl:value-of select="concat(substring(translate($v1,'_',''),1,3),substring(translate($v1,'_',''),string-length(translate($v1,'_',''))-3+1))"/>					
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        
        <xsl:variable name="v_action">
            <xsl:variable name="v_action_1">
                <xsl:choose>
                    <xsl:when test="substring-before($title, ' ')!=''">
                        <xsl:value-of select="substring-before($title, ' ')" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$title" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="sanitizeTag">
                <xsl:with-param name="tag" select="$v_action_1" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="v_action1" select="substring($v_action,1,9)" />

        <xsl:variable name="v_action2">
            <xsl:variable name="v_action2_1">
                <xsl:call-template name="sanitizeTag">
                    <xsl:with-param name="tag" select="substring(translate($page,'_T_',''),1,6)" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="translate(concat(substring(translate($action,'_',''),1,4),'_',substring($v_action2_1,1,20)),'_','')" />
        </xsl:variable>

        <xsl:call-template name="LowerCase">
            <xsl:with-param name="text" select="translate(concat($v_action1,'_',$v,$v_action2),'.','')" />
        </xsl:call-template>  -->

    </xsl:template>
    <xsl:template name="sanitizeToolbar-v1">
        <xsl:param name="title"/>
        <xsl:param name="selfaction"/>
        <xsl:param name="page"/>
        <xsl:param name="action"/>

        <xsl:variable name="v">
            <xsl:choose>
                <xsl:when test="string-length($selfaction) &lt;= 6">
                    <xsl:call-template name="sanitizeTag">
                        <xsl:with-param name="tag" select="$selfaction" />
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:variable name="v1">
                        <xsl:call-template name="sanitizeTag">
                            <xsl:with-param name="tag" select="$selfaction" />
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="concat(substring(translate($v1,'_',''),1,3),substring(translate($v1,'_',''),string-length(translate($v1,'_',''))-3+1))"/>                 
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable> 
        
        <xsl:variable name="v_action">
            <xsl:variable name="v_action_1">
                <xsl:choose>
                    <xsl:when test="substring-before($title, ' ')!=''">
                        <xsl:value-of select="substring-before($title, ' ')" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$title" />
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:variable>
            <xsl:call-template name="sanitizeTag">
                <xsl:with-param name="tag" select="$v_action_1" />
            </xsl:call-template>
        </xsl:variable>

        <xsl:variable name="v_action1" select="substring($v_action,1,9)" />

        <xsl:variable name="v_action2">
            <xsl:variable name="v_action2_1">
                <xsl:call-template name="sanitizeTag">
                    <xsl:with-param name="tag" select="substring(translate($page,'_T_',''),1,6)" />
                </xsl:call-template>
            </xsl:variable>
            <xsl:value-of select="translate(concat(substring(translate($action,'_',''),1,4),'_',substring($v_action2_1,1,20)),'_','')" />
        </xsl:variable>
        
        <xsl:call-template name="LowerCase">
            <xsl:with-param name="text" select="translate(concat($v_action1,'_',$v,$v_action2),'.','')" />
        </xsl:call-template> 

    </xsl:template>
    <!--Generate FIELD Attribute-->
    <xsl:template name="genFieldAttribute">
        <xsl:param name="name"/>
        <xsl:param name="type" select="''"/>
        <xsl:param name="value"/>
        <xsl:param name="with_quotes" select="'true'"/>
        <xsl:param name="with_comma" select="'true'"/>
        <xsl:value-of select="$enter2tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"
        />
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"
        />
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="$tab"/>
        <xsl:value-of select="concat($name,'=>')" />
        <xsl:if test="$with_quotes='true'">
            <xsl:value-of select="$quotes"/>
        </xsl:if>
        <xsl:value-of
            select="$value"/>
        <xsl:if test="$with_quotes='true'">
            <xsl:value-of select="$quotes"/>
        </xsl:if>
        <xsl:if test="$with_comma='true'">
            <xsl:value-of select="$comma"/>
        </xsl:if>
    </xsl:template>
    <!--Gen Type of fields-->
    <xsl:template name="genWhatType">
        <xsl:param name="type"/>
        <xsl:choose>
            <xsl:when test="$type='select' or $type='selectchange' or $type='selectlist' or $type='radiolist' or $type='checkboxlist'">options</xsl:when>
            <xsl:when test="$type='separatorlist' or $type='separatordialog' or $type='list' or $type='formlist'">list</xsl:when>
            <xsl:when test="contains($type,'LOOKUP')">lookup</xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$type"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <!--Gen Type of button-->
    <xsl:template name="genWhatButton">
        <xsl:param name="type"/>
        <xsl:choose>
            <xsl:when test="$type='form'">FRM</xsl:when>
            <xsl:when test="$type='list' or $type='filter'">LST</xsl:when>
            <xsl:when test="$type='tab'">TAB</xsl:when>
            <xsl:when test="contains($type,'context')">CTX</xsl:when>
            <xsl:when test="$type='tbar'">MN</xsl:when>
            <xsl:otherwise>BTN</xsl:otherwise>
        </xsl:choose>
    </xsl:template>


    <!-- TRIM -->
    <xsl:variable name="whitespace" select="'&#09;&#10;&#13; '" />

    <!-- Strips trailing whitespace characters from 'string' -->
    <xsl:template name="string-rtrim">
        <xsl:param name="string" />
        <xsl:param name="trim" select="$whitespace" />

        <xsl:variable name="length" select="string-length($string)" />

        <xsl:if test="$length &gt; 0">
            <xsl:choose>
                <xsl:when test="contains($trim, substring($string, $length, 1))">
                    <xsl:call-template name="string-rtrim">
                        <xsl:with-param name="string" select="substring($string, 1, $length - 1)" />
                        <xsl:with-param name="trim"   select="$trim" />
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$string" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- Strips leading whitespace characters from 'string' -->
    <xsl:template name="string-ltrim">
        <xsl:param name="string" />
        <xsl:param name="trim" select="$whitespace" />

        <xsl:if test="string-length($string) &gt; 0">
            <xsl:choose>
                <xsl:when test="contains($trim, substring($string, 1, 1))">
                    <xsl:call-template name="string-ltrim">
                        <xsl:with-param name="string" select="substring($string, 2)" />
                        <xsl:with-param name="trim"   select="$trim" />
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="$string" />
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <!-- Strips leading and trailing whitespace characters from 'string' -->
    <xsl:template name="string-trim">
        <xsl:param name="string" />
        <xsl:param name="trim" select="$whitespace" />
        <xsl:call-template name="string-rtrim">
            <xsl:with-param name="string">
                <xsl:call-template name="string-ltrim">
                    <xsl:with-param name="string" select="$string" />
                    <xsl:with-param name="trim"   select="$trim" />
                </xsl:call-template>
            </xsl:with-param>
            <xsl:with-param name="trim"   select="$trim" />
        </xsl:call-template>
    </xsl:template>

</xsl:stylesheet>