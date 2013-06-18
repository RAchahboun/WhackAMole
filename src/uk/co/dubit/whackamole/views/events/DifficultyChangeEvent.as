package uk.co.dubit.whackamole.views.events
{
	import flash.events.Event;
	
	
	public class DifficultyChangeEvent extends Event
	{
		public static const EASY_SELECTED:String = "easySelected";
		public static const MEDIUM_SELECTED:String = "mediumSelected";
		public static const HARD_SELECTED:String = "hardSelected";
		
		public function DifficultyChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

