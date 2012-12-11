package org.jack.puremvc.imageSpliter.controller
{
	import flash.display.Loader;
	
	import org.jack.puremvc.imageSpliter.model.ImageProxy;
	import org.jack.puremvc.imageSpliter.view.ImageSpliterMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class ImageLoadCompleteCommand extends SimpleCommand
	{
		public function ImageLoadCompleteCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			// TODO Auto Generated method stub
			super.execute(notification);
			
			var imageProxy:ImageProxy = facade.retrieveProxy(ImageProxy.NAME) as ImageProxy;
			var app:ImageSpliterMediator = facade.retrieveMediator(ImageSpliterMediator.NAME) as ImageSpliterMediator;
		
			if(app.ui.exportFolderTxt.text.length > 0)
			{
				app.ui.executeBtn.enabled = true;
			}
		}
		
	}
}