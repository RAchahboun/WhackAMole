package uk.co.dubit.whackamole.models.moles
{
	/**
	 * Fire Mole
	 * Requires 2 clicks to kill
	 * 
	 **/
	public class Fire_Mole
	{
		private var _points:int = 100;
		private var _showtime:int = 1800;
		private var _dead:Boolean;
		private var _currentClicks:int = 0; //Number of clicks 
		public function get points():int
		{
			return _points;
		}
		
		public function set points(value:int):void
		{
			_points = value;
		}
		
		public function get showtime():int
		{
			return _showtime;
		}
		
		public function set showtime(value:int):void
		{
			_showtime = value;
		}
		
		[Bindable]
		public function get dead():Boolean
		{
			return _dead;
		}
		
		public function set dead(value:Boolean):void
		{
			_dead = value;
		}
		
		public function hit() : void
		{
			_currentClicks++; //Increment the number of clicks
			if(_currentClicks >= 2)
			{
				dead = true;
			}
		}
	}
}

