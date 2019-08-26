<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

	<xsl:template name="blockly.element.separator" >
	
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="dao_sep" select="field[@name='dao_sep']"/>
		
		<xsl:variable name="where1" select="substring-after(value[@name='where1']/block/field,'::')"/>
		
		<xsl:variable name="table" select="field[@name='table']"/>
		
		<xsl:variable name="table_up">
	       	<xsl:call-template name="InitCap">
	       		<xsl:with-param name="text" select="$table"/>
	       	</xsl:call-template>
	   	</xsl:variable>
	   	
	   	<xsl:variable name="button" select="field[@name='button']"/>
	   	
	   	<xsl:variable name="model_low" select="field[@name='id_model']"/>
	   	
	   	<xsl:variable name="id_model">
	       	<xsl:call-template name="InitCap">
	       		<xsl:with-param name="text" select="field[@name='id_model']"/>
	       	</xsl:call-template>
	   	</xsl:variable>
	   	
	   	<xsl:variable name="sep_row">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="rowvaluechildID" select="substring-after(value[@name='id_separator']/block/field,'::')"/>
		
		<xsl:variable name="ChildID">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$rowvaluechildID"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="where2">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='where2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="sep_model">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='set_model']"/>
			</xsl:call-template>
		</xsl:variable>
	
		<xsl:variable name="code">
		
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>List &lt; </xsl:text><xsl:value-of select="$dao_sep"></xsl:value-of>
			<xsl:text>&gt; docsList = new </xsl:text><xsl:value-of select="$dao_sep"></xsl:value-of>
			<xsl:text>().find().andWhere( "</xsl:text><xsl:value-of select="$where1"></xsl:value-of>
			<xsl:text>", "=",</xsl:text><xsl:value-of select="$where2"></xsl:value-of><xsl:text>).all();</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>if ( Core.isNotNull( docsList ) ) {</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>List &lt;</xsl:text><xsl:value-of select="$page-title"></xsl:value-of>
			<xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>&gt; </xsl:text>
			<xsl:text> separatorlistDocs = model.get</xsl:text>
			<xsl:value-of select="$table_up"></xsl:value-of><xsl:text>(); </xsl:text> 
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>docsList.forEach( doc-> {</xsl:text> 
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:value-of select="$page-title"></xsl:value-of>
			<xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of>
			<xsl:text> row = new </xsl:text><xsl:value-of select="$page-title"></xsl:value-of>
			<xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>();</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:text>row.set</xsl:text><xsl:value-of select="$table_up"></xsl:value-of>
			<xsl:text>_id(</xsl:text><xsl:text>new Pair( ""+doc.get</xsl:text>
			<xsl:value-of select="$ChildID"></xsl:value-of><xsl:text>(), ""+doc.get</xsl:text>
			<xsl:value-of select="$ChildID"></xsl:value-of><xsl:text>()));</xsl:text>
			<xsl:value-of select="concat($newlineTab4,$sep_row)"></xsl:value-of>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:text>separatorlistDocs.add( row );</xsl:text> 
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>});</xsl:text> 
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}</xsl:text> 
			<xsl:value-of select="$newline"></xsl:value-of>

		</xsl:variable>
		
		
		<xsl:value-of select="$code"></xsl:value-of>
		

	</xsl:template>

	<xsl:template name="blockly.element.sep_row">
	
		<xsl:variable name="rowType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="rowValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="rowvaluechild" select="substring-after(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="ValueChild">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$rowvaluechild"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="nameCap">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$rowValue"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="rowset">
			<xsl:choose>
				<xsl:when test="$rowtypechild = 'Date'">
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>( new Pair(""+doc.get</xsl:text><xsl:value-of select="$ValueChild"></xsl:value-of>
					<xsl:text>(),""+doc.get</xsl:text><xsl:value-of select="$ValueChild"></xsl:value-of><xsl:text>()) );</xsl:text>
					
				</xsl:when>

				<xsl:otherwise>
					<xsl:text>row.set</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
					<xsl:text>( new Pair(doc.get</xsl:text><xsl:value-of select="$ValueChild"></xsl:value-of>
					<xsl:text>(),doc.get</xsl:text><xsl:value-of select="$ValueChild"></xsl:value-of><xsl:text>()) );</xsl:text>
				</xsl:otherwise>
			
			</xsl:choose>
			
		</xsl:variable>
		
		<xsl:value-of select="$rowset"></xsl:value-of>
	
	</xsl:template>	
	
	<!-- ////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	<!-- //////////////////////////////////////////////////////////////////////////////////////////////////////////////////// -->
	
	<xsl:template name="blockly.element.save_separator" >
	
		<xsl:variable name="dao" select="field[@name='dao']"/>
		
		<xsl:variable name="dao_sep" select="field[@name='dao_sep']"/>
		
		<xsl:variable name="table" select="field[@name='table']"/>
		
		<xsl:variable name="exist_insert" select="value[@name='id_dad']"/>
		
		<xsl:variable name="id_dad_low" select="substring-after(value[@name='id_dad']/block/field,'::')"/>
		
		<xsl:variable name="table_up">
	       	<xsl:call-template name="InitCap">
	       		<xsl:with-param name="text" select="$table"/>
	       	</xsl:call-template>
	   	</xsl:variable>
	   	
	   	<xsl:variable name="id_dad">
	       	<xsl:call-template name="InitCap">
	       		<xsl:with-param name="text" select="$id_dad_low"/>
	       	</xsl:call-template>
	   	</xsl:variable>
		
		<xsl:variable name="insercao">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="statement[@name='insert_dao']"/>
			</xsl:call-template>
		</xsl:variable>
	   	
	   	<xsl:variable name="sep_insercao_obj">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='value2']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="delete_obj">
			<xsl:call-template name="blockly.getValue">
				<xsl:with-param name="value" select="*[@name='delete']"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="delete">
			
			<xsl:call-template name="replace-all">
			
				<xsl:with-param name="text" select="$delete_obj"/>
				
				<xsl:with-param name="replace" select="'obj.get'"/>
				
				<xsl:with-param name="by" select="'doc.get'"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="sep_insercao">
			
			<xsl:call-template name="replace-all">
			
				<xsl:with-param name="text" select="$sep_insercao_obj"/>
				
				<xsl:with-param name="replace" select="'obj.set'"/>
				
				<xsl:with-param name="by" select="'doc.set'"/>
				
			</xsl:call-template>
			
		</xsl:variable>
		
		<xsl:variable name="id_model">
	       	<xsl:call-template name="InitCap">
	       		<xsl:with-param name="text" select="field[@name='id_model']"/>
	       	</xsl:call-template>
	   	</xsl:variable>
	
	
		<xsl:variable name="code">
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>try {</xsl:text><xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>for ( </xsl:text>
			<xsl:value-of select="$page-title"></xsl:value-of>
			<xsl:text>.</xsl:text><xsl:value-of select="$table_up"></xsl:value-of>
			<xsl:text> row : model.get</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>()){</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>if( Core.isNotNull( row.get</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>_id())</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:text> &amp;&amp; Core.isNotNull( row.get</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>_id().getKey())</xsl:text>
			<xsl:value-of select="$newlineTab5"></xsl:value-of>
			<xsl:text> &amp;&amp; !row.get</xsl:text><xsl:value-of select="$table_up"></xsl:value-of><xsl:text>_id().getKey().isEmpty()){</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:text>if( Core.isNotNull( model.getP_</xsl:text>
			<xsl:value-of select="$table"></xsl:value-of><xsl:text>_edit())</xsl:text>
			<xsl:value-of select="$newlineTab5"></xsl:value-of>
			<xsl:text> &amp;&amp; Arrays.stream( model.getP_</xsl:text><xsl:value-of select="$table"></xsl:value-of>
			<xsl:text>_edit())</xsl:text>
			<xsl:value-of select="$newlineTab6"></xsl:value-of>
			<xsl:text>.anyMatch(row.get</xsl:text><xsl:value-of select="$table_up"></xsl:value-of>
			<xsl:text>_id().getKey()::equals)){</xsl:text>
			<xsl:value-of select="$newlineTab5"></xsl:value-of>
			<xsl:value-of select="$dao_sep"></xsl:value-of><xsl:text> doc = new </xsl:text><xsl:value-of select="$dao_sep"></xsl:value-of>
			<xsl:text>().findOne( Core.toInt(row.get</xsl:text>
			<xsl:value-of select="$table_up"></xsl:value-of><xsl:text>_id().getKey()) );</xsl:text>
			<xsl:value-of select="concat($newlineTab5,$sep_insercao)"></xsl:value-of> 
			<xsl:value-of select="$newlineTab5"></xsl:value-of>
			<xsl:text>if ( doc != null &amp;&amp; !doc.hasError()){</xsl:text>
			<xsl:value-of select="$newlineTab6"></xsl:value-of>
			<xsl:text>doc = doc.update();</xsl:text>
			<xsl:value-of select="$newlineTab6"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess( "Document updated." );</xsl:text>
			<xsl:value-of select="$newlineTab5"></xsl:value-of>
			<xsl:text>}else</xsl:text>
			<xsl:value-of select="$newlineTab6"></xsl:value-of>
			<xsl:text>Core.setMessageError( "Error updating document!" );</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>}</xsl:text>
			
			<xsl:choose>
			
			<xsl:when test="$exist_insert != ''">
			
				<xsl:text>else{</xsl:text>	
				<xsl:value-of select="$newlineTab4"></xsl:value-of>
				<xsl:value-of select="$dao_sep"></xsl:value-of><xsl:text> doc = new </xsl:text>
				<xsl:value-of select="$dao_sep"></xsl:value-of><xsl:text>();</xsl:text>
				<xsl:value-of select="$newlineTab4"></xsl:value-of>
				<xsl:text>doc.set</xsl:text><xsl:value-of select="$id_dad"></xsl:value-of><xsl:text>(obj);</xsl:text>
				<xsl:value-of select="$newlineTab4"></xsl:value-of>		
				<xsl:value-of select="$sep_insercao"></xsl:value-of> 
				<xsl:value-of select="$newlineTab4"></xsl:value-of>	
				<xsl:text>if ( Core.isNotNull( doc ) &amp;&amp; !doc.hasError()){</xsl:text>
				<xsl:value-of select="$newlineTab5"></xsl:value-of>	
				<xsl:text>doc.insert();</xsl:text>
				<xsl:value-of select="$newlineTab5"></xsl:value-of>
				<xsl:text>Core.setMessageSuccess( "Document registred." );</xsl:text>	
				<xsl:value-of select="$newlineTab4"></xsl:value-of>	
				<xsl:text>}else</xsl:text>	
				<xsl:value-of select="$newlineTab5"></xsl:value-of>
				<xsl:text>Core.setMessageError( "Error registring document!" );</xsl:text>
				<xsl:value-of select="$newlineTab4"></xsl:value-of>
				<xsl:text>}</xsl:text>
			
			</xsl:when>	
			
			</xsl:choose>
			
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>} catch ( Exception e ) {}</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>String [] deletedIdsArray = model.getP_</xsl:text><xsl:value-of select="$table"></xsl:value-of><xsl:text>_del();</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
			<xsl:text>if ( Core.isNotNull( deletedIdsArray ) ) {</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>for ( String docId : deletedIdsArray ) {</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>if ( Core.isNotNull( docId ) &amp;&amp; !docId.isEmpty() ) {</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:value-of select="$dao_sep"></xsl:value-of><xsl:text> doc = new </xsl:text><xsl:value-of select="$dao_sep"></xsl:value-of>
			<xsl:text>().findOne( docId );</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>if ( doc.delete(</xsl:text><xsl:value-of select="$delete"></xsl:value-of><xsl:text>) )</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:text>Core.setMessageSuccess( "Document deleted." );</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>else</xsl:text>
			<xsl:value-of select="$newlineTab4"></xsl:value-of>
			<xsl:text>Core.setMessageError( "Error deleting doc!" );</xsl:text>
			<xsl:value-of select="$newlineTab3"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab2"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newlineTab1"></xsl:value-of>
			<xsl:text>}</xsl:text>
			<xsl:value-of select="$newline"></xsl:value-of>
		</xsl:variable>
		
		<xsl:value-of select="$code"></xsl:value-of>
		
	</xsl:template>	
	
	<xsl:template name="blockly.element.get_row_sep">
	
		<xsl:variable name="rowType" select="substring-before(field,'::')"/>
		
		<xsl:variable name="rowValue" select="substring-after(field,'::')"/>
		
		<xsl:variable name="rowtypechild" select="substring-before(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="rowvaluechild" select="substring-after(value[@name='fields_model']/block/field,'::')"/>
		
		<xsl:variable name="ValueChild">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$rowvaluechild"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="nameCap">
			<xsl:call-template name="InitCap">
				<xsl:with-param name="text" select="$rowValue"/>
			</xsl:call-template>
		</xsl:variable>
		
		<xsl:variable name="rowset">
			<xsl:text>row.get</xsl:text><xsl:value-of select="$nameCap"></xsl:value-of>
			<xsl:text>().getValue()</xsl:text>
		</xsl:variable>
		
		<xsl:value-of select="$rowset"></xsl:value-of>
	
	</xsl:template>	
	


</xsl:stylesheet>
		