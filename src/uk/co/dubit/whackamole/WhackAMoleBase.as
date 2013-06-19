package uk.co.dubit.whackamole
{
	import mx.events.FlexEvent;
	
	import spark.components.Application;
	import spark.components.Group;
	
	import uk.co.dubit.whackamole.models.MoleGame;
	import uk.co.dubit.whackamole.views.GameOverView;
	import uk.co.dubit.whackamole.views.IntroductionView;
	import uk.co.dubit.whackamole.views.MoleGameView;
	import uk.co.dubit.whackamole.views.events.DifficultyChangeEvent;
	import uk.co.dubit.whackamole.views.events.IntroductionViewEvent;

	/**
	 * A small whack-a-mole game based around MVC principles
	 */
	public class WhackAMoleBase extends Application
	{
		public var viewContainer:Group;
		private var _currentDifficulty:int = 2;
		
		public function WhackAMoleBase() : void
		{
			addEventListener(FlexEvent.CREATION_COMPLETE, onCreationComplete);
		}
		
		public function loadIntroduction() : void
		{
			var introductionView:IntroductionView = new IntroductionView();
			introductionView.addEventListener(IntroductionViewEvent.START, onIntroductionViewStart);
			//Listen for any difficulty changes made in the main menu
			introductionView.addEventListener(DifficultyChangeEvent.EASY_SELECTED, onEasySelection);
			introductionView.addEventListener(DifficultyChangeEvent.MEDIUM_SELECTED, onMediumSelection);
			introductionView.addEventListener(DifficultyChangeEvent.HARD_SELECTED, onHardSelection);
			
			loadView(introductionView);
		}
		
		protected function onEasySelection(event:DifficultyChangeEvent) : void
		{
			_currentDifficulty = 1;
		}
		
		protected function onMediumSelection(event:DifficultyChangeEvent) : void
		{
			_currentDifficulty = 2;
		}
		
		protected function onHardSelection(event:DifficultyChangeEvent) : void{
			_currentDifficulty = 3;
		}
		
		protected function onIntroductionViewStart(event:IntroductionViewEvent):void
		{
			event.target.removeEventListener(event.type, arguments.callee);
			//Stop listening for difficulty changes, the game is starting
			event.target.removeEventListener(DifficultyChangeEvent.EASY_SELECTED, onEasySelection);
			event.target.removeEventListener(DifficultyChangeEvent.MEDIUM_SELECTED, onMediumSelection);
			event.target.removeEventListener(DifficultyChangeEvent.HARD_SELECTED, onHardSelection);
			loadMainGame();
		}
		
		public function loadMainGame() : void
		{		
			var moleGameView:MoleGameView = new MoleGameView();
			moleGameView.moleGame = new MoleGame(this, _currentDifficulty);
			loadView(moleGameView);
		}
		
		public function gameOver(score:int) : void
		{
			var gameOverView:GameOverView = new GameOverView();
			gameOverView.endScore = score;
			gameOverView.addEventListener(IntroductionViewEvent.START, onIntroductionViewStart);	//Listen for game restart
			//Listen for difficulty changes
			gameOverView.addEventListener(DifficultyChangeEvent.EASY_SELECTED, onEasySelection);
			gameOverView.addEventListener(DifficultyChangeEvent.MEDIUM_SELECTED, onMediumSelection);
			gameOverView.addEventListener(DifficultyChangeEvent.HARD_SELECTED, onHardSelection);
			
			loadView(gameOverView);
			//loadMainGame();
		}
		
		private function loadView(view:Group) : void
		{
			//Clear any previous views in the container and add
			viewContainer.removeAllElements();
			viewContainer.addElement(view);
		}
		
		private function onCreationComplete(event:FlexEvent) : void
		{
			//When the application is first created, we want to show the introductory view 
			loadIntroduction();
		}
		
	}
}