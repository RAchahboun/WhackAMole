package uk.co.dubit.whackamole.achievments
{
	/**
	 * Master 
	 * Kill more than 40 zombie moles in a single game
	 * 
	 **/
	public class Achievement_Master extends AchievementBase
	{
		private var _zombieMolesKilled:int = 0;	
		public function Achievement_Master()
		{
			super.persistent = false;
			super.completed = false;
			super.name = "Master";
			super.description = "Kill more than 40 zombie moles in a single game";
		}
		
		public function updateProgress() : void
		{
			_zombieMolesKilled++;
			if(_zombieMolesKilled >= 15)
				super.completed = true;
		}
		
		override public function reset():void
		{
			if(!completed)
				_zombieMolesKilled = 0;
		}
	}
}

