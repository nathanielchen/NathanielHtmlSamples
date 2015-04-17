package com
{
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.filters.BitmapFilter;
	import flash.geom.Rectangle;
	
	public class BoundingBox
	{
		private var currentDefaultRectangle:Rectangle;// = new Rectangle();
		
		public function BoundingBox()
		{
		}
		
		public function getBoundingBox(defaultRectangle:Rectangle, mySprite:Sprite, imageScale:int, isBackgroundImage:Boolean=false):Rectangle
		{
			Trace.log(new Error().getStackTrace().split("\n")[1].split("[")[0]+" - ");
			var tempRectagle:Rectangle;
			
			currentDefaultRectangle = defaultRectangle;
			
			/*if(!defaultRectangle)
			{
			//Default new Bounding Box Rectangle
			defaultRectangle = new Rectangle();
			}*/
			
			switch(RemoteSingleton.objectSelector.getObjectType(mySprite))
			{
				case RemoteSingleton.objectSelector._MovieClip:
					//Get Movie Clip Bounding Box 
					tempRectagle = getMovieClipBoundingBox(mySprite as MovieClip, imageScale, isBackgroundImage);
					break;
				case RemoteSingleton.objectSelector._Sprite:
					tempRectagle = getSpriteBoundingBox(mySprite as Sprite, imageScale);
					break;
				case RemoteSingleton.objectSelector._Shape:
					//Get Shape Bounding Box
					tempRectagle = getShapeBoundingBox(mySprite as Shape, imageScale);
					break;
				case RemoteSingleton.objectSelector._SimpleButton:
					//Get Simple Button Bounding Box
					tempRectagle = getSimpleButtonBoundingBox(mySprite as SimpleButton, imageScale);
					break;
			}
			
			//Set the new Found Bounding Box into the default Bounding Box as Combining Bounding Box
			combiningBoundingBox(tempRectagle);
			
			//Clrean Up 
			tempRectagle = null;
			defaultRectangle = null;
			return currentDefaultRectangle;
		}
		
		private function getMovieClipBoundingBox(myMovieClip:MovieClip, imageScale:int, isBackgroundImage:Boolean=false):Rectangle
		{
			Trace.log(new Error().getStackTrace().split("\n")[1].split("[")[0]+" - ");
			var tempRectagle:Rectangle;
			if(myMovieClip.numChildren >0)
			{
				//Return bounding box when movieClip content a shape as child object only
				if( (myMovieClip.numChildren == 1 || myMovieClip.getChildAt(0) as Shape) || !isAnyMovieClipChild(myMovieClip))
				{
					//Call get filters rectangle
					/*if(myMovieClip.filters.length>0)
					{*/
					//Get Movie Clip pixel bounds and Combining the new found bounding box with default bounding box
					
					var myBitmapData:BitmapData;
					if(isBackgroundImage)
					{
						myBitmapData = new BitmapData( myMovieClip.transform.pixelBounds.width, myMovieClip.transform.pixelBounds.height );
					}else
					{
						myBitmapData = new BitmapData( myMovieClip.transform.pixelBounds.width+1, myMovieClip.transform.pixelBounds.height+1 );
					}
					
					var filterRect:Rectangle = getFiltersBoundingBox(myBitmapData, myMovieClip.filters);
					combiningBoundingBox(filterRect);
					/*}
					else
					{
					var myBitmapData:BitmapData = new BitmapData( myMovieClip.transform.pixelBounds.width, myMovieClip.transform.pixelBounds.height );
					
					var filterRect:Rectangle = getFiltersBoundingBox(myBitmapData, myMovieClip.filters);
					combiningBoundingBox(myMovieClip.transform.pixelBounds);
					}*/
					//getFiltersBoundingBox(myMovieClip.transform.pixelBounds, myMovieClip.filters)
					
				}
				else
				{
					//Loop Every Child Object in the MovieClip
					for(var j:int = 0; j<myMovieClip.numChildren; j++)
					{
						switch(RemoteSingleton.objectSelector.getObjectType(myMovieClip.getChildAt(j)))
						{
							case RemoteSingleton.objectSelector._MovieClip:
								//Get MovieClip Bounding Box
								currentDefaultRectangle = getMovieClipBoundingBox(myMovieClip.getChildAt(j) as MovieClip, imageScale);
								break;
							case RemoteSingleton.objectSelector._Shape:
								//Get Shape Bounding Box
								currentDefaultRectangle = getShapeBoundingBox(myMovieClip.getChildAt(j) as Shape, imageScale);
								break;
							case RemoteSingleton.objectSelector._SimpleButton:
								//Get Simple Button Bounding Box
								currentDefaultRectangle = getSimpleButtonBoundingBox(myMovieClip.getChildAt(j) as SimpleButton, imageScale);
								break;
							case RemoteSingleton.objectSelector._Sprite:
								tempRectagle = getSpriteBoundingBox(myMovieClip.getChildAt(j)  as Sprite, imageScale);
								break;
						}
						
						//Set the new Found Bounding Box into the default Bounding Box as Combining Bounding Box
						//currentDefaultRectangle = combiningBoundingBox(defaultRectangle, tempRectagle);
					}
				}
			}
			//defaultRectangle = null;
			
			return currentDefaultRectangle;
		}
		
		public function getFiltersBoundingBox( myBitmapData:BitmapData, filters:Array ):Rectangle
		{
			// Get the first filter and compute his bounding box
			var filter:BitmapFilter;
			var tempRectangle:Rectangle =myBitmapData.rect; 
			// Helps to find the largest bounding box
			var le:Number = tempRectangle.left;
			var to:Number = tempRectangle.top;
			var ri:Number = tempRectangle.right;
			var bo:Number = tempRectangle.bottom;
			var _x:Number = tempRectangle.x;
			var _y:Number = tempRectangle.y;
			
			for (var i:int = 0; i < filters.length ; i++)
			{
				filter= filters[i];
				tempRectangle = myBitmapData.generateFilterRect( tempRectangle, filter );
				
				// If the size of new Rectangle is larger that the previous one, we update the values for the bounding box
				if ( tempRectangle.left  < le ) le = tempRectangle.left;
				if ( tempRectangle.top  < to ) to = tempRectangle.top;
				if ( tempRectangle.right > ri ) ri = tempRectangle.right;
				if ( tempRectangle.bottom > bo ) bo = tempRectangle.bottom;
				if ( tempRectangle.x < _x ) _x = tempRectangle.x;
				if ( tempRectangle.y < _y ) _y = tempRectangle.y;
			}
			
			
			// Return the Rectangle object that corresponds to the largest bounding box
			//r = new Rectangle();
			tempRectangle.left  = le;
			tempRectangle.top  = to;
			tempRectangle.right = ri;
			tempRectangle.bottom = bo;
			tempRectangle.x = _x;
			tempRectangle.y = _y;
			myBitmapData.dispose();
			myBitmapData = null;
			
			return tempRectangle;
		}
		
		private function getSpriteBoundingBox(mySprite:Sprite, imageScale:int):Rectangle
		{
			
			if(mySprite as MovieClip != null || mySprite == null)
			{
				Trace.log(new Error().getStackTrace().split("\n")[1].split("[")[0]+" - ");
				return null;
			}
			var myBitmapData:BitmapData = new BitmapData( Math.ceil(mySprite.width), Math.ceil(mySprite.height) );
			var filterRect:Rectangle;
			if(mySprite.filters.length == 0 && mySprite.numChildren==1)
			{
				//child is movieClip
				var tempMovieClip:MovieClip = mySprite.getChildAt(0) as MovieClip;
				if(tempMovieClip)
				{
					filterRect = getMovieClipBoundingBox( tempMovieClip,imageScale);
				}
				else
				{
					//Chile is simple button or shape 
					filterRect = getFiltersBoundingBox(myBitmapData, mySprite.filters);
				}
			}
			else
			{
				filterRect = getFiltersBoundingBox(myBitmapData, mySprite.filters);
			}
			combiningBoundingBox(filterRect);
			
			return currentDefaultRectangle;
		}
		
		private function getShapeBoundingBox(myShape:Shape, imageScale:int):Rectangle
		{
			Trace.log(new Error().getStackTrace().split("\n")[1].split("[")[0]+" - ");
			//Return Shape Bounding Box
			//combiningBoundingBox(myShape.transform.pixelBounds);
			var myBitmapData:BitmapData = new BitmapData( Math.ceil(myShape.width), Math.ceil(myShape.height) );
			
			var filterRect:Rectangle = getFiltersBoundingBox(myBitmapData, myShape.filters);
			combiningBoundingBox(filterRect);
			
			return currentDefaultRectangle;
		}
		
		private function getSimpleButtonBoundingBox(mySimpleButton:SimpleButton, imageScale:int):Rectangle
		{
			Trace.log(new Error().getStackTrace().split("\n")[1].split("[")[0]+" - ");
			//Get Three states of the Button as Sprite
			currentDefaultRectangle = getBoundingBox(currentDefaultRectangle, mySimpleButton.upState as Sprite, imageScale);
			currentDefaultRectangle = getBoundingBox(currentDefaultRectangle, mySimpleButton.overState as Sprite, imageScale);
			currentDefaultRectangle = getBoundingBox(currentDefaultRectangle, mySimpleButton.downState as Sprite, imageScale);
			
			//Return Simple Button Bounding box
			return currentDefaultRectangle;
		}
		
		
		private function isAnyMovieClipChild(myMovieClip:MovieClip):Boolean
		{
			Trace.log(new Error().getStackTrace().split("\n")[1].split("[")[0]+" - ");
			for(var j:int = 0; j<myMovieClip.numChildren; j++)
			{
				if( RemoteSingleton.objectSelector.getObjectType(myMovieClip.getChildAt(j)) == RemoteSingleton.objectSelector._MovieClip)
				{
					return true;
				}
			}
			return false;
		}
		
		private function combiningBoundingBox(tempRectagle:Rectangle):Rectangle
		{
			Trace.log(new Error().getStackTrace().split("\n")[1].split("[")[0]+" - ");
			if(currentDefaultRectangle != null)
			{
				var le:Number = currentDefaultRectangle.left;
				var to:Number = currentDefaultRectangle.top;
				var ri:Number = currentDefaultRectangle.right;
				var bo:Number = currentDefaultRectangle.bottom;
				var _x:Number = currentDefaultRectangle.x;
				var _y:Number = currentDefaultRectangle.y;
				
				//Set the new Found Bounding Box into the default Bounding Box
				if(tempRectagle)
				{
					/*Trace.log("-- Combining Bounding Box");
					Trace.log("tempRectagle");
					Trace.log("left:    "+tempRectagle.left);
					Trace.log(" top:    "+tempRectagle.top);
					Trace.log(" right:   "+tempRectagle.right);
					Trace.log(" bottom: "+tempRectagle.bottom);
					Trace.log(" x:      "+tempRectagle.x);
					Trace.log(" y:      "+tempRectagle.y);
					Trace.log("defaultRectangle");
					Trace.log("left:    "+currentDefaultRectangle.left);
					Trace.log(" top:    "+currentDefaultRectangle.top);
					Trace.log(" right:   "+currentDefaultRectangle.right);
					Trace.log(" bottom: "+currentDefaultRectangle.bottom);
					Trace.log(" x:      "+currentDefaultRectangle.x);
					Trace.log(" y:      "+currentDefaultRectangle.y);*/
					
					//Reset position x, y from new found Bounding box
					if ( _x < tempRectagle.x ) _x = tempRectagle.x;
					if ( _y < tempRectagle.y ) _y = tempRectagle.y;
					
					if ( le > tempRectagle.left ) le = tempRectagle.left;
					if ( to > tempRectagle.top ) to = tempRectagle.top;
					if ( ri < tempRectagle.right ) ri = tempRectagle.right;
					if ( bo < tempRectagle.bottom ) bo = tempRectagle.bottom;
				}
				tempRectagle = null;
				currentDefaultRectangle = new Rectangle();
				
				currentDefaultRectangle.x = _x;
				currentDefaultRectangle.y = _y;
				currentDefaultRectangle.left = le;
				currentDefaultRectangle.top = to;
				currentDefaultRectangle.right = ri;
				currentDefaultRectangle.bottom = bo;
				
				/*Trace.log("New defaultRectangle");
				Trace.log("left:    "+currentDefaultRectangle.left);
				Trace.log(" top:    "+currentDefaultRectangle.top);
				Trace.log(" right:   "+currentDefaultRectangle.right);
				Trace.log(" bottom: "+currentDefaultRectangle.bottom);
				Trace.log(" x:      "+currentDefaultRectangle.x);
				Trace.log(" y:      "+currentDefaultRectangle.y);*/
				
				return currentDefaultRectangle;
				/*Trace.log("New defaultRectangle");*/
			}
			currentDefaultRectangle = tempRectagle
			
			return currentDefaultRectangle;
			
		}
		/*public function getBoundingBoxWithoutChild(pDORect:Rectangle, mySprite:Sprite, imageScale:int ):Rectangle
		{
		// Get the first filter and compute his bounding box
		var filter:BitmapFilter= mySprite.filters[ 0 ];
		if (filter == null ) throw new TypeError( "The filters Array must contains at least one filter" );
		Trace.log(pDORect.width+" "+pDORect.height);
		if((pDORect.width==0 && pDORect.height==0 )||pDORect==null)
		{
		return null;
		}
		try{ 
		var b:BitmapData = new BitmapData( pDORect.width, pDORect.height, false );
		}catch ( errorEvent:Error )
		{ 
		Trace.log("error");
		return null;
		}
		var r:Rectangle = b.generateFilterRect( pDORect, filter );
		b.dispose();
		
		// Helps to find the largest bounding box
		var le:Number = r.left;
		var to:Number = r.top;
		var ri:Number = r.right;
		var bo:Number = r.bottom;
		
		// How many filters have been applied to the MovieClip ?
		var ln:int = mySprite.filters.length;
		
		for (var i:int = 1; i < ln ; i++)
		{
		b = new BitmapData( r.width, r.height, false );
		
		filter = mySprite.filters[ i ];
		
		//DropShadowFilter fileter is DropShadowFilter
		//add x2
		
		// Find the next flash.geom.Rectangle object starting with the one we find in the previous iteration
		r = b.generateFilterRect( r, filter );
		
		// Release the memory used.
		// Notice that this BitmapData object is only necessary for computing the filtered bounding box
		b.dispose();
		
		// If the size of new Rectangle is larger that the previous one, we update the values for the bounding box
		if ( r.left  < le ) le = r.left;
		if ( r.top  < to ) to = r.top;
		if ( r.right > ri ) ri = r.right;
		if ( r.bottom > bo ) bo = r.bottom;
		}
		
		b.dispose();
		b = null;
		
		// Return the Rectangle object that corresponds to the largest bounding box
		r = new Rectangle();
		r.left  = le;
		r.top  = to;
		r.right = ri;
		r.bottom = bo;
		
		return r;
		}
		
		public function getBoundingBoxWhitChild(pDORect:Rectangle, mySprite:Sprite, imageScale:int):Rectangle
		{	
		var r:Rectangle;
		
		if(mySprite == null)
		{
		return null;
		}
		
		if(pDORect != null)
		{
		r =pDORect;
		}
		else
		{
		r= new Rectangle((mySprite.x*mySprite.scaleX)*imageScale,
		(mySprite.y*mySprite.scaleY)*imageScale,
		(mySprite.width*mySprite.scaleX)*imageScale,
		(mySprite.height*mySprite.scaleY)*imageScale);
		}
		
		// Helps to find the largest bounding box
		var le:Number = r.left;
		var to:Number = r.top;
		var ri:Number = r.right;
		var bo:Number = r.bottom;
		
		//Get Child BoundingBox
		var filtersRectangle:Rectangle;
		for(var j:int = 0; j<mySprite.numChildren; j++)
		{
		//if ( (mySprite.x)  < le ) le = (mySprite.x);
		//if ( (mySprite.y)  < to ) to = (mySprite.y);
		
		
		if(mySprite.getChildAt(j).filters.length>0)
		{
		filtersRectangle = getBoundingBoxWithoutChild(r, mySprite.getChildAt(j) as Sprite,imageScale);
		}
		else
		{
		filtersRectangle = new Rectangle((mySprite.getChildAt(j).x*mySprite.getChildAt(j).scaleX+mySprite.x)*imageScale,
		(mySprite.getChildAt(j).x*mySprite.getChildAt(j).scaleY+mySprite.y)*imageScale,
		(mySprite.getChildAt(j).width*mySprite.scaleX+mySprite.x)*imageScale, 
		(mySprite.getChildAt(j).height*mySprite.scaleY+mySprite.y)*imageScale);	
		}
		
		if ( (filtersRectangle.left)  < le ) le = (filtersRectangle.left);
		if ( (filtersRectangle.top)  < to ) to = (filtersRectangle.top);
		if ( (filtersRectangle.right) > ri ) ri = (filtersRectangle.right);
		if ( (filtersRectangle.bottom) > bo ) bo = (filtersRectangle.bottom);
		
		
		r.left  = le;
		r.top  = to;
		r.right = ri;
		r.bottom = bo;
		}
		
		filtersRectangle = null;
		// Return the Rectangle object that corresponds to the largest bounding box
		return r;
		}*/
	}
}