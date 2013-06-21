package uk.co.dubit.whackamole.views
{
	import mx.collections.ArrayCollection;
	import mx.effects.Sequence;
	import mx.events.FlexEvent;
	
	import spark.components.Group;
	
	import uk.co.dubit.whackamole.achievments.achievement_manager.Achievement_Manager;
	import uk.co.dubit.whackamole.models.MoleGame;
	public class MoleGameViewBase extends Group
	{
		public var startAnimation:Sequence;
		
		[Bindable]
		protected var moleHoles:ArrayCollection;
		
		[Bindable]
		protected var _moleGame:MoleGame;
		
		[Bindable]
		protected var _achievementManager:Achievement_Manager;
		
		public function MoleGameViewBase() 
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		public function set moleGame(value:MoleGame) : void
		{
			_moleGame = value;
			moleHoles = value.moleHoles;
		}
		
		public function set achievementManager(value:Achievement_Manager) : void
		{
			_achievementManager = value;
		}
		
		public function setAchievementBackgroundColour(achievement:String):uint
		{
			if((_achievementManager.getAchievementWithKey(achievement)).completed)
				return uint(39168);
			else
				return uint(16711731);		
		}
		
		protected function onCreationComplete(event:FlexEvent) : void
		{
			startAnimation.play();
		}
		
		protected function startAnimationEnd() : void
		{
			_moleGame.start()
		}
			
	}
}