package uk.co.dubit.whackamole.achievments.achievement_manager
{
	/**
	 * Achievement Manager
	 * Stores achievements and reacts to events that update achievements
	 * 
	 **/
	
	import uk.co.dubit.whackamole.achievments.Achievement;
	import uk.co.dubit.whackamole.achievments.stats.Statistic;
	public class Achievement_Manager
	{
		private var _achievements:Object = new Object();
		private var _stats:Object = new Object();
		//private var _molesKilled:int;
		/*private var _molesKilledThisRound:int;
		private var _fireMolesKilled:int;
		private var _fireMolesKIlledThisRound:int;
		private var _zombieMolesKilled:int;
		private var _zombieMolesKilledThisRound:int;
		private var _molesMissed:int;*/
		

		
		public function Achievement_Manager()
		{
			//_achievements["apprentice"] = new Achievement_Apprentice;
			//_achievements["fireman"] = new Achievement_Fireman;
			//_achievements["master"] = new Achievement_Master;
			//_achievements["moleMassacre"] = new Achievement_Mole_Massacre;
			//_achievements["softTouch"] = new Achievement_Soft_Touch;
			
			
			//Stats relevant to achievements that we will track
			_stats["molesKilled"] = new Statistic(true);
			_stats["molesKilledThisRound"] = new Statistic(false);
			_stats["fireMolesKilled"] = new Statistic(true);
			_stats["fireMolesKilledThisRound"] = new Statistic(false);
			_stats["zombieMolesKilled"] = new Statistic(true);
			_stats["zombieMolesKilledThisRound"] = new Statistic(false);
			_stats["molesMissed"] = new Statistic(true);
			_stats["molesMissedThisRound"] = new Statistic(false);
			
			
			//Set up our achievements.
			//Achievements have a title, a description and a set of logical criteria to meet.
			//Criteria are entered in the form (statistic to track, test value, condition against for completion)
			_achievements["apprentice"] = new Achievement(
				"Apprentice",  
				"Kill over 15 moles during a single game", 
				new Array(new Array(_stats["molesKilledThisRound"], 15, ">"))
			);
			
			_achievements["master"] = new Achievement(
				"Master",
				"Kill more than 40 zombie moles in a\nsingle game",
				new Array(new Array(_stats["zombieMolesKilledThisRound"], 40, ">"))
			);
			
			_achievements["moleMassacre"] = new Achievement(
				"Mole Massacre",
				"Kill over 55 moles during a game",
				new Array(new Array(_stats["molesKilled"], 55, ">"))
			);
			
			_achievements["fireman"] = new Achievement(
				"Fireman",
				"Kill more than 10 fire moles in a single game",
				new Array(new Array(_stats["fireMolesKilledThisRound"], 10, ">"))
			);
			
			_achievements["apocolyptica"] = new Achievement(
				"Apocolyptica",
				"Kill more than 5 zombie moles in a game",
				new Array(new Array(_stats["zombieMolesKilled"], 5, ">"))
			);
			
			_achievements["softTouch"] = new Achievement(
				"Soft Touch",
				"Miss more than 30 moles during a game",
				new Array(new Array(_stats["molesMissed"], 30, ">"))
			);
			
			_achievements["trifecta"] = new Achievement(
				"Trifecta",
				"Kill at least 3 moles of each type in a single game",
				new Array(
					new Array(_stats["molesKilledThisRound"], 3, ">="),
					new Array(_stats["fireMolesKilledThisRound"], 3, ">="),
					new Array(_stats["zombieMolesKilledThisRound"], 3, ">=")
					)
			);
			
			//Must be checked at end of game, not during.
			_achievements["sniper"] = new Achievement(
				"Sniper",
				"Don't miss more than 10 times in a single game",
				new Array(new Array(_stats["molesMissedThisRound"], 10, "<="))
			);
				
				
		}
		
		public function getAchievementWithKey(key:String):Achievement
		{
			return(_achievements[key]);
		}
		
		public function moleKilled():void
		{
			_stats["molesKilled"].incrementCounter();
			_stats["molesKilledThisRound"].incrementCounter();
			_achievements["apprentice"].checkAchievement();
			_achievements["moleMassacre"].checkAchievement();
			trace("Moles killed this round: " + _stats["molesKilledThisRound"].value);
			trace("Apprentice Complete: " + _achievements["apprentice"].completed);
			trace("Total Moles killed: " + _stats["molesKilled"].value);
			trace("Mole Massacre Complete: " + _achievements["moleMassacre"].completed);
		}
		
		public function fireMoleKilled():void
		{
			_stats["fireMolesKilled"].incrementCounter();
			_stats["fireMolesKilledThisRound"].incrementCounter();
			_achievements["fireman"].checkAchievement();
			_achievements["trifecta"].checkAchievement();
			trace("Fire Moles Killed: " + _stats["fireMolesKilled"].value);
			trace("Fire Moles Killed This Round: " + _stats["fireMolesKilledThisRound"].value);
			trace("Fireman Complete: " + _achievements["fireman"].completed);
			trace("Trifecta Complete: " + _achievements["trifecta"].completed);
			
		}
		
		public function zombieMoleKilled():void
		{
			_stats["zombieMolesKilled"].incrementCounter();
			_stats["zombieMolesKilledThisRound"].incrementCounter();
			_achievements["master"].checkAchievement();
			_achievements["apocolyptica"].checkAchievement();
			trace("Zombie Moles killed this round: " + _stats["zombieMolesKilledThisRound"].value);
			trace("Master Complete: " + _achievements["master"].completed);
			trace("Apocolyptica Complete: " + _achievements["master"].completed);
		}
		
		public function moleMissed():void
		{
			_stats["molesMissed"].incrementCounter();
			_stats["molesMissedThisRound"].incrementCounter();
			_achievements["softTouch"].checkAchievement();
		}
		
		public function checkEndOfRoundAchievements():void
		{
			_achievements["sniper"].checkAchievement();
		}
		
		public function reset():void
		{
			for each(var stat:Statistic in _stats)
			{
				if(!(stat.persists))
					stat.reset();
			}
		}
		
	}
}


