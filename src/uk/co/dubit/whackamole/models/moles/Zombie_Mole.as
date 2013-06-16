package uk.co.dubit.whackamole.models.moles
{
	/**
	 * Fire Mole
	 * Requires 2 clicks to kill
	 * 
	 **/
	public class Zombie_Mole extends Mole
	{
		private var _currentClicks:int = 0; //Number of clicks 
		
		public function Zombie_Mole()
		{
			super.points = 400;
			super.showtime = 1200;
			super.dead = false;
			super.type = 3;
		}
		
		override public function hit() : void
		{
			_currentClicks++; //Increment the number of clicks
			if(_currentClicks >= 3)
			{
				dead = true;
			}
		}
	}
}

