<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema">
    <xsl:preserve-space elements="*"/>
    <!--Generate SERVICE-->
    <xsl:template name="genDbService">
        <xsl:if test="service">
            <xsl:variable name="request_serv" select="service/request"/>
            <xsl:variable name="response_serv" select="service/response"/>

            <xsl:variable name="name">
                <xsl:call-template name="LowerCase">
                    <xsl:with-param name="text" select="title" />
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="relName">
                <xsl:choose>
                    <xsl:when test="@rel">
                        <xsl:value-of select="@rel"/>
                    </xsl:when>
                    <xsl:otherwise>page</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="namePorce">
                <xsl:call-template name="UpperCase">
                    <xsl:with-param name="text" select="$relName" />
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="servCode" select="service/@code"/>

            <xsl:variable name="packageName">
                <xsl:choose>
                    <xsl:when test="service/response/@package and service/response/@package != ''">
                       <xsl:value-of select="concat(service/response/@package,'.')"/> 
                    </xsl:when>
                    <xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <!--REQUEST-->
            <xsl:value-of select="$entertab"/>
            <xsl:value-of select="concat('--- SERVICE',$space,$namePorce,$entertab,$entertab)"/>
            <xsl:text>FUNCTION</xsl:text>
            <xsl:value-of select="concat($space,$namePorce,'_xml',$enter2tab)"/>
            <xsl:text>RETURN</xsl:text>
            <xsl:value-of select="$space"/>
            <xsl:text>CLOB</xsl:text>
            <xsl:value-of select="$entertab"/>
            <xsl:text>IS</xsl:text>
            <xsl:value-of select="$enter2tab"/>
            <xsl:text>v_xml</xsl:text>
            <xsl:value-of select="$space"/>
            <xsl:text>CLOB:=''</xsl:text>
            <xsl:value-of select="concat($endline,$enter2tab,$tab)"/>
            <xsl:text>v_blob_content</xsl:text>
            <xsl:value-of select="$space"/>
            <xsl:text>BLOB</xsl:text>
            <xsl:value-of select="concat($endline,$enter2tab,$tab)"/>
            <xsl:text>v_mime_type</xsl:text>
            <xsl:value-of select="$space"/>
            <xsl:text>VARCHAR2(100)</xsl:text>
            <xsl:value-of select="concat($endline,$enter,$enter2tab)"/>
            <xsl:text>BEGIN</xsl:text>
            <xsl:value-of select="$enter2tab"/>
            <xsl:text>v_xml:=v_xml||</xsl:text>
            <xsl:value-of select="concat($quotes,'&lt;','rows','&gt;',$quotes)"/>
            <xsl:value-of select="concat($endline,$enter2tab,$enter2tab)"/>
            <xsl:text>v_xml:=v_xml||</xsl:text>
            <xsl:value-of select="concat($quotes,'&lt;','row','&gt;',$quotes)"/>
            <xsl:value-of select="concat($endline,$enter2tab,$enter2tab)"/>
            <xsl:text>v_xml:=v_xml||</xsl:text>
            <xsl:value-of select="concat($quotes,'&lt;','mimetype','&gt;')"/>
            <xsl:text>xml</xsl:text>
            <xsl:value-of select="concat('&lt;','/mimetype','&gt;',$quotes)"/>
            <xsl:value-of select="concat($endline,$enter2tab,$enter2tab)"/>

            <xsl:for-each select="service/request/item">
                <xsl:text>v_xml:=v_xml||</xsl:text>
                <xsl:choose>
                    <xsl:when test="not(@structure) or @structure != 'list'">
                        <xsl:value-of select="concat($quotes,'&lt;',text(),'&gt;',$quotes)"/>
                        <xsl:choose>
                            <xsl:when test="@from and @from != ''">
                                <xsl:choose>
                                    <xsl:when test="@type = 'date'">
                                        <xsl:value-of select="concat($concat,'TO_CHAR(tp_record.',@from,$comma,$quotes,$date_format,$quotes,')',$concat)"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="concat($concat,$serv_convert,'(tp_record.',@from,')',$concat)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="concat($concat,$serv_convert,'(',$pkg_core,'.get(',$quotes,'p_',text(),$quotes,'))',$concat)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                        <xsl:value-of select="concat($quotes,'&lt;',$end,text(),'&gt;',$quotes,$endline)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="count(row) &gt; 0">
                            <xsl:value-of select="concat($quotes,'&lt;',@rel,'&gt;',$quotes,$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                            <xsl:value-of select="concat('DECLARE',$enter2tab,$tab,'v_total',$space,'NUMBER := 0',$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                            <xsl:value-of select="concat('BEGIN',$enter2tab,$enter2tab,$tab)"/>
                            <xsl:value-of select="'v_total:=GREATEST('"/>

                            <xsl:variable name="tagSep">
                                <xsl:choose>
                                    <xsl:when test="@from != ''"><xsl:value-of select="@from"/></xsl:when>
                                    <xsl:otherwise><xsl:value-of select="''"/></xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>

                            <xsl:for-each select="row">
                                <xsl:variable name="vname">
                                    <xsl:choose>
                                        <xsl:when test="@from != ''"><xsl:value-of select="@from"/></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>

                                <xsl:variable name="vfname">
                                    <xsl:choose>
                                        <xsl:when test="not(substring($vname,(string-length($vname)-7),8) =  '_fk_desc')">
                                            <xsl:choose>
                                                <xsl:when test="$tagSep != '' and (concat($tagSep,'_id') = $vname or concat($tagSep,'_del') = $vname)">
                                                    <xsl:value-of select="$vname"/>
                                                </xsl:when>
                                                <xsl:otherwise><xsl:value-of select="concat($vname,'_fk')"/></xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise><xsl:value-of select="$vname"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>

                                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab,$tab)"/>
                                <xsl:value-of select="concat($pkg_core,'.get_array(',$quotes,'p_',$vfname,$quotes,').COUNT',$comma)"/>
                            </xsl:for-each>
                            <xsl:value-of select="concat($enter2tab,$enter2tab,$tab,'1)',$endline,$enter2tab,$enter2tab)"/>

                            <xsl:value-of select="concat($tab,'FOR',$space,'I',$space,'IN',$space,'1..v_total',$space,'LOOP')"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab,$tab,$tab)"/>
                            <xsl:value-of select="concat('v_xml:=v_xml||',$quotes,'&lt;row&gt;',$quotes,$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab,$tab,$tab)"/>
                            
                            <xsl:for-each select="row">
                                <xsl:variable name="vname">
                                    <xsl:choose>
                                        <xsl:when test="@from != ''"><xsl:value-of select="@from"/></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>

                                <xsl:variable name="vfname">
                                    <xsl:choose>
                                        <xsl:when test="not(substring($vname,(string-length($vname)-7),8) =  '_fk_desc')">
                                            <xsl:choose>
                                                <xsl:when test="$tagSep != '' and (concat($tagSep,'_id') = $vname or concat($tagSep,'_del') = $vname)">
                                                    <xsl:value-of select="$vname"/>
                                                </xsl:when>
                                                <xsl:otherwise><xsl:value-of select="concat($vname,'_fk')"/></xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise><xsl:value-of select="$vname"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="$tab"/>
                                <xsl:text>v_xml:=v_xml||</xsl:text>
                                <xsl:value-of select="concat($quotes,'&lt;',text(),'&gt;',$quotes,'||',$serv_convert)"/>
                                <xsl:value-of select="concat('((CASE WHEN',$space,$pkg_core,'.get_array(',$quotes,'p_',$vfname,$quotes,')')"/>
                                <xsl:value-of select="concat('.COUNT &gt;= I THEN',$space,$pkg_core,'.get_array(',$quotes,'p_',$vfname,$quotes,')')"/>
                                <xsl:value-of select="concat('(i) ELSE',$space,$pkg_core,'.get(',$quotes,'p_',$vname,$quotes,')',$space,'END))||')"/>
                                <xsl:value-of select="concat($quotes,'&lt;',$end,text(),'&gt;',$quotes,$endline)"/>
                                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab,$tab)"/>
                            </xsl:for-each>
                            <xsl:value-of select="concat('v_xml:=v_xml||',$quotes,'&lt;',$end,'row&gt;',$quotes,$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab,$tab,'END',$space,'LOOP',$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab,'END',$endline,$enter2tab,$enter2tab)"/>
                            <xsl:value-of select="concat('v_xml:=v_xml||',$quotes,'&lt;',$end,@rel,'&gt;',$quotes,$endline)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
            </xsl:for-each>

            <xsl:text>v_xml:=v_xml||</xsl:text>
            <xsl:value-of select="concat($quotes,'&lt;','/row','&gt;',$quotes)"/>
            <xsl:value-of select="$endline"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
            <xsl:text>v_xml:=v_xml||</xsl:text>
            <xsl:value-of select="concat($quotes,'&lt;','/rows','&gt;',$quotes)"/>
            <xsl:value-of select="$endline"/>
            
            <xsl:call-template name="genPreserveYourCode">
                <xsl:with-param name="procName" select="concat($namePorce,'_XML')" />
            </xsl:call-template>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:text>return v_xml</xsl:text>
            <xsl:value-of select="$endline"/>
            <xsl:value-of select="$entertab"/>
            <xsl:text>END</xsl:text>
            <xsl:value-of select="$endline"/>
            <xsl:value-of select="concat($entertab,$entertab,$entertab,$entertab)"/>

            <!--PARSING-->

            <xsl:text>PROCEDURE</xsl:text>
            <xsl:value-of select="concat($space,$namePorce,'_parsing(p_xml_response',$space,'CLOB)')"/>
            <xsl:value-of select="$entertab"/>
            <xsl:text>IS</xsl:text>
            <xsl:value-of select="$enter2tab"/>
            <xsl:value-of select="concat('myxml',$space,$xml_api,$endline)"/>
            <xsl:value-of select="concat($entertab,$entertab)"/>
            <xsl:text>BEGIN</xsl:text>
            <xsl:value-of select="$enter2tab"/>
            <xsl:value-of select="concat('myxml := NEW',$space,$xml_api,'(p_xml_response')"/>
            <xsl:value-of select="concat('/*',$serv_convert,'(p_xml_response',$comma,$space,$serv_decode,')*/)',$endline)"/>

            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
            <xsl:value-of select="concat('IF',$space,'LOWER(myxml.getitempath(',$quotes,'//row/status',$quotes,'))','=',$quotes,'false',$quotes,$space,'THEN')"/>

            <xsl:call-template name="genPreserveYourCode">
                <xsl:with-param name="procName" select="concat($namePorce,'_ERROR')" />
            </xsl:call-template>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($pkg_core,'.messageerror(',$serv_convert,'(myxml.getitempath (',$quotes,'//row/status_text',$quotes,')',$comma,$space,$serv_decode,'))',$endline)"/>

            <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>
            <xsl:text>RETURN</xsl:text>
            <xsl:value-of select="$endline"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
            <xsl:value-of select="concat('END',$space,'IF',$endline)"/>

            <xsl:call-template name="genPreserveYourCode">
                <xsl:with-param name="procName" select="concat($namePorce,'_PARSING_OK')" />
            </xsl:call-template>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:for-each select="service/response/item">
                <xsl:choose>
                    <xsl:when test="not(@structure) or @structure != 'list'">
                        <xsl:if test="@to != ''">
                            <xsl:variable name="vname">
                                <xsl:choose>
                                    <xsl:when test="@to != ''"><xsl:value-of select="@to"/></xsl:when>
                                    <xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>

                            <xsl:value-of select="concat($pkg_core,'.add(',$quotes,'p_',text(),$quotes,$comma,$serv_convert,'(myxml.getitempath (',$quotes,'/rows/row/',$vname,$quotes,')',$comma,$serv_decode,'))',$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="count(row) &gt; 0">
                            <xsl:variable name="tagList">
                                <xsl:choose>
                                    <xsl:when test="@to and @to != ''"><xsl:value-of select="@to"/></xsl:when>
                                    <xsl:otherwise>table</xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:value-of select="concat('myxml.loadgrupo(',$quotes,'row/',$tagList,'/row',$quotes,')',$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                            
                            <xsl:choose>
                                <xsl:when test="@type = 'table'">
                                    <xsl:variable name="parentTag" select="@rel"/>
                                    <xsl:value-of select="concat($packageName,'tbl_',$parentTag,'.delete',$endline)"/>
                                    <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                                    <xsl:value-of select="concat('FOR',$space,'i',$space,'IN',$space,'1..','myxml.totalregistos',$space,'LOOP')"/>
                                    <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>
                                    <xsl:value-of select="concat('myxml.loadregisto(i)',$endline)"/>
                                    <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                                    <xsl:for-each select="row">
                                        <xsl:variable name="itemTag">
                                            <xsl:choose>
                                                <xsl:when test="@to != ''"><xsl:value-of select="@to"/></xsl:when>
                                                <xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:variable>

                                        <xsl:value-of select="concat($tab,$packageName,'tbl_',$parentTag,'(i).',text(),' := ')"/>
                                        <xsl:choose>
                                            <xsl:when test="@type = 'date'">
                                                <xsl:value-of select="concat('TO_DATE(myxml.getitem(',$quotes,$itemTag,$quotes,')',$comma,$quotes,$date_format,$quotes,')',$endline)"/> 
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat($serv_convert,'(myxml.getitem(',$quotes,$itemTag,$quotes,')',$comma,$serv_decode,')',$endline)"/> 
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="concat('FOR',$space,'i',$space,'IN',$space,'1..','myxml.totalregistos',$space,'LOOP')"/>
                                    <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>
                                    <xsl:value-of select="concat('myxml.loadregisto(i)',$endline)"/>
                                    <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                                    <xsl:for-each select="row">
                                        <xsl:choose>
                                            <xsl:when test="@to != ''">
                                                <xsl:variable name="xname">
                                                    <xsl:choose>
                                                        <xsl:when test="not(substring(text(),(string-length(text())-7),8) =  '_fk_desc')">
                                                           <xsl:value-of select="text()"/> 
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="concat(substring-before(text(),'_fk_desc'),'_desc')"/>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </xsl:variable>
                                                
                                                <xsl:value-of select="concat($tab,$packageName,'v_',$xname,'(',$packageName,'v_',$xname,'.count+1):=',$serv_convert)"/>
                                                <xsl:value-of select="concat('(myxml.getitem(',$quotes,@to,$quotes,')',$comma,$serv_decode,')',$endline)"/>
                                                <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>
                                                
                                                <!--<xsl:if test="not(substring(text(),(string-length(text())-7),8) =  '_fk_desc')">
                                                    <xsl:value-of select="concat($tab,$packageName,'v_',@to,'_desc','(v_',@to,'_desc','.count+1):=',$serv_convert)"/>
                                                    <xsl:value-of select="concat('(myxml.getitem(',$quotes,text(),$quotes,')',$comma,$serv_decode,')',$endline)"/>
                                                    <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>
                                                </xsl:if>-->
                                                
                                            </xsl:when>
                                            <xsl:otherwise>

                                                <xsl:if test="not(substring(text(),(string-length(text())-7),8) =  '_fk_desc')">
                                                    <xsl:value-of select="concat($tab,$pkg_core,'.wf_add(',$quotes,'p_',text(),'_fk',$quotes,$comma,$serv_convert,'(myxml.getitem (',$quotes,text(),$quotes,')',$comma,$serv_decode,'))',$endline)"/>
                                                    <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>

                                                    <xsl:value-of select="concat($tab,$pkg_core,'.wf_add(',$quotes,'p_',text(),'_fk_desc',$quotes,$comma,$serv_convert,'(myxml.getitem (',$quotes,text(),$quotes,')',$comma,$serv_decode,'))',$endline)"/>
                                                    <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/> 
                                                </xsl:if>

                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:value-of select="concat('END',$space,'LOOP',$endline,$enter2tab,$enter2tab)"/>
                        </xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            
            <xsl:call-template name="genPreserveYourCode">
                <xsl:with-param name="procName" select="concat($namePorce,'_PARSING')" />
            </xsl:call-template>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:text>myxml:=NULL</xsl:text>
            <xsl:value-of select="$endline"/>
            <xsl:value-of select="$entertab"/>
            <xsl:value-of select="concat('END',$endline)"/>

            <xsl:value-of select="concat($entertab,$entertab)"/>
        </xsl:if>
    </xsl:template>


    <xsl:template name="genDmlService">
        <xsl:if test="service">

            <xsl:variable name="relName">
                <xsl:choose>
                    <xsl:when test="@rel">
                        <xsl:value-of select="@rel"/>
                    </xsl:when>
                    <xsl:otherwise>page</xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="namePorce">
                <xsl:call-template name="UpperCase">
                    <xsl:with-param name="text" select="$relName" />
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="localUserData">
                <xsl:choose>
                    <xsl:when test="@rel">
                        <xsl:value-of select="app"/>
                    </xsl:when>
                    <xsl:otherwise><xsl:value-of select="//rows/app"/></xsl:otherwise>
                </xsl:choose>
            </xsl:variable>

            <xsl:variable name="servCode" select="service/@code"/>

            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
            
            <xsl:value-of select="concat($namePorce,'_parsing(',$pkg_core,'.invoke_biztalk(')"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_code_client=&gt;',$pkg_core,'.get_biztalk_client(',$quotes,$servCode,$quotes,')',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_code_contract=&gt;',$pkg_core,'.get_biztalk_contract(',$quotes,$servCode,$quotes,')',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_user_data=&gt;NVL(K_LOCAL_USERDATA',$comma,$quotes,$localUserData,$quotes,')',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_code_service=&gt;',$quotes,$servCode,$quotes,$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_session_id=&gt;',$pkg_core,'.get_session_id',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <!--<xsl:value-of select="concat($tab,'p_function_name=&gt;',$quotes,'REDGLOBAL.BIZ_SERV_',$servCode,'.SERV_',$servCode,$quotes,$comma)"/>-->
            <xsl:value-of select="concat($tab,'p_function_name=&gt;',$quotes,service/@proc,$quotes,$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_xml_request=&gt;',$namePorce,'_xml')"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab,'))',$endline)"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>