(function(){

	var GEN = VARS.getGen();

	var list = {};
	
	GEN.Request = {

		get : function(url, p){

			p = p || {};

			if(!list[url]){

				$.get(url, p.data).then(function(d){

					if(p.then)

						p.then(d);

					list[url] = d;

				})

			}else{

				if(p.then)

					p.then(list[url]);

			}

		}

	}	

})();
