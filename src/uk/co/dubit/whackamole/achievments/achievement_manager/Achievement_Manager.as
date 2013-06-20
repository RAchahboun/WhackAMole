package uk.co.dubit.whackamole.achievments.achievement_manager
{
	/**
	 * Achievement Manager
	 * Stores achievements and reacts to events that update achievements
	 * 
	 **/
	import mx.collections.ArrayCollection;
	
	import uk.co.dubit.whackamole.achievments.AchievementBase;
	import uk.co.dubit.whackamole.achievments.Achievement_Apprentice;
	import uk.co.dubit.whackamole.achievments.Achievement_Fireman;
	import uk.co.dubit.whackamole.achievments.Achievement_Master;
	import uk.co.dubit.whackamole.achievments.Achievement_Mole_Massacre;
	import uk.co.dubit.whackamole.achievments.Achievement_Soft_Touch;
	
	public class Achievement_Manager
	{
		private var _achievements:Object = new Object();
		
		public function Achievement_Manager()
		{
			_achievements["apprentice"] = new Achievement_Apprentice;
			_achievements["fireman"] = new Achievement_Fireman;
			_achievements["master"] = new Achievement_Master;
			_achievements["moleMassacre"] = new Achievement_Mole_Massacre;
			_achievements["softTouch"] = new Achievement_Soft_Touch;
		}
		
		public function moleKilled():void
		{
			_achievements["apprentice"].updateProgress();
		}
		
		public function fireMoleKilled():void
		{
			
		}
		
		public function zombieMoleKilled():void
		{
			
		}
		
		public function moleMissed():void
		{
			
		}
		
		public function reset():void
		{
			for(var key:String in _achievements)
			{
				_achievements[key].reset();
			}
		}
		
	}
}


