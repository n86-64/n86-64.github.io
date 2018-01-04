---
layout: project
title:  "Manic Traffic - A Rush Hour Puzzle Game"
date:   2017-05-01
author: Nathan Butt
categories:
- University Projects
- Year 1
img: rh_thumb.jpg
thumb:
carousel:
- manicTraffic/img1.png
- manicTraffic/img2.png
- manicTraffic/img3.png
- manicTraffic/img4.png
tagged: Games, 2D, Puzzler, Cocos2DX
client: University Project
website:
published: true
---
<script async defer src="https://buttons.github.io/buttons.js"></script>

### Get it Here:

<p>
<a class="github-button" href="https://github.com/n86-64/ESDAssignment3-ManicTraffic/archive/master.zip" data-icon="octicon-cloud-download" data-size="large" aria-label="Download DudleyHK/CyberGameCafe on GitHub">Download Now</a>

<a class="github-button" href="https://github.com/n86-64/ESDAssignment3-ManicTraffic/" data-size="large" aria-label="Download DudleyHK/CyberGameCafe on GitHub">View Source on GitHub</a>
</p>


Manic Traffic was one of my first year university projects and is a basic clone of the classic puzzle game rush hour. Hence the aim of the game is to navigate the red car on a grid out of a maze of traffic. My version of the game is very much like the traditional rush hour game where the players main objective is to complete the puzzle in either the shortest amount of moves or the shortest amount of time.

The game contains of a series of 8 levels which progress in difficulty and the player is tasked with completing these 8 levels in the shortest amount of time possible.  The game uses a basic control scheme involving just the mouse. Requiring the player to drag the cars around the board in order to free the red car in the centre of the board. If at any point the player is struggling to solve the puzzle and wants to reset they are able to do so by clicking the reset button which will restore the vehicles to the starting layout.

Upon the completion of the 8 levels the player will be presented with a congratulatory message and the time it took for them to finish the game. At this point the player will be able to return to the main menu and have the option to play again to beat that time or quit the game. However, if the player wishes to end there session early they are able to do so by pressing escape and returning to the main menu.

## Technical Structure:
The game was built using the Cocos2DX API utilising several elements afforded by the API ,such as scene management\transition, physics components and sound playback. My game also contained several self designed elements such as a basic file parser, which is able to read level data from provided text files. Allowing levels to be constructed efficiently and loaded in at runtime without the need to recompile the games source code. This mechanism was especially useful during development as it allowed me to create levels quickly and efficiently.

## Extensions:
Whilst the original application met the requirements of the university project there was a number of extensions that I had considered and if I had more time would have added into the game. The first being the addition of a level editor which would allow yours truly as well as players to create there own levels. These could then be exported from the game and shared allowing other people to load the levels and play them. This would then be combined with leaderboard data allowing players to compete with each other.
