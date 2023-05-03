# Documentation
This code is a Processing sketch for a Doodle Jump-inspired game with multiple game modes: one-player, two-player, and down stairs mode. The game features a doodler character that jumps on platforms while avoiding monsters and falling off the screen. The "Main" file serves as the Game Manager. Please see below for more details.

<strong>Variables:</strong>

- PImage variables for storing the different background images, pause button, spike image, and doodleFallWord image.
- PFont variable for storing the font used in the game.
Integer variables for the width (W) and height (H) of the game window.
- ArrayLists for storing doodler characters, platforms, monsters, and start page platforms.
- Various game objects like startPage, pause, gameOver, setting, and help.
- Variables for controlling game state, player count, score, platform count.
  
<em> The sketch contains six main functions: settings(), setup(), draw(), keyPressed(), keyReleased(), and mouseClicked().</em>

<strong> settings():</strong>

Sets the size of the game window using the width (W) and height (H) variables.

<strong>setup():</strong>

1. Sets the initial values for various game objects, loads images and fonts, and initializes the game state.

2. Initializes doodler characters, start page platforms, and game platforms (for both main game and down stairs mode).

<strong>draw():</strong>

The main game loop that renders different game states and manages the transitions between them.
When the game is in the start page state, it displays the start page, doodler character(s), and start page platforms.

1. If the setting or help state is active, it shows the settings or help window.

2. If the pause state is active, it displays the pause window.

3. When the game is in the down stairs mode, it renders the game screen with platforms and the doodler character, and manages the game logic for this mode.

4. When the game is in the two-player mode, it renders the game screen with platforms, doodler characters, and monsters (if applicable), and manages the game logic for this mode.

<strong>keyPressed(): </strong>

This function is triggered when a key is pressed.

1. LEFT and RIGHT arrow keys control the doodler character's horizontal movement and flipping of the image direction.
2. 'a' and 'd' keys control the second player's movement in two-player mode.
3. SPACEBAR toggles the pause state of the game.
4. SPACEBAR also restarts the game if the game is over.
   
<strong>keyReleased(): </strong>

This function is triggered when a key is released.

1. It stops the horizontal movement of the doodler character when the LEFT, RIGHT, 'a', or 'd' keys are released.
2. In gameState 1, when the 'Z' key is released, it creates a new platform below the doodler if there are any "sosPlatformCount" remaining.
   
<strong>mouseClicked(): </strong> 

This function is triggered when the mouse is clicked</strong>

1. In gameState 0, it checks for clicks on the start page, settings, and help buttons.
2. In gameState 1, 2, and 3, it checks for clicks on the pause button.
3. If the game is over and the mouse is clicked within specific coordinates, the game is restarted and gameState is set to 0.
