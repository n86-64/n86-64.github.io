---
layout: project
title:  "LLP Game 3 - Sentire"
date:   2018-03-05
author: Nathan Butt
categories:
- LLP Portfolio Games
- Games Technology Course
img: birdman.jpg
thumb: birdman.jpg
carousel:
- LLP/sen.png
- LLP/sen2.png
- LLP/sen3.png
tagged: Games, Low Level Programming
client: University project
website: N/A
published: true
---

Sentire is the third of five games produced as part of my LLP assignment portfolio. I developed this game as part of a team made up of two other developers.

## About this Game
Sentire is a game that is based on one of the core themes of the film Birdman. This game is a beat 'em-up game which is designed to be a metaphor for the current state of Riggans mind in the film. With each of the enemies acting as a metaphor for an emotion that Riggan faces such as fear or stress. This would then be combined with some gameplay design decisions to create a game which gets across a light 'emotional message'.

The game simply plays in a fashion similar to classic beat 'em up gams such as Streets of Rage.

## Gameplay and Features
The game is comprised of two sections, the hub world and the various levels. In a similar fashion to many games such as Mario the player is started in a hub world but unlike Mario, the player is given free-reign as to which levels they wish to complete apart from locked levels which are unlocked as the game progresses. This allows us to create the feeling of navigating through someone's mind. Upon selecting a level the player is then able to play through that level and upon completion will unlock new levels.

As this game was only supposed to provide a demo of some form hence the game has only included a limited hub world and a single level.

In the game players are able to use one of two attacks, both a minor and major attack. The goal of the player is simply to get to the end of the stage and defeat the enemies on the level.

## Role
Our group decided to split into specialised roles when working on this project. In my case, I was assigned the task of creating many of the underlying systems that compose the game. Primarily, I focused on the scene manager, as well as the audio, UI and level-generation subsystems. I was also responsible for the creation of both the main-menu level a set of in-game elements such as various buttons and text labels.

## Evaluation
Overall, in comparison with the previous portfolio group we were able to produce a better game. Many of the underlying systems functioned well and allowed us to implement a few of our ideas. However, despite this the game was still somewhat lacking in some areas.

Technically speaking, all of the components were quite well built. The scene-manager was quite robust and allowed scenes to be switched with ease as well as various properties such as the scenes current active camera being easy to change. The event system whilst somewhat basic allows the various components to be abstracted properly. Preventing for example the world being passed through to the game objects which could lead to 'undefined behaviour'. Alongside the scene manager I was also able to add a component system to the game which would allow small sub systems of functionality such as audio playback. This system was very much functional and made the addition of elements such as audio playback and Colliders. This reduced the complexity of scaling up and allowed entities such as the player to be created quickly and easily.

The game also was the first in this portfolio to add a working camera scroll which was fully functional and scrolled with the player as they played through the level. Creating a seamless experience with the player being able to move back and forth in the world with no issue.

The game was complete and playable to a conclusion, with the players being able to get to the end of the game via engaging in combat with the oncoming enemies. In regards to enemies, we were able to provide some basic enemy AI providing the player a mild challenge for a gameplay demo allowing us to get the core of the idea across.

However, there are some issues with the game in the sense that the game was quite limited in functionality.  Elements of the gameplay were also slightly broken with moves such as jumping having faulty bounds resulting in incorrect damage. There was also a problem with the camera scrolling bounds where the player would be unable to see ahead of them. Hence, if work were to continue our focus would be on fixing these issues and refining the combat.
