package org.jack.puremvc.imageSpliter.model.vo
{
	import flash.display.BitmapData;

	public class ImageVO
	{
		public var name:String;
		public var splitRow:int = 1;
		public var splitCol:int = 1;
		public var previewWidth:Number;
		public var previewHeight:Number;
		public var exportFolder:String;
		public var originalBitmapData:BitmapData;
		public var splitBitmapDataList:Array;
		
		public function ImageVO()
		{
		}
	}
}