var GENMAP = function(name,params){
	CONTAINER.call(this,name,params);
	
	var container    = this,
		includesPath = '/plugins/redgis/n_esri',
		cssPath      = includesPath+'/css',
		jsPath       = includesPath+'/js';


	container.xml.structure = 'form';


	container.includes = {
		/*css:[
			{ path : cssPath+'/esri.css' },
			{ path :'//js.arcgis.com/3.10/js/dojo/dijit/themes/claro/claro.css', relative:false },
			{ path : '//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css', relative:false },
			{ path : cssPath+'/redgisapp.css' },
			{ path : includesPath+'/widgets/css/widgets.css' },
			{ path : includesPath+'/widgets/css/steps.config.css' }
		],
		js :[
			{ path : jsPath+'/esri.3.13.js' },
			{ path : jsPath+'/dojo.require.js' },
			{ path : jsPath+'/mapp.library.js' },
			{ path : jsPath+'/mapp.js' },
			{ path : jsPath+'/Widgets.js' },
			{ path : jsPath+'/LayersManager.js' },
			{ path : jsPath+'/Geometry.js' }
		],*/
		xsl:['mapp','mapp.widgets']
	};

	container.onDrawEnd = function(){
		
	}

	container.ready = function(){
		container.setProperty({
			name:'url',
			label:'Map URL',
			value:path+'/core/formgen/types/containers/map/map.example.xml',
			isField:true
		});

		container.setProperty({
			name:'height',
			label:'Height',
			value:400
		});
	}

}


	var GEN = VARS.getGen();
	GEN.declareContainer({
	name:'map',
	container:GENMAP
});