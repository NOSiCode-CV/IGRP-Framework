<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:preserve-space elements="*"/>
    <!--UTILS-->
    <!--Gen cabecalho Package-->
    <xsl:template name="genPackageCab">
        <xsl:param name="packageName"/>
        <xsl:param name="body" select="'true'"/>
        <xsl:param name="replace" select="'true'"/>
        <xsl:text>CREATE</xsl:text>
        <xsl:if test="$replace='true'">
            <xsl:value-of select="$space"/>OR
            <xsl:value-of select="$space"/>REPLACE
        </xsl:if>
        <xsl:value-of select="$enter"/>PACKAGE
        <xsl:value-of select="$space"/>
        <xsl:if
            test="$body='true'">BODY
            <xsl:value-of select="$space"/>
        </xsl:if>
        <xsl:value-of
            select="$packageName"/>
            <xsl:value-of select="$enter"/>IS
            <xsl:value-of select="$enter"/>
            <xsl:value-of select="$enter"/>
            <xsl:value-of select="$enter"/>--------------- RED
            <xsl:value-of select="$enter"/>--------------- IGRP FrameWork
            <xsl:value-of select="$enter"/>--------------- Data:
            <xsl:value-of select="$enter"/>--------------- User:
            <xsl:value-of select="$enter"/>--------------- XSL-Generator
        </xsl:template>
        <!--Gen fim cabecalho Package-->
        <xsl:template name="genPackageEndCab">
            <xsl:param name="packageName" select="''"/>
            <xsl:value-of select="$enter"/>END
            <xsl:value-of select="$endline"/>
            <xsl:value-of select="$enter"/>
            <xsl:value-of select="$end"/>
            <xsl:value-of select="$enter"/>
            <xsl:value-of select="$enter"/>
        </xsl:template>
        <!--Gen cabecalho Procedure-->
        <xsl:template name="genProcedureCab">
            <xsl:param name="procedureName"/>
            <xsl:param name="params" select="''"/>
            <xsl:param name="body" select="'true'"/>
            <xsl:value-of select="$entertab"/>PROCEDURE
            <xsl:value-of select="$space"/>
            <xsl:value-of
                select="$procedureName"/>
                <xsl:if test="$params != ''">(
                    <xsl:value-of select="$params"
                        />)
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="$body='true'">
                            <xsl:value-of select="$entertab"/>IS
                            <xsl:value-of select="$enter"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$endline"/>
                            <xsl:value-of select="$enter"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:template>
                <!--Gen cabecalho Procedure Spec-->
                <xsl:template name="genProcedureSpec">
                    <xsl:param name="procedureName"/>
                    <xsl:param name="params" select="''"/>
                    <xsl:call-template name="genProcedureCab">
                        <xsl:with-param name="procedureName" select="$procedureName"/>
                        <xsl:with-param name="params" select="$params"/>
                        <xsl:with-param name="body" select="'false'"/>
                    </xsl:call-template>
                </xsl:template>
                <!--Gen fim cabecalho Package-->
                <xsl:template name="genProcedureEndCab">
                    <xsl:param name="procedureName"/>
                    <xsl:param name="preserve" select="'false'"/>
                    <xsl:if test="$preserve='true'">
                        <xsl:call-template name="genPreserveYourCode">
                            <xsl:with-param name="procName" select="$procedureName" />
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$entertab"/>END
                    <xsl:value-of select="$space"/>
                    <xsl:value-of select="$procedureName"/>
                    <xsl:value-of select="$endline"/>
                    <xsl:value-of select="$enter"/>
                </xsl:template>
                <!--Comentario PLSQL-->
                <xsl:template name="genComment">
                    <xsl:param name="comment" />
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$enter2tab"/>
                    <xsl:text>------</xsl:text>
                    <xsl:value-of select="$comment"/>
                </xsl:template>
                <xsl:template name="genPreserveYourCode">
                    <xsl:param name="procName" />
                    <xsl:variable name="tag">
                        <xsl:call-template name="UpperCase">
                            <xsl:with-param name="text" select="$procName"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$enter2tab"/>
                    <xsl:text>---#START-</xsl:text>
                    <xsl:value-of select="$tag"/>
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="$enter"/>
                    <xsl:value-of select="$enter2tab"/>
                    <xsl:text>---#END-</xsl:text>
                    <xsl:value-of select="$tag"/>
                    <xsl:text>#</xsl:text>
                    <xsl:value-of select="$enter"/>
                </xsl:template>
            </xsl:stylesheet>