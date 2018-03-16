---
layout: post
title:  "Smashing Core - Part 1"
date:   2018-03-16 18:30:00
author: Nathan Butt
categories:
- Game Engine Programming
- C++
- Game Engines
- GEP Developer Dairy
img: battlefield.jpg
thumb: programming.png
published: true
---

In GEP, development of our Smash Bros clone has been coming along fairly smoothly. Since the last post a good deal of progress has been made regarding many of the engines components and subsystems. Whilst the game is currently not ready for a beta release, me and the team are confident that we will be able to pull the game together and get ready for the beta release portion of the assignment.  
Upon finishing the alpha, we as a group had a couple of SCRUM meetings and began to organise and delegate the various tasks based on the set of requirements that we had to meet. The first issue we had to address was deciding on what work had to be done, which varies according to both the technology we wanted to use and the features that we want in our game.

<!--more-->

In terms of technology we were provided with a basic game framework built on DirectXTK12 This is a higher-level wrapper for the DirectX12 API which provides several sets of utilities inspired by the XNA library such as a spritebatch for rendering sprites and input support.  (More on this later.)

The framework contained many custom additions and data structures to perform basic tasks such as sound playback and physics. However, these objects are very limited in functionality and did not allow for many advanced features such as sprite effects or physics simulation.
Considering these factors alongside the core requirements that we were given, we decided to focus on these features for the beta:
-	A wide range of levels and stages that players would be able to choose from.
-	Complete control over any games ruleset and parameters such as launch multipliers and game length.
-	A wide range of characters to choose from each with a unique set of moves and attacks.
-	A collection of items which the players can utilise against their opponents or items which can have environmental effects.

Whilst these features are subject to change and modification they allow us to meet all the core requirements for the project, as well as open the door for expansion if we feel new features are needed.
With the requirements settled the team proceeded to delegate jobs. I was given responsibility over the implementation of a scene management and event system. Upon receiving these jobs, I began to get to work designing and implementing these systems in the engine.

## Scenic Scenes

The first issue for our engine was how we could represent countless numbers of possible game states at any time. As can be imagined a game like ours has a high number of game states ranging from results screens to various game stages. Thus, a system is needed to allow us to switch between these states efficiently and dynamically.
One approach is to have a simple event listener where we could send a signal with a flag to change to a premade state like so.

```
    ChangeState(new state):
        Select option using 'new state':
          case MENU: load Menu()
          case VICTORY : load Victory()
          ...
```

However, this isn’t very dynamic or efficient method. For starters it would require the code to be changed each time a user wanted an item in the scene to be moved or changed which for designers would be a nightmare. Not to mention the addition of levels being complicated with this requiring additional flags and transition code to be added.
Thus, to solve this issue I decided to utilise the concept of scenes. Scenes are containers that are responsible for updating and rendering all the objects contained within them. These would be game objects which provide various sets of functionalities such as player movement and sound. This is an approach that is used in engines such as Unity and Unreal which isn’t surprising given its simplicity and flexability. Considering this I designed a scene management system around this base architecture and settled on this initial design below.

![Initial Design](https://n86-64.github.io/assets/img/blog/GEP/scene-manager.png)

As illustrated, this structure simply follows the Manager-Managed pattern otherwise known as the Observer-Observed pattern. In this case the scene manager would act as the scenes main controller, allowing things such as objects to be instantiated and scenes to be changed. The scene manager would also act as an event handler, managing any events from the game objects themselves. The scene itself is merely a container with a buffer to allow for game objects to be added and removed from a scene.
Ticking and rendering of the scene would also be done by the scene manager which in turn would have its tick and render routines called by the core game object like so.

```
Object Game:
     while Game is running
        Update world (GameData)
        Render world (RenderData)
     end while

Object Scene:
      For each GameObject in the List
            GameObject.tick Object (GameData)
            GameObject.render Object (RenderData)
            get events from GameObject
      End For
```

I was able to implement this structure with very few issues and initially I was able to get basic scenes. However, there was a major bug that occurred whenever a new scene was loaded which in a best-case scenario would cause the application to crash and in the worst-case scenario would cause the video driver in Windows to lock up, requiring a restart.

## Scene Managers in DirectX 12

This bug was relatively difficult to isolate since it wouldn’t occur in debug mode if any breakpoints were triggered. As a result, locating the bug was difficult and initially I started by checking various possible occurrences. I knew that this bug occurred whenever I changed scene, so the first step was to try clearing and updating objects in the main Game Class. I found that this resulted in the same exact issue indicating that there was something wrong with the game object data being cleared.

In response to this I decided to improve management of the scene data by containing it in its own class and improving the deallocation and reallocation of game objects before the start of the tick. I also added more error checks to the various portions of the render loop. However, this made no difference.
Perusing this further I also began to get assistance from some of my lecturers due to the complex nature of the bug. Alongside this I also began to test the code on other computers such as my home PC to see if the issue was driver specific. It was here I discovered that the DX12 Present() function was causing an exemption during the render loop.

![D3D12 Bug](https://n86-64.github.io/assets/img/blog/GEP/D3D12_bug.png)

This break also came with some debugging messages which was logged to Visual Studios Debugging log.

```
D3D12: Removing Device.

D3D12 ERROR: ID3D12Device::RemoveDevice: Device removal has been triggered for the following reason (DXGI_ERROR_DEVICE_HUNG: The Device took an unreasonable amount of time to execute its commands, or the hardware crashed/hung...[ EXECUTION ERROR #232: DEVICE_REMOVAL_PROCESS_AT_FAULT]

D3D12: **BREAK** enabled for the previous message, which was: [ ERROR EXECUTION #232: DEVICE_REMOVAL_PROCESS_AT_FAULT ]

```

After Reading these messages and further consulting my lecturers I was eventually able to work out that there was an issue with GPU scheduling. Issues such as this have become more prevalent with DirectX 12 because of the changes made to the API for multi-threading purposes.  Namely the idea of distributed state machines in the form of command buffers. Meaning any attempt to change the render state and draw without unlocking the GPU in-between these steps will cause problems when committing a draw call. Hence all that was needed was a “fence” routine to allow the GPU to finish any pending tasks before drawing. However, I wanted to be careful as excessive checking could dampen performance.

I attempted several fixes to this problem. The first was to use a scene change flag and call a function to fence the GPU after loading a new scene. However, this wasn’t effective, and I was still receiving the same issue. After this I attempted embedding the routine in the scene manager and calling it just after a scene is deallocated and the new scene is loaded. On the university production workstations this patch appeared to fix the problem however I found it to be ineffective on my home PC as well as third party PCs with the same exemption occurring.

Whilst this may have possibly been due to inconsistent DX12 driver versions, the inconsistency of the patch meant I had to look to an alternative solution that would be more viable. Hence, I decided to call the GPU fence check prior to calling the present function and doing so fixed the problem with little performance impact.  Allowing scenes to be changed at any time when needed.

At this point I was able to get scenes working with the next focus being how to manage interaction between the GameObjects and Scenes.
