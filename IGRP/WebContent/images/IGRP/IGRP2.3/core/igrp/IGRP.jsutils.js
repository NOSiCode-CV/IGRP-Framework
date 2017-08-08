//number between two values?  return bool
Number.prototype.between = function(a, b) {
  var min = Math.min.apply(Math, [a, b]),
    max = Math.max.apply(Math, [a, b]);
  return this > min && this < max;
};
//replace all occurences of given string
String.prototype.replaceAll = function(str1, str2, ignore){
    return this.replace(new RegExp(str1.replace(/([\/\,\!\\\^\$\{\}\[\]\(\)\.\*\+\?\|\<\>\-\&])/g,"\\$&"),(ignore?"gi":"g")),(typeof(str2)=="string")?str2.replace(/\$/g,"$$$$"):str2);
};

String.prototype.convertToDate = function(){
	var s = this;
	try{
		s = this.split(' ');
		if(s[0].indexOf('-') != -1){
			var ds = s[0].split('-');
			var da = [];
			var c  = 0;
			for(var i = ds.length-1; i>=0 ; i--){
				da[c] = ds[i];
				c++;
			}
			s[0] = da.join('/')
		}
	}catch(e){
		console.log(e);
	}
	return s.join(' ');
};

String.prototype.capitalizeFirstLetter = function() {
    return this.charAt(0).toUpperCase() + this.slice(1);
}

$.fn.getXMLDocument = function(s) {
	var rtn;
	try{
		if(this[0]){
			var str = new XMLSerializer().serializeToString(this[0]);
			rtn = $.parseXML(str);
		}	
	}catch(e){
		rtn = false;
	}
    return rtn;
};

$.fn.alterClass = function ( removals, additions ) {
	
	var self = this;
	
	if ( removals.indexOf( '*' ) === -1 ) {
		// Use native jQuery methods if there is no wildcard matching
		self.removeClass( removals );
		return !additions ? self : self.addClass( additions );
	}

	var patt = new RegExp( '\\s' + 
			removals.
				replace( /\*/g, '[A-Za-z0-9-_]+' ).
				split( ' ' ).
				join( '\\s|\\s' ) + 
			'\\s', 'g' );

	self.each( function ( i, it ) {
		var cn = ' ' + it.className + ' ';
		while ( patt.test( cn ) ) {
			cn = cn.replace( patt, ' ' );
		}
		it.className = $.trim( cn );
	});

	return !additions ? self : self.addClass( additions );
};

$.fn.insertAt = function(index, element) {
  var lastIndex = this.children().size();
  if (index < 0) {
    index = Math.max(0, lastIndex + 1 + index);
  }
  this.append(element);
  if (index < lastIndex) {
    this.children().eq(index).before(this.children().last());
  }
  return this;
};

$.fn.writeAlert = function(alert,insertAt,index){

	if(insertAt){

		var i = index || 0;

		this.insertAt(0,alert);

	}else
		this.append(alert);
};