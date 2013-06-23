Dubit's Coding Challenge
========================

Welcome to Dubit's very own Whack-a-mole game. It's a very simple little game designed to let you show off your coding skills. We would like to add a number of simple extensions to this game as numbered below.

You are strongly encouraged to add any comments about your implementation of a feature to the related section, explaining your reasoning and any difficulties you encountered. Have the best go you can at at least tasks 1-4, and send us the repository when you are done. Feel free to play around, refactor stuff as you see fit, and embellish the project with cool stuff.

The project was created with Flash Builder, but can be compiled using mxmlc without issue. You'll need the Flex 4.1 or higher SDK.

Thanks, and good luck!

1. Add a game over/scores screen
--------------------------------

This should appear after the game is over and the moles have stopped appearing. It should contain text telling the player the game is over and a label displaying the player's score.

It should also include a button labelled 'Play again' that will start a new game for the player



*Your comments:*
I initially experimented with trying to use events to trigger the game over, however, I had difficulty in dispatching an event in the MoleGame object and capturing it in the WhackAMoleBase object. As the majority of my university work has been done in C++ events are still a relatively new concept to me. Given that non base variables are passed by reference in AS3 I decided to pass the address of the WhackAMoleBase class to the MoleGame object. I could then send a message directly to the WhackAMoleBase object, which could handle the game over routine.




2. Add difficulty levels
------------------------

Modify the Introduction screen to allow the user to choose one of three difficulty levels: easy, medium and hard. Make the main game easier or more difficult based on the user's choice. The difficulty level should modify both the rate at which the moles appear and the time they spend on screen before disappearing.



*Your comments:*
I took a more event driven approach with the difficulty settings. The user can select a radio button to change difficulty before the game begins, each time a radio button is clicked then an event is sent indicating which difficulty is now selected. The selected difficulty is then passed to the mole game constructor as an integer, 1 representing easy, 2 representing medium and 3 representing hard. The game then modifies the spawn rate of moles and the time they spend on screen. For the easy mode moles spawn slower and last longer, giving the player more time to whack a mole. For the harder difficulty moles appear faster and spend less time on screen.




3. Add new types of mole
------------------------

Currently there is only one type of mole that uses the standard_mole.png asset. Create two more types of mole with the following properties:

Fire Mole
* Points awarded for killing: 100
* Time showing on screen (ms): 1800
* Asset to use: fire_mole.png
* Number of clicks required to kill: 2

Zombie Mole
* Points awarded for killing: 400
* Time showing on screen (ms): 1200
* Asset to use: zombie_mole.png
* Number of clicks required to kill: 3

When spawning a new mole, have a 60% chance of creating a standard mole, a 25% chance of creating a fire mole, and a 15% chance of creating a zombie mole.



*Your comments:*
Initially I wanted to use an abstract mole class and have all moles derive from this abstract class, however further research indicated that this was either not possible in AS3. I therefore decided to use the standard mole as a base class, and derived the special moles from this class. I could then override the hit functions to react in the same way. I added a new variable called "type" to the standard mole class, which would be an integer of value 1 for normal moles, 2 for fire moles and 3 for zombie moles. This value would be set in the constructors of each mole class to the corresponding value. The MoleHoleItemRenderer can then tell which type of mole to draw by accessing the type property of the the mole.



4. Build in achievements/awards
-------------------------------

This task requires creating a feature from scratch, and as such it gives you the most freedom to decide how to accomplish it.

Acheivements have become a standard feature of games over the past few years. They are awarded to the player when they meet a certain set of criteria. For example, the user might be awarded an achievement for breaking a score threshold for the first time. Add the following acheivements into the game, and have them appear in the section titled 'Achievements' to the right of the main game area:


Achievement name: Apprentice - 
Criteria required: Kill over 15 moles during a single game

Achievement name: Master - 
Criteria required: Kill more than 40 zombie moles in a single game

Achievement name: Mole massacre - 
Criteria required: Kill over 55 moles during a game

Achievement name: Fireman - 
Criteria required: Kill more than 10 fire moles in a single game

Achievement name: Apocolyptica - 
Criteria required: Kill more than 5 zombie moles in a game

Achievement name: Soft touch - 
Criteria required: Miss more than 30 moles during a game



*Your comments:*
I designed my achievement system to be as future proof as possible. By seperating statistics and the achievements affected by them I have reduced data redundancy. In the achievement set given only one criteria is required for each achievement, however, it is entirely possible that further achievements may have multiple criteria for achievement completion (eg, kill one mole of each type). I have added a few other achievements to my system to demonstrate that this is possible with my system. The background colour of each achievement is green for completed achievements and red for incomplete ones.

Additional Features:
-Sound effects when a user hits or misses a mole.
-Used an embedded font for titles.
-Used a wood image background to imitate a fairground game.
-Added extra achievements to demonstrate my achievement system functionality.


Future Ideas For Improvements:
I had a few improvements planned that sadly I ran out of time to complete:
-I would like to use a script to populate the achievements list in the mxml file, however, my  initial attempts using AS3 to write to the mxml were not successful.
-I would like to make the achievements list to update and change colour as the game is played. I believe that it should be possible to do this using events.
-Currently misses are only registered when the user  file licks on an empty hole. I would like to change this so that clicks outside of a hole are also registered as misses. This would require placing the holes over the top of a different component that could handle click events.
-I'm not particularly satisfied with the visual look of the game at the moment. Although I am happy with the wood background and dark holes the menus look bland and uninteresting. I experimented with bright reds and yellows to represent fairground colours but they were either too bright or it was difficult to read the text. I was also unable to change the colour of the embedded font. I would also like to use custom images for the menu buttons, instead of the default UI ones that I am currently using.

Thanks for your interest, and once again - good luck!