package uk.co.dubit.whackamole.achievments
{
	/**
	 * Common structure for all achievements
	 * 
	 * Do not create instances of this class!
	 **/
	public class AchievementBase
	{
		private var _completed:Boolean;
		private var _persistent:Boolean;	//Persistent achievements apply to multiple games
		private var _name:String;
		private var _description:String;
		
		[Bindable]
		public function get completed():Boolean
		{
			return _completed;
		}
		
		public function set completed(value:Boolean):void
		{
			_completed = value;
		}
		
		[Bindable]
		public function get persistent():Boolean
		{
			return _persistent;
		}
		
		public function set persistent(value:Boolean):void
		{
			_persistent = value;
		}
		
		[Bindable]
		public function get name():String
		{
			return _name;
		}
		
		public function set name(value:String):void
		{
			_name = value;
		}
		
		[Bindable]
		public function get description():String
		{
			return _description;
		}
		
		public function set description(value:String):void
		{
			_description = value;
		}
		
		public function reset():void
		{
			if(!_persistent)
			{
				trace("Forgot to override reset() function for " + _name + "!");
			}
		}
	}
}

