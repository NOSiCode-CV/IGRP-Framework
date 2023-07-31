<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">	
	<xsl:key name="index1" match="block" use="@type" />	
	<xsl:key name="index2" match="block" use="field" />
	<xsl:template name="blockly.imports">		
		<xsl:variable name="dao-imports" select="$all-blocks[contains(@type,'et-dao-')]"></xsl:variable>		
		<xsl:text>/* Start-Code-Block (import) */</xsl:text>				
 		<xsl:for-each select="//rows/blockly/imports/import[not(.=preceding::import)]"> 			
			<xsl:choose>	
				<xsl:when test="@type = 'listar'">			
					<xsl:value-of select="$newline"></xsl:value-of>		
					<xsl:text>import java.util.ArrayList; //block import</xsl:text>			
					<xsl:value-of select="$newline"></xsl:value-of>				
					<xsl:text>import java.util.List; //block import</xsl:text>		
				</xsl:when>
				<xsl:when test="@type = 'verticalmenu'">			
					<xsl:value-of select="$newline"></xsl:value-of>		
					<xsl:text>import nosi.core.gui.components.IGRPButton; //block import</xsl:text>				
				</xsl:when>
				<xsl:when test="@type = 'report'">			
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import nosi.core.webapp.Report; //block import</xsl:text>		
				</xsl:when>
				<xsl:when test="@type = 'list_simple_dao'">				
					<xsl:value-of select="$newline"></xsl:value-of>				
					<xsl:text>import java.util.List; //block import</xsl:text>		
				</xsl:when>
				<xsl:when test="@type = 'combo_dao'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.LinkedHashMap; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import static nosi.core.i18n.Translator.gt; //block import</xsl:text>
				</xsl:when>
				<xsl:when test="@type = 'fill_combo'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.LinkedHashMap; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import static nosi.core.i18n.Translator.gt; //block import</xsl:text>
				</xsl:when>
				<xsl:when test="@type = 'separator'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import nosi.core.gui.components.IGRPSeparatorList.Pair; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.ArrayList; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.Map; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.HashMap; //block import</xsl:text>
				</xsl:when>
				<xsl:when test="@type = 'formlist'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import nosi.core.gui.components.IGRPSeparatorList.Pair; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.ArrayList; //block import</xsl:text>
				</xsl:when>
				<xsl:when test="@type = 'inserir_dao'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Session; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Transaction; //block import</xsl:text>
				</xsl:when>				
				<xsl:when test="@type = 'insert_simple_dao'">
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import org.hibernate.Session; //block import</xsl:text>				
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import org.hibernate.Transaction; //block import</xsl:text>				
				</xsl:when>				
				<xsl:when test="@type = 'inserir_dao2'">
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import org.hibernate.Session; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import org.hibernate.Transaction; //block import</xsl:text>				
				</xsl:when>				
				<xsl:when test="@type = 'save_separator'">				
					<xsl:variable name="pagelow">					
						<xsl:call-template name="LowerCase">						
							<xsl:with-param name="text" select="$page-title"/>							
						</xsl:call-template>						
					</xsl:variable>					
					<xsl:variable name="separator">					
						<xsl:call-template name="InitCap">						
							<xsl:with-param name="text" select="."/>							
						</xsl:call-template>						
					</xsl:variable>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.stream.Collectors; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.ArrayList; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.Arrays; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.List; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import org.hibernate.Session; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import org.hibernate.Transaction; //block import</xsl:text>					
