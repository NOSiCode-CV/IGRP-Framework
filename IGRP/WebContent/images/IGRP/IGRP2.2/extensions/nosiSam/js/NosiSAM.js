// JavaScript Document
/**
NOSI - ADILSON RODRIGUES
16-10-2015

Safenet - Authentication,Signature
**/

String.prototype.format = function() {
    var formatted = this;
    for (var i = 0; i < arguments.length; i++) {
        var regexp = new RegExp('\\{'+i+'\\}', 'gi');
        formatted = formatted.replace(regexp, arguments[i]);
    }
    return formatted;
};

var NosiSAM = new function()
{
	var oMyApplet = null;
	var sam = null;
	var tokens = null;
	var _log = "";
	var currentTerminal;
	var currentTokenSerial;
	var personal = null;
	var pin = null;
	
	
	//inicializa o Applet, Token e SAMAPI
	this.start = function(pObject)
	{
		try		
		{
			
			if(oMyApplet==null)
				oMyApplet=pObject;
			this.setLog("start: applet object is set");
			
				
			if(sam==null)
			{
				//sam=oMyApplet.getSAM();
				this.setLog("\n"+"start: sam card object is set");
			}
			
			
			if(tokens==null)
			{
				//tokens=new ActiveXObject("PhysicalDevices2.PhysicalTokens");
				tokens=new ActiveXObject("NosiPkcs11.NosiPkcs11");				
				this.setLog("\n"+"start: NosiPkcs11.NosiPkcs11 object is set");				
			}
						
		}
		catch(e)
		{
			this.setLog("start error::"+e.description);			
		}
	}
	
	
	//set Log
	this.setLog = function(pLog)
	{
		_log=_log+"\n"+pLog;	
	}
	
	//Clear log
	this.clearLog = function()
	{
		_log="";
	}
	
	//Retorna log
	this.getLog = function()
	{
		return _log;
	}
	
	//Retorna IsTokenPresent
	this.IsTokenPresent = function()
	{
		return tokens.IsTokenPresent();
	}
	
	
		
	//Função para obter os terminais
	this.getTerminals = function()	{	
		this.setLog("getTerminals start");	
		var terminals=JSON.parse(tokens.GetTokens());
		var _terminals=new Array();			
		this.setLog("getTerminals Count: "+terminals.Tokens.length);		
		for(var i=0;i<terminals.Tokens.length;i++)
		{				
			_terminals.push(terminals.Tokens[i]);			
			if(currentTokenSerial!="" && currentTokenSerial==terminals.Tokens[i].SerialString)
			{
				currentTerminal=terminals.Tokens[i];
			}
			
			if(i==0 && currentTerminal==null)
				currentTerminal=terminals.Tokens[i];
		}
		currentTokenSerial=currentTerminal.SerialString;
		this.setLog("getTerminals end");			
		return _terminals;
	}
	
	
	//Função para obter o terminal CURRENT
	this.getCurrentTerminal = function()
	{
		this.setLog("getCurrentTerminal start");	
		if(currentTerminal==null)
			//currentTerminal=tokens.GetFirstToken();
			this.setCurrentTerminal();
		currentTokenSerial=currentTerminal.SerialString;
		this.setLog("getCurrentTerminal end");
		return currentTerminal;
	}
	
	//Função para set o terminal CURRENT
	this.setCurrentTerminal = function()
	{
		this.setLog("setCurrentTerminal start");	
		this.getTerminals();
		this.setLog("setCurrentTerminal end");			
	}
	
	//Função para obter o CURRENT Token Serial
	this.getCurrentTokenSerial = function()
	{	
		this.setLog("getCurrentTokenSerial start");					
		if(currentTokenSerial=="")
		{
			this.getCurrentTerminal();	
			currentTokenSerial=currentTerminal.SerialString;
		}
		this.setLog("getCurrentTokenSerial end");
		return currentTokenSerial;
	}
	
	//Função para obter set CURRENT Token Serial
	this.setCurrentTokenSerial=function(pCurrentTokenSerial)
	{
		this.setLog("setCurrentTokenSerial start");	
		currentTokenSerial=pCurrentTokenSerial;
		this.setCurrentTerminal();
		this.setLog("setCurrentTokenSerial serial:"+currentTokenSerial+" label: "+currentTerminal.Label);
		this.setLog("setCurrentTokenSerial end");	
	}
	
	//Get CurrentToken Json Info
	this.getCurrentTokenInfo=function()
	{	
		this.setLog("getCurrentTokenInfo start");	
		
		//alert(currentTerminal.Serialize());
		
		/*var info='{"serial":"'+currentTerminal.SerialString
		+'","CardType":"'+currentTerminal.CardType
		+'","CardVersion":"'+currentTerminal.CardVersion.Major+'.'+currentTerminal.CardVersion.Minor
		+'","CaseModel":"'+currentTerminal.CaseModel
		+'","Color":"'+currentTerminal.Color
		+'","FipsSupport":"'+(currentTerminal.FIPSSupported ? '1' : '0')
		+'","HasBattary":"'+(currentTerminal.HasBattery ? '1' : '0')
		+'","HasFips":"'+(currentTerminal.HasFIPS ? '1' : '0')
		+'","HasLCD":"'+(currentTerminal.HasLCD ? '1' : '0')
		+'","HasSO":"'+(currentTerminal.HasSO ? '1' : '0')
		+'","HasStorage":"'+(currentTerminal.MassStoragePresent ? '1' : '0')
		+'","HasUser":"'+(currentTerminal.HasUser ? '1' : '0')
		+'","HMAC_SHA1Support":"'+(currentTerminal.HMAC_SHA1Supported ? '1' : '0')
		+'","MayInit":"'+(currentTerminal.MayInit ? '1' : '0')
		+'","RSA2048Support":"'+(currentTerminal.RSA2048Supported ? '1' : '0')
		+'","SlotType":"'+currentTerminal.SlotType
		+'","MemorySize":"'+currentTerminal.MemorySize
		+'","Label":"'+currentTerminal.Label
		+'","Model":"'+currentTerminal.Model			
		+'","ProductionDate":"'+currentTerminal.ProductionDate
		+'","ProductName":"'+currentTerminal.ProductName+'"}';
		*/
		
		var info='{"serial":"'+currentTerminal.SerialString
		+'","Label":"'+currentTerminal.Label
		+'","Model":"'+currentTerminal.Model			
		+'","ManufacturerId":"'+currentTerminal.ManufacturerId+'"}';
		
		this.setLog("getCurrentTokenInfo end");
		return info;
	}
	
	//Get CurrentToken XML Info
	this.getCurrentTokenInfoXML=function()
	{	
		this.setLog("getCurrentTokenInfoXML start");
		
		var token = this.getCurrentTerminal();

		var infoXML = '<?xml version="1.0" encoding="utf-8"?>\
		<Tokens>\
			<Token serial="{0}">\
				<CardType>{1}</CardType>\
				<CardVersion>{2}</CardVersion>\
				<CaseModel>{3}</CaseModel>\
				<Color>{4}</Color>\
				<FipsSupport>{5}</FipsSupport>\
				<HasBattary>{6}</HasBattary>\
				<HasFips>{7}</HasFips>\
				<HasLCD>{8}</HasLCD>\
				<HasSO>{9}</HasSO>\
				<HasStorage>{10}</HasStorage>\
				<HasUser>{11}</HasUser>\
				<HMAC_SHA1Support>{12}</HMAC_SHA1Support>\
				<MayInit>{13}</MayInit>\
				<RSA2048Support>{14}</RSA2048Support>\
				<SlotType>{15}</SlotType>\
				<MemorySize>{16}</MemorySize>\
				<Label>{17}</Label>\
				<Model>{18}</Model>\
				<ProductionDate>{19}</ProductionDate>\
				<ProductName>{20}</ProductName>\
			</Token>\
		</Tokens>'.format(token.SerialString,
            token.CardType,
            "{0}.{1}".format(token.CardVersion.Major, token.CardVersion.Minor),
            token.CaseModel,
            token.Color,
            token.FIPSSupported ? "1" : "0",
            token.HasBattery ? "1" : "0",
            token.HasFIPS ? "1" : "0",
            token.HasLCD ? "1" : "0",
            token.HasSO ? "1" : "0",
            token.MassStoragePresent ? "1" : "0",
            token.HasUser ? "1" : "0",
            token.HMAC_SHA1Supported ? "1" : "0",
            token.MayInit ? "1" : "0",
            token.RSA2048Supported ? "1" : "0",
            token.SlotType,
            token.MemorySize,
            token.Label,
            token.Model,
            token.ProductionDate/*.ToString("MM/dd/yyyy")*/,
            token.ProductName);
		
		
		this.setLog("getCurrentTokenInfoXML end");
		return infoXML;
	}
	
	
	
	
	//Set PIN
	this.setPin=function(pPin)
	{
		pin = pPin;
		this.setLog("setPin: OK");	
	}
	
	//validatePin
	this.validatePin=function()
	{
		this.setLog("validatePin start");	
		var isPinValid=false;
		if(currentTerminal==null)
			this.getCurrentTerminal();
			
		try
		{			
			/*var hSession=currentTerminal.OpenSession(pin); 
			if(hSession != 0)
			{  
			   currentTerminal.CloseSession(hSession);
			   isPinValid = true;
			}*/
			isPinValid=tokens.ValidatePin(this.getCurrentTokenSerial(),"",pin);
		}
		catch(e){ this.setLog("validatePin error "+e.description); }
		
		this.setLog("validatePin end");
		return isPinValid;		
	}
		
	
	//doAuthentication
	this.doAuthentication=function(pMessage,pPin,pSerialString)
	{
		this.setLog("doAuthentication start");	
		/*this.setPin(pPin);
		if(!this.validatePin())	
			return '{"status":"false","status_text":"Incorrect Password"}';
		this.setLog("doAuthentication end");
		*/
		if(pSerialString!=null)
			this.setCurrentTokenSerial(pSerialString);
		else
			this.setCurrentTerminal();
			
		var result="";
		try
		{	
			result=tokens.Sign(tokens.Base64Encode(pMessage),this.getCurrentTokenSerial(),"",pPin);
			var obj=JSON.parse(result);
			result='{"status":"true","message":"'+pMessage+'","message_digest":"'+obj.Signature+'","certificate":"'+obj.Certificate+'"}';
		}	
		catch(e){result='{"status":"false","status_text":"'+e.description+'"}';}
		this.setLog("doAuthentication end");		
		return result;
		
	}
	
	//Evaluate Pin
	this.EvaluatePIN=function(newPin)
	{
		this.setLog("EvaluatePIN start");
		var res = 0;
		var reason = 0;	
		
		if(currentTerminal==null)
			this.getCurrentTerminal();
		try
		{		
			res=currentTerminal.EvaluatePIN(newPin, reason); 
		}
		catch(e) {this.setLog("EvaluatePIN error "+e.description);}
		this.setLog("EvaluatePIN reason "+reason);
		this.setLog("EvaluatePIN res "+res);				
		this.setLog("EvaluatePIN end");
		return res==100;		
	}
	
	//Change Pin
	this.ChangePIN=function(oldPIN, newPIN)
	{
		this.setLog("ChangePIN start");
		
		//Validação da nova password
		/*if(!this.EvaluatePIN(newPIN)) return false;
		
		//Verifica password antiga
		this.setPin(oldPIN);		
		if(!this.validatePin()) return false;
		*/
		
		if(currentTerminal==null)
			this.getCurrentTerminal();
		
		this.setPin(newPIN);
		
		var res=false;
		try
		{
			res=tokens.ChangePin(this.getCurrentTokenSerial(),"",oldPIN,newPIN);
		}
		catch(e){this.setLog("ChangePIN error "+e.description);}	
				
		this.setLog("ChangePIN end");
		return res;		
	}
	
	
	//Set Label
	this.SetLabel=function(label)
	{
		this.setLog("SetLabel start");			
		var res=false;
		try
		{
			currentTerminal.SetLabel(label,pin); 
			res=true;
		}
		catch(e){this.setLog("SetLabel error "+e.description);}	
				
		this.setLog("SetLabel end");
		return res;		
	}
}