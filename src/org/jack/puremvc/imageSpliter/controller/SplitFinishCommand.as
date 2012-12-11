package org.jack.puremvc.imageSpliter.controller
{
	import org.jack.puremvc.imageSpliter.view.ImageSpliterMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.interfaces.IMediator;
	
	public class SplitFinishCommand extends SimpleCommand
	{
		public function SplitFinishCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			// TODO Auto Generated method stub
			super.execute(notification);
			
			var app:ImageSpliterMediator = facade.retrieveMediator(ImageSpliterMediator.NAME) as ImageSpliterMediator;
			app.ui.splitFinish();
		}
		
	}
}