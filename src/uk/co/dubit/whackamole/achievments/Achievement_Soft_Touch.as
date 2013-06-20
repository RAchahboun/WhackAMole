package uk.co.dubit.whackamole.achievments
{
	/**
	 * Soft Touch
	 * Miss more than 30 moles during a game
	 * 
	 **/
	public class Achievement_Soft_Touch extends AchievementBase
	{
		private var _molesMissed:int = 0;	
		public function Achievement_Soft_Touch()
		{
			super.persistent = true;
			super.completed = false;
			super.name = "Soft Touch";
			super.description = "Miss more than 30 moles during a game";
		}
		
		public function updateProgress() : void
		{
			_molesMissed++;
			if(_molesMissed >= 5)
				super.completed = true;
		}	
	}
}

