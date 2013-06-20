package uk.co.dubit.whackamole.achievments
{
	/**
	 * Apprentice
	 * Kill over 15 moles during a single game
	 * 
	 **/
	public class Achievement_Apprentice extends AchievementBase
	{
		private var _molesKilled:int = 0;	
		public function Achievement_Apprentice()
		{
			super.persistent = false;
			super.completed = false;
			super.name = "Apprentice";
			super.description = "Kill over 15 moles during a single game";
		}
		
		public function updateProgress() : void
		{
			_molesKilled++;
			if(_molesKilled >= 15)
				super.completed = true;
		}
		
		override public function reset():void
		{
			if(!completed)
				_molesKilled = 0;
		}
		
	}
}

