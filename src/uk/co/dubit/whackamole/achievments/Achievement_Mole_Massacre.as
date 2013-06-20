package uk.co.dubit.whackamole.achievments
{
	/**
	 * Mole massacre
	 * Kill over 55 moles during a game
	 * 
	 **/
	public class Achievement_Mole_Massacre extends AchievementBase
	{
		private var _molesKilled:int = 0;	
		public function Achievement_Mole_Massacre()
		{
			super.persistent = true;
			super.completed = false;
			super.name = "Mole Massacre";
			super.description = "Kill over 55 moles during a game";
		}
		
		public function updateProgress() : void
		{
			_molesKilled++;
			if(_molesKilled >= 55)
				super.completed = true;
		}		
	}
}

