// JavaScript Document
/**
NOSI - ADILSON RODRIGUES
03-07-2009

OCX - SCAN AND IMAGE CAPTURE
**/


/*
0 - gfBMP: Bitmap format
1 - gfGIF: GIF format
2 - gfJPG: JPEG format
3 - gfPCX: PCX format
4 - gfPNG: PNG format
5 - gfWBMP: Wireless Bitmap format
6 - gfPSD: Adobe Photoshop format
7 - gfTIF: TIFF format
8 - gfPDF: Portable Document Format
*/




var NosiTwain = new function ()
{
    //Private
    var oCSXI=null;
    var oCSXIF=null;
    var mFullFileName=null;
    var mFileName=null;
    var mFileExt=null;

    var mServer=null;
    var mParameterName=null;
    var mParameterValue=null;
    var mLog=new Array();
    var mDevice = new Array();
    


    this.setOCX = function(pObject,pFrame)
    {
        oCSXI = pObject;
        oCSXIF = pFrame;
        oCSXI.UseTwainInterface=false;
        oCSXI.TwainMultiImage = true;
        oCSXI.ShowTwainProgress=true;
        oCSXI.UseSelection=true;
        oCSXI.TwainDuplexEnabled=true;

        this.LoadTwainDevice();
    }

    function display(pDisplay)
    {
        if(pDisplay)
        {
            oCSXI.style.display="block";
            oCSXIF.style.display="none";
        }
        else
        {
            oCSXI.style.display="none";
            oCSXIF.style.display="block";
        }
    }

    this.LoadTwainDevice = function()
    {
        try
        {
            for(var i=0; i<oCSXI.TwainDeviceCount;i++)
            {
                mDevice[i]=oCSXI.TwainDeviceName(i);
                if((mDevice[i].toUpperCase()).indexOf("TWAIN")>-1)
                    this.setCurrentDevice(i);
            }

        }
        catch(e)
        { null; }
    }

    this.setServer = function(pValue)
    {
        mServer = pValue.replace('&amp;','&');
    }

    this.setName = function(pValue)
    {
        mParameterName = pValue;
    }

    this.setValue= function(pValue)
    {
        mParameterValue = pValue;
    }

    //Set File Properties
    function setFile()
    {
        mFullFileName =  oCSXI.LastFileName;
        mFileName = mFullFileName.substring(mFullFileName.lastIndexOf("\\") + 1);
        mFileExt = mFileName.substring(mFileName.lastIndexOf(".") + 1);
    }


    //Get Devices
    this.getDevice = function()
    {
        return mDevice;
    }

    //Set Current Device
    this.setCurrentDevice = function(pValue)
    {
        oCSXI.CurrentTwainDevice = pValue;
    }

    //Get Current Device
    this.getCurrentDevice = function()
    {
        return oCSXI.CurrentTwainDevice;
    }

    


    //Get Full File Name
    this.getFullFileName = function()
    {
        if(mFileName==null)
            setFile();
        return mFullFileName;
    }

    //Get File Name
    this.getFileName = function()
    {
        if(mFileName==null)
            setFile();
        return mFileName;
    }

    //Get File Extension
    this.getFileExtension = function()
    {
        if(mFileName==null)
            setFile();
        return mFileExt;
    }

    //Check if file is an image
    this.isImage = function()
    {
        if(mFileName==null)
            setFile();

        /*switch (mFileExt.toUpperCase())
        {
          case "BMP" :
          case "GIF" :
          case "GIFF" :
          case "JPG" :
          case "JPEG" :
          case "PCX" :
          case "PNG" :
          case "WBMP" :
          case "PSD" :
          case "TIF" :
          case "TIFF" :
            return true;
          break;

          default :
            return false;
            break;
        }*/
        return true;
    }

    //Get Image Width
    this.getWidth=function()
    {
        //alert(oCSXI.FileName);
        return oCSXI.ImageWidth;
    }

    //Get Image Height
    this.getHeight=function()
    {
        return oCSXI.ImageHeight;
    }

    


      //Set Log
    this.setLog = function(pId,pFile)
    {
        mLog[pId] = pFile.replace('&amp;','&');
    }

    //Show File in Log
    this.showLog = function()
    {
        display(true);
        try
        {
            if((mLog[mParameterValue].substring(0,4)).toLowerCase()=="http")
                this.LoadURL(mLog[mParameterValue]);
            else
                this.LoadFile(mLog[mParameterValue]);
            return true;
        }
        catch(e)
        { return false; }
    }



      //Load Image From File
    this.LoadFile = function(pValue)
    {
        try
        {
            oCSXI.LoadFromFile(pValue);
        }
        catch(e)
        {
            display(false);
            oCSXIF.src=pValue;
        }
    }

    //Load Image From URL
    this.LoadURL = function(pValue)
    {
        try
        {
            oCSXI.LoadFromURL(pValue);
        }
        catch(e)
        {
            display(false);
            oCSXIF.src=pValue;
        }
    }

    //Add Form Parameter
    this.addParameter = function(pName,pValue)
    {
        oCSXI.AddFormVar(pName,pValue);
    }



    //Open File on Windows Explorer
    this.Open = function()
    {
        display(true);
        return oCSXI.LoadDialog();
    }

    //Select Scan Device
    this.SelectScan= function()
    {
       /* oCSXI.SelectTwainDevice();
        return oCSXI.TwainConnected;
        */
        display(true);
        return true;

    }

    //Start Scan
    this.Scan = function()
    {
        try
        {
            oCSXI.Acquire();
            return oCSXI.ImageHeight?true:false;
        }
        catch(e)
        { return false;}

    }

    this.PDF = function()
    {
       //oCSXI.Redraw();
       //alert("ACQUIRED");
       oCSXI.addToPDF(0);
       //oCSXI.addToTIF(0);
    }

    //Upload File to Server
    this.Upload = function()
    {
        setFile();
        mLog[mParameterValue] = mFullFileName;

        try
        {
			oCSXI.PostImage(mServer, mParameterValue, mParameterName, 8);
            oCSXI.ClearPDF();

            if((oCSXI.PostReturnFile).substring(0,2).toUpperCase()!="OK")
            {
                 alert("SERVER ERROR: "+oCSXI.PostReturnFile);
                 return false;
            }
            else return true;

        }
        catch(e)
        {return false;}
    }
    

    //Select Area To Crop
    this.SelectArea = function()
    {
        return oCSXI.MouseSelectRectangle();
    }

    //Crop File
    this.Crop = function()
    {
        try
        {
            oCSXI.CropToSelection();
            return true;
        }
        catch(e){ return false; }
    }

    //Rotate
    this.Rotate = function(pValue)
    {
        try
        {
            oCSXI.Rotate(pValue);
            return true;
        }
        catch(e){ return false; }
    }

    //Rotate Left
    this.RotateLeft = function()
    {
        return this.Rotate(90);
    }

    //Rotate Right
    this.RotateRight = function()
    {
        return this.Rotate(270);
    }

    //Resize
    this.Resize = function(pWidth)
    {
        try
        {
            oCSXI.ResizeImage(pWidth, 0);
            return true;
        }
        catch(e){ return false; }
    }


}

