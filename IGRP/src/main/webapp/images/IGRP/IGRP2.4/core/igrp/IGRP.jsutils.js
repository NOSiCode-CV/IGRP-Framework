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
		if(s[0].indexOf('-') !== -1){
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


String.prototype.igrpDateFormat = function(){
	var s = this;
	try{
		s = this.split(' ');
		if(s[0].indexOf('-') !== -1){
			var ds = s[0].split('-');
			var da = [];
			var c  = 0;
			for(var i = ds.length-1; i>=0 ; i--){
				da[c] = ds[i];
				c++;
			}
			s[0] = da.join('-')
		}
	}catch(e){
		console.log(e);
	}
	return s.join(' ');
};

String.prototype.igrpIsDate = function(){
	return eval(/^(0?[1-9]|[1-2][0-9]|3[01])[-](0?[1-9]|1[0-2])[-][1-9]\d{3}$/).test(this.trim());
}

String.prototype.igrpValideteDissextoDate = function(){

	const v = this.trim();

	let valid = true;

	if(v && v!= undefined){
		let ListofDays  = [31,28,31,30,31,30,31,31,30,31,30,31]; 
		let datepart    = v.split('-'); 
		let month       = parseInt(datepart[1]);      
		let day         = parseInt(datepart[0]);      
		let year        = parseInt(datepart[2]); 

		if (month === 1 || month > 2){ 

			valid = (day <= ListofDays[month-1]);

		}else if (month === 2){ 

			let leapYear = ( (!(year % 4) && year % 100) || !(year % 400));

			valid = !leapYear ? day <= ListofDays[1] : day <= 29;
		}
	}

	return valid;
}


String.prototype.igrpValidateDateFormat = function(){
	const v = this.trim();

	let valid = true;
	
	try{

		if(v && v!= undefined){

			let date = v;

			if(date.indexOf('/') !== -1){
				date = v.split('/');

				valid = date[0].igrpIsDate() && date[1].igrpIsDate();

				if(valid)
					valid = date[0].igrpValideteDissextoDate() && date[1].igrpValideteDissextoDate();

			}else{
				valid = v.igrpIsDate();

				if(valid)
					v.igrpValideteDissextoDate();
			}
		}
		
	}catch(e){
		console.log(e);
	}
	return valid;
};


String.prototype.iSoDateFormat = function(){
	return new Date(this).toISOString();
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

var containsFunc = function(a, i, m) {
	return $(a).text().toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
};

$.expr[':'].Contains = containsFunc;

$.expr[':'].contains = containsFunc;