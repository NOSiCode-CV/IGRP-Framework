<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:strip-space elements="*" />
	 <xsl:template match="text()">
        <xsl:value-of select='normalize-space()'/>
    </xsl:template>
	<xsl:template  match="/">
		<textarea id="mySavedModel" style="width: 100%; height: 300px">
	        {"class":"go.GraphLinksModel",
	          "linkFromPortIdProperty":"fromPort",
	          "linkToPortIdProperty":"toPort",
	          "modelData":{"position":"230 200"},
	          "nodeDataArray":<xsl:apply-templates select="form/value/nodedata"/>,
	          "linkDataArray":<xsl:apply-templates select="form/value/linkdata"/>
	        }
	    </textarea>
	</xsl:template>
</xsl:stylesheet>