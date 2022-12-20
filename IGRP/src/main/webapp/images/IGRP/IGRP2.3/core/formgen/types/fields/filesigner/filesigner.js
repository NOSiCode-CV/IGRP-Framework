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

		const typeParent = field.parent.type;

		field.setPropriety({
			name:'setSignerUrlHooks',
			value:false,
			editable:false,
			xslValue: function(){
				
				const pathValue = typeParent === 'formlist' ? field.GET.tag() : `rows/content/${field.parent.GET.tag()}/fields/${field.GET.tag()}/value`;

				return `<xsl:if test=" ${pathValue} != ''">
					<xsl:attribute name="href">
						<xsl:value-of select="${pathValue}"/>
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