package org.jack.puremvc.imageSpliter
{
	import org.jack.puremvc.imageSpliter.controller.StartupCommand;
	import org.puremvc.as3.patterns.facade.Facade;
	
	public class ApplicationFacade extends Facade
	{
		public static const STARTUP:String = "startup";
		public static const IMAGE_LOAD_COMPLETE:String = "image_load_complete";
		public static const SPLIT_START:String = "split_start";
		public static const SPLIT_FINISH:String = "split_finish";
		
		public function ApplicationFacade()
		{
			super();
		}
		
		public static function getInstance():ApplicationFacade
		{
			if(instance == null) instance = new ApplicationFacade();
			
			return instance as ApplicationFacade;
		}
		
		override protected function initializeController():void
		{
			// TODO Auto Generated method stub
			super.initializeController();
			
			registerCommand(STARTUP, StartupCommand);
		}
		
		
		public function startup(app:ImageSpliter):void
		{
			sendNotification(STARTUP, app);
		}
	}
}