//TWAIN HANDLER

function addOption(pDestino,pValue,pText,pSelected)
{
		var opt_new = document.createElement("option");
		opt_new.value = pValue;
		opt_new.text = pText;

		if(pValue==pSelected)
			 opt_new.selected = true;

		try
		{
			 pDestino.add(opt_new,null);
		}
		catch(ex)
		{
			 pDestino.add(opt_new);
		}
}


function makeSelect()
{
		try
		{
			 TwainSource = document.formular_default.p_device;
			 var device = NosiTwain.getDevice();
			 for(var i=0;i<device.length;i++)
			 {
					addOption(TwainSource,i,device[i],NosiTwain.getCurrentDevice());
			 }
		}
		catch(e){null;}
}


function setParameter()
{				
	var href = ServerLink.replace("#","").replace(/&amp;/i,"&");	
	var url = href.substring(0,href.indexOf("?"));	
	if(href.indexOf("?")>-1)
	{
		var param = href.substring(href.indexOf("?")+1);
		
		var p = param.split("&");			
						
		for(var i=0;i<p.length;i++)
		{	
			var p1 = p[i].split("=");
			NosiTwain.addParameter(p1[0].replace(/amp;/,""),p1[1]);
			//alert(p1[0].replace(/amp;/,"")+"="+p1[1]);
		}
		
		ServerLink=href.substring(0,href.indexOf("?"));
		NosiTwain.setServer(ServerLink);
	}
	
	
}