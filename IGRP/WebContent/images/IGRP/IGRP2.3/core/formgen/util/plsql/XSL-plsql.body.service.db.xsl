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

            <xsl:variable name="namePorce">
                <xsl:call-template name="UpperCase">
                    <xsl:with-param name="text" select="title" />
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="servCode" select="service/@code"/>
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
            <xsl:value-of select="concat($entertab,$tab)"/>
            <xsl:text>v_xml</xsl:text>
            <xsl:value-of select="$space"/>
            <xsl:text>CLOB:=''</xsl:text>
            <xsl:value-of select="concat($endline,$entertab,$entertab,$tab)"/>
            <xsl:text>v_blob_content</xsl:text>
            <xsl:value-of select="$space"/>
            <xsl:text>BLOB</xsl:text>
            <xsl:value-of select="concat($endline,$entertab,$entertab,$tab)"/>
            <xsl:text>v_mime_type</xsl:text>
            <xsl:value-of select="$space"/>
            <xsl:text>VARCHAR2(100)</xsl:text>
            <xsl:value-of select="concat($endline,$enter,$entertab,$entertab)"/>
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
                                <xsl:value-of select="concat($concat,$serv_convert,'(tp_record.',@from,')',$concat)"/>
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
                            <xsl:for-each select="row">
                                <xsl:variable name="vname">
                                    <xsl:choose>
                                        <xsl:when test="@from != ''"><xsl:value-of select="@from"/></xsl:when>
                                        <xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab,$tab)"/>
                                <xsl:value-of select="concat($pkg_core,'.get_array(',$quotes,'p_',$vname,'_fk',$quotes,').COUNT',$comma)"/>
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
                                <xsl:value-of select="$tab"/>
                                <xsl:text>v_xml:=v_xml||</xsl:text>
                                <xsl:value-of select="concat($quotes,'&lt;',text(),'&gt;',$quotes,'||',$serv_convert)"/>
                                <xsl:value-of select="concat('((CASE WHEN',$space,$pkg_core,'.get_array(',$quotes,'p_',$vname,'_fk',$quotes,')')"/>
                                <xsl:value-of select="concat('.COUNT &lt;= I THEN',$space,$pkg_core,'.get_array(',$quotes,'p_',$vname,'_fk',$quotes,')')"/>
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
            <xsl:value-of select="concat('myxml',$space,'RED.NOSI_XML_API',$endline)"/>
            <xsl:value-of select="concat($entertab,$entertab)"/>
            <xsl:text>BEGIN</xsl:text>
            <xsl:value-of select="$enter2tab"/>
            <xsl:value-of select="concat('myxml := NEW',$space,'RED.NOSI_XML_API(p_xml_response')"/>
            <xsl:value-of select="concat('/*',$serv_convert,'(p_xml_response',$comma,$space,$serv_decode,')*/)',$endline)"/>

            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
            <xsl:value-of select="concat('IF',$space,'LOWER(myxml.getitempath(',$quotes,'//row/status',$quotes,'))','=',$quotes,'false',$quotes,$space,'THEN')"/>

            <xsl:call-template name="genPreserveYourCode">
                <xsl:with-param name="procName" select="concat($namePorce,'_ERROR')" />
            </xsl:call-template>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($serv_decode,'.messageerror(myxml.getitempath (',$quotes,'//row/status_text',$quotes,'))',$endline)"/>

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
                        <xsl:variable name="vname">
                            <xsl:choose>
                                <xsl:when test="@to != ''"><xsl:value-of select="@to"/></xsl:when>
                                <xsl:otherwise><xsl:value-of select="text()"/></xsl:otherwise>
                            </xsl:choose>
                        </xsl:variable>
                        <xsl:value-of select="concat($pkg_core,'.add(',$quotes,'p_',$vname,$quotes,$comma,$serv_convert,'(myxml.getitempath (',$quotes,'/rows/row/',text(),$quotes,')',$comma,$serv_decode,'))',$endline)"/>
                        <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:if test="count(row) &gt; 0">
                            <xsl:value-of select="concat('myxml.loadgrupo(',$quotes,'row/',@rel,'/row',$quotes,')',$endline)"/>
                            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                            
                            <xsl:choose>
                                <xsl:when test="@type != 'formlist'">
                                    <xsl:variable name="parentTag" select="@rel"/>
                                    <xsl:value-of select="concat('tbl_',$parentTag,'.delete',$endline)"/>
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

                                        <xsl:value-of select="concat($tab,'tbl_',$parentTag,'(i).',text(),' := ',$serv_convert)"/>
                                        <xsl:value-of select="concat('(myxml.getitem(',$quotes,$itemTag,$quotes,')',$comma,$serv_decode,')',$endline)"/> 
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
                                                <xsl:value-of select="concat($tab,'v_',@to,'(v_',@to,'.count+1):=',$serv_convert)"/>
                                                <xsl:value-of select="concat('(myxml.getitem(',$quotes,text(),$quotes,')',$comma,$serv_decode,')',$endline)"/>
                                                <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>
                                                <xsl:value-of select="concat($tab,'v_',@to,'_desc','(v_',@to,'_desc','.count+1):=',$serv_convert)"/>
                                                <xsl:value-of select="concat('(myxml.getitem(',$quotes,text(),$quotes,')',$comma,$serv_decode,')',$endline)"/>
                                                <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="concat($tab,$pkg_core,'.wf_add(',$quotes,'p_',text(),'_fk',$quotes,$comma,$serv_convert,'(myxml.getitem (',$quotes,text(),$quotes,')',$comma,$serv_decode,'))',$endline)"/>
                                                <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>
                                                <xsl:value-of select="concat($tab,$pkg_core,'.wf_add(',$quotes,'p_',text(),'_fk_desc',$quotes,$comma,$serv_convert,'(myxml.getitem (',$quotes,text(),$quotes,')',$comma,$serv_decode,'))',$endline)"/>
                                                <xsl:value-of select="concat($tab,$enter2tab,$enter2tab)"/>
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
            <xsl:variable name="namePorce">
                <xsl:call-template name="UpperCase">
                    <xsl:with-param name="text" select="title" />
                </xsl:call-template>
            </xsl:variable>

            <xsl:variable name="servCode" select="service/@code"/>

            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
            
            <xsl:value-of select="concat($namePorce,'_parsing(',$pkg_core,'.invoke_biztalk(')"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_code_client=&gt;',$pkg_core,'.get_biztalk_client(',$quotes,$servCode,$quotes,')',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_code_contract=&gt;',$pkg_core,'.get_biztalk_contract(',$quotes,$servCode,$quotes,')',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_user_data=&gt;NVL(K_LOCAL_USERDATA',$comma,$quotes,app,$quotes,')',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_code_service=&gt;',$quotes,$servCode,$quotes,$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_session_id=&gt;',$pkg_core,'.get_session_id',$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_function_name=&gt;',$quotes,'REDGLOBAL.BIZ_SERV_',$servCode,'.SERV_',$servCode,$quotes,$comma)"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

            <xsl:value-of select="concat($tab,'p_xml_request=&gt;',$namePorce,'_xml')"/>
            <xsl:value-of select="concat($enter2tab,$enter2tab,'))',$endline)"/>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>