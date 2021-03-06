package uk.co.dubit.whackamole.models.moles
{
	/**
	 * Fire Mole
	 * Requires 2 clicks to kill
	 * 
	 **/
	public class Fire_Mole extends Mole
	{
		private var _currentClicks:int = 0; //Number of clicks 
		
		public function Fire_Mole()
		{
			super.points = 100;
			super.showtime = 1800;
			super.dead = false;
			super.type = 2;
		}
		
		override public function hit() : void
		{
			_currentClicks++; //Increment the number of clicks
			if(_currentClicks >= 2)
			{
				dead = true;
			}
		}
	}
}

