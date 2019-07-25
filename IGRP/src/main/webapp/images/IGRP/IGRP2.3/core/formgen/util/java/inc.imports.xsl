<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
	<xsl:key name="index1" match="block" use="@type" />
	
	<xsl:key name="index2" match="block" use="field" />
	
	
	<xsl:template></xsl:template>
	
	<xsl:template name="blockly.imports">
		
		<xsl:variable name="dao-imports" select="$all-blocks[contains(@type,'et-dao-')]"></xsl:variable>
		
		<xsl:text>/* Start-Code-Block (import) */</xsl:text>
		
		<xsl:value-of select="$newline"></xsl:value-of>
		
		<xsl:for-each select="//rows/blockly/imports/import">
			
			<xsl:choose>
			
				<xsl:when test="@type = 'listar'">
					
					<xsl:text>import java.util.ArrayList;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
				
				</xsl:when>
				
				<xsl:when test="@type = 'dao'">
					
					<xsl:variable name="className" select="."></xsl:variable>
					
					<xsl:text>import nosi.webapps.</xsl:text><xsl:value-of select="$app-title"></xsl:value-of>
					<xsl:text>.</xsl:text><xsl:value-of select="$className"></xsl:value-of>
					<xsl:text>;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
				
				</xsl:when>
				
				<xsl:when test="@type = 'fields'">
					
					<xsl:variable name="fieldType" select="."/>
					
					<xsl:choose>
						<xsl:when test="$fieldType = 'File'">
							<xsl:text>import nosi.core.webapp.UploadedFile;</xsl:text>
							<xsl:value-of select="$newline"></xsl:value-of>
						</xsl:when>
						
						<xsl:when test="$fieldType = 'Date'">
							<xsl:text>import java.sql.Date;</xsl:text>
							<xsl:value-of select="$newline"></xsl:value-of>
						</xsl:when>
						
						<xsl:when test="$fieldType = 'Select'">
							<xsl:text>import java.util.LinkedHashMap;</xsl:text>
							<xsl:value-of select="$newline"></xsl:value-of>
							<xsl:text>import static nosi.core.i18n.Translator.gt;</xsl:text>
							<xsl:value-of select="$newline"></xsl:value-of>
						</xsl:when>
						
						<xsl:when test="$fieldType = 'Link'">
							<xsl:text>import nosi.webapps.igrp.dao.CLob;</xsl:text>
							<xsl:value-of select="$newline"></xsl:value-of>
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
				
				<xsl:when test="@type = 'listar'">
					<xsl:text>import java.util.ArrayList;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
					<xsl:text>import java.util.List;</xsl:text>
					<xsl:value-of select="$newline"></xsl:value-of>
				</xsl:when>
				
				<xsl:when test="contains(field,'File::')">
					<xsl:text>import nosi.core.webapp.UploadedFile;</xsl:text>
				</xsl:when>
				
				<xsl:when test="contains(field,'Date::')">
					<xsl:text>import java.sql.Date;</xsl:text>
				</xsl:when>
				
				<xsl:when test="contains(field,'Select::')">
					<xsl:text>import java.util.LinkedHashMap;</xsl:text>
					<xsl:text>import static nosi.core.i18n.Translator.gt;</xsl:text>
				</xsl:when>
				
				<xsl:when test="contains(field,'Link::')">
					<xsl:text>import nosi.webapps.igrp.dao.CLob;</xsl:text>
				</xsl:when>
				
			

			</xsl:choose>
			
		</xsl:for-each> 
		
		
		
		<xsl:for-each select="$all-blocks/field[contains(.,'Date::')][ not(.=preceding::*) ]">
			<xsl:value-of select="."></xsl:value-of>
		</xsl:for-each>
		
		 -->
		
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:text>/* End-Code-Block */</xsl:text>
		<xsl:value-of select="$newline"></xsl:value-of>
		<xsl:value-of select="$newline"></xsl:value-of>
		
	</xsl:template>

</xsl:stylesheet>