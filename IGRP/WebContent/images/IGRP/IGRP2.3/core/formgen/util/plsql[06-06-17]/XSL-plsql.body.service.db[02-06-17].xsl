<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--Generate SERVICE-->
    <xsl:template name="genDbService">
        <xsl:for-each select="$all_toolsbars_html/item">
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

                <xsl:value-of select="$entertab"/>
                <xsl:value-of select="concat('--- SERVICE',$space,$name,$entertab,$entertab)"/>
                <xsl:text>FUNCTION</xsl:text>
                <xsl:value-of select="concat($space,$namePorce,'_xml',$enter2tab)"/>
                <xsl:text>RETURN</xsl:text>
                <xsl:value-of select="$space"/>
                <xsl:text>CLOB</xsl:text>
                <xsl:value-of select="$entertab"/>
                <xsl:text>IS</xsl:text>
                <xsl:value-of select="$entertab"/>
                <xsl:text>v_xml</xsl:text>
                <xsl:value-of select="$space"/>
                <xsl:text>CLOB:=''</xsl:text>
                <xsl:value-of select="concat($endline,$entertab,$entertab)"/>
                <xsl:text>v_blob_content</xsl:text>
                <xsl:value-of select="$space"/>
                <xsl:text>BLOB</xsl:text>
                <xsl:value-of select="concat($endline,$entertab,$entertab)"/>
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

                <xsl:for-each select="service/request/map">
                    <xsl:text>v_xml:=v_xml||</xsl:text>
                    <xsl:value-of select="concat($quotes,'&lt;',to,'&gt;',$quotes)"/>
                    <!--<xsl:value-of select="concat($concat,$serv_convert,'(',$pkg_core,'.get(',$quotes,'p_',from,$quotes,'))',$concat)"/>-->
                    <xsl:value-of select="concat($concat,$serv_convert,'(tp_record.',from,')',$concat)"/>
                    <xsl:value-of select="concat($quotes,'&lt;',$end,to,'&gt;',$quotes,$endline)"/>
                    <xsl:value-of select="concat($enter2tab,$enter2tab)"/> 
                </xsl:for-each>

                <xsl:text>v_xml:=v_xml||</xsl:text>
                <xsl:value-of select="concat($quotes,'&lt;','/row','&gt;',$quotes)"/>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>v_xml:=v_xml||</xsl:text>
                <xsl:value-of select="concat($quotes,'&lt;','/rows','&gt;',$quotes)"/>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:text>---#START-GRAVAR_XML#</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>---#END-GRAVAR_XML#</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>return v_xml</xsl:text>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="$entertab"/>
                <xsl:text>END</xsl:text>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="concat($entertab,$entertab)"/>

                <xsl:text>PROCEDURE</xsl:text>
                <xsl:value-of select="concat($space,$namePorce,'_parsing(p_xml_response',$space,'CLOB)')"/>
                <xsl:value-of select="$entertab"/>
                <xsl:text>IS</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="concat('myxml',$space,'RED.NOSI_XML_API',$endline)"/>
                <xsl:value-of select="concat($entertab,$entertab)"/>
                <xsl:text>BEGIN</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:value-of select="concat('myxml:=NEW',$space,'RED.NOSI_XML_API(p_xml_response')"/>
                <xsl:value-of select="concat('/*',$serv_convert,'(p_xml_response',$serv_decode,')*/)',$endline)"/>

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('IF',$space,'LOWER(myxml.getitempath(',$quotes,'//row/status',$quotes,'))','=',$quotes,'false',$quotes,$space,'THEN')"/>

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>---#START-GRAVAR_PARSING_ERROR#</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>---#END-GRAVAR_PARSING_ERROR#</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:value-of select="concat($serv_decode,'.messageerror(myxml.getitempath (',$quotes,'//row/status_text',$quotes,'))',$endline)"/>

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>RETURN</xsl:text>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('END',$space,'IF',$endline)"/>

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>---#START-GRAVAR_PARSING_OK#</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>---#END-GRAVAR_PARSING_OK#</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:value-of select="concat('myxml.loadgrupo(',$quotes,'row/lista/row',$quotes,')',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('FOR',$space,'i',$space,'IN',$space,'1..','myxml.totalregistos',$space,'LOOP')"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('myxml.loadregisto(i)',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:for-each select="service/request/map">
                    <xsl:value-of select="concat($pkg_core,'.wf_add(',$quotes,'p_',to,$quotes,$comma,$serv_convert,'(myxml.getitem (',$quotes,from,$quotes,')',$comma,$serv_decode,'))',$endline)"/>
                    <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                </xsl:for-each>

                <xsl:value-of select="concat('END',$space,'LOOP',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>---#START-GRAVAR_PARSING#</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>---#END-GRAVAR_PARSING#</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:text>myxml:=NULL</xsl:text>
                <xsl:value-of select="$endline"/>
                <xsl:value-of select="$entertab"/>
                <xsl:value-of select="concat('END',$endline)"/>

                <xsl:value-of select="concat($entertab,$entertab)"/>

                <xsl:value-of select="concat('---DML_GRAVAR_TBTSTE: - (',$name,')')"/>
                <xsl:value-of select="concat($entertab,$entertab)"/>

                <xsl:value-of select="concat('PROCEDURE dml_',$name,'_tbtste')"/>
                <xsl:text>(p_page   OUT VARCHAR2, p_action  OUT VARCHAR2, p_app OUT VARCHAR2)</xsl:text>
                <xsl:value-of select="concat($entertab,'IS',$entertab,'BEGIN',$enter2tab,$enter2tab)"/>
                <xsl:text>--TODO: put you code here</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab,'REDGLOBAL.GLB_CORE.set_action(p_action=&gt;',$quotes,title,$quotes,')',$endline,$enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('p_app:=',$quotes,app,$quotes,$endline,$enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('p_page:=',$quotes,page,$quotes,$endline,$enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('p_action:=',$quotes,'TBTESTE',$quotes,$endline,$entertab)"/>

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>---#START-GRAVAR_TBTSTE#</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>---#END-GRAVAR_TBTSTE#</xsl:text>
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

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>---#START-RESPGRAVAR_TBTSTE#</xsl:text>
                <xsl:value-of select="$enter2tab"/>
                <xsl:text>---#END-RESPGRAVAR_TBTSTE#</xsl:text>
                <xsl:value-of select="concat($entertab,$entertab)"/>
                <xsl:value-of select="concat('END',$endline)"/>

            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>