package uk.co.dubit.whackamole.models
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import uk.co.dubit.whackamole.models.moles.Fire_Mole;
	import uk.co.dubit.whackamole.models.moles.Mole;
	/**
	 * Models a hole which may or may not
	 * be filled by a mole. It's empty if
	 * the mole property is null.
	 *  
	 **/
	public class MoleHole
	{
		private var _mole:Mole;
		private var _fireMole:Fire_Mole;
		
		private var _moleGame:MoleGame;
		private var showTimer:Timer;
		
		public function MoleHole(moleGame:MoleGame)
		{
			_moleGame = moleGame;
			//This time controls the amount of time
			//a mole fills this hole for
			showTimer = new Timer(1000, 1);
			showTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onShowTimerComplete);
		}
		
		public function get moleGame():MoleGame
		{
			return _moleGame;
		}

		[Bindable]
		public function get mole():Mole
		{
			return _mole;
		}

		public function set mole(value:Mole):void
		{
			_mole = value;
		}
		
		[Bindable]
		public function get fireMole():Fire_Mole
		{
			return _fireMole;
		}
		
		public function set fireMole(value:Fire_Mole):void
		{
			_fireMole = value;
		}
		

		[Bindable]
		public function get occupantDead() : Boolean
		{
			if(mole != null) 
			{
				return (mole.dead); 
			}
			if(fireMole != null) 
			{
				return (fireMole.dead);
			}
			else
			{
				//Must be a zombie mole in the hole
				return false;	//TODO: Change to zombie mole
			}
		}
		
		public function set occupantDead(value:Boolean) : void
		{
			if(mole) mole.dead = value; 
			else
			{
				if(fireMole) fireMole.dead = value;
				else
				{
					//Must be a Zombie mole
				}
			}
			
		}
		
		public function populateWithStandardMole() : void
		{
			//Add the specified mole to this hole,
			//and set up the timer to remove it after
			//its showtime has elapsed
			this.mole = new Mole;
			showTimer.reset();
			showTimer.delay = mole.showtime;
			showTimer.start();
			
			//Reset other mole types to null
			fireMole = null;
		}
		
		public function populateWithFireMole() : void
		{
			//Add the specified mole to this hole,
			//and set up the timer to remove it after
			//its showtime has elapsed
			this.fireMole = new Fire_Mole;
			showTimer.reset();
			showTimer.delay = fireMole.showtime;
			showTimer.start();
			
			//Reset other mole types to null
			mole = null;		
		}
		
		public function populateWithZombieMole() : void
		{
			//Add the specified mole to this hole,
			//and set up the timer to remove it after
			//its showtime has elapsed
			this.mole = mole;
			showTimer.reset();
			showTimer.delay = mole.showtime;
			showTimer.start();
		}
		
		public function hit() : void
		{
			if((mole && !mole.dead) || (fireMole && !fireMole.dead))
			{
				//Whack the mole, and if it results in a
				//kill, rack up the score
				if(mole)
				{
					mole.hit();
					if(mole.dead)
					{
						moleGame.addScore(mole.points);
					}
				}
				else
				{
					if(fireMole)
					{
						fireMole.hit();
						if(fireMole.dead)
						{
							moleGame.addScore(fireMole.points);
							//Reset all possible mole types
						}
					}
					else
					{
						//Must be a zombie mole
					}
				}
			}
		}
		
		private function onShowTimerComplete(event:TimerEvent) : void
		{
			//Empty the hole
			mole = null;
			fireMole = null;
		}
	}
}