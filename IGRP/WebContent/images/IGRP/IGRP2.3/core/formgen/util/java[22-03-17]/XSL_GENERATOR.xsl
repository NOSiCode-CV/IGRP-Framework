<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:xdb="http://xmlns.oracle.com/xdb" >

    <xsl:output method="text" encoding="UTF-8" indent="yes" />
    <!--Variable Declaration-->
    <xsl:include href="XSL_JAVA_CONSTANT.xsl" />
    <xsl:include href="XSL_JAVA_FIELD.xsl" />
    <xsl:include href="XSL_JAVA_CONTEXT-MENU.xsl" />
    <xsl:include href="XSL_JAVA_TOOLSBAR.xsl" />
    <xsl:include href="XSL_JAVA_VIEW.xsl" />
	<xsl:include href="XSL_JAVA_FORM.xsl" />
	<xsl:include href="XSL_JAVA_TABLE.xsl" />
   
    <!-- ============================Main Generate View===================================-->
    <xsl:template match="/">
		<xsl:call-template name="startOf">
			<xsl:with-param name="value">
				<xsl:text> VIEW</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$enter" />
    	<xsl:text>package xpto;</xsl:text>
    	<xsl:value-of select="$enter" />
		<xsl:text>import java.util.ArrayList;
	import java.util.HashMap;
	import nosi.igrp.helper.Field;</xsl:text>
		<xsl:value-of select="$enter" />
    	<!--Main of genarator (Rows element)-->
    	<xsl:value-of select="$initClass" /> 
    	<xsl:value-of select="$space" />
    	<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>PageTeste page;</xsl:text>
		
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>Cliente model;</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		
		<xsl:for-each select="//fields/*">
			<xsl:text>public Field</xsl:text>
			<xsl:value-of select="$space" />
			<xsl:value-of select="name()" />;
		</xsl:for-each>
		
		<!-- Toolbars declaration -->
		<xsl:for-each select="rows/content/*[@type = 'toolsbar']">
			<xsl:variable name="j" select="position()" />
			<xsl:for-each select="item">
				<xsl:variable name="i" select="position()" />
				<xsl:text>public Toolbar pageToolbar</xsl:text>
				<xsl:value-of select="$j" />
				<xsl:text>Item</xsl:text>
				<xsl:value-of select="$i" />;
			</xsl:for-each>
		</xsl:for-each>
		<!-- Form Toolbars declaration -->
		<xsl:for-each select="rows/content/*[@type='form']">
			<xsl:variable name="j" select="position()" />
			<xsl:for-each select="tools-bar/item">
				<xsl:variable name="i" select="position()" />
				<xsl:text>public Toolbar form</xsl:text>
				<xsl:value-of select="$j" />
				<xsl:text>ToolbarItem</xsl:text>
				<xsl:value-of select="$i" />;
			</xsl:for-each>
		</xsl:for-each>
		<!-- Table Toolbars declaration -->
		<xsl:for-each select="rows/content/*[@type='table']">
			<xsl:variable name="j" select="position()" />
			<xsl:for-each select="table/context-menu/item">
				<xsl:text>public Toolbar </xsl:text>
				<xsl:variable name="i" select="position()" />
				<xsl:text>table</xsl:text>
				<xsl:value-of select="$j" />
				<xsl:text>ContextMenuItem</xsl:text>
				<xsl:value-of select="$i" />;
			</xsl:for-each>
		</xsl:for-each>
		
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:for-each select="//fields/*">
			<xsl:choose>
				<xsl:when test="@type = 'select'">
					<xsl:text>nosi.igrp.helper.IGRPList </xsl:text>
					<xsl:value-of select="name()" />
					<xsl:text>List </xsl:text>
					<xsl:text>;</xsl:text>
					<xsl:value-of select="$enter" />
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		
    	<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>public  (PageTeste page, Cliente model) {</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:value-of select="$tab" />
		<xsl:text>this.page = page;</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:value-of select="$tab" />
		<xsl:text>this.model = model;</xsl:text>
		<xsl:value-of select="$enter" />
		<!-- Join into one for-each -->
		<xsl:for-each select="rows/content/*[@type='form']/fields/*">
			<xsl:if test="@type = 'select'">
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>this.</xsl:text>
				<xsl:value-of select="name()" />
				<xsl:text> = model.get</xsl:text>
				<xsl:call-template name="uppercase">
					<xsl:with-param name="value">
						<xsl:value-of select="substring(name(),1,1)" />
					</xsl:with-param>
				</xsl:call-template>
				<xsl:value-of select="substring(name(),2)" />
				<xsl:text>();</xsl:text>
				
				<xsl:value-of select="$tab" />
			</xsl:if>
		</xsl:for-each>	
		<xsl:value-of select="$enter" />
		<xsl:for-each select="rows/content/*[@type='form']/fields/*">
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>this.</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text> = new Field("</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text>", </xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="./label" />
			<xsl:text>", </xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="./@type" />
			<xsl:text>", </xsl:text>
			<xsl:text>model, </xsl:text>
			<xsl:if test="@type = 'select'">
				<xsl:value-of select="name()" />
				<xsl:text>List</xsl:text>
				<xsl:text>, true</xsl:text>
			</xsl:if>
			<xsl:text>);</xsl:text>
			<xsl:value-of select="$enter" />
		</xsl:for-each>
		<xsl:value-of select="$enter" />
			
		<xsl:for-each select="rows/content/*[@type='table']/fields/*">
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>this.</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text> = new Field("</xsl:text>
			<xsl:value-of select="name()" />
			<xsl:text>", </xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="./label" />
			<xsl:text>", </xsl:text>
			<xsl:text>"</xsl:text>
			<xsl:value-of select="./@type" />
			<xsl:text>"</xsl:text>
			<xsl:text>);</xsl:text>
			<xsl:value-of select="$enter" />
		</xsl:for-each>
		<xsl:value-of select="$enter" />
		
		<xsl:for-each select="rows/content/*[@type='table']">
			<xsl:variable name="i" select="position()" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>private ArrayList&lt;HashMap&lt;String,String&gt;&gt; tableList</xsl:text>
			<xsl:value-of select="$i"/>
			<xsl:text>;</xsl:text>
			<xsl:value-of select="$enter" />
		</xsl:for-each>
		
		<!-- Toolbars declaration -->
		<xsl:for-each select="rows/content/*[@type = 'toolsbar']">
			<xsl:variable name="j" select="position()" />
			<xsl:for-each select="item">
				<xsl:variable name="i" select="position()" />
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>this.pageToolbar</xsl:text>
				<xsl:value-of select="$j" />
				<xsl:text>Item</xsl:text>
				<xsl:value-of select="$i" />
				<xsl:text> = </xsl:text>
				<xsl:text>new Toolbar("</xsl:text>
				<xsl:value-of select="title" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="app" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="page" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="link" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="target" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="img" />
				<xsl:text>");</xsl:text>
				<xsl:value-of select="$enter" />
			</xsl:for-each>
		</xsl:for-each>
		<!-- Form Toolbars declaration -->
		<xsl:for-each select="rows/content/*[@type='form']">
			<xsl:variable name="j" select="position()" />
			<xsl:for-each select="tools-bar/item">
				<xsl:variable name="i" select="position()" />
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>this.form</xsl:text>
				<xsl:value-of select="$j" />
				<xsl:text>ToolbarItem</xsl:text>
				<xsl:value-of select="$i" />
				<xsl:text> = </xsl:text>
				<xsl:text>new Toolbar("</xsl:text>
				<xsl:value-of select="title" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="app" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="page" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="link" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="target" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="img" />
				<xsl:text>");</xsl:text>
				<xsl:value-of select="$enter" />
			</xsl:for-each>
		</xsl:for-each>
		<!-- Table Toolbars declaration -->
		<xsl:for-each select="rows/content/*[@type='table']">
			<xsl:variable name="j" select="position()" />
			<xsl:for-each select="table/context-menu/item">
				<xsl:variable name="i" select="position()" />
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>this.table</xsl:text>
				<xsl:value-of select="$j" />
				<xsl:text>ContextMenu</xsl:text>
				<xsl:value-of select="$i" />
				<xsl:text> = </xsl:text>
				<xsl:text>new Toolbar("</xsl:text>
				<xsl:value-of select="title" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="app" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="page" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="link" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="target" />
				<xsl:text>", </xsl:text>
				<xsl:text>"</xsl:text>
				<xsl:value-of select="img" />				
				<xsl:text>");</xsl:text>
				<xsl:value-of select="$enter" />
			</xsl:for-each>
		</xsl:for-each>
		
		<!-- <xsl:for-each select="rows/content/*[@type='table']/table/value/row"> -->
			<!-- <xsl:variable name="l" select="position()" /> -->
			<!-- <xsl:value-of select="$tab" /> -->
			<!-- <xsl:value-of select="$tab" /> -->
			<!-- <xsl:text>HashMap&lt;String, String&gt; row</xsl:text> -->
			<!-- <xsl:value-of select="$l"/> -->
			<!-- <xsl:text>= new HashMap&lt;String, String&gt;();</xsl:text> -->
			<!-- <xsl:value-of select="$enter" /> -->
			<!-- <xsl:for-each select="*"> -->
				<!-- <xsl:value-of select="$tab" /> -->
				<!-- <xsl:value-of select="$tab" /> -->
				<!-- <xsl:if test="not(name() = 'context-menu')"> -->
					<!-- <xsl:text>row</xsl:text> -->
					<!-- <xsl:value-of select="$l"/> -->
					<!-- <xsl:text>.put("</xsl:text> -->
					<!-- <xsl:value-of select="name()" /> -->
					<!-- <xsl:text>",</xsl:text> -->
					<!-- <xsl:text> "</xsl:text> -->
					<!-- <xsl:value-of select="." /> -->
					<!-- <xsl:text>");</xsl:text> -->
				<!-- </xsl:if> -->
				<!-- <xsl:value-of select="$enter" /> -->
			<!-- </xsl:for-each> -->
			<!-- <xsl:value-of select="$tab" /> -->
			<!-- <xsl:value-of select="$tab" /> -->
			<!-- <xsl:text>this.tableList</xsl:text> -->
			<!-- <xsl:value-of select="$i"/> -->
			<!-- <xsl:text>.add(</xsl:text> -->
			<!-- <xsl:text>row</xsl:text> -->
			<!-- <xsl:value-of select="$l"/> -->
			<!-- <xsl:text>);</xsl:text> -->
			<!-- <xsl:value-of select="$enter" /> -->
		<!-- </xsl:for-each> -->
		
		<xsl:value-of select="$tab" />
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		
		<xsl:for-each select="rows/content/*">
			<xsl:choose>     		  
				
				<xsl:when test="@type = 'form' ">   			
					<xsl:apply-templates select="." />
				</xsl:when>
				
				<xsl:when test="@type = 'toolsbar' ">  
			
					<xsl:apply-templates mode="gen-toolsbar" select="."/>
					
				</xsl:when>
				
				<xsl:when test="@type = 'table' ">   			
					<xsl:apply-templates select="." />
				</xsl:when>
				<xsl:otherwise>
				
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		<xsl:value-of select="$tab" />
		<xsl:text>public void view() {</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:value-of select="$tab" />
		<xsl:for-each select="rows/content/*">
			<xsl:choose>
				<xsl:when test="@type = 'form'">
					<xsl:text>this.</xsl:text>
					<xsl:value-of select="name()"/>();
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="@type = 'table'">
					<xsl:text>this.</xsl:text>
					<xsl:value-of select="name()"/>();
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
				</xsl:when>
				<xsl:when test="@type = 'toolsbar'">
					<xsl:text>this.</xsl:text>
					<xsl:value-of select="name()"/>();
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:value-of select="$tab" />
		<xsl:text>page.drawXml();</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$endClass" />
		<xsl:value-of select="$enter" />
		
		<xsl:call-template name="endOf">
			<xsl:with-param name="value">
				<xsl:text> VIEW</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		<!--================================================= Generate Model =================================================-->
		<xsl:call-template name="startOf">
			<xsl:with-param name="value">
				<xsl:text> MODEL</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$enter" />
		<xsl:text>package xpto;</xsl:text>
    	<xsl:value-of select="$enter" />
		<xsl:text>import java.util.ArrayList;
	import java.util.HashMap;
	import nosi.igrp.helper.Field;</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$initClass" />
		<xsl:value-of select="$enter" />
		<xsl:for-each select="//fields/*">
			<xsl:choose>
				<xsl:when test="@type='text'">
					<xsl:value-of select="$tab" />
					<xsl:text>public String </xsl:text>
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
				</xsl:when>
				<xsl:when test="@type='number'">
				<xsl:value-of select="$tab" />
					<xsl:text>public int </xsl:text>
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
				</xsl:when>
				<xsl:when test="@type = 'select'">
				<!-- <xsl:value-of select="$enter" /> -->
				<!-- <xsl:value-of select="$tab" /> -->
				<!-- <xsl:value-of select="$tab" /> -->
					<xsl:value-of select="$tab" />
					<xsl:text>nosi.igrp.helper.IGRPList </xsl:text>
					<xsl:value-of select="name()" />
					<xsl:text> = new nosi.igrp.helper.IGRPList();</xsl:text>
					<xsl:value-of select="$enter" />
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		
		<xsl:for-each select="rows/content/*[@type='table']/table">
			<xsl:variable name="j" select="position()" />
			<!-- <xsl:value-of select="$tab" /> -->
			<!-- <xsl:value-of select="$tab" /> -->
				<xsl:value-of select="$tab" />
				<xsl:text>private ArrayList&lt;HashMap&lt;String,String&gt;&gt; tableList</xsl:text>
				<xsl:value-of select="$j"/>
				<xsl:text>;</xsl:text>
				<xsl:value-of select="$enter" />
			</xsl:for-each>
			<xsl:value-of select="$enter" />
		<xsl:for-each select="//fields/*">
			<xsl:choose>
				<xsl:when test="@type='text'">
					<xsl:value-of select="$tab" />
					
					<xsl:text>public String get</xsl:text>
					<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />() {
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
					<xsl:text>return </xsl:text>
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>}</xsl:text>
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>public void set</xsl:text>
					<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />
					<xsl:text>(String </xsl:text>
					<xsl:value-of select="name()" />) {
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
					<xsl:text>this.</xsl:text>
					<xsl:value-of select="name()" />
					<xsl:text> = </xsl:text> 
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>}</xsl:text>
					<xsl:value-of select="$enter" />
				</xsl:when>
				
				<xsl:when test="@type='number'">
				<xsl:value-of select="$tab" />
					<xsl:text>public int get</xsl:text>
					<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />() {
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
					<xsl:text>return </xsl:text>
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>}</xsl:text>
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>public void set</xsl:text>
					<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />
					<xsl:text>(int </xsl:text>
					<xsl:value-of select="name()" />) {
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
					<xsl:text>this.</xsl:text>
					<xsl:value-of select="name()" />
					<xsl:text> = </xsl:text> 
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>}</xsl:text>
					<xsl:value-of select="$enter" />
				</xsl:when>
				
				<xsl:when test="@type='select'">
				<xsl:value-of select="$tab" />
					<xsl:text>public nosi.igrp.helper.IGRPList get</xsl:text>
					<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />() {
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
					<xsl:text>return </xsl:text>
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>}</xsl:text>
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>public void set</xsl:text>
					<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />
					<xsl:text>(nosi.igrp.helper.IGRPList </xsl:text>
					<xsl:value-of select="name()" />) {
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:value-of select="$tab" />
					<xsl:text>this.</xsl:text>
					<xsl:value-of select="name()" />
					<xsl:text> = </xsl:text> 
					<xsl:value-of select="name()" />;
					<xsl:value-of select="$enter" />
					<xsl:value-of select="$tab" />
					<xsl:text>}</xsl:text>
					<xsl:value-of select="$enter" />
				</xsl:when>
			</xsl:choose>
		</xsl:for-each>
		
		<xsl:for-each select="rows/content/*[@type='table']/table">
			<xsl:variable name="k" select="position()" />
			<!-- <xsl:value-of select="$tab" /> -->
			<!-- <xsl:value-of select="$tab" /> -->
				<xsl:value-of select="$tab" />
				<xsl:text>public ArrayList&lt;HashMap&lt;String, String&gt;&gt; get</xsl:text>
				<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />
					<xsl:text>List</xsl:text>
				<xsl:value-of select="$k"/>
				<xsl:text>() {</xsl:text>
				<xsl:value-of select="$enter" />
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>return </xsl:text>
				<xsl:value-of select="name()" />
				<xsl:text>List</xsl:text>
				<xsl:value-of select="$k"/>;
				<xsl:value-of select="$enter" />
				<xsl:value-of select="$tab" />
				<xsl:text>}</xsl:text>
				<xsl:value-of select="$enter" />
				<xsl:value-of select="$tab" />
				<xsl:text>public void set</xsl:text>
				<xsl:call-template name="uppercase">
						<xsl:with-param name="value">
							<xsl:value-of select="substring(name(),1,1)" />
						</xsl:with-param>
					</xsl:call-template>
					<xsl:value-of select="substring(name(),2)" />
					<xsl:text>List</xsl:text>
					<xsl:value-of select="$k"/>
					<xsl:text>(</xsl:text>
				<xsl:text>ArrayList&lt;HashMap&lt;String, String&gt;&gt; </xsl:text>
				<xsl:value-of select="name()" />
					<xsl:text>List</xsl:text>
				<xsl:value-of select="$k"/>
				<xsl:text>) {</xsl:text>
				<xsl:value-of select="$enter" />
				<xsl:value-of select="$tab" />
				<xsl:value-of select="$tab" />
				<xsl:text>this.</xsl:text>
				<xsl:value-of select="name()" />
				<xsl:text>List</xsl:text>
				<xsl:value-of select="$k"/>
				<xsl:text> = </xsl:text> 
				<xsl:value-of select="name()" />
				<xsl:text>List</xsl:text>
				<xsl:value-of select="$k"/>
				<xsl:text>;</xsl:text>
				<xsl:value-of select="$enter" />
				<xsl:value-of select="$tab" />
				<xsl:text>}</xsl:text>
				<xsl:value-of select="$enter" />
			</xsl:for-each>
			
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$endClass" />
		<xsl:value-of select="$enter" />
		
		<xsl:call-template name="endOf">
			<xsl:with-param name="value">
				<xsl:text> MODEL</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		<!--================================================= Generate Controller =================================================-->
		<xsl:call-template name="startOf">
			<xsl:with-param name="value">
				<xsl:text> CONTROLLER</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$enter" />
		<xsl:text>package xpto;</xsl:text>
    	<xsl:value-of select="$enter" />
		<xsl:text>import java.util.ArrayList;
	import java.util.HashMap;
	import nosi.igrp.helper.Field;</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$initClass" />
		
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>nosi.igrp.helper.Page page;</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>nosi.igrp.model.App model;</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>nosi.igrp.view.app.ListApp listView;
		nosi.igrp.view.app.FormAddApp formView;</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>public () {</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:value-of select="$tab" />
		<xsl:text>model = new nosi.igrp.model.App();</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>public void listAplicacao(Page page) throws ClassNotFoundException, SQLException, IOException {</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:value-of select="$tab" />
		<xsl:text>listView=new ListApp(page, model);
			listView.list();</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$tab" />
		<xsl:text>}</xsl:text>
		<xsl:value-of select="$enter" />
		<xsl:value-of select="$enter" />
		<xsl:for-each select="rows/content/*[@type = 'toolsbar']/item|rows/content/*[@type = 'form']/tools-bar/item">
			<xsl:value-of select="$tab" />
			<xsl:text>public void btn</xsl:text>
			<xsl:value-of select="title" />
			<xsl:text>(Page page) throws IOException, ClassNotFoundException, SQLException {</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>String vApp = page.getRequest().getParameter("p_prm_app");
			String vPage = page.getRequest().getParameter("p_prm_page");
			String vAction = page.getRequest().getParameter("p_prm_action");</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>/*PUT YOUR CODE HERE*/</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>/* PUT YOUR CODE HERE */</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>page.redirect(vApp, vPage, vAction);</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$enter" />
		</xsl:for-each>
		
		<xsl:for-each select="rows/content/*[@type = 'table']/table/context-menu/item">
			<xsl:value-of select="$tab" />
			<xsl:text>public void </xsl:text>
			<xsl:call-template name="getMethod">
				<xsl:with-param name="linkName" select="link"/>
			</xsl:call-template>
			<xsl:text>(Page page) throws IOException, ClassNotFoundException, SQLException {</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>String vApp = page.getRequest().getParameter("p_prm_app");
			String vPage = page.getRequest().getParameter("p_prm_page");
			String vAction = page.getRequest().getParameter("p_prm_action");</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>/*PUT YOUR CODE HERE*/</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>/* PUT YOUR CODE HERE */</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:value-of select="$tab" />
			<xsl:text>page.redirect(vApp, vPage, vAction);</xsl:text>
			<xsl:value-of select="$enter" />
			<xsl:value-of select="$tab" />
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$enter" />
		</xsl:for-each>
		<xsl:value-of select="$endClass" />
		<xsl:value-of select="$enter" />
		<xsl:call-template name="endOf">
			<xsl:with-param name="value">
				<xsl:text> CONTROLLER</xsl:text>
			</xsl:with-param>
		</xsl:call-template>
		<xsl:value-of select="$enter" />
    </xsl:template>
    <xsl:include href="XSL_JAVA_CHART.xsl" />	    
</xsl:stylesheet>