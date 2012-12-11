package org.jack.puremvc.imageSpliter.controller
{
	import flash.events.OutputProgressEvent;
	import flash.filesystem.File;
	import flash.filesystem.FileMode;
	import flash.filesystem.FileStream;
	import flash.utils.ByteArray;
	
	import mx.graphics.codec.PNGEncoder;
	
	import org.jack.puremvc.imageSpliter.ApplicationFacade;
	import org.jack.puremvc.imageSpliter.model.ImageProxy;
	import org.jack.puremvc.imageSpliter.model.vo.ImageVO;
	import org.jack.puremvc.imageSpliter.view.ImageSpliterMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class SplitStartCommand extends SimpleCommand
	{
		private var imageProxy:ImageProxy;
		private var app:ImageSpliterMediator;
		
		private var flag:int = 0;
		
		public function SplitStartCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			// TODO Auto Generated method stub
			super.execute(notification);
			
			imageProxy = facade.retrieveProxy(ImageProxy.NAME) as ImageProxy;
			app = facade.retrieveMediator(ImageSpliterMediator.NAME) as ImageSpliterMediator;
			
			split();
		}
		
		private function split():void
		{
			flag = 0;
			
			app.ui.getImageVO();
			imageProxy.setData(app.ui.voImage);
			imageProxy.splitOriginalBitmapData();
			app.ui.splitStart();
			
			// 保存切割后的图片到指定的目录下
			var pngEncoder:PNGEncoder = new PNGEncoder();
			
			var imageVO:ImageVO = imageProxy.getData() as ImageVO;
			var list:Array = imageVO.splitBitmapDataList;
			
			var exportFolder:String = imageVO.exportFolder;
			var originalImageName:String = imageVO.name;
			var fileName:String;
			var byteArray:ByteArray;
			
			var prefix:String = originalImageName.substring(0, originalImageName.indexOf("."));
			for (var i:int = 0; i < list.length; i++) 
			{
				byteArray = pngEncoder.encode( list[i] );
				
				// set an filename
				var filename:String = prefix + "_" + i + ".png";
				// get current path
				var file:File = File.applicationDirectory.resolvePath( filename );
				// get the native path 
				var wr:File = new File( );
				wr.nativePath = exportFolder + "/" + filename;
				
				var stream:FileStream = new FileStream();
				stream.addEventListener(OutputProgressEvent.OUTPUT_PROGRESS, onWriteImageComplete);
				stream.openAsync(wr, FileMode.WRITE);
				stream.writeBytes(byteArray, 0, byteArray.length);
				stream.close();
			}
		}
		
		protected function onWriteImageComplete(event:OutputProgressEvent):void
		{
			trace("onWriteImageComplete");
			flag++;
			if(flag == (imageProxy.getData() as ImageVO).splitBitmapDataList.length)
			{
				sendNotification(ApplicationFacade.SPLIT_FINISH);
			}
		}
	}
}