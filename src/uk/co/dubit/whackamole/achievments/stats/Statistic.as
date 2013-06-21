package uk.co.dubit.whackamole.achievments.stats
{
	/**
	 * Soft Touch
	 * Miss more than 30 moles during a game
	 * 
	 **/
	public class Statistic
	{
		//private var _name:String;		//name of the statistic
		private var _value:int;			//the current value of the statistic
		private var _persists:Boolean;	//if the statistic persists over rounds
		
		public function Statistic(persists:Boolean)
		{
			//_name = name;
			_persists = persists;
			_value = 0;
		}
		
		public function get persists():Boolean
		{
			return _persists;
		}
		/*
		public function get name():String
		{
			return _name;
		}
		*/
		public function get value():int
		{
			return _value;
		}
		
		public function incrementCounter():void
		{
			_value++;
		}
		
		public function reset():void
		{
			_value = 0;
		}
		
	}
}


