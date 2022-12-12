var FILESIGNER = function(type,params){
	Field.call(this,type,params);

	var GEN 		= VARS.getGen(),
		field 		= this,
		proprieties = params.properties;

	field.xml.structure = 'text';

	field.xml.type = 'text';

	field.includes = {
		js  :[ { path:'/plugins/nosicaSigner/nosicaSigner.js'}]
	}
	
	field.ready = function(){
		console.log('read');

		field.setPropriety({
			name:'setSignerUrlHooks',
			value:false,
			editable:false,
			xslValue: function(){
				return `<xsl:if test="${field.GET.valuePath()}/value != ''">
					<xsl:attribute name="href">
						<xsl:value-of select="${field.GET.valuePath()}/value"/>
					</xsl:attribute>
				</xsl:if>`;
			}
		});

		field.setPropriety({
			name:'signerbeforsave',
			label:'Signer File From URL',
			value: false,
			onChange:function(v){
				field.SET.setSignerUrlHooks(v)
			},
			xslValue:'signerbeforsave'
		});
	}
}

VARS.getGen().declareField({
	type:'filesigner',
	field:FILESIGNER
});