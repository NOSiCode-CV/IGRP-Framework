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
					<xsl:text>import java.util.ArrayList;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
				</xsl:when>
				
				<xsl:when test="@type = 'combo_dao'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.LinkedHashMap;</xsl:text>
				</xsl:when>
				
				<xsl:when test="@type = 'fill_combo'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.LinkedHashMap;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import static nosi.core.i18n.Translator.gt;</xsl:text>
				
				</xsl:when>
				
				<xsl:when test="@type = 'separator'">
					
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import nosi.core.gui.components.IGRPSeparatorList.Pair;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.ArrayList;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.Map;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.HashMap;</xsl:text>		
				</xsl:when>
				
				<xsl:when test="@type = 'formlist'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import nosi.core.gui.components.IGRPSeparatorList.Pair;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.ArrayList;</xsl:text>
				</xsl:when>
				
				<xsl:when test="@type = 'inserir_dao'">

					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Session;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Transaction;</xsl:text>
				
				</xsl:when>
				
				<xsl:when test="@type = 'save_separator'">
				
					<xsl:variable name="pagelow">
						<xsl:call-template name="LowerCase">
							<xsl:with-param name="text" select="$page-title"/>
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.stream.Collectors;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.ArrayList;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.Arrays;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Session;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Transaction;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"></xsl:value-of>
					<xsl:text>.pages.</xsl:text><xsl:value-of select="$pagelow"></xsl:value-of>
					<xsl:text>.</xsl:text><xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.</xsl:text>
					<xsl:text>Separatorlist_1;</xsl:text>
									
				</xsl:when>
				
				<xsl:when test="@type = 'save_formlist'">
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Session;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import org.hibernate.Transaction;</xsl:text>			
				</xsl:when>
				
				<xsl:when test="@type = 'grafico'">
				
					<xsl:variable name="pagelow">
						<xsl:call-template name="LowerCase">
							<xsl:with-param name="text" select="$page-title"/>
						</xsl:call-template>
					</xsl:variable>
					
					<xsl:text>import java.util.ArrayList;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"></xsl:value-of>
					<xsl:text>.pages.</xsl:text><xsl:value-of select="$pagelow"></xsl:value-of>
					<xsl:text>.</xsl:text><xsl:value-of select="$page-title"></xsl:value-of><xsl:text>.Chart_1;</xsl:text>
	
				</xsl:when>
	
				<xsl:when test="@type = 'dao'">
					
					<xsl:variable name="className" select="."></xsl:variable>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"></xsl:value-of>
					<xsl:text>.dao.</xsl:text><xsl:value-of select="$className"></xsl:value-of>
					<xsl:text>;</xsl:text>
					
				</xsl:when>
				
				<xsl:when test="@type = 'fields'">
					
					<xsl:variable name="fieldType" select="."/>
					
					<xsl:choose>
						<xsl:when test="$fieldType = 'File'">
							<xsl:value-of select="$newline"></xsl:value-of>
							<xsl:text>import nosi.core.webapp.UploadedFile;</xsl:text>
						</xsl:when>
						<xsl:when test="$fieldType = 'Link'">
							<xsl:value-of select="$newline"></xsl:value-of>
							<xsl:text>import nosi.webapps.igrp.dao.CLob;</xsl:text>							
						</xsl:when>
					</xsl:choose>
				
				</xsl:when>
			
			</xsl:choose>
			
		</xsl:for-each>
		
		<!-- <xsl:for-each select="$all-blocks[generate-id() = generate-id( key('index1', @type )[1] )]">
			
			<xsl:choose>
			
				<xsl:when test="contains(@type,'et-dao-')">
					
					<xsl:variable name="className" select="substring-after(@type, 'et-dao-')"></xsl:variable>
					
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"></xsl:value-of>
					<xsl:text>.</xsl:text><xsl:value-of select="$className"></xsl:value-of>
					<xsl:text>;</xsl:text>
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