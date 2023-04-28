# Introduction

Our primary goal during the planning phase of our video game brief was to capture a modern, recognizable brand that was flexible and approachable to every kind of user. As a result, early discussions shifted away from more traditional forms of arcade gaming such as Pac-Man or Space Invaders. Instead, group ideas that were shortlisted sought to capture the instantly identifiable nostalgia of games that we, as video game players ourselves, grew up with. Our game finally coalesced into a platforming video game, providing a twist on the original iPhone game Doodle Jump. The platforming aspect of Doodle Jump provided the perfect combination of simple, easy-to-pick-up game mechanics as well as the ability to implement a diverse range of gameplay twists. In our game you control your ‘doodle’, a customizable player character whose main objective is to steadily climb higher through a randomly generated environment. While doing so, players will encounter several obstacles whose goal is to slow down or defeat the player. These obstacles include different types of platforms such as ghost ledges, which cause the player to fall straight through, or single-use platforms that disappear when stepped on. Obstacles also include active enemies who spawn at varying intervals throughout the map, attempting to end the current user’s game. At the player’s disposal are several powerful abilities or ‘equipment’ that encourage fast-moving platforming, such as spring mechanisms and jetpack boosts. What distinguishes our game from other implementations of platforming games and Doodle Jump itself is the introduction of core game-play twists. These include:

1.	dynamic map manipulation by players that allows for exciting in-game problem solving

2.	gravity inversion that shifts gameplay away from traditional platforming and towards a race-against-the-clock style

3.	a competitive two-player version that pits users against each other in an ‘elimination-style’ twist on the Doodle Jump formula

# Requirements

## Ideation process
During the ideation process, our team focused on brainstorming potential game ideas that met specific constraints to ensure that the game we create was feasible to develop, has a good user appeal, and adheres to specific constraints.

To better understand what users may be interested in, we started by creating user stories. 

"As young student, I want a game that is easy to undestand and yet challenging to play during my break time."

"As a working professional, I want a game doesn't require internet connection, playable with one hand, quick, fun, and engaging game to play during commute."

To adhere to these constraints, we generated five game ideas, including chess, checkers, flappy bird, temple run, and doodle jump. We then evaluated these ideas based on their features, technical feasibility, and potential appeal to users.

We considered several features during our evaluation process, including whether the game was static or dynamic and whether it relied on strategy or reflexes. After careful consideration and by creating more user stories, 

"As a single player, I want to be able to enjoy a game without relying on oher players."

"As a player, I want a game that are challenging and require different levels of skill and strategy to master."

we eliminated the two static game ideas and opted for a dynamic and reflex-based game as we believed they are more appealing to users.

Next, we evaluated the remaining game ideas' technical feasibility and concluded that Doodle Jump was the most feasible game to develop. This was because the game has simple mechanics where the player only needs to jump from one platform to another, which does not require complex physics simulations or pathfinding algorithms like Temple Run or Flappy Bird. Doodle Jump also has a minimalist art style that doesn’t require detailed graphics or animations, which makes it easier for developers to create the necessary assets for the game. The game also only scrolls vertically, reducing the technical complexity of implementing scrolling.

After deciding on Doodle Jump as our final game, we brainstormed possible twists to make the game more thrilling. Ultimately, we settled on three ideas: Helping Platform, Gravity Reverse, and Two-Player PK Mode.

## Early stages design

Once we decided on creating a game based on Doodle Jump with three twists, we began the early stages of design. Our first step was to identify the core game mechanics and functionality needed for the game. We conducted research with paying particular attention to games with similar mechanics to Doodle Jump. This research helped us to identify the key game mechanics we needed to incorporate, such as jumping and avoiding obstacles.

Next, we developed a use case diagram to help us visualize the core use cases and actors involved in the game. This diagram helped us to identify the primary use cases and actors, and how they interacted with one another. We included the use cases for the basic version of Doodle Jump, as well as the three twists we planned to add. We also identified the actors involved in the game, including the player, broken platforms and monsters.
<figure>
  <img src="static/Basic_Doodle_use_case_diagram.png" alt="Base Game Use Case Diagram" style="width:100%">
  <figcaption>Base Game Use Case Diagram</figcaption>
</figure>

<figure>
  <img src="static/Basic_Doodle_use_case_diagram_twists.png" alt="Twist Use Case Diagram" style="width:100%">
  <figcaption>Use Case Diagram with Twist</figcaption>
