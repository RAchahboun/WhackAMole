package uk.co.dubit.whackamole.models.moles
{
	/**
	 * The only type of mole at the moment;
	 * one hit kills it
	 * 
	 **/
	public class Mole
	{
		private var _points:int;
		private var _showtime:int;
 		private var _dead:Boolean;
		private var _type:int;
		
		public function Mole()
		{
			//Set up variables for standard mole
			_points = 60;
			_showtime = 1000;
			_dead = false;
			_type = 1;
		}
		
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
		
		[Bindable]
		public function get type():int
		{
			return _type;
		}
		
		public function set type(value:int):void
		{
			_type = value;
		}
		
		public function hit() : void
		{
			dead = true;
		}
	}
}