/***************************************************************************
 * **************************************************************************
 * this css selector consture the body css and html tags css 
 * **************************************************************************
 * **************************************************************************
*/

package com
{
	import entities.BodyDefaultStyle;
	import entities.CssAttributes;
	
	public class CssSelector
	{
		
		public var LayoutResponsive:String 	="Responsive Layout";
		public var LayoutFixed:String 		="Fixed Layout";
		public var LayoutElastic:String 	="Elastic Layout";
		public var LayoutScale:String 		="Scale to Fit Layout";
		
		private var cssCodeHolder:String ="";
		private var cssAttributes:CssAttributes;
		public  var tab:String = "\n\t";
		private var regExpNum:RegExp = /#/g;
		private var regExpStr:RegExp = /\*/g;
		public var regExpHtmlTag:RegExp = /(\S+)=["']?((?:.(?!["']?\s+(?:\S+)=|[>"']))+.)["']?/g
		private var regExpQuotation:RegExp = /"([^"]*)"/g;
		
		public function CssSelector()
		{
			
		}
		
		public function converteHexColor2ColorArray(colorHex:uint):Object
		{
			var colorArray:Object = new Object();
			
			colorArray.red = 	colorHex >> 16 & 0xFF;
			colorArray.green = 	colorHex >> 8 & 0xFF;
			colorArray.blue = 	colorHex & 0xFF;
			
			return colorArray;
		}
		/*private function getCSSRule(values:CssAttributes, tabs:String ):String
		{
			var cssDeclaration:String = " ";	
			
			//Positioning
			//cssDeclaration += tabs +"//Positioning";
			if(values.position){	cssDeclaration 			+= tabs +"position:"		+ values.position 		+ ";";}		//static|relative|absolute|fixed
			
			if(values.top){			cssDeclaration 			+= tabs +"top:"				+ values.top 			+ ";";}		//static|relative|absolute|fixed
			if(values.left){		cssDeclaration 			+= tabs +"left:"			+ values.left 			+ ";";}		//"% | px | em | pt"
			
			if(values.right){		cssDeclaration 			+= tabs +"right:"			+ values.right 			+ ";";}
			if(values.bottom){		cssDeclaration 			+= tabs +"bottom:"			+ values.bottom 		+ ";";}
			if(values.zIndex){		cssDeclaration 			+= tabs +"z-index:"			+ values.zIndex 		+ ";";}
			if(values.clip){		cssDeclaration 			+= tabs +"clip rect("		+ values.clip 			+ ");";}
			
			//Box-Model
			//cssDeclaration += tabs +"//Box-Model";
			if(values.float){		cssDeclaration 			+= tabs +"float:"			+ values.float 			+ ";";}		//left | right | none
			if(values.minWidth){	cssDeclaration 			+= tabs +"min-width:"		+ values.minWidth 		+ ";";}
			if(values.minHeight){	cssDeclaration 			+= tabs +"min-height:"		+ values.minHeight 		+ ";";}
			if(values.maxWidth){	cssDeclaration 			+= tabs +"max-width:"		+ values.maxWidth 		+ ";";}
			if(values.maxHeight){	cssDeclaration 			+= tabs +"max-height:"		+ values.maxHeight 		+ ";";}
			if(values.width){		cssDeclaration 			+= tabs +"width:"			+ values.width 			+ ";";}
			if(values.height){		cssDeclaration 			+= tabs +"height:"			+ values.height 		+ ";";}
			
			if(values.margin){		cssDeclaration 			+= tabs +"margin:"			+ values.margin 		+ ";";}		//auto
			if(values.marginTop){	cssDeclaration 			+= tabs +"margin-top:"		+ values.marginTop 		+ ";";}		//auto
			if(values.marginRight){	cssDeclaration 			+= tabs +"margin-right:"	+ values.marginRight	+ ";";}		//auto
			if(values.marginBottom){cssDeclaration 			+= tabs +"margin-bottom:"	+ values.marginBottom	+ ";";}		//auto
			if(values.marginLeft){	cssDeclaration 			+= tabs +"margin-left:"		+ values.marginLeft 	+ ";";}		//auto
			
			if(values.padding){		cssDeclaration 			+= tabs +"padding:"			+ values.padding 		+ ";";}		
			
			if(values.visibility){	cssDeclaration 			+= tabs +"visibility:"		+ values.visibility 	+ ";";}		//visible|hidden|scroll|auto|initial|inherit
			if(values.overflowX){	cssDeclaration 			+= tabs +"overflow-x:"		+ values.overflowX 		+ ";";}		
			if(values.overflowY){	cssDeclaration 			+= tabs +"overflow-y:"		+ values.overflowY 		+ ";";}		//visible|hidden|scroll|auto|initial|inherit
			if(values.rotationPoint){cssDeclaration 		+= tabs +"rotation-point:"	+ values.rotationPoint 	+ ";";}		//visible|hidden|scroll|auto|initial|inherit
			if(values.rotation){	cssDeclaration 			+= tabs +"rotation:"		+ values.rotation 		+ ";";}		
			//marquee-direction marquee-play-count marquee-speed marquee-style	
			
			//Text
			//cssDeclaration += tabs +"//Text";
			if(values.direction){		cssDeclaration 		+= tabs +"direction:"			+ values.direction 		+ ";";}		//ltr|rtl|initial|inherit;
			if(values.letterSpacing){	cssDeclaration 		+= tabs +"letter-spacing:"		+ values.letterSpacing 	+ ";";}		//normal|length|initial|inherit;
			if(values.textAlignLast){	cssDeclaration 		+= tabs +"text-align-last:"		+ values.textAlignLast 	+ ";";}		//auto|left|right|center|justify|start|end|initial|inherit;
			if(values.textDecoration){	cssDeclaration 		+= tabs +"text-decoration:"		+ values.textDecoration	+ ";";}		//none|underline|overline|line-through|initial|inherit;
			if(values.textIndent){		cssDeclaration 		+= tabs +"text-indent:"			+ values.textIndent 	+ ";";}
			if(values.textJustify){		cssDeclaration 		+= tabs +"text-justify:"		+ values.textJustify 	+ ";";}		//auto|inter-word|inter-ideograph|inter-cluster|distribute|kashida|trim|initial|inherit;
			if(values.textShadow){		cssDeclaration 		+= tabs +"text-shadow:"			+ values.textShadow 	+ ";";}		//h-shadow v-shadow blur color
			if(values.textTransform){	cssDeclaration 		+= tabs +"text-transform:"		+ values.textTransform 	+ ";";}		//none|capitalize|uppercase|lowercase|initial|inherit;
			if(values.textWrap){		cssDeclaration 		+= tabs +"text-wrap:"			+ values.textWrap 		+ ";";}		//normal|break-word|initial|inherit;
			
			if(values.unicodeBidi){			cssDeclaration 		+= tabs +"unicode-bidi:"		+ values.unicodeBidi 		+ ";";}		//normal|embed|bidi-override|intitial|inherit;
			if(values.whiteSpace){			cssDeclaration 		+= tabs +"white-space:"			+ values.whiteSpace 		+ ";";}		//normal|nowrap|pre|pre-line|pre-wrap|initial|inherit;
			if(values.whiteSpaceCollapse){	cssDeclaration 		+= tabs +"white-space-collapse:"+ values.whiteSpaceCollapse + ";";}
			if(values.wordBreak){			cssDeclaration 		+= tabs +"word-break:"			+ values.wordBreak 			+ ";";}		//normal|break-all|keep-all|initial|inherit;
			if(values.wordSpacing){			cssDeclaration 		+= tabs +"word-spacing:"		+ values.wordSpacing 		+ ";";}		//normal|break-word|initial|inherit;
			if(values.wordWrap){			cssDeclaration 		+= tabs +"word-wrap:"			+ values.wordWrap 			+ ";";}
			//punctuation-trum hanging-punctuation text-emphasis text-outline
			
			//Font
			//cssDeclaration += tabs +"//Font";
			if(values.textAlign){		cssDeclaration 		+= tabs +"text-align:"			+ values.textAlign 		+ ";";}		//left|right|center|justify|initial|inherit;
			if(values.font){			cssDeclaration 			+= tabs +"font:"			+ values.font 			+ ";";}		//font-style font-variant font-weight font-size/line-height|caption|icon|menu|message-box|small-caption|status-bar|initial|inherit
			if(values.fontFamily){		cssDeclaration 			+= tabs +"font-family:"		+ values.fontFamily 	+ ";";}		//name
			if(values.fontStyle){		cssDeclaration 			+= tabs +"font-style:"		+ values.fontStyle 		+ ";";}		//normal|italic|oblique|initial|inherit;
			if(values.fontVariant){		cssDeclaration 			+= tabs +"font-variant:"	+ values.fontVariant 	+ ";";}		//normal|small-caps|initial|inherit;
			if(values.fontWeight){		cssDeclaration 			+= tabs +"font-weight:"		+ values.fontWeight 	+ ";";}		//normal|bold|bolder|lighter|number|initial|inherit;
			
			if(values.fontSize){
				if(int(values.fontSize)>0){
					cssDeclaration 			+= tabs +"font-size:"		+ values.fontSize 		+ "px;";
				}else{
					cssDeclaration 			+= tabs +"font-size:"		+ values.fontSize 		+ ";";	
				}
			}		//medium|xx-small|x-small|small|large|x-large|xx-large|smaller|larger|length|initial|inherit; //px, po, em,etc
			
			if(values.fontSizeAdjust){	cssDeclaration 			+= tabs +"font-size-adjust:"+ values.fontSizeAdjust + ";";}		//number|none|initial|inherit;
			
			//Background
			//cssDeclaration += tabs +"//Background";
			if(values.background){			cssDeclaration 		+= tabs +"background:"				+ values.background 			+ ";";}		//color position/size repeat origin clip attachment image|initial|inherit;
			if(values.backgroundAttachment){cssDeclaration 		+= tabs +"background-attachment:"	+ values.backgroundAttachment 	+ ";";}		//scroll|fixed|local|initial|inherit;
			if(values.backgroundBreak){		cssDeclaration 		+= tabs +"background-break:"		+ values.backgroundBreak		+ ";";}
			if(values.backgroundClip){		cssDeclaration 		+= tabs +"background-clip:"			+ values.backgroundClip			+ ";";}		//border-box|padding-box|content-box|initial|inherit;
			if(values.backgroundColor){		cssDeclaration 		+= tabs +"background-color:"		+ values.backgroundColor		+ ";";}
			if(values.backgroundImage){		cssDeclaration 		+= tabs +"background-image:"		+ values.backgroundImage 		+ ";";}
			if(values.backgroundOrigin){	cssDeclaration 		+= tabs +"background-origin:"		+ values.backgroundOrigin 		+ ";";}
			if(values.backgroundPosition){	cssDeclaration 		+= tabs +"background-position:"		+ values.backgroundPosition		+ ";";}
			if(values.backgroundRepeat){	cssDeclaration 		+= tabs +"background-repeat:"		+ values.backgroundRepeat 		+ ";";}
			if(values.backgroundSize){		cssDeclaration 		+= tabs +"background-size:"			+ values.backgroundSize 		+ ";";}
			
			//Color
			//cssDeclaration += tabs +"//Color";
			if(values.color){			cssDeclaration 			+= tabs +"color:"				+ values.color 				+ ";";}
			if(values.opacity){			cssDeclaration 			+= tabs +"opacity:"				+ values.opacity 			+ ";";}
			
			//Other
			//cssDeclaration += tabs +"//Other";
			if(values.border){			
										cssDeclaration 			+= tabs +"border:"				+ values.border				+ ";";
				if(values.border.substr(0,1) == "0")
				{			
										cssDeclaration 			+= tabs +"*border:"				+ "0;";
				}
			}
			
			if(values.resize){			cssDeclaration 			+= tabs +"resize:"				+ values.resize 			+ ";";}
			if(values.clear){			cssDeclaration 			+= tabs +"clear:"				+ values.clear 				+ ";";}
			
			
			return cssDeclaration;
		}*/
		
		public function getBodyCSSRule(values:BodyDefaultStyle, tabs:String ):String
		{
			var cssDeclaration:String=" ";
			if(AppPlusCache.Instance.bodyDefaultStyle.position)
			{	
				cssDeclaration 		+= tabs +"position: "		+ AppPlusCache.Instance.bodyDefaultStyle.position 	+ ";";
			}
			
			if(AppPlusCache.Instance.bodyDefaultStyle.fontFamily)
			{	
				cssDeclaration 		+= tabs +"font-family: "		+ AppPlusCache.Instance.bodyDefaultStyle.fontFamily 	+ ";";
			}	//name
			
			//FontStyle
			if(AppPlusCache.Instance.bodyDefaultStyle.fontStyle)
			{	
				cssDeclaration 		+= tabs +"font-style: "			+ AppPlusCache.Instance.bodyDefaultStyle.fontStyle 		+ ";";
			}	//normal|italic|oblique|initial|inherit;
			
			//fontSize
			if(AppPlusCache.Instance.bodyDefaultStyle.fontSize){
				if(int(AppPlusCache.Instance.bodyDefaultStyle.fontSize)>0){
					cssDeclaration 			+= tabs +"font-size: "		+ AppPlusCache.Instance.bodyDefaultStyle.fontSize 		+ "px;";
					
				}else{
					cssDeclaration 			+= tabs +"font-size: "		+ AppPlusCache.Instance.bodyDefaultStyle.fontSize 		+ ";";
					
				}
			}	//medium|xx-small|x-small|small|large|x-large|xx-large|smaller|larger|length|initial|inherit; //px, po, em,etc
			
			//textAlign
			if(AppPlusCache.Instance.bodyDefaultStyle.textAlign)
			{	
				cssDeclaration 		+= tabs +"text-align: "			+ AppPlusCache.Instance.bodyDefaultStyle.textAlign 		+ ";";
			}	//left|right|center|justify|initial|inherit;
			
			//fontWeight
			if(AppPlusCache.Instance.bodyDefaultStyle.fontWeight)
			{
				cssDeclaration 		+= tabs +"font-weight: "		+ AppPlusCache.Instance.bodyDefaultStyle.fontWeight 	+ ";";
						
			}
			
			//Color
			if(AppPlusCache.Instance.bodyDefaultStyle.color)
			{
				cssDeclaration 		+= tabs +"color: "				+ AppPlusCache.Instance.bodyDefaultStyle.color 				+ ";";
				
			}
			
			//background image
			if(AppPlusCache.Instance.bodyDefaultStyle.background)
			{
				cssDeclaration 		+= tabs +"background: "				+ AppPlusCache.Instance.bodyDefaultStyle.background 				+ ";";
			}
			
			//width
			if(AppPlusCache.Instance.bodyDefaultStyle.width)
			{
				cssDeclaration 		+= tabs +"width: "				+ AppPlusCache.Instance.bodyDefaultStyle.width 				+ ";";
			}
			
			//height
			if(AppPlusCache.Instance.bodyDefaultStyle.height)
			{
				cssDeclaration 		+= tabs +"height: "				+ AppPlusCache.Instance.bodyDefaultStyle.height 				+ ";";
			}
			return cssDeclaration;
		}
		
		public function getObjectCSSRule(values:CssAttributes, tabs:String, childItemTypeName:String):String
		{
			var finalcssDeclaration:String = "";
			if(childItemTypeName)
			{
				finalcssDeclaration = "\n." + childItemTypeName + "{";
			}
			//Layout value
			var layout:String = LayoutFixed;
			var cssDeclaration:String;
			//********************************
			switch(layout)
			{
				case LayoutResponsive:
					break;
				case LayoutElastic:
					break;
				case LayoutScale:
					break;
				case LayoutFixed:
					cssDeclaration = "";	
					
					//Positioning
					//cssDeclaration += tabs +"//Positioning";
					
					/*if(AppPlusCache.Instance.bodyDefaultStyle.position)
					{
						//Overwrite the position value of the object
						values.position = AppPlusCache.Instance.bodyDefaultStyle.position;
					}*/
					
					if(values.position && values.position != "static"){	
						//If position value is not static and add position into css
						cssDeclaration 			+= tabs +"position: "		+ values.position 		+ ";";
					}		//static|relative|absolute|fixed
					if(!values.position || values.position.toLowerCase() == "absolute" || values.position.toLowerCase() == "inherit" )
					{
						//if values is not definded or postion is absolute (default)
						if(values.top){			cssDeclaration 			+= tabs +"top: "			+ values.top 			+ ";";}		//"% | px | em | pt"
						if(values.left){		cssDeclaration 			+= tabs +"left: "			+ values.left 			+ ";";}		
						if(values.right){		cssDeclaration 			+= tabs +"right: "			+ values.right 			+ ";";}
						if(values.bottom){		cssDeclaration 			+= tabs +"bottom: "			+ values.bottom 		+ ";";}
						if(values.zIndex){		cssDeclaration 			+= tabs +"z-index: "		+ values.zIndex 		+ ";";}
					}
					if(values.clip){			cssDeclaration 			+= tabs +"clip rect("		+ values.clip 			+ ");";}
					if(values.pointerEvents){	cssDeclaration 			+= tabs +"pointer-events:"		+ values.pointerEvents 	+ ";";}
					
					//Box-Model
					//cssDeclaration += tabs +"//Box-Model";
					if(values.float){		cssDeclaration 			+= tabs +"float: "			+ values.float 			+ ";";}		//left | right | none
					
					if(values.minWidth){	cssDeclaration 			+= tabs +"min-width: "		+ values.minWidth 		+ ";";}
					if(values.minHeight){	cssDeclaration 			+= tabs +"min-height: "		+ values.minHeight 		+ ";";}
					if(values.maxWidth){	cssDeclaration 			+= tabs +"max-width: "		+ values.maxWidth 		+ ";";}
					if(values.maxHeight){	cssDeclaration 			+= tabs +"max-height: "		+ values.maxHeight 		+ ";";}
					
					if(!values.dimensions || values.dimensions !="off")
					{
						if(values.width){		cssDeclaration 			+= tabs +"width: "			+ values.width 			+ ";";}
						if(values.height){		cssDeclaration 			+= tabs +"height: "			+ values.height 		+ ";";}
					}
					
					if(values.margin){		cssDeclaration 			+= tabs +"margin: "			+ values.margin 		+ ";";}		//auto
					if(values.marginTop){	cssDeclaration 			+= tabs +"margin-top: "		+ values.marginTop 		+ ";";}		//auto
					if(values.marginRight){	cssDeclaration 			+= tabs +"margin-right: "	+ values.marginRight	+ ";";}		//auto
					if(values.marginBottom){cssDeclaration 			+= tabs +"margin-bottom: "	+ values.marginBottom	+ ";";}		//auto
					if(values.marginLeft){	cssDeclaration 			+= tabs +"margin-left: "		+ values.marginLeft 	+ ";";}		//auto
					
					if(values.padding){		cssDeclaration 			+= tabs +"padding: "			+ values.padding 		+ ";";}		
					if(values.paddingTop){	cssDeclaration 			+= tabs +"padding-top: "		+ values.paddingTop 		+ ";";}		//auto
					if(values.paddingRight){cssDeclaration 			+= tabs +"padding-right: "		+ values.paddingRight	+ ";";}		//auto
					if(values.paddingBottom){cssDeclaration 		+= tabs +"padding-bottom: "		+ values.paddingBottom	+ ";";}		//auto
					if(values.paddingLeft){	cssDeclaration 			+= tabs +"padding-left: "		+ values.paddingLeft 	+ ";";}		//auto
					
					if(values.visibility){	cssDeclaration 			+= tabs +"visibility: "		+ values.visibility 	+ ";";}		//visible|hidden|scroll|auto|initial|inherit
					if(values.overflowX){	cssDeclaration 			+= tabs +"overflow-x: "		+ values.overflowX 		+ ";";}		
					if(values.overflowY){	cssDeclaration 			+= tabs +"overflow-y: "		+ values.overflowY 		+ ";";}		//visible|hidden|scroll|auto|initial|inherit
					if(values.rotationPoint){cssDeclaration 		+= tabs +"rotation-point: "	+ values.rotationPoint 	+ ";";}		//visible|hidden|scroll|auto|initial|inherit
					if(values.rotation){	cssDeclaration 			+= tabs +"rotation: "		+ values.rotation 		+ ";";}		
					//marquee-direction marquee-play-count marquee-speed marquee-style	
					
					//Text
					//cssDeclaration += tabs +"//Text";
					if(values.direction){		cssDeclaration 		+= tabs +"direction: "			+ values.direction 		+ ";";}		//ltr|rtl|initial|inherit;
					if(values.letterSpacing){	cssDeclaration 		+= tabs +"letter-spacing: "		+ values.letterSpacing 	+ ";";}		//normal|length|initial|inherit;
					if(values.textAlignLast){	cssDeclaration 		+= tabs +"text-align-last: "		+ values.textAlignLast 	+ ";";}		//auto|left|right|center|justify|start|end|initial|inherit;
					if(values.textDecoration){	cssDeclaration 		+= tabs +"text-decoration: "		+ values.textDecoration	+ ";";}		//none|underline|overline|line-through|initial|inherit;
					if(values.textIndent){		cssDeclaration 		+= tabs +"text-indent: "			+ values.textIndent 	+ ";";}
					if(values.textJustify){		cssDeclaration 		+= tabs +"text-justify: "		+ values.textJustify 	+ ";";}		//auto|inter-word|inter-ideograph|inter-cluster|distribute|kashida|trim|initial|inherit;
					if(values.textShadow){		cssDeclaration 		+= tabs +"text-shadow: "			+ values.textShadow 	+ ";";}		//h-shadow v-shadow blur color
					if(values.textTransform){	cssDeclaration 		+= tabs +"text-transform: "		+ values.textTransform 	+ ";";}		//none|capitalize|uppercase|lowercase|initial|inherit;
					if(values.textWrap){		cssDeclaration 		+= tabs +"text-wrap: "			+ values.textWrap 		+ ";";}		//normal|break-word|initial|inherit;
					
					if(values.unicodeBidi){			cssDeclaration 		+= tabs +"unicode-bidi: "		+ values.unicodeBidi 		+ ";";}		//normal|embed|bidi-override|intitial|inherit;
					if(values.whiteSpace){			cssDeclaration 		+= tabs +"white-space: "			+ values.whiteSpace 		+ ";";}		//normal|nowrap|pre|pre-line|pre-wrap|initial|inherit;
					if(values.whiteSpaceCollapse){	cssDeclaration 		+= tabs +"white-space-collapse: "+ values.whiteSpaceCollapse + ";";}
					if(values.wordBreak){			cssDeclaration 		+= tabs +"word-break: "			+ values.wordBreak 			+ ";";}		//normal|break-all|keep-all|initial|inherit;
					if(values.wordSpacing){			cssDeclaration 		+= tabs +"word-spacing: "		+ values.wordSpacing 		+ ";";}		//normal|break-word|initial|inherit;
					if(values.wordWrap){			cssDeclaration 		+= tabs +"word-wrap: "			+ values.wordWrap 			+ ";";}
					//punctuation-trum hanging-punctuation text-emphasis text-outline
					
					//Font
					//cssDeclaration += tabs +"//Font";
					if(values.font){			cssDeclaration 			+= tabs +"font: "			+ values.font 			+ ";";}		//font-style font-variant font-weight font-size/line-height|caption|icon|menu|message-box|small-caption|status-bar|initial|inherit
					if(values.fontVariant){		cssDeclaration 			+= tabs +"font-variant: "	+ values.fontVariant 	+ ";";}		//normal|small-caps|initial|inherit;
					if(values.fontSizeAdjust){	cssDeclaration 			+= tabs +"font-size-adjust: "+ values.fontSizeAdjust + ";";}		//number|none|initial|inherit;
					if(values.lineHeight){	cssDeclaration 			+= tabs +"line-height: "+ values.lineHeight + ";";}		//px\em;
					
					//******************************************************************					
					//******************************************************************
					//Check with Default style
					
					//FontFamily
					if(values.fontFamily)
					{
						//if font family is not null and fontfamily value is not as same as body default style fontfamily
						if(!AppPlusCache.Instance.bodyDefaultStyle.fontFamily || AppPlusCache.Instance.bodyDefaultStyle.fontFamily.toLowerCase() != values.fontFamily.toLowerCase())
						{			
							cssDeclaration 		+= tabs +"font-family: "		+ values.fontFamily 	+ ";";
						}		
					}	//name
					
					//FontStyle
					if(values.fontStyle)
					{
						//if font family is not null and fontStyle value is not as same as body default style fontStyle
						if(!AppPlusCache.Instance.bodyDefaultStyle.fontStyle || AppPlusCache.Instance.bodyDefaultStyle.fontStyle.toLowerCase() != values.fontStyle.toLowerCase()){
							cssDeclaration 		+= tabs +"font-style: "			+ values.fontStyle 		+ ";";
						}
					}else
					{
						//if font family is not null and body default style fontStyle is not normal
						if(AppPlusCache.Instance.bodyDefaultStyle.fontStyle && AppPlusCache.Instance.bodyDefaultStyle.fontStyle.toLowerCase() != "normal"){
							cssDeclaration 		+= tabs +"font-style: "			+ "normal" 		+ ";";
						}
					}	//normal|italic|oblique|initial|inherit;
					
					//fontSize
					if(values.fontSize){
						if(int(values.fontSize)>0){
							//if font family is not null and fontSize value is not as same as body default style fontSize with px
							if(!AppPlusCache.Instance.bodyDefaultStyle.fontSize || AppPlusCache.Instance.bodyDefaultStyle.fontSize.toLowerCase() != values.fontSize.toLowerCase()+"px")
							{
								cssDeclaration 			+= tabs +"font-size: "		+ values.fontSize 		+ "px;";
							}
						}else{
							//if font family is not null and fontSize value is not as same as body default style fontSize
							if(!AppPlusCache.Instance.bodyDefaultStyle.fontSize || AppPlusCache.Instance.bodyDefaultStyle.fontSize.toLowerCase() != values.fontSize.toLowerCase())
							{
								cssDeclaration 			+= tabs +"font-size: "		+ values.fontSize 		+ ";";
							}
						}
					}	//medium|xx-small|x-small|small|large|x-large|xx-large|smaller|larger|length|initial|inherit; //px, po, em,etc
					
					//textAlign
					if(values.textAlign)
					{	
						//if font family is not null and textAlign value is not as same as body default style textAlign
						if(!AppPlusCache.Instance.bodyDefaultStyle.textAlign || AppPlusCache.Instance.bodyDefaultStyle.textAlign.toLowerCase() != values.textAlign.toLowerCase()){	
							cssDeclaration 		+= tabs +"text-align: "			+ values.textAlign 		+ ";";
						}		
					}	//left|right|center|justify|initial|inherit;
					
					//fontWeight
					if(values.fontWeight)
					{
						//if font family is not null and fontWeight value is not as same as body default style fontWeight
						if(!AppPlusCache.Instance.bodyDefaultStyle.fontWeight || AppPlusCache.Instance.bodyDefaultStyle.fontWeight.toLowerCase() != values.fontWeight.toLowerCase()){	
							cssDeclaration 		+= tabs +"font-weight: "		+ values.fontWeight 	+ ";";
						}		
					}
					
					//Color
					if(values.color)
					{
						//if font family is not null and color value is not as same as body default style color
						if(!AppPlusCache.Instance.bodyDefaultStyle.color || AppPlusCache.Instance.bodyDefaultStyle.color.toLowerCase() != values.color.toLowerCase())
						{				
							cssDeclaration 		+= tabs +"color: "				+ values.color 				+ ";";
						}
					}
					
					//Background
					//cssDeclaration += tabs +"//Background";
					if(values.background){			cssDeclaration 		+= tabs +"background: "				+ values.background 			+ ";";}		//color position/size repeat origin clip attachment image|initial|inherit;
					if(values.backgroundAttachment){cssDeclaration 		+= tabs +"background-attachment: "	+ values.backgroundAttachment 	+ ";";}		//scroll|fixed|local|initial|inherit;
					if(values.backgroundBreak){		cssDeclaration 		+= tabs +"background-break: "		+ values.backgroundBreak		+ ";";}
					if(values.backgroundClip){		
						cssDeclaration 		+= tabs +"background-clip: "			+ values.backgroundClip			+ ";";
						cssDeclaration 		+= tabs +"-webkit-background-clip: "	+ values.backgroundClip			+ ";";
					}		//border-box|padding-box|content-box|initial|inherit;
					if(values.backgroundColor){		cssDeclaration 		+= tabs +"background-color: "		+ values.backgroundColor		+ ";";}
					
					if(values.backgroundImage){
						if(values.backgroundImage.substring(0,3) =="url")
						{
							//url background
							cssDeclaration 				+= tabs +"background-image: "			+ values.backgroundImage 		+ ";";
						}
						else
						{
							//gradient backgrouund
							cssDeclaration 				+= tabs +"background-image: "			+ values.backgroundImage 		+ ";";
							cssDeclaration 				+= tabs +"background-image: -o-"		+ values.backgroundImage 		+ ";";
							cssDeclaration 				+= tabs +"background-image: -moz-"		+ values.backgroundImage 		+ ";";
							cssDeclaration 				+= tabs +"background-image: -webkit-"	+ values.backgroundImage 		+ ";";
							cssDeclaration 				+= tabs +"background-image: -ms-"		+ values.backgroundImage 		+ ";";
						}
					}
					if(values.backgroundOrigin){	cssDeclaration 		+= tabs +"background-origin: "		+ values.backgroundOrigin 		+ ";";}
					if(values.backgroundPosition){	cssDeclaration 		+= tabs +"background-position: "	+ values.backgroundPosition		+ ";";}
					if(values.backgroundRepeat){	cssDeclaration 		+= tabs +"background-repeat: "		+ values.backgroundRepeat 		+ ";";}
					if(values.backgroundSize){		cssDeclaration 		+= tabs +"background-size: "		+ values.backgroundSize 		+ ";";}
					
					//Border
					if(values.borderRadius){	cssDeclaration 			+= tabs +"border-radius: "				+ values.borderRadius 				+ ";";}
					if(values.borderTopRightRadius){	cssDeclaration 	+= tabs +"border-top-right-radius: "	+ values.borderTopRightRadius 				+ ";";}
					if(values.borderBottomRightRadius){	cssDeclaration 	+= tabs +"border-bottom-right-radius: "	+ values.borderBottomRightRadius 				+ ";";}
					if(values.borderBottomLeftRadius){	cssDeclaration 	+= tabs +"border-bottom-left-radius: "	+ values.borderBottomLeftRadius 				+ ";";}
					if(values.borderTopLeftRadius){	cssDeclaration 		+= tabs +"border-top-left-radius: "		+ values.borderTopLeftRadius 				+ ";";}
					
					if(values.outlineWidth){	cssDeclaration 			+= tabs +"outline-width: "				+ values.outlineWidth 				+ ";";}
					//cssDeclaration += tabs +"//Color";
					if(values.opacity){			cssDeclaration 			+= tabs +"opacity: "			+ values.opacity 			+ ";";}
					//Other
					//cssDeclaration += tabs +"//Other";
					if(values.border){			cssDeclaration 			+= tabs +"border: "				+ values.border				+ ";";}
					if(values.resize){			cssDeclaration 			+= tabs +"resize: "				+ values.resize 			+ ";";}
					if(values.clear){			cssDeclaration 			+= tabs +"clear: "				+ values.clear 				+ ";";}
					
					//borderWidth - solid transparent
					if(values.borderWidth){		cssDeclaration	+= tabs +"border-width: "	+ values.borderWidth	+ ";";};
					//borderImage - url top right bottom left scale type(fill, stretch, round)
					if(values.borderImage){
						cssDeclaration 				+= tabs +"border-image: "			+ values.borderImage 		+ ";";
						cssDeclaration 				+= tabs +"border-image: -o-"		+ values.borderImage 		+ ";";
						cssDeclaration 				+= tabs +"border-image: -moz-"		+ values.borderImage 		+ ";";
						cssDeclaration 				+= tabs +"border-image: -webkit-"	+ values.borderImage 		+ ";";
						cssDeclaration 				+= tabs +"border-image: -ms-"		+ values.borderImage 		+ ";";
					};
					
					
					break;
			}
			
			if(cssDeclaration != "")
			{
				finalcssDeclaration	+= cssDeclaration;
				if(childItemTypeName)
				{
					finalcssDeclaration +="\n}";
				}
				return finalcssDeclaration;
			}
			//when cssDeclaration is Not found return empty
			return "";
		}
	}
}