</figure>
<br>
<br>
After developing the use case diagram, we created a paper prototype of the game.

<figure>
  <img src="static/DoodleJump_prototype.gif" alt="paper prototype" style="width:100%">
  <figcaption>Paper Prototype</figcaption>
</figure>
<br>
<br>
This prototype helped us to refine our design ideas and iterate on the game mechanics. We experimented with different layouts, color schemes, and game mechanics to see what worked best. We also discuss and identify any potential issues or improvements. Through this process, we were able to make the necessary adjustments and refine our game design.

One of the key challenges we faced during the early stages of design was balancing the difficulty level of the game. We wanted the game to be challenging enough to keep players engaged, but not so difficult that it would frustrate them. We experimented with different platforms, monsters, and gameplay mechanics to find the right balance.

Overall, the early stages of design were crucial in helping us to refine our game concept and identify the key features and functionality required for our game. By developing a use case diagram and a paper prototype, we were able to visualize the game mechanics and iterate on our design ideas. This process helped us to create a solid foundation for the development of our game.

# Design

## System Architecture
The game’s architecture consists of three main components: the Game Manager, User Interface, and the Game Elements. These components work together to create a cohesive and engaging gaming experience.

<strong>Game Manager</strong>
<br>
Our "main" file acts as a Game Manager. The Game Manager is responsible for managing the overall game flow, including updating the game state, generating new game elements, and handling user input. It plays a crucial role in ensuring that the game runs smoothly and responds to user actions in a timely and appropriate manner.

For user input, we decided to use the left and right arrow keys as the main moving keys, as they are more intuitive than other options. Additionally, the 'z' key can be used to spawn a helping platform under the Doodler, and the 'space' key can be used to restart the game when it's game over. These user inputs are carefully chosen to provide a seamless and enjoyable gaming experience.

<strong>User Interface</strong>
<br>
We have five classes as our user interface components: start page, setting window, help window, pause window, and end page. The User Interface is designed to be easy to use and visually appealing, providing a seamless and enjoyable gaming experience for the user.

While acting as game manager, the "main" also plays a role in rendering the main game screen, which displays the player's score, as well as buttons for pausing the game. The start page consists of a help window button and a setting window button at the left and right top corner, respectively. It displays the game's title, choices of character, and a start button. The help window provides instructions for users to understand the game, while users can choose level difficulty and switch to 2-player mode in the setting window. In the end page, the final score is shown in single player mode, whereas in two-player mode, the winner is shown.

<strong>Game Elements</strong>
<br>
The Game Elements component includes all of the game objects, such as Doodler, monsters, and platforms. Each of these game elements is implemented as a separate class, with its own set of properties and methods. These elements are carefully designed to be visually appealing and challenging, providing a fun and engaging gaming experience for the user.

The Doodler is the main character of the game, and is designed to be easy to control and visually appealing. The monsters and platforms provide a challenging obstacle for the Doodler to overcome, adding an element of excitement and difficulty to the game.

## Class Diagram

<figure>
  <img src="static/DoodleJump_class_diagram_2.jpg" alt="class diagram" style="width:100%">
  <figcaption>Class Diagram</figcaption>
</figure>
<br>
<br>
To create a clear and organized system for Doodle Jump, we've designed a class diagram that includes different pages and windows as classes to help players navigate and understand the game.

First, we have the Start Page class, which players see when they open the game. This class allows players to choose their character and provides access to two auxiliary windows: the Setting Window and the Help Window. The Setting Window allows players to adjust the number of players and difficulty level, while the Help Window provides guidance on how to play the game. These pages are designed to enhance user control and freedom.

During gameplay, there are four important classes: Doodle, Platform, Equipment, and Monster. The objective is to help the Doodle jump as high as possible, while avoiding falling off the screen or colliding with monsters. Equipments can help the Doodle jump higher and gain points more efficiently, but can also lead to collisions with monsters. To implement these features, we've designed three interactions: Doodle & Platform, Doodle & Equipment, and Doodle & Monster.

When the Doodle touches a platform, it can jump to a specific level. When it touches equipment, it can jump higher, but must avoid colliding with monsters. In addition, three twists have been incorporated to change the gameplay slightly. The first twist is the Two-Player Mode, where players try to jump higher than each other, while avoiding monsters. The second twist is the Gravity Reverse Mode, where the objective is to move down the stairs without jumping on platforms, while avoiding spikes on the ceiling. Finally, the Helping Platform Mechanism allows players to generate a platform just below the Doodle under specific conditions, to save it from falling off the screen.

