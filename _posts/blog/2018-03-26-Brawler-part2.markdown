---
layout: post
title:  "Birdman Brawler - Part 2"
date:   2018-03-28 14:30:00
author: Nathan Butt
categories:
- Low Level Programming
- Games Programming
- C++
- Development Dairy
- Birdman Game
img: birdman2.jpg
thumb: birdman_tumb2.png
published: true
---

Development of this game began after our presentation getting greenlit, with a meeting discussing the multiple aspects of the game. The first priority was to decide on the technical design of the game itself and work out how we were going to implement the various mechanics in our game.

<!--more-->

## Technical Design

In technical terms we had to consider the game structure in terms of the requirements of the game we were making. In our case the game had to support the following:
- A hub world where the player is able to select which level they wish to play.
- Levels which have well paced waves of enemies attacking the player. Said Levels should function like streets of rage where the player can only proceed when they have cleared the wave of enemies.
- Ability to save the game and resume at any time. As well as the ability to pause the game and return to the main menu.

We had quite a few technical requirements and in order to save time decided to focus on the creation of a single level and a key hub world, in essence a vertical slice of gameplay which would get across the main pattern for the game.

## My roles in development
My role in the group was primarily focused on the technical side of the project. I was responsible for the creation of many of the low level systems that the various game mechanics would be built on. This included areas such as collisions and sound. Hence I primarily focused on designing and building the various systems for the game such as the scene manager and the game object model.

## Overall System Design
The first challenge was deciding on the overall system structure that we were going to use. Like with previous games I decided to maintain the concept of a generic GameObject as it was useful in simplifying the updating and rendering of objects as well as allowing for specialised behaviours via inheritance.

### Game Components

One limitation however that was noticeable in previous games I made was the limited composition with each component class having to be hardcoded into the class object. Therefore for classes such as Colliders the class would not only be limited to one collider but each Gameobject would have to have a collider to ensure enemies and players alike had one. This is incredibly wasteful as well as

Therefore inspired by Unity3D and Unreal I decided on a component model. Each object would have a generic component container with players being able to acquire components from this container via search utilising the C++ template system. Hence functionality such as audio sources and gameplay systems could now be expressed as GameComponents which can then be dynamically added or removed from classes allowing for truly bespoke behaviour. These game components would contain a limited set of functions, namely and update and render routine with other components being specialised via inheritance, in a similar fashion to GameObjects. This model is useful in two-fold as it allows for specialised behaviours to be easily added to classes without having to reimpliment said behaviours reducing code duplication as well as simplifying an observer model implementation as the scene management system is then able to check for these components and register them with their appropriate managers.  


![I decided to adopt this model for all game component objects.](https://n86-64.github.io/assets/img/blog/LLP/component_model.png)

*I decided to adopt this model for all game component objects.*

The implementation for this system is relatively easy with all components being collected in a centralised container within the GameObjects. Each GameObject then contains a number of utility functions which allow components to be found and then interacted with.

```
GameObject:
       ComponentList of type Component array

       Get component by type parameter - typename:
            for each component in the Component Array
                 if entry.typename in Component is equal to typename parameter
                    return entry reference from Component Array
            end for loop

          if no entry exists then return null reference.  
```
The system would only return references to the said objects with instances and management being handled by the GameObject template.

### Scene Management

Scene management utilised a similar model to the previous games where the scene would act as a container if all GameObjects allowing to be updated and rendered by the game. This is a very flexible model which allows for a seemingly infinite set of game states, greatly simplifying the development of levels and menu systems.

However one limitation of my previous implementations was an inability for the system to communicate with an observer of some form to trigger in game events such as changing the map or instantiating a GameObject in the game. Whilst in previous games I had often passed references to the current game world this would result in coupling of in-game modules which could lead to 'undefined behaviour' in the long term.

Whilst this initially was challenging due to the need for a simple model which the team could use. I eventually was able to come to a solution that was simple and abstracted well.
I utilised a hybrid approach based on the observer model where each game object is given an event handler object which contains a data structure. So whenever an object calls an event, a flag in the data structure is set along with any potential parameters and the said flag is then interpreted by the scene manager.

This not only decoupled these objects, but it also greatly simplified operations such as scene management from game objects. Meaning behaviour such as entry doors which take the players to new scenes is quick and easy to add without too many difficulties surrounding bugs etc. However, other than this key modification the system design is very similar to the previous games except with the addition of a scene manager. The scene manager responsible for updating, rendering and transitioning scenes.

![Scene Manager acts as an observer to the scene.](https://n86-64.github.io/assets/img/blog/LLP/component_model.png)

*Scene Manager acts as an observer to the scene.*

## Gameplay Systems

This game also requires a number of additional gameplay systems than compared with the previous games I have worked on this module. Most of the systems here would be designed as a GameObject of some form.

### Camera

The first requirement for this type of game was to have a fully independent, scrolling camera GameObject which would allow the player to be able to move around independently of the window frame. This was not a significantly difficult issue to deal with and I quickly decided on a simple transformation algorithm for the camera.

```
Draw Sprite:
         Draw sprite at position (sprite.position.x - camera.position.x, sprite.position.y - camera.position.y)
```

As you can see it simply involves subtracting the position of any object from the position of the camera. Hence, all objects in the world would be placed at an appropriate point in the frame according to the position. In essence the world moves around the position of the camera. This was a very simple and effective algorithm that achieved the desired effect with very little computational expense.
In addition to this transform algorithm I also ran a clipping check to see if an object was in frame before drawing.

```
Sprite Culling:
        if SPRITE is within VIEWPORT
           then Draw Sprite
        else do nothing
```
The said algorithm is useful as it allows us to preload all assets at specified positions in the scene without having to render the said objects. Improving performance in the game as well as allowing for larger levels and vastly more enemies.


### Collision and Fighting
Collision for a brawler game is quite crucial and in order to deal with this I made some slight adjustments to the collision system that I used in the last game. The collision manager works in a similar manner where a collision function is called when a collision occurs. However, I have modified the system so the collision manager has references to colliders registered. This allows any object to have multiple colliders which can each serve a different function. Hence why tags which function as group identifiers were added to the objects.

Other than this change the collider system still uses the same collision system that my previous games had used with an event being called on the objects where the collision occurred. Meaning any behaviour that needs to occur such as registering damage or stopping character movement could now occur.

Such a system would be utilised in giving each player and NPC hitboxes which could then be enabled when the player punches and enemy or kicks an enemy. Allowing the said enemy to then register damage according to the hitbox it is a part of. Whilst not pixel perfect it is a close enough approximation that the player should still feel a sense of control over the caracter and get a close to instantaneous response.

Any other objects such as walls and blocking volumes also become simple because they can be composed of just a single blocking collider which can ten be deactivated when the player is ready to move on.

With my system designed and planned out I proceeded to progress with the implementation of these designs as did my team who focused primarily on the gameplay angle of the system.
