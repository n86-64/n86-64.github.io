---
layout: post
title:  "Planning Snake"
date:   2017-10-08 17:00:00
author: Nathan Butt
categories:
- Low Level Programming
- C++
- Games programming
- Software Design
- Developer Dairy
- Snake
img: Snake.jpg
thumb: gnome-nibbles.png
published: true
---

This year in university as part of our low level programming module we have to produce a series of five games. Four games over a set time and one game throughout the entire year culminating in a portfolio of games at the end of the year. As part of this module we need to detail our processes of design to show how we arrived at the programs we submit and what we can do to improve them.
Hence, as part of this blog, all posts with the tag 'Low Level Programming' will form part of a developer dairy (or 'dev dairy' if you prefer).

With this being my first entry I will be focusing on my first assignment, create a version of Snake.

<!--more-->

## What is Snake?

<iframe width="560" height="315" src="https://www.youtube.com/embed/e4PHPPyFzm0?rel=0" frameborder="0" allowfullscreen style="float:middle"></iframe>

Snake is of course a classic and simple game dating back decades. Practically everyone has played some variation of snake from Nokia snake to GNOME Nibbles (which is the version I played and the version you can see here).

In snake the player is given a maze and is required to manoeuvre a snake round a level in order to eat fruit to gain points. Sounds easy except eating causes the snake to grow in length and if the snake collides with itself, a wall, or other obstacles the game ends or a life is lost.

There are of course different variations of snake, however all share these basic rules.

## Planning

Before any code can be written, of course it is important to have an application structure in place and in regards to technical aspects I have made some inroads here.

The first key issue was the snake itself and the representation that I should use for the game.

The initial representation for the environment that I considered was to use a cellular representation where the snake would occupy certain cells. However I quickly realised that there were several downsides, one such being limited freedom of movement for the player. This is an issue as after seeing games such as 'slither.io' I wanted to consider the possibility of allowing the player freeform movement but this would be close to impossible to replicate well with a cellular representation. Hence I decided I will not use a cellular representation for the level but instead use a freeform representation meaning elements can be anywhere in the level and are not constrained to a grid.  

In regards to the snake itself, I settled on a technique for the game loop which I call 'trace then draw' as this would provide an efficient update loop preventing any stuttering. Thus my data representation for the snake is built around this which involves calculating the snakes path on the screen and then drawing the elements of the snakes and presenting the frame to the player.

In essence the snake would be roughly drawn this way:

```
Game Loop()

          input <- system.inputValues
          Transform (snake.head) By (input.value)

          If snake Collides With object Then
             Stop
          else
            path <- Calculate Path Using (snake.head)
            Draw Using (path)
          End If

End Of Function
```

In essence any motion of the snakes head is first retrieved and upon the new position being determined the path is then determined using the length of the snake as well as the snakes head. The system then goes on to draw the snake on screen or show a game over screen if the snake has collided which would be checked during the game loop.

Hence the snake can merely be represented by a collection of integer and 2D vector values which will be used to calculate the path. The advantage of this approach is it will allow me to possibly consider using curved snakes and allow the player to have freeform control as well as limiting the amount of data I have to track in the player class.

With these key elements roughly decided upon I considered the overall application structure and whilst it is not complete I have a basic structure here based on my personal requirements for these algorithms.

<img src="https://n86-64.github.io/img/Snake-Basic-Structure.png" alt="My Snake Structure" align="middle" style="float: middle">

<!--![Alt-Text](https://n86-64.github.io/img/Snake-Basic-Structure.png)-->

The application structure is built with the assumption that changes will be made in the future. I chose this application design because it limits the coupling in the application and allows me to make changes easily. As in my [minesweeper application](https://github.com/n86-64/NathansMinesweeper-ESDAssignment2) this strategy allowed me to make future changes such as the feature to reveal adjacent cells without having to, in essence, re-write the software or, as John Mashey brilliantly says, (Whilst not directly related to games I find the quote to be very relevant):

<iframe width="560" height="315" src="https://www.youtube.com/embed/tc4ROCJYbm0?rel=0&amp;start=127&end=181" frameborder="0" allowfullscreen style="float:middle"></iframe>

## Considerations for Game Design

Design-wise I have considered a few changes to differentiate my version from others on the market. The main change being 360 degree movement based on the players mouse as stated earlier.

However I am also considering features such as:
- Basic Multiplayer where two snakes could play simultaneously
- Adding AI snakes which the player has to avoid.
- A timer where the player has to eat food or starve and lose the game.
- Adding Lives which are lost instead of an instant game over.
- Sounds based on actions in the game.
- A slowdown feature where the player can try and avoid a collision. Similar to Pac-Man CE DX.
- The ability to wrap-around the map at certain points.

At the moment, however, these are just basic ideas for extensions to the game rather than a fully-fledged feature list. My plan is to first build a basic application and get the core loop of snake implemented. Upon doing so I will then consider adding these features.

Whilst at the moment the application is still very much in the design phase, I intend to have a basic implementation planned and partially implemented.

<!--TODO - talk about design ideas and what should be done next.-->
