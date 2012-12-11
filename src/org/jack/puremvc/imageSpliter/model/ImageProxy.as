package org.jack.puremvc.imageSpliter.model
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.jack.puremvc.imageSpliter.model.vo.ImageVO;
	import org.puremvc.as3.patterns.proxy.Proxy;
	
	public class ImageProxy extends Proxy
	{
		public static const NAME:String = "ImageProxy";
		
		public function ImageProxy(data:Object=null)
		{
			super(NAME, data);
		}
		
		public function splitOriginalBitmapData():void
		{
			var voImage:ImageVO = data as ImageVO;
			var obmd:BitmapData = voImage.originalBitmapData;
			var row:int = voImage.splitRow;
			var col:int = voImage.splitCol;
			var w:int = obmd.width/row;
			var h:int = obmd.height/col;
			
			voImage.splitBitmapDataList = [];
			var bmd:BitmapData;
			var rect:Rectangle;
			
			for (var i:int = 0; i < row; i++) 
			{
				for (var j:int = 0; j < col; j++) 
				{
					bmd = new BitmapData(w, h, true);
					rect = new Rectangle(i*w, j*h, w, h);
					bmd.copyPixels(obmd, rect, new Point());
					voImage.splitBitmapDataList.push(bmd);
				}
			}
		}
		
	}
}