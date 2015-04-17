package com
{
	import flash.display.GraphicsBitmapFill;
	import flash.display.GraphicsEndFill;
	import flash.display.GraphicsGradientFill;
	import flash.display.GraphicsPath;
	import flash.display.GraphicsShaderFill;
	import flash.display.GraphicsSolidFill;
	import flash.display.GraphicsStroke;
	import flash.display.GraphicsTrianglePath;
	import flash.display.IGraphicsData;
	import flash.geom.Point;
	
	import entities.CssAttributes;

	public class CreateShapeHTML
	{
		public function CreateShapeHTML()
		{
		}

		/**
		 * HTML5 ConternerBackground
		 * Started
		 **/
		
		private var mainGraphicsPath:GraphicsPath;
		private var mainGraphicsStrokePath:GraphicsPath;
		private var mainGraphicsSolidFill:GraphicsSolidFill;
		private var mainGraphicsGradientFill:GraphicsGradientFill;
		private var mainGraphicsStroke:GraphicsStroke;
		private var mainGraphicsStrokeFill:GraphicsSolidFill;
		private var graphicsDataPatten:String;
		
		public function ValidateHTMLContener(graphicsData:Vector.<IGraphicsData>):Boolean
		{
			graphicsDataPatten = "";
			mainGraphicsPath=null;
			mainGraphicsGradientFill=null;
			mainGraphicsSolidFill=null;
			mainGraphicsStroke=null;
			
			//Validate graphicsData pattents
			for( var n:int=0; n<graphicsData.length; n++)
			{
				//Call graphics passer
				if(graphicsData[n] is GraphicsEndFill)
				{
					graphicsDataPatten+="0";
				}
				else if(graphicsData[n] is GraphicsStroke)
				{
					graphicsDataPatten+="1";
				}
				else if(graphicsData[n] is GraphicsPath)
				{
					graphicsDataPatten+="2";
				}
				else if(graphicsData[n] is GraphicsSolidFill)
				{
					graphicsDataPatten+="3";
				}
				else if(graphicsData[n] is GraphicsGradientFill)
				{
					graphicsDataPatten+="4";
				}
				else if(graphicsData[n] is GraphicsShaderFill)
				{
					graphicsDataPatten+="5";
				}
				else if(graphicsData[n] is GraphicsTrianglePath)
				{
					graphicsDataPatten+="6";
				}
				else if(graphicsData[n] is GraphicsBitmapFill)
				{
					graphicsDataPatten+="7";
				}
			}
			
			//Find the Path of the background 
			//420121
			//4201210
			
			switch(graphicsDataPatten)
			{
				case "320320":
					if(graphicsData[0] is GraphicsSolidFill)
					{
						//Identifying Solid Fill
						mainGraphicsSolidFill = graphicsData[0] as GraphicsSolidFill;
					}
					//Identifying Path
					if(graphicsData[1] is GraphicsPath)
					{
						mainGraphicsPath = graphicsData[1] as GraphicsPath;
					}
					//Identifying Path
					if(graphicsData[3] is GraphicsSolidFill)
					{
						mainGraphicsStrokeFill = graphicsData[3] as GraphicsSolidFill;
					}
					
					//Identifying stroke Path
					if(graphicsData[4] is GraphicsPath)
					{
						mainGraphicsStrokePath = graphicsData[4] as GraphicsPath;
					}
					
					break;
				case "3201210":
				case "4201210":
				case "320":
				case "420":
				case "1210":
					//Identifying Fill
					if(graphicsData[0] is GraphicsSolidFill)
					{
						//Identifying Solid Fill
						mainGraphicsSolidFill = graphicsData[0] as GraphicsSolidFill;
					}
					else if(graphicsData[0] is GraphicsGradientFill)
					{
						//Identifying Gradient Fill
						mainGraphicsGradientFill = graphicsData[0] as GraphicsGradientFill;
					}
					
					//Identifying Path
					if(graphicsData[1] is GraphicsPath)
					{
						mainGraphicsPath = graphicsData[1] as GraphicsPath;
					}
					
					//Identifying Stroke
					if(graphicsData.length>4)
					{
						if(graphicsData[3] is GraphicsStroke)
						{
							mainGraphicsStroke = graphicsData[3] as GraphicsStroke;
						}
						//Identifying stroke Path
						if(graphicsData[4] is GraphicsPath)
						{
							mainGraphicsStrokePath = graphicsData[4] as GraphicsPath;
						}
					}
					else if(graphicsData.length==4)
					{
						if(graphicsData[0] is GraphicsStroke)
						{
							mainGraphicsStroke = graphicsData[0] as GraphicsStroke;
						}
						//Identifying stroke Path
						if(graphicsData[1] is GraphicsPath)
						{
							mainGraphicsStrokePath = graphicsData[1] as GraphicsPath;
						}
					}
					break;
				case "1210320":
				case "1210420":
					//Identifying Fill
					if(graphicsData[4] is GraphicsSolidFill)
					{	//Identifying Solid Fill
						mainGraphicsSolidFill = graphicsData[4] as GraphicsSolidFill;
					}
					else if(graphicsData[4] is GraphicsGradientFill)
					{
						//Identifying Gradient Fill
						mainGraphicsGradientFill = graphicsData[4] as GraphicsGradientFill;
					}
					
					//Identifying main fill Path
					if(graphicsData[5] is GraphicsPath)
					{
						mainGraphicsPath = graphicsData[5] as GraphicsPath;
					}
					//Identifying stroke Path
					if(graphicsData[1] is GraphicsPath)
					{
						mainGraphicsStrokePath = graphicsData[1] as GraphicsPath;
					}
					
					//Identifying Stroke
					if(graphicsData[0] is GraphicsStroke)
					{
						mainGraphicsStroke = graphicsData[0] as GraphicsStroke;
					}
					break;
				default:
					return false;
					break;
			}
			
			//trace("case \""+mainGraphicsPath.commands.join("") +"\":");
			switch(mainGraphicsPath.commands.join(""))
			{
				case "1332332332332":
					//roundedRectangle
				case "132323232":
					//roundedRectangle
				case "123232323":
					//roundedRectangle
				case "13333233332":
					//roundedRectangle
				case "12333323333":
					//roundedRectangle
				case "12232233":
					//tl br
				case "12222":
					//squareShape
				case "13323333233":
					//round top/bottom
				case "12333323333":
					//round left/right
				case "133333333":
					//circle
				case "1232332332":
				case "1233233233233":
					//borderRadiushape
				case "12322332":
				case "123322332":
				case "1232232":
				case "12332232":
					//topRight_bottomLeftShape
				case "12233223":
				case "122332233":
					//topLeft_bottomRightShape
				case "1233223323":
				case "12332233233":
					//bottomRightAngleShape
				case "1233233223":
				case "12332332233":
				case "123323323323":
				case "12323323323":
					//bottomLeftAngleShape
				case "1223323323":
				case "12233233233":
					//topRightAngleShape
				case "12332332332":
					//topLeftAngleShape
				case "12223323":
				case "122233233":
					//topRightBottomLeftShape
					
				case "12332223":
				case "123322233":
					//topRightTopLeftShape
				case "123323322":
				case "12323322":
					//topRightBottomRight
				case "12233232":
				case "122332332":
					//bottomRightBottomLeftShape
					
				case "1233222":
					//topRightShape
				case "1222332":
					//bottomLeftShape
				case "1223322":
					//bottomRightShape
				case "1222233":
					//leftTopShape
					
					//Passed all the check and return true
					return true;
					break;		
			}
			
			return false;
		}
		
		
		
		public function GetContenerBoundingBox(path:GraphicsPath,contentHolderWidth:Number, cssAttributes:CssAttributes):CssAttributes
		{	
			// Helps to find the largest bounding box
			var le:Number = path.data[0];
			var to:Number = path.data[1];
			var ri:Number = path.data[0];
			var bo:Number = path.data[1];
			
			for (var i:int = 0; i < path.data.length/2 ; i++)
			{
				// If the size of new Rectangle is larger that the previous one, we update the values for the bounding box
				if ( le > path.data[(i*2)] ) le = path.data[(i*2)];
				if ( to > path.data[(i*2)+1] ) to = path.data[(i*2)+1];
				if ( ri < path.data[(i*2)] ) ri = path.data[(i*2)];
				if ( bo < path.data[(i*2)+1] ) bo = path.data[(i*2)+1];
			}
			
			//Return height and width of the background css
			cssAttributes.height 		= getCssUnitText(bo-to,"px"); // Math.ceil(bo-to)+"px";
			cssAttributes.width 		= getCssUnitText(ri-le,"px"); // Math.ceil(ri-le)+"px";
			//cssAttributes.width 		= Math.round(((ri-le)/contentHolderWidth)*100)+"%;";
			cssAttributes.marginTop 	= getCssUnitText(to,"px"); // Math.ceil(to)+"px";
			cssAttributes.marginLeft 	= getCssUnitText(le,"px"); // Math.ceil(le)+"px";
			
			return 	cssAttributes;
		}
		
		private function getCssUnitText(unit:Number,unitName:String):String
		{
			if(unit == 0)
				return "0";	//return unit without unitName
			else
				return Math.ceil(unit) + unitName; //Exp: 8px, 8em,   
		}
		
		public function GetSolidFill(fill:GraphicsSolidFill):String
		{
			if(fill != null)
			{
				var red:uint = uint(fill.color) >> 16 & 0xFF;
				var green:uint = uint(fill.color) >> 8 & 0xFF;
				var blue:uint = uint(fill.color) & 0xFF;
				
				return "rgba("+red+", "+green+", "+blue+", "+fill.alpha+")";
			}
			return "rgb(0,0,0)";
		}
		
		public function GetGradientFill(fill:GraphicsGradientFill):String
		{
			var red:uint;
			var green:uint;
			var blue:uint;
			
			red= uint(fill.colors[0]) >> 16 & 0xFF;
			green = uint(fill.colors[0]) >> 8 & 0xFF;
			blue = uint(fill.colors[0]) & 0xFF;
			return "rgba("+red+", "+green+", "+blue+", "+fill.alphas[0]+")";
		}
		
		public function GetBackgroundGradientFill(fill:GraphicsGradientFill, cssAttributes:CssAttributes):CssAttributes
		{
			var red:uint;
			var green:uint;
			var blue:uint;
			
			
			var gradientColor:String="";
			for(var i:int=0; i<fill.colors.length;i++)
			{
				red= uint(fill.colors[i]) >> 16 & 0xFF;
				green = uint(fill.colors[i]) >> 8 & 0xFF;
				blue = uint(fill.colors[i]) & 0xFF;
				
				if(fill.colors.length-1==i)
				{
					gradientColor += "rgba("+red+","+green+","+blue+","+fill.alphas[i]+") "+int((fill.ratios[i]/255)*100)+"%"
				}
				else
				{
					gradientColor += "rgba("+red+","+green+","+blue+","+fill.alphas[i]+") "+int((fill.ratios[i]/255)*100)+"%,"
				}
			}
			var px:Point = new flash.geom.Point(0, 1);
			px = fill.matrix.deltaTransformPoint(px);
			
			Trace.log("rotation: " +int(90-(180/Math.PI) * Math.atan2(px.y, px.x) ));
			
			if(fill.type=="linear")
			{
				cssAttributes.backgroundImage = fill.type+"-gradient("+int(90-int((180/Math.PI) * Math.atan2(px.y, px.x)))+"deg,"+gradientColor+")";
			}
			else if(fill.type=="radial")
			{	
				cssAttributes.backgroundImage =fill.type+"-gradient("+gradientColor+")";
			}
			return cssAttributes;
		}
		
		public function GetContenerBackground(path:GraphicsPath, cssAttributes:CssAttributes):CssAttributes
		{
			var tlRadius:Number=0;
			var trRadius:Number=0;
			var brRadius:Number=0;
			var blRadius:Number=0;
			
			switch(path.commands.join(""))
			{
				case "12222":
					//rectangle
					cssAttributes.borderRadius = "0";//0px
					return cssAttributes;
					break;
				
				case "13323333233":
					//round top/bottom
					tlRadius=Math.abs(path.data[0]);
					trRadius=Math.abs(path.data[9]);
					brRadius=Math.abs(path.data[18]);
					blRadius=Math.abs(path.data[29]);
					break;
				case "12333323333":
					//round left/right
					tlRadius=Math.abs(path.data[0]);
					trRadius=Math.abs(path.data[11]);
					brRadius=Math.abs(path.data[20]);
					blRadius=Math.abs(path.data[29]);
					break;
				case "133333333":
					//circle
					tlRadius=Math.abs(path.data[0]);
					trRadius=Math.abs(path.data[9]);
					brRadius=Math.abs(path.data[17]-path.data[16]);
					blRadius=Math.abs(path.data[25]);
					break;
				case "1332332332332":
					//roundedRectangle
					tlRadius=Math.abs(path.data[0]-path.data[8]);
					trRadius=Math.abs(path.data[10]-path.data[18]);
					brRadius=Math.abs(path.data[20]-path.data[28]);
					blRadius=Math.abs(path.data[30]-path.data[38]);
					break;
				case "1233233233233":
					//roundedRectangle
					tlRadius=Math.abs(path.data[2]-path.data[10]);
					trRadius=Math.abs(path.data[12]-path.data[20]);
					brRadius=Math.abs(path.data[22]-path.data[30]);
					blRadius=Math.abs(path.data[32]-path.data[40]);
					break;
				
				case "12332232":
					//topRight_bottomLeftShape
					tlRadius=0;
					trRadius=Math.abs(path.data[11]);
					brRadius=0;
					blRadius=Math.abs(path.data[14]);
					break;
				case "1232232":
					//topRight_bottomLeftShape
					tlRadius=0;
					trRadius=Math.abs(path.data[7]);
					brRadius=0;
					blRadius=Math.abs(path.data[10]);
					break;
				case "12322332":
					//topRight_bottomLeftShape
					tlRadius=0;
					trRadius=Math.abs(path.data[7]);
					brRadius=0;
					blRadius=Math.abs(path.data[10]);
					break;
				case "123322332":
					//topRight_bottomLeftShape
					tlRadius=0;
					trRadius=Math.abs(path.data[11]);
					brRadius=0;
					blRadius=Math.abs(path.data[14]);
					break;
				
				
				case "12232233":
					//tl br
					//topLeft_bottomRightShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=0;
					brRadius=Math.abs(path.data[7] - path.data[5]);
					blRadius=0;
					break;
				case "12233223":
				case "122332233":
					//topLeft_bottomRightShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=0;
					brRadius=Math.abs(path.data[6] - path.data[5]);
					blRadius=0;
					break;
				
				case "1233223323":
				case "12332233233":
					//bottomRightAngleShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=Math.abs(path.data[11]);
					brRadius=0;
					blRadius=Math.abs(path.data[14]);
					break;
				
				case "1233233223":
				case "12332332233":
					//bottomLeftAngleShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=Math.abs(path.data[11]);
					brRadius=Math.abs(path.data[14]-path.data[13]);
					blRadius=0;
					break;
				
				case "1223323323":
				case "12233233233":
					//topRightAngleShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=0;
					brRadius=Math.abs(path.data[13]-path.data[5]);//brRadius=Math.abs(path.data[13]-path.data[12]);
					blRadius=Math.abs(path.data[14]);
					break;
				
				case "1232332332":
					//topLeftAngleShape
					tlRadius=0;
					trRadius=Math.abs(path.data[7]);
					brRadius=Math.abs(path.data[15]-path.data[9]);
					blRadius=Math.abs(path.data[18]);
					break;
				case "12332332332":
				case "123323323323":
					//topLeftAngleShape
					tlRadius=0;
					trRadius=Math.abs(path.data[11]);
					brRadius=Math.abs(path.data[12]-path.data[13]);
					blRadius=Math.abs(path.data[22]);
					break;
				case "12323323323":
					//topLeftAngleShape
					tlRadius=0;
					trRadius=Math.abs(path.data[7]);
					brRadius=Math.abs(path.data[17]-path.data[9]);
					blRadius=Math.abs(path.data[18]);
					break;
				case "12223323":
				case "122233233":
					//topLeftBottomLeftShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=0;
					brRadius=0;
					blRadius=Math.abs(path.data[6]);
					break;
				case "12332223":
				case "123322233":
					//topRightTopLeftShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=Math.abs(path.data[11]);
					brRadius=0;
					blRadius=0;
					break;
				case "12323322":
					//topRightBottomRight
					tlRadius=0;
					trRadius=Math.abs(path.data[7]);
					brRadius=Math.abs(path.data[10]-path.data[9]);
					blRadius=0;
					break;
				case "123323322":
					//topRightBottomRight
					tlRadius=0;
					trRadius=Math.abs(path.data[33]);
					brRadius=Math.abs(path.data[19]-path.data[13]);
					blRadius=0;
					break;
				case "12233232":
				case "122332332":
					//bottomRightBottomLeftShape
					tlRadius=0;
					trRadius=0;
					brRadius=Math.abs(path.data[13]-path.data[5]);//brRadius=Math.abs(path.data[13]-path.data[12]);
					blRadius=Math.abs(path.data[14]);
					break;
				case "1233222":
					//topRightShape
					tlRadius=0;
					trRadius=Math.abs(path.data[11]);
					brRadius=0;
					blRadius=0;
					break;
				case "1222332":
					//bottomLeftShape
					tlRadius=0;
					trRadius=0;
					brRadius=0;
					blRadius=Math.abs(path.data[6]);
					break;
				case "1223322":
					//bottomRightShape
					tlRadius=0;
					trRadius=0;
					brRadius=Math.abs(path.data[6]-path.data[5]);
					blRadius=0;
					break;
				case "1222233":
					//leftTopShape
					tlRadius=Math.abs(path.data[0]);
					trRadius=0;
					brRadius=0;
					blRadius=0;
					break;
					
				case "132323232":
					//roundedRectangle
					tlRadius=Math.abs(path.data[0]-path.data[4]);
					trRadius=Math.abs(path.data[6]-path.data[10]);
					brRadius=Math.abs(path.data[12]-path.data[16]);
					blRadius=Math.abs(path.data[18]-path.data[22]);
					break;
				case "123232323":
					//roundedRectangle
					tlRadius=Math.abs(path.data[2]-path.data[6]);
					trRadius=Math.abs(path.data[8]-path.data[12]);
					brRadius=Math.abs(path.data[14]-path.data[18]);
					blRadius=Math.abs(path.data[20]-path.data[24]);
					break;
				case "13333233332":
					//roundedRectangle
					tlRadius=Math.abs(path.data[0]-path.data[8]);
					trRadius=Math.abs(path.data[8]-path.data[16]);
					brRadius=Math.abs(path.data[18]-path.data[26]);
					blRadius=Math.abs(path.data[26]-path.data[24]);
					break;
				case "12333323333":
					//roundedRectangle
					tlRadius=Math.abs(path.data[2]-path.data[10]);
					trRadius=Math.abs(path.data[10]-path.data[18]);
					brRadius=Math.abs(path.data[20]-path.data[28]);
					blRadius=Math.abs(path.data[28]-path.data[26]);
					break;		
			}
			
			if(tlRadius==trRadius && tlRadius==blRadius && tlRadius==brRadius)
			{
				cssAttributes.borderRadius = getCssUnitText(tlRadius,"px"); //brRadius+"px";
				return cssAttributes; 				
			}
			else
			{
				cssAttributes.borderTopLeftRadius		= getCssUnitText(tlRadius,"px"); //tlRadius+"px";
				cssAttributes.borderTopRightRadius  	= getCssUnitText(trRadius,"px"); //tlRadius+"px";
				cssAttributes.borderBottomRightRadius 	= getCssUnitText(brRadius,"px"); //brRadius+"px";
				cssAttributes.borderBottomLeftRadius 	= getCssUnitText(blRadius,"px"); //brRadius+"px";
				return cssAttributes; 		
			}
			return cssAttributes;
		}
		
		
		public function GetStrokeType(path:GraphicsPath):String
		{
			if(path.commands.join("").substr(0,6) == "121212"){
				return "dashed";
			}
			if(path.commands.join("").substr(0,14) == "133333333"){
				return "dotted";
			}
			return "solid";
		}
		
		public function GetStroke(stroke:GraphicsStroke, graphicPath:GraphicsPath, cssAttributes:CssAttributes):CssAttributes
		{
			//mainGraphicsStrokePath
			var borderCSS:String="";
			//Identifying Fill
			if(stroke != null)
			{
				if(stroke.fill is GraphicsSolidFill)
				{	//Identifying Solid Fill 
					borderCSS = GetSolidFill(stroke.fill as GraphicsSolidFill);
				}
				else if(stroke.fill is GraphicsGradientFill)
				{
					//Identifying Gradient Fill
					borderCSS = GetGradientFill(stroke.fill as GraphicsGradientFill);
				}
				cssAttributes.border	=	stroke.thickness+"px "+GetStrokeType(mainGraphicsStrokePath)+" "+ borderCSS;
			}else
			{
				if(mainGraphicsStrokeFill)
				{	//Identifying Solid Fill 
					borderCSS = GetSolidFill(mainGraphicsStrokeFill as GraphicsSolidFill);
				}
				cssAttributes.border	=	"1px "+GetStrokeType(mainGraphicsStrokePath)+" "+ borderCSS;
			}
			
			return cssAttributes;
		}
		
		public function HTMLContenerBackground(graphicsData:Vector.<IGraphicsData>, contentHolderWidth:Number, justBackgroundValues:Boolean, cssAttributes:CssAttributes, parentContener:String):CssAttributes
		{	
			//var cssAttributes:CssAttributes;
			if( ValidateHTMLContener(graphicsData))
			{
				//cssAttributes = new CssAttributes();
				//Create background CSS
				if( parentContener == "html body") //!justBackgroundValues &&
				{	//Not create background bounding box for Background color Values only
					cssAttributes=GetContenerBoundingBox(mainGraphicsPath,contentHolderWidth, cssAttributes);
				}
				//use shape to get backgroundcolor
				cssAttributes=GetContenerBackground(mainGraphicsPath, cssAttributes);
				
				
				if(mainGraphicsGradientFill!=null)
				{
					cssAttributes=GetBackgroundGradientFill(mainGraphicsGradientFill, cssAttributes );
				}
				else
				{
					cssAttributes.background =GetSolidFill(mainGraphicsSolidFill) ;
				}
				
				//Create Border CSS
				cssAttributes=GetStroke(mainGraphicsStroke, mainGraphicsPath, cssAttributes);
				
				return cssAttributes;
			}
			return cssAttributes;
		}
		
	}
}