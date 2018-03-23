var DATASTR = ['lorem','ipsum','dolor','sit', 'amet', 'consectetur','adipiscing','elit','labore','magna','aliqua','sed','ut','perspiciatis','unde','omnis','iste','natus','stract','sit','voluptatem','accusantium','doloremque','laudantium','totam','rem','aperiam','officia','deserunt','mollit','anim']


function genStr(chars,m){
    var text    = "";
    var lastPos = -1;
    var max     = m || 30; 

    for( var i=0; i < chars; i++ ){
    	var random = Math.floor(Math.random() * DATASTR.length);
    	var pos    = random == lastPos ?  Math.floor(Math.random() * DATASTR.length) : random;
    	lastPos    = pos;
        
        text += DATASTR[pos]+' ';
    }

    return $.trim( capitalizeFirstLetter(text).substring(0,max) );
}

function genNum(limit){
    return Math.floor(Math.random() * limit);
}
var DATA = {
	get:function(p){
		
		var rtn     = "",
			mlength = p && p.maxLength ? p.maxLength :  p.field && p.field.GET.maxlength ? p.field.GET.maxlength() : 30;

		switch(p.type){
			case 'date':
				/*var date = '0'+(genNum(8)+1)+'-0'+(genNum(8)+1)+'-201'+genNum(5);
				var time = genNum(23)+':'+genNum(59);
				console.log(p.field.proprieties.format.value)
				if(p.field.proprieties.format){
					
					//if()

				}*/
				//console.log(p);
				rtn='';
				//rtn = '0'+(genNum(8)+1)+'-0'+(genNum(8)+1)+'-201'+genNum(5);
			break;

			case 'number':
				rtn = genNum(mlength);
				//rtn = '123456789';
			break;

			case 'password':
				rtn = '******';
			break;

			case 'email':
				rtn = chance.email({domain: 'example.com'});
				//rtn = 'user@server.com';
			break;

			case 'link':
				rtn = chance.url();
				//rtn = 'http://www.nosi.cv';
			break;
			
			case 'textarea':
				rtn = genStr(15,mlength);
				//rtn = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
			break;

			case 'checkbox':
				rtn = '1';
			break;

			case 'radio':
				rtn = '1';
			break;

			case 'color':
				rtn =""
				var format = p.field && p.field.parent.type != 'table' && p.field.GET.format ? p.field.GET.format() : p.format;
				if(format){
					switch(format){
						case 'hex':
							rtn = '#'+'0123456789abcdef'.split('').map(function(v,i,a){return i>5 ? null : a[Math.floor(Math.random()*16)] }).join('');
						break;
						
						case 'rgba':
							rtn = 'rgba(' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ',0.6)';
						break;

						case 'rgb':
							rtn = 'rgb(' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ')';
						break;
					}
				}else{
					if(p && p.field && p.field.parent){
						var cont = p.field.parent;
						if(cont.GET.legendColors){
							var colors =  cont.GET.legendColors();
							
							if(colors.length){
								
								var idx = Math.floor(Math.random() * colors.length);
								rtn = colors[idx] ? colors[idx].value : colors[0].value;
								
							}
						}
					}else{
						rtn = Math.floor(Math.random() * 9 + 1);
					}
					
				}
				//console.log(rtn)
			break;

			case 'upload':
				rtn = '';
			break;

			case 'texteditor':
				rtn = genStr(20,mlength);
			break;

			case 'text':
				rtn = genStr(5,mlength);
			break;

			case 'select':
				var delimiter = p.field.GET.delimiter ? p.field.GET.delimiter() : '';
				rtn = p.field.GET.multiple() ? '1'+delimiter+'2' : '2';
			break;

			case 'plaintext':
				var chars = 25;
				if(p && p.field ){
					var container = p.field.parent;
					switch(container.GET.type()){
						case 'formlist':
							chars = 5;
						break;
					}
				}
				rtn = genStr(chars,mlength);
			break;

			case 'img':
				rtn = path+'/assets/img/jon_doe.jpg';
			break;

			case 'hidden':
				rtn = 1;
			break;

			default:
				rtn = '';
			break;
		}
		return rtn;
	}
}