Lastly, the End Page class appears only when the game is over. Here, players can choose to start a new game or exit the game. Additionally, a Pause Window will appear if the player pauses the game, informing them of their paused status. By organizing the game into different windows and pages, we've created a clear and intuitive system for players to navigate and understand Doodle Jump.


## Sequence Diagram

<figure>
  <img src="static/doodle_jump_sequence_diagram.jpg" alt="sequence diagram" style="width:100%">
  <figcaption>Sequence Diagram</figcaption>
</figure>
<br>
<br>
Above is the sequence diagram for our game. The sequence diagram shows the interactions between the different components of the game, including the player, the platforms, the monsters, and the score system. First of all, the game generates various types of platforms randomly, including normal, fragile, broken, spring, and rocket platforms. Each platform provides different feedback to the doodler based on its characteristics.

When the player moves the doodler to the left or right, the doodler can land on a platform, and the platform will provide feedback to the doodler. The normal platform and fragile platform both return the "jump" feedback, but the fragile platform will disappear at the same time. On the other hand, the broken platform will not provide any feedback but disappear when the doodler interacts with it. The spring platform and rocket platform provide different types of jumps. The spring platform helps the doodler to jump higher, while the rocket reduces gravity, allowing the doodler to fly.
In addition to the different types of platforms, there are also empty areas where there are no platforms for the doodler to land on. When this happens, the game constantly checks whether the doodler is out of the window. If the doodler is out of the window, the game is over. Furthermore, monsters will appear at random times, intervals, and places. If the doodler touches a monster, the game is also over.

If the player is good enough to reach a certain score, a gravity reverse is triggered, causing the player to go down instead of jumping to avoid touching the ceiling spike. If the doodler touches the ceiling spike, the game is over.

# Implementation

## Platforming Framework
Implementing the early platforming logic of the player character and the surrounding objects proved to be relatively straightforward in their design.  Writing our game in Processing allowed us to straightforwardly generate player characters, manipulate their velocity, and implement simple collision detection between the user and the surrounding platform. The first challenge that emerged in our game implementation was designing the nature of our randomly generated map, in particular, cycling through successfully navigated parts of the map. One problem that seemed to emerge among other project groups was the difficulty in translating the map and its obstacles to the movement of the user. Our game structure navigated these problems by ensuring that the platform entities (and in turn the equipment and monster entities) were all instantiated within the Doodler class. This allowed us to manipulate these objects in a way that responded to the current configuration of the player character. This also presented a novel solution to a secondary problem that immediately impacted platforming performance and memory allocation. When the map failed to adequately react to the movement of the player the large number of platform, equipment, and monster entities being spawned caused map generation errors, hardware lag, and eventual crashing. By successfully implementing a reactive map generation process, our software was able to identify when parts of the map had been successfully traversed and were therefore being rendered off-screen. In doing so we were able to purge navigated entities that no longer needed to be rendered ensuring a smooth, efficient game execution.

## Gameplay Twists
Having implemented a basic platforming method that represented the underlying framework for the rest of our software, the next development challenge was the incorporation of the gameplay twist elements. Developing our two-player game mode presented several challenges, particularly in its integration with the base game model. The two-player method required tweaking how user inputs were registered, allowing for multiple key presses and directional changes among the two users. Creating this alternate game state for two players also required a careful rebalancing of equipment objects. Preliminary feedback recognised that powerful changes to a doodle’s velocity and map position, which caused games to end prematurely, threatened the fairness and enjoyment of the game mode. As a result, alterations were made to interactions with equipment to lessen their impact and the method behind map generation was altered slightly to favour whichever doodle was traversing fastest.

## Integration and UI
Alongside our two-player game mode, our group endeavoured to develop and refine two other gameplay twists, which also included a reversed gravity mode and the ability for the user to directly manipulate the map layout. Laid out alongside our basic platforming framework, the final challenge required us to combine these disparate packages into one complete product. Important considerations throughout this process were the need to not only create tidy, easy-to-read code for us as developers but an equally accessible user interface for our players. While also remaining keenly aware of how we wanted to structure our game difficulty sections. Our gameplay twists, as well as features such as map enemies, significantly altered the difficulty level of a simple platformer. We, therefore, wanted to create an interface for our game that communicated our gameplay twists to the user, while also allowing for features to be added or removed for certain difficulty levels, all at the discretion of the player. The solution was to implement a layered interface that allowed users to both select single and multiplayer game modes, as well as adjust the difficulty of the map they faced. Subsequently, each incremental difficulty level would enable a new, more challenging gameplay twist.

