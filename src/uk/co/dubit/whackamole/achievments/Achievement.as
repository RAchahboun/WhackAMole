package uk.co.dubit.whackamole.achievments
{
	/**
	 * Common structure for all achievements
	 * 
	 * Do not create instances of this class!
	 **/
	//import uk.co.dubit.whackamole.achievments.stats.Statistic;
	public class Achievement
	{
		private var _completed:Boolean;
		private var _name:String;
		private var _description:String;
		private var _statsRequired:Array;
		//private var _testValues:Array;
		//private var _conditions:Array;
		//, testValues:Array, conditions:Array
		public function Achievement(name:String, description:String, statsRequired:Array)
		{
			_name = name;
			_description = description;
			_statsRequired = statsRequired;
		}
		
		public function get completed():Boolean
		{
			return _completed;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get description():String
		{
			return _description;
		}
		
		public function checkAchievement():void
		{
			if(!_completed)	//Do not try to check an event that has already been completed
			{
				var allRequirementsMet:Boolean;
				for (var i:int = 0; i < _statsRequired.length; i++)
				{
					switch(_statsRequired[i][2])
					{
						case "<":
						{
							allRequirementsMet = (_statsRequired[i][0].value < _statsRequired[i][1]);
							break;
						}
						
						case "<=":
						{
							allRequirementsMet = (_statsRequired[i][0].value <= _statsRequired[i][1]);
							break;
						}
						
						case ">":
						{
							allRequirementsMet = (_statsRequired[i][0].value > _statsRequired[i][1]);
							break;
						}
						
						case ">=":
						{
							allRequirementsMet = (_statsRequired[i][0].value >= _statsRequired[i][1]);
							break;
						}
						
						case "==":
						{
							allRequirementsMet = (_statsRequired[i][0].value == _statsRequired[i][1]);
							break;
						}
					}
					
					if(allRequirementsMet == false)
						break;			
				}
			
				_completed = allRequirementsMet;
			}
		}
		
	}
}

