package org.jack.puremvc.imageSpliter.view
{
	import flash.events.Event;
	import flash.net.FileReference;
	
	import org.jack.puremvc.imageSpliter.ApplicationFacade;
	import org.puremvc.as3.patterns.mediator.Mediator;
	
	public class ImageSpliterMediator extends Mediator
	{
		public static const NAME:String = "ImageSpliterMediator";

		private var fileRef:FileReference;
		private var timeout:uint;
		
		public function ImageSpliterMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
			
			ui.addEventListener(ApplicationFacade.IMAGE_LOAD_COMPLETE, onImageLoadComplete);
			ui.addEventListener(ApplicationFacade.SPLIT_START, onSplitStart);
		}
		
		protected function onSplitStart(event:Event):void
		{
			// TODO Auto-generated method stub
			sendNotification(ApplicationFacade.SPLIT_START);
		}
		
		protected function onImageLoadComplete(event:Event):void
		{
			// TODO Auto-generated method stub
			sendNotification(ApplicationFacade.IMAGE_LOAD_COMPLETE);
		}
		
		public function get ui():ImageSpliter
		{
			return viewComponent as ImageSpliter;
		}
	}
}