# Process
## Team roles
First of all, in our team, Joyee serves as the main project manager while Shannon takes on the role of vice project manager. Both Joyee and Shannon, along with Henry and Tien, work as software developers, contributing their skills and expertise to the project. Meanwhile, Zefeng is responsible for game style design and evaluation, ensuring the game's aesthetics align with our vision and goals. We follow a streamlined and collaborative approach to software development, ensuring timely and high-quality results. Next, we will outline the essential tools and methods we use to optimize our process, communication, and project management throughout our software development journey.

## Tools
To achieve a smooth and organized project management system, our team decided to take advantage of various tools and methodologies that would cater to our specific needs. This multifaceted approach helped us streamline communication, allocate tasks efficiently, and maintain a high level of productivity throughout the project.
<br>
One of the key tools we employed was "Trello", a project management application that allowed us to record and track every task that needed to be done. Trello's user-friendly interface and organizational capabilities enabled us to create boards, lists, and cards to represent tasks and their respective deadlines. This way, every team member had a clear understanding of their responsibilities, and it also helped us monitor the overall progress of the project, making our development process more flexible and agile.
<br>
<figure>
  <img src="static/Trello_Interface.png" alt="Trello Interface" style="width:100%">
  <figcaption>Trello interface</figcaption>
</figure>
<br>
<br>
However, just having a visual representation of tasks was not enough. We also needed a reliable communication platform to facilitate discussions, share updates, and address any issues that arose during the project. For this purpose, we used Microsoft Teams and WhatsApp groups to stay in touch with each other. These tools allowed us to have real-time conversations, share files, and even conduct video conferences when necessary.
<br>
We understood that effective communication was essential to the success of the project, and we wanted to ensure that no one felt overwhelmed or left out. To further enhance communication efficiency, we divided our group into smaller subgroups based on specific features or areas of expertise. This way, each subgroup could focus on their designated tasks and collaborate more effectively, without getting bogged down by excessive information or irrelevant discussions.

## How we work
To maintain a sense of accountability and ensure that everyone was making progress, we would get in touch with each team member every one to two weeks to assess their progress, address any challenges they faced, and provide support as needed. These check-ins helped us identify potential bottlenecks and allowed us to proactively address any issues before they escalated.
<br>
Workload estimation played a significant role in our project management strategy. We used Poker planning, a consensus-based estimation technique, to determine the complexity of each task and assign story points accordingly. This method involved team members discussing and comparing their estimates, fostering open communication and collaborative decision-making. By assigning story points, we could better understand the effort required for each task and allocate resources more effectively.
<br>
With a clear understanding of the complexity of each task, team members could then gauge how many tasks they could realistically handle within two weeks based on their respective story points. We recognized, however, that personal issues might cause delays or unexpected challenges, so we planned for contingencies. Every two weeks, we held meetings to assess progress, discuss any obstacles encountered, and make any necessary adjustments to individual workloads.
<br>
This biweekly review allowed us to remain flexible and adapt to changing circumstances, ensuring that the team's overall productivity was not hindered by unforeseen issues. Moreover, these meetings also allowed team members to share their experiences, learn from each other, and celebrate milestones achieved.
<br>
Our comprehensive approach, which combined various tools, methodologies, and a strong emphasis on communication and collaboration, proved to be highly effective. We managed to complete the game development on time, thanks to the hard work and dedication of our team. This experience not only reinforced the importance of strategic project management but also taught us valuable lessons that we can apply to future projects.



<!-- ### [Class Diagram](https://app.diagrams.net/#G1eO5WRYrhPcYVJps2LNeKAyVoR5l_IiGF)
![Class Diagram](static/DoodleJump_class_diagram_2.jpg) -->


# Team Members
<img src="./static/Joyee_swe.JPG" width="200" height=auto>

- Joyee Tan

<!-- ![Shannon](Shannon_Lin.jpeg) -->
<img src="./static/Shannon_Lin.jpeg" width="200" height=auto>

- Shannon Lin

<!-- ![Zefeng](Zefeng_Zhuang.jpg) -->
<img src="./static/Zefeng_Zhuang.jpg" width="200" height=auto>

- Zefeng Zhuang

<img src="./static/Henry.jpg" width="200" height=auto>

- Henry Brooking

