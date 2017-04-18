var svapi    = {
  
  applet : null,
  set    : false,
  
  executeActiveX:function(p){
    //console.log(p);
    var GEN    = VARS.getGen();
    
    if(window.ActiveXObject){
      var base   = p.subversionpath;
      try{
        if(base){
            //var contentsArr       = GEN.plsqlEditor.getValue('\n').split('------*!GENSPLIT*!');
            var contrl   = 0; 
            
            var contents = [
                [],[],[],[]
            ];

           // console.log(GEN.plsqlEditor.lineCount());
            
            for(var x = 0; x < GEN.plsqlEditor.lineCount(); x++){
                var line = GEN.plsqlEditor.getLine(x);
                contents[contrl].push(line);

                if(line.indexOf('------*!GENSPLIT*!') != -1 && contrl < contents.length)
                    contrl++;
            }

            var fileSysController = new ActiveXObject("Scripting.FileSystemObject");
            //create folder if does not exists
            if(!fileSysController.FolderExists(base))
                fileSysController.CreateFolder(base);

            //arry of Path names and respective contents
            var contentsObj = [
                { 
                    name     : 'PACKAGES',
                    contents : [
                       { name: p.package+'.sql', content : contents[0] },
                       { name: p.html+'.sql', content : contents[2] }
                    ]
                },
                { 
                    name     : 'PACKAGES_BODIES',
                    contents : [
                       { name: p.package+'.sql', content : contents[1] },
                       { name: p.html+'.sql', content : contents[3] }
                    ]
                },
                { 
                    name     : 'TYPES',
                    contents : []
                }
            ];
            //add  /  at the end of basepath
            if(base.substr(base.length - 1)!='/') base+='/';
            
            //create folders and respective sql files
            contentsObj.forEach(function(c){
                var path = base+c.name;
                
                if(!fileSysController.FolderExists(path))
                    fileSysController.CreateFolder(path);
                
                var ctrl = 0;
                
                c.contents.forEach(function(sql,idx){
                    var file = fileSysController.OpenTextFile(path+'/'+sql.name, 2, true);
                    sql.content.forEach(function(content){
                        file.writeLine(content);
                    });                    
                    file.close();
                });
            });
            alert('Executado com sucesso!');
        }else{
            console.log('Invalid Path!')
        }
      }catch(err){
        console.log(err);
      }

    }else{
      alert('Funcionalidade suportada apenas no IE para esta versao do gerador.')
    }
    
  },
  execute:function(p){
	 var applet = svapi.applet;
	 var base   = p.subversionpath;
	 var GEN    = VARS.getGen();

	 if(applet.pathExists(base)){
		
		/*var packagesDir       = 'PACKAGES';
		var packagesBodiesDir = 'PACKAGES_BODIES';
		var TypesDir          = 'TYPES';*/

		var contentsArr = GEN.plsqlEditor.getValue().split('------*!GENSPLIT*!');
		
      var contentsObj = [
         { 
            name    : 'PACKAGES',
            contents : [
               { name: p.package+'.sql', content : contentsArr[0] },
               { name: p.html+'.sql', content : contentsArr[2] }
            ]
         },
         { 
            name    : 'PACKAGES_BODIES',
            contents : [
               { name: p.package+'.sql', content : contentsArr[1] },
               { name: p.html+'.sql', content : contentsArr[3] }
            ]
         },
         { 
            name    : 'TYPES',
            contents : []
         }
      ];

		var foldersArr        = [contentsObj[0].name,contentsObj[1].name,contentsObj[2].name];

	   var foldersResponse   = $.parseJSON(applet.createFolders(base,foldersArr));

      for(var r in foldersResponse){
         if(foldersResponse[r]){
            var folder = contentsObj[r];
           // 
            folder.contents.forEach(function(c){
               var response = $.parseJSON(applet.createFiles(base+'/'+folder.name,c.name,c.content));
               console.log(response)
            });
            
         }
      }

	 }else{
		console.log('path inexistent')
	 }
  },

  isSet:function(){
	 return svapi.set;
  },

  init:function(id){
	 var attributes = {
		  id: id,
		  name: id,
		  code: "GenSubversion.class",
		  mayscript: "true",
		  scriptable: "true",
		  archive: path+"/extensions/formgen/util/java/gen.subversion.jar",
		  width: 0,
		  height: 0,
		  permissions:'all-permissions'
	 };
	 
	 deployJava.runApplet(attributes, {});
	 
	 svapi.set = true;
	 
	 svapi.applet = window[id];
  }
}