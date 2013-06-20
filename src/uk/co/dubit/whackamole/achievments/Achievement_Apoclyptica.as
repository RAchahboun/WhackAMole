package uk.co.dubit.whackamole.achievments
{
	/**
	 * Apocolyptica
	 * Kill more than 5 zombie moles in a game
	 * 
	 **/
	public class Achievement_Apocolyptica extends AchievementBase
	{
		private var _zombieMolesKilled = 0;	
		public function Achievement_Apocolyptica()
		{
			super().persistent = true;
			super().completed = false;
			super().name = "Apocolyptica";
			super().description = "Kill more than 5 zombie moles in a game";
		}
		
		public function updateProgress() : void
		{
			_zombieMolesKilled++;
			if(_zombieMolesKilled >= 5)
				super().completed = true;
		}	
	}
}

