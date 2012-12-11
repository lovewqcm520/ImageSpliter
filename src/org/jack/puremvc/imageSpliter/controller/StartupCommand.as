package org.jack.puremvc.imageSpliter.controller
{
	import org.jack.puremvc.imageSpliter.ApplicationFacade;
	import org.jack.puremvc.imageSpliter.model.ImageProxy;
	import org.jack.puremvc.imageSpliter.view.ImageSpliterMediator;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	
	public class StartupCommand extends SimpleCommand
	{
		public function StartupCommand()
		{
			super();
		}
		
		override public function execute(notification:INotification):void
		{
			// TODO Auto Generated method stub
			super.execute(notification);
			
			var _app:ImageSpliter = notification.getBody() as ImageSpliter;
			
			// 注册 proxy
			facade.registerProxy(new ImageProxy());
			
			// 注册 mediator
			facade.registerMediator(new ImageSpliterMediator(_app));
			
			// 注册 command
			facade.registerCommand(ApplicationFacade.IMAGE_LOAD_COMPLETE, ImageLoadCompleteCommand);
			facade.registerCommand(ApplicationFacade.SPLIT_START, SplitStartCommand);
			facade.registerCommand(ApplicationFacade.SPLIT_FINISH, SplitFinishCommand);
		}
		
	}
}