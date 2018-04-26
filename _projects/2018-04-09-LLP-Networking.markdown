---
layout: project
title:  "LLP Game 5 - Deadlock"
date:   2018-04-23
author: Nathan Butt
categories:
- LLP Portfolio Games
- Games Technology Course
img: deadlock.jpg
thumb: deadlock.jpg
carousel:
tagged: Games, Low Level Programming
client: University project
website: N/A
published: true
---

Deadlock is the last of a series of games developed as part of my LLP assessment portfolio. This game was developed as part of the same team that made Sentire.

## About this Game
Deadlock is a turn-based network game. In this game players are required to cooperate with each other in order to complete a map objective of some form. As can be guessed from the title these said mission relate to survival in a zombie outbreak and range from finding items, to clearing the area of zombies.

The game is a built around the idea of locating and recruiting civilians. Doing so increases the size of the players army which is needed in order to face greater hordes and more complex enemy types. The players get to choose what mission they choose to engage in and then, upon making this decision are able to lobby up and play through there mission of choice.

## Gameplay and Features
Deadlock is a game that is played on a dedicated server utilising a client-server architecture where the players are given a choice what map to play and are then able to play the map of their choice. This is a similar system to TF2's gamemode Mann Vs Machine where the story as it were, is played out as missions which can be freely chosen by the player.

In the game players will command two types of units, civilians and a commander. The commander is chosen by the players in the main menu and will function as the main chracter. Survivors are placed within the map and are to be rescued in the game by the commanders in the game world. Hence, in the levels the players need to be able to rescue these civilians and recruit them, else they will find civilians being infected and turning into zombies.

The players goal is to complete a stated mission objective such as clearing the area of zombies or rescuing someone from a certian area.

The game has additional features such as options for text chat and a lobby system
which allows players to connect to any server on a network.


## Role
My principle role in this game was the system designer. I was responsible for designing the networking system that would be used by the game for transmitting data packets over the network. I was also responsible for the creation of a level generator system which would now allow for level files to be created via text files rather than being hardcoded. Alongside this I implimented a the various systems to improve rendering and UI interactions from the last game.

In terms of gameplay and game experience I created both the main menu and the lobby screen.


## Evaluation
The networking project I felt could have gone significantly better as I felt there were major faults in terms of the gameplay.

In terms of technical ability we decided as a team to utilise the same codebase as the one used in Sentire. Hence, what I am dubbing the Sentire engine largely featured many of the same structures as the last codebase. In this version the technical system side of the implementation was significantly improved with the addition of a level loader and entity construction system. This made it significantly easier to construct new levels and allowed us to create many of these levels quickly as well as test any changes. This both sped up development and allowed for finer refinements.

The networking system was also well constructed. Whilst not a fully fledged packet system, its generic nature allows data of any nature to be streamed in and out with relative ease. The addition of a packet type constant also assisted in interpreting the contents of the packet and allowed for data such as messages to be moved around with relative ease.

However, the big flaw with this game was the implementation of the gameplay systems. Whilst the gameplay was somewhat implemented there were a few problems with the methods used. The units being coupled to the grid was a big mistake as it prevented proper game setup and movements being recorded. Resulting in an incomplete game where the key element does function but is slightly buggy. The game also lacked a key amount of polish which would allow for easy navigation in the menus for example. The result was a game that didn't quite function properly and as a result of these bugs we had to fixed, with the game being in an inadequate state.

When looking into the factors behind this games development I would have defiantly considered reorganising the teams time with a focus on completing the gameplay elements first before the addition of networking. Whilst the networking architecture was strong without a well built game system its is meaningless. Hence, in future I intend to reorganise and reprioritise my development schedules to ensure these crucial elements are completed on time and to a string standard.