<!-- 					<xsl:value-of select="$newline"></xsl:value-of>					 -->
<!-- 					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"/><xsl:text>.pages.</xsl:text><xsl:value-of select="$pagelow"/><xsl:text>.</xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$separator"/><xsl:text>; //block import</xsl:text>									 -->
				</xsl:when>				
				<xsl:when test="@type = 'save_formlist'">				
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import org.hibernate.Session; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>				
					<xsl:text>import org.hibernate.Transaction; //block import</xsl:text>								
				</xsl:when>				
				<xsl:when test="@type = 'grafico'">				
					<xsl:variable name="grafico">				
						<xsl:call-template name="InitCap">						
							<xsl:with-param name="text" select="."/>							
						</xsl:call-template>						
					</xsl:variable>				
					<xsl:variable name="pagelow">					
						<xsl:call-template name="LowerCase">						
							<xsl:with-param name="text" select="$page-title"/>							
						</xsl:call-template>						
					</xsl:variable>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.ArrayList; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.List; //block import</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.stream.Collectors; //block import</xsl:text>						
					<xsl:value-of select="$newline"></xsl:value-of>	
					<xsl:text>import java.util.LongSummaryStatistics; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>				
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"/><xsl:text>.pages.</xsl:text><xsl:value-of select="$pagelow"/><xsl:text>.</xsl:text><xsl:value-of select="$page-title"/><xsl:text>.</xsl:text><xsl:value-of select="$grafico"/><xsl:text>; //block import</xsl:text>	
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.Map; //block import</xsl:text>					
				</xsl:when>	
				<xsl:when test="@type = 'statbox'">	
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.List; //block import</xsl:text>										
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.stream.Collectors; //block import</xsl:text>						
					<xsl:value-of select="$newline"></xsl:value-of>	
					<xsl:text>import java.util.LongSummaryStatistics; //block import</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.Map; //block import</xsl:text>					
				</xsl:when>	
				<xsl:when test="@type = 'circlestatbox'">	
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.List; //block import</xsl:text>										
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import java.util.stream.Collectors; //block import</xsl:text>						
					<xsl:value-of select="$newline"></xsl:value-of>	
					<xsl:text>import org.apache.commons.math3.util.Precision; //block import</xsl:text>			
				</xsl:when>	
				<xsl:when test="@type = 'dao'">					
					<xsl:variable name="className" select="."></xsl:variable>					
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"/><xsl:text>.dao.</xsl:text><xsl:value-of select="$className"/><xsl:text>; //block import</xsl:text>					
				</xsl:when>
				<xsl:when test="@type = 'service'">					
					<xsl:variable name="className" select="."></xsl:variable>	
					<xsl:variable name="packageName" select="@package"></xsl:variable>	
					<xsl:variable name="classNameRenamed">
						<xsl:call-template name="replace-all">
							<xsl:with-param name="text" select="$className"/>
							<xsl:with-param name="replace" select="'Soap'"/>
							<xsl:with-param name="by" select="''"/>
						</xsl:call-template>
					</xsl:variable>				
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"/><xsl:text>.services.</xsl:text><xsl:value-of select="$packageName"/><xsl:text>.</xsl:text>
					<xsl:choose>
						<xsl:when test="contains($className,'Soap')">
							<xsl:value-of select="$classNameRenamed"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:value-of select="$className"/>
						</xsl:otherwise>						
					</xsl:choose>
					<xsl:text>; //block import</xsl:text>					
				</xsl:when>					
				<xsl:when test="@type = 'fields'">					
					<xsl:variable name="fieldType" select="."/>					
					<xsl:choose>
						<xsl:when test="$fieldType = 'File'">						
							<xsl:value-of select="$newline"></xsl:value-of>							
							<xsl:text>import nosi.core.webapp.UploadedFile; //block import</xsl:text>							
						</xsl:when>						
						<xsl:when test="$fieldType = 'Link'">
							<xsl:value-of select="$newline"></xsl:value-of>							
							<xsl:text>import nosi.webapps.igrp.dao.CLob; //block import</xsl:text>														
						</xsl:when>
						<xsl:when test="$fieldType = 'LocalTime'">
							<xsl:value-of select="$newline"></xsl:value-of>							
							<xsl:text>import java.time.LocalTime; //block import</xsl:text>														
						</xsl:when>		
							<xsl:when test="$fieldType = 'LocalDate'">
							<xsl:value-of select="$newline"></xsl:value-of>							
							<xsl:text>import java.time.LocalDate; //block import</xsl:text>														
						</xsl:when>		
							<xsl:when test="$fieldType = 'LocalDateTime'">
							<xsl:value-of select="$newline"></xsl:value-of>							
							<xsl:text>import java.time.LocalDateTime; //block import</xsl:text>														
						</xsl:when>								
					</xsl:choose>				
				</xsl:when>				
				<xsl:when test="@type = 'checkbox_table'">				
					<xsl:value-of select="$newline"></xsl:value-of>					
					<xsl:text>import nosi.core.webapp.helpers.CheckBoxHelper; //block import</xsl:text>	
					<xsl:value-of select="$newline"></xsl:value-of>	
					<xsl:text>import java.util.List; //block import</xsl:text>			
				</xsl:when>			
			</xsl:choose>			
		</xsl:for-each>		
		<!-- <xsl:for-each select="$all-blocks[generate-id() = generate-id( key('index1', @type )[1] )]">			
			<xsl:choose>			
				<xsl:when test="contains(@type,'et-dao-')">					
					<xsl:variable name="className" select="substring-after(@type, 'et-dao-')"></xsl:variable>					
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"/><xsl:text>.</xsl:text><xsl:value-of select="$className"/><xsl:text>;</xsl:text>					
					<xsl:value-of select="$newline"></xsl:value-of>				
				</xsl:when>
			</xsl:choose>			
		</xsl:for-each> 			
		<xsl:for-each select="$all-blocks/field[contains(.,'Date::')][ not(.=preceding::*) ]">		
			<xsl:value-of select="."></xsl:value-of>			
		</xsl:for-each>		
		 -->		
		<xsl:value-of select="$newline"></xsl:value-of>		
		<xsl:text>/* End-Code-Block */</xsl:text>				
	</xsl:template>
</xsl:stylesheet>