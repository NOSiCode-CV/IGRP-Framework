<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--Generate SERVICE-->
    <xsl:template name="genHtmlService">
        <xsl:for-each select="$all_toolsbars_html/item">
            <xsl:if test="service">
        
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

                <xsl:variable name="serv_format_error" select="'DBMS_UTILITY.FORMAT_ERROR_BACKTRACE'"/>

                <xsl:value-of select="concat($entertab,$entertab)"/>
                <xsl:value-of select="concat('---FORM_GRAVAR_TBTSTE: - (',$name,')')"/>
                <xsl:value-of select="concat($entertab,$entertab)"/>
                <xsl:value-of select="concat('PROCEDURE form_',$name,'_tbtste')"/>
                <xsl:value-of select="concat($entertab,'IS',$entertab,'BEGIN',$enter2tab,$enter2tab)"/>
                <xsl:text>--Prepara os parametros de formulário</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab,'LOAD',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>--Executa a operação DML</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:variable name="actionDB">
                    <xsl:value-of select="concat(app,'_',page,'_TBTESTE_BD.DML_',$namePorce,'_TBTSTE')"/>
                </xsl:variable>
                
                <xsl:value-of select="concat($pkg_core,'.log_debug(',$quotes,'ACTION DB:',$space,$actionDB,$quotes,')',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:value-of select="concat($actionDB,'(p_page=&gt;V_PAGE',$comma,'p_action=&gt;V_ACTION',$comma,'p_app=&gt;V_APP)',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:text>--Redireciona a página para</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:value-of select="concat($pkg_core,'.GO_TO_PAGE(P_PAGE=&gt;NVL(V_PAGE',$comma,'L_PAGE)',$comma,'P_ACTION=&gt;NVL(V_ACTION',$comma,$quotes,$quotes,')',$comma,'P_APP=&gt;NVL(V_APP',$comma,'L_APP))',$endline)"/>

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>--Tratamento de erro</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>EXCEPTION</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:text>--Verifica se existe erro na validação de dados</xsl:text>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>

                <xsl:value-of select="concat('WHEN',$space,$pkg_core,'.L_EX_VALIDATION',$space,'THEN')"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat($tab,'ROLLBACK',$endline,$enter2tab,$enter2tab,$tab)"/>

                <xsl:value-of select="concat($pkg_core,'.log_debug(',$quotes,'L_EX_VALIDATION:',$space,$quotes,$concat,'SQLERRM',$concat,$quotes,$space,'-',$space,$quotes,$concat,$serv_format_error,')',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>

                <xsl:value-of select="concat($pkg_core,'.load_message',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>

                <xsl:value-of select="concat($pkg_core,'.GO_TO_PAGE(','P_PAGE=&gt;L_PAGE',$comma,'P_ACTION=&gt;',$quotes,'TBTESTE',$quotes,$comma,'P_APP=&gt;L_APP)',$endline)"/>

                <xsl:value-of select="concat($enter2tab,$enter2tab)"/>
                <xsl:value-of select="concat('WHEN',$space,'OTHERS',$space,'THEN')"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>
                <xsl:value-of select="concat('ROLLBACK',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>

                <xsl:value-of select="concat($pkg_core,'.log_debug(',$quotes,'SEVERE:',$space,$quotes,$concat,'SQLERRM',$concat,$quotes,$space,'-',$space,$quotes,$concat,$serv_format_error,')',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>

                <xsl:value-of select="concat($pkg_core,'.messagedmlerror',$endline)"/>
                <xsl:value-of select="concat($enter2tab,$enter2tab,$tab)"/>

                <xsl:value-of select="concat($pkg_core,'.GO_TO_PAGE(','P_PAGE=&gt;L_PAGE',$comma,'P_ACTION=&gt;',$quotes,'TBTESTE',$quotes,$comma,'P_APP=&gt;L_APP)',$endline)"/>

                <xsl:value-of select="concat($entertab,$entertab,'END',$endline)"/>

            </xsl:if>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>