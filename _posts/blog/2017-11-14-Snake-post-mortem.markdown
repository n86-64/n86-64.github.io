---
layout: post
title:  "Snake Post Mortem"
date:   2017-11-14 17:00:00
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

Sorry for the long wait, but as you can probably tell my first low level programming portfolio piece has been completed.
Whilst I was able to pass my assignment I feel this is the perfect opportunity to reflect on the past few weeks on how the assignment has gone and work out what went right, what went wrong and what I can change to improve it.

<!--more-->

# The Planning

Upon deciding on the features that I considered for the game I set about planning both the algorithms and the object structure.

The algorithms needed for this game were quite simple to work out. In terms of the snake I had the choice between either using a grid algorithm where the screen is divided into cells and all items etc. have a position on the grid, or I could use a freeform grid-snapping representation where the snake moves at a fixed velocity every frame. I decided on the latter representation primarily for flexibility reasons as one of the features I was considering would require a freeform representation.

This representation also had other advantages as it meant only the head location and the length of the snake along with the turning points had to be stored in order to create this effect. This greatly reduced the amount of memory needed as well as allowing the snake to move freely to any location within the game world without needing to kill the snake. Hence opening the door to more opportunities for gameplay alterations as well as simplifying implementation modifications. Once I settled on this issue all the other algorithms I needed to design became clear, for instance the need for bounding boxes to check for overlap with any entities in the scene.

These algorithms were not particularly complex to design and I was able to come up with a rough idea of what components I would need fairly quickly.

With the algorithms settled I then got to work designing an application structure which took significantly longer than I had expected. This was due to the nature of the framework that we were provided. Whilst an engine, ASGE did not provide many components for areas such as collisions as well as font rendering thus I had to consider this when deciding on my systems object model.

After much consideration I eventually settled on this object model:

![My Object Model](https://n86-64.github.io/assets/img/blog/snake_plan_final.png)

As you can see I decided to build my object model on the concept of a game space hierarchy model or to put it another way:

{:.box-note}
**Game -> World -> Object -> Component**

That is all simulation occurs within a game world and that game world contains game objects. These game objects have a state which is updated via the updateObject function which is called by the game world. Having all core components as game objects within a world simplified the games design as everything form the snake player to the UIs can be treated as a game object. Hence only a Passover update routine is needed and no work needs to be done to check and then call these multiple objects. The same also applies to rendering, and whilst the model doesn't account for Layers or Z-order this could be easily implemented.

Alongside Game objects I had game components which are used to add functionality to the GameObjects such as sprites which were provided by the engine but also colliders. These would then interact with managers which are components of the game world and provide functionality such as collision.

The last few components are data structures and here I use a Vector2 data structure which is utilised for storing and managing placement data as well as other 2D values.

Reflecting on this I feel the object structure whilst satisfactory could have been improved. For example, components like the sprite manager were not necessary as the engine handled issues such as texture caching automatically. It may have been slightly over-engineered but overall by observing RAII (Resource acquisition is initialisation) it simplified memory management greatly as destroying the snake world for example would mean all its sub components would be deallocated and cleaned. Hence making memory allocation easier as well as debugging in general.

The main issue however with planning was the time I took to plan the system as I was designing several components. This lead to reduced implementation time which would cause issues in the implementation phase.

# Implementation

Implementation was a mixed bag in terms of results.

The implementation did differ to the initial plan in many ways. For instance, many components I had planned to include were missing from the final build. This was primarily a result of time limitations or as mentioned earlier were removed in response to new information.

The implementations main strength was the fact the application was stable and ran at fairly consistent performance with little if any slowdown. Alongside this the implementation was able to implement the core object model successfully which simplified memory management and debugging speeding up the development process. This approach also assisted in testing as I was able to generate levels which would allow me to test out different components such as the snake player in the game, speeding up the debugging process.

However, the development may have been strong on the technical side but was weak on the game side. The implementation did come across some very serious bugs which had game breaking effects. Hence these had to be fixed which in combination with the amount of components that had to be written and the extended planning time led to the tail end of the implementation being rushed. For example, the creation of levels is semi-automated with the LevelCreation class however due to time restraints this was semi hardcoded. Hence this system would not be responsive to different sets of data creating a potential source of bugs. Alongside this there were some bugs that did work their way into the game that could affect the gameplay slightly as well as routines which could have been improved in terms of efficiency.

Time restraints also lead to some features being dropped from the game. But despite this the core loop was present and did work and was stable and did successfully include functionality such as resetting game sessions and preserving scores.



# Conclusions

So, what can I take away from all this. Well after considering feedback from multiple sources, if I had to do this project again I would start by reducing the time I spend planning the software and focus on the key components more instead of worrying about some details and then improvising other steps. This would speed up the planning process and would allow me to get to the implementation sooner. Spending more time on the implementation would have improved the polish of the system and would have

In terms of the implementation itself there were some changes I would make such as not using pointers in the std::vector as doing so is unnecessary and adds additional layers of complexity. Also, if I need to hardcode values I would substitute them with constant expression values as that would improve code readability.

Overall whilst the implementation was partially successful there were many features and issues which could have been implemented or fixed.
If I could attempt the project again I would focus more time on the implementation consider reducing the scope of projects and focus on doing a small number of key features well rather than try and create a game with several dozen features. Reducing development time and improving the polish of the game overall.
