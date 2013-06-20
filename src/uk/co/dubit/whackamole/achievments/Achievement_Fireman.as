package uk.co.dubit.whackamole.achievments
{
	/**
	 * Fireman
	 * Kill more than 10 fire moles in a single game
	 * 
	 **/
	public class Achievement_Fireman extends AchievementBase
	{
		private var _fireMolesKilled:int = 0;	
		public function Achievement_Fireman()
		{
			super.persistent = false;
			super.completed = false;
			super.name = "Fireman";
			super.description = "Kill more than 10 fire moles in a single game";
		}
		
		public function updateProgress() : void
		{
			_fireMolesKilled++;
			if(_fireMolesKilled >= 10)
				super.completed = true;
		}	
		
		override public function reset():void
		{
			if(!completed)
				_fireMolesKilled = 0;
		}
	}
}

