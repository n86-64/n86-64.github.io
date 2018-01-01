---
layout: post
title:  "Lessons in board game design"
date:   2017-10-08 17:00:00
author: Nathan Butt
categories:
- Play and games
- game design
- Board games
img: The_L_Game.png
thumb: Dice.png
published: true
---

Hello again everyone I hope you are doing well.

Recently I had a tutorial session in my university, the topic of which was game design. In the session, we were given two games and we had to simply change the games in some way via modification of the games rules. Whilst I had studied the basics of design in previous sessions, it was a very challenging task as the games that we were given were indeed very simple and there are a lot of possible changes that we could make. However it led me to reach some interesting conclusions about the process of design and also some points to consider in the future when working on the design for this game.
<!--more-->

# The Games

<!-- TODO - add an image of the two games here. -->

The two games that we were given was 'Tic-Tac-Toe' and 'The L Game'. We were put into groups and our task was to modify the rules of these games to make them into 'better' or at least more interesting games. There were stark differences in how these tasks turned out.

## Tic-Tac-Toe

Tic-Tac-Toe was defiantly the easier of the two tasks as the game has a very major flaw in its design. This being first move advantage. This phrase refers to the advantage that the player gets when playing the first turn in a game and in Tic-Tac-Toe this was a significant issue as it could guarantee the player at least a draw and if not that a win.

This strategy is simply one of controlling certain sections of the grid. Doing so essentially would give the first player leverage in the game causing the second player to be reactive and make moves in order to negate the first players move and prevent them from getting 3 in a row. Whilst this may counter the move made by the first player this gives the first player an opportunity to make another advantageous move. The result is that the second player is in essence playing catch-up. This in combination with the simple nature of the strategy means that it doesn't take long before all games end in ties. Resulting in the game becoming 'stale'.

Hence our design modifications focused mainly on broadening the strategy of the game. Our team had two primary aims when modifying the design. Keep the game simple and ensure the modifications are as original as possible.
Hence on this basis we attempted several modifications to the game, the first of these involving expanding the size of the grid. In principle this should allow more possible combinations. However again there is still a slight first move advantage issue which if exploited can allow the first player to win if only 3 matches were required. In which case the logical change is to increase the number of cells that you need to match. Although this would make the game too similar to the likes of Connect 4 and others. This led me and the team to consider new alternative changes.

After experimenting there were two possible modification we came to consider. Both of which were focused on expanding the strategy of the game and addressing these shortcomings.

The first was to introduce a battle mechanic into tic-tac-toe.

![Our Battle variant of Tic Tac Toe](https://n86-64.github.io/img/DSC_0027.JPG)

In battle tic-tac-toe we kept the same goal but changed the core loop of the game. When the player puts a piece down they have the option to attack the opponent from a square. The attacks followed a rock-paper-scissors model where each shape is both weak to one shape and strong against another.
 ![The Rules](https://n86-64.github.io/img/DSC_0028.JPG)

This variation of the game had more depth as it allowed players to plan moves as well as counter potentially problematic moves. Thus resulting in the elimination of the first move advantage and the broadening of possible strategies in the game.

The second rule that was considered was in essence a dice mechanic where the player would have to roll a die and get a certain value or more in order to place there shape on that square.

In essence it assists in eliminating the first move advantage and adds some reasonable chance to the game. Although on evaluation whilst this does lengthen the game there are some potential issues in regards to the fact that victory could come down to a dice roll so to speak.

## The L Game

![The L Game](https://n86-64.github.io/img/The_L_Game.png)

[Source: Wikipedia User - Cburnett](https://en.wikipedia.org/wiki/L_game#/media/File:L_Game_start_position.svg)

The L Game was a puzzle game created in the 1960's by Edward de Bono. The goal of the L game is to paralyse your opponent via preventing them from being able to move there shape into a new position. The players are able to move and rotate the shape however they like providing that the shape is not in the same position. Upon moving the shape the player has the option to move a neutral piece to any position they wish.

The L game compared to Tic-Tac-Toe is vastly more complex and as a result has a higher skill ceiling than Tic-Tac-Toe. Despite this though we were able to find some simple strategies which could be used to win the game quickly. Hence for the L game the focus was on increasing the difficulty of the game.


![The L Game Design Alternatives](https://n86-64.github.io/img/DSC_0029.JPG)

We did this via changing the shapes of the pieces to a Z like shape. However this in combination with the use of the neutral pieces had the unintended effect of reducing the number of possible moves that could be made. Resulting in very short games. One change that we were considering was expanding the board however due to time constraints we were unable to test these changes.

Overall the exercise was quite useful as it allowed us to design new games from simple bases assisting me and my team in improving our model for designing games. In essence its a process of refinement kind of like the scientific method in some ways, if a mechanic works then great expand it and build on it and if it doesn't then you can discard the said concept and move on and repeat until you have a game.  

<!--TODO - Add the rest of the analysis on both games.-->
<!--TODO - Add a conclusion explaining the design process and its relevance here. i.e. Come up with an idea, break, repeat until good-->
