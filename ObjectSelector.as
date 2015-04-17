package com
{
	import flash.display.Bitmap;
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.text.StaticText;
	import flash.text.TextField;
	
	
	public class ObjectSelector
	{
		public var  _MovieClip:String="MovieClip";
		public var _SimpleButton:String="SimpleButton";
		public var _StaticText:String="StaticText";
		public var _Bitmap:String="Bitmap";
		public var _TextField:String="TextField";
		public var _Shape:String="Shape";
		public var _Sprite:String="Sprite";
		
		public function ObjectSelector()
		{
		}
		
		public function getObjectType(sprite:Object):String
		{
			var foundObjectType:String="";
			
			if(sprite is MovieClip)
			{
				foundObjectType=_MovieClip;
			}
			else if(sprite is SimpleButton)
			{
				foundObjectType=_SimpleButton;
			}
			else if(sprite is StaticText)
			{
				foundObjectType=_StaticText;
			}
			else if(sprite is TextField)
			{
				foundObjectType=_TextField;
			}
			else if(sprite is Bitmap)
			{
				foundObjectType=_Bitmap;
			}
			else if(sprite is Shape)
			{
				foundObjectType=_Shape;
			}
			else if(sprite is Sprite)
			{
				foundObjectType=_Sprite;
			}
			sprite=null;
			return foundObjectType;
		}
		
	}
}