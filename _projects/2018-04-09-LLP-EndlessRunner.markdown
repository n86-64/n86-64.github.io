---
layout: project
title:  "LLP Game 2 - nRunner"
date:   2017-12-10
author: Nathan Butt
categories:
- LLP Portfolio Games
- Games Technology Course
img: runner.jpg
thumb: runner.jpg
carousel:
tagged: Games, Low Level Programming
client: University project
website: N/A
published: false
---

nRunner is the second of five games developed as part of my LLP assignment portfolio.

## About this Game
nRunner is an endless runner game where the player will be presented with an assortment of obstacles. The players goal is simply to dodge the incoming projectiles in order to get the highest score possible. These obstacles as per the assignments requirements are procedurally generated and will be sent to the player at various intervals.

## Gameplay and Features
The player plays on a top down view and is able to move using the up and down arrow keys. From the beginning of the game the player will be presented with a set of obstacles which will accelerate towards the player over the course of the game. Using the arrow keys the player needs to dodge the incoming obstacles. The player is able to gain points simply by surviving for as long as possible with the number of points the player receives increasing as time goes on.

The game includes a system for saving high scores meaning if the player is able to achieve the highest score then it will be saved into a text file and recalled. This gives incentive to the players to play again to try and get the highest score.

Overall the game is just a simple endless runner where players are able to compete each other for the biggest high-score.

## Evaluation

Overall, I feel this project was quite lacking in terms of features and functionality.

The game was functional and playable to a conclusion with many areas such as collision working well with no issues. There were no major performance issues with the game running at a fairly consistent, and high frame rate. The player was able to move up and down perfectly with the player being restricted correctly to a playfield with no known issues. The Game was able to correctly create the obstacles and send them to the player throughout the entire length of the game. Much of the key functionality that the game required was implemented in some form.

However, the issue was that these implementations was that the underling systems were not refined enough to create a good quality experience. Features such as the high score system for example were not fully implemented due to some file I/O issues, meaning the high score display could not be shown in the game. The game itself also had issues in terms of the procedural generation of obstacles. Whilst perfectly functional it was limited in scope with the projectiles after a certain amount of time moving in a uniform way which made it predictable and easy to dodge. Resulting in a lack of challenge and replayability. There were also some minor bugs present with the input system.

Design wise the use of assets in the game was also an issue. Examples such as the colour of fonts that were used which did cause problems in terms of readability.

The primary reason for these issues was the organisation of time. The time issue resulted in not having enough time to iterate and enhance many aspects of this game such as the procedural generation. Organising this time properly would have allowed me to refine this design resulting in better gameplay and replayability. Hence in future projects I intend to ensure that I manage my time better as doing so will give me those crucial hours to refine the games behaviour or add more features to a game to create a more fulfilling experience.
