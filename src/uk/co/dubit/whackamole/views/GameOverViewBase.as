package uk.co.dubit.whackamole.views
{
	import spark.components.Button;
	import spark.components.Group;
	
	import uk.co.dubit.whackamole.views.events.IntroductionViewEvent;
	
	public class GameOverViewBase extends Group
	{
	
		[Bindable]
		protected var _endScore:int;
	
	
		public function set endScore(value:int) : void
		{
			_endScore = value;
		}
		
		public var startButton:Button;
		
		protected function onStartButtonClick() : void
		{
			dispatchEvent(new IntroductionViewEvent(IntroductionViewEvent.START));
		}
	}
	
}

