package uk.co.dubit.whackamole.views
{
	import spark.components.Button;
	import spark.components.Group;
	
	import uk.co.dubit.whackamole.views.events.DifficultyChangeEvent;
	import uk.co.dubit.whackamole.views.events.IntroductionViewEvent;
	
	[Event(name="introductionStart", type="uk.co.dubit.whackamole.views.events.IntroductionViewEvent")]
	[Event(name="easySelected", type="uk.co.dubit.whackamole.views.events.DifficultyChangeEvent")]
	[Event(name="mediumSelected", type="uk.co.dubit.whackamole.views.events.DifficultyChangeEvent")]
	[Event(name="hardSelected", type="uk.co.dubit.whackamole.views.events.DifficultyChangeEvent")]
	public class IntroductionViewBase extends Group
	{
		public var startButton:Button;
		
		protected function onStartButtonClick() : void
		{
			dispatchEvent(new IntroductionViewEvent(IntroductionViewEvent.START));
		}
		
		protected function onEasySelected() : void
		{
			dispatchEvent(new DifficultyChangeEvent(DifficultyChangeEvent.EASY_SELECTED));
		}
		
		protected function onMediumSelected() : void
		{
			dispatchEvent(new DifficultyChangeEvent(DifficultyChangeEvent.MEDIUM_SELECTED));
		}
		
		protected function onHardSelected() : void
		{
			dispatchEvent(new DifficultyChangeEvent(DifficultyChangeEvent.HARD_SELECTED));
		}
	}
}