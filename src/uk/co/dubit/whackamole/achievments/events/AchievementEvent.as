package uk.co.dubit.whackamole.achievments.events
{
	import flash.events.Event;
	
	
	public class AchievementEvent extends Event
	{
		public static const MOLE_KILLED:String = "moleKilled";
		public static const FIRE_MOLE_KILLED:String = "fireMoleKilled";
		public static const ZOMBIE_MOLE_KILLED:String = "zombieMoleKilled";
		
		public function AchievementEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}

