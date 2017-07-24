// JavaScript Document Colorpicker init NOSi @2014
function componentToHex(pColor){
    var hex = pColor.toString(16);
    return hex.length == 1 ? "0" + hex : hex;
}

function rgbToHex(pObj) {
    return "#" + componentToHex(pObj.pR) + componentToHex(pObj.pG) + componentToHex(pObj.pB);
}

function preferredColorFormat(pObj){
	var vCor = "#ECC", vformat = (pObj.pThis.attr('format'))?(pObj.pThis.attr('format')):'hex',
		vR = Math.ceil(pObj.pColor._r), vG = Math.ceil(pObj.pColor._g), vB = Math.ceil(pObj.pColor._b);
	switch(vformat.toLowerCase()){
		case"rgb":
			vCor = 'rgb('+vR+','+vG+','+vB+')';
		break;
		case"rgba":
			vCor = 'rgba('+vR+','+vG+','+vB+','+pObj.pColor._a+')';
		break;
		default:
			vCor = rgbToHex({pR:vR,pG:vG,pB:vB});
	}
	return vCor;
}

function colorPikerInit(_this){
	var vAlpha = _this.attr('format') && _this.attr('format').toLowerCase() == 'rgba'?true:false,
		defaultColor = _this.attr('defaultColor')?_this.attr('defaultColor'):'#a7d447';
		defaultColor = (defaultColor.indexOf('#') != -1)?defaultColor:'#'+defaultColor;
	_this.spectrum({
		color:defaultColor,
		preferredFormat: "hex",
		showAlpha: vAlpha,
		move: function (color) {
			$("#"+$(this).attr("relColor")).val(preferredColorFormat({pThis:$(this),pColor:color}));
		}
	});
}

$(function(){
	$("body").on("click",".colorPicker",function(){
		colorPikerInit($(this));
		$(this).spectrum("show");
	});
	$(".colorPicker").click();
	
	$("body").on("keypress",".color",function(){
		var vThis = $(this).next("input:first");
		vThis.spectrum("show");
		vThis.spectrum("set",$(this).val());
	});
});