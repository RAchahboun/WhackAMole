package uk.co.dubit.whackamole
{
	
	public class GameSounds
	{
		/**
		 * Game Sounds
		 */
		
		/**
		 * Sound Effects
		 */
		//Hit sound
		[Embed(source="../assets/sounds/whack.mp3")]
		public static var SFX_HIT:Class;
		
		//Miss sound
		[Embed(source="../assets/sounds/thud.mp3")]
		public static var SFX_MISS:Class;
		
		/**
		 * Music
		 */
		
		//Background music
		//[Embed(source="../assets/sounds/main.wav")]
		//public static var BG_GAME_MUSIC : Class;
	}
}

