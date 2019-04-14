---
layout: project
title:  "Kachiku64 Level Editor"
date: 2019-04-05
author: Nathan Butt et al
categories:
- University Project
- Editors and Tools
img: k64editthumb.png
thumb: k64editthumb.png
carousel:
- K64Edit/img1.PNG
- K64Edit/img2.PNG
- K64Edit/img3.PNG
- K64Edit/img4.PNG
tagged: Games Technology, Games, Group Project
client: University Project
website: N/A
published: true
---

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

### Details
- Platform - PC
- Engine - Unity
- Programming Language - C#
- Role - Create a Level editor
- Objective - Create level editing tools for use by the year.

### Introduction
As part of our Commercial Games Development module our cohort was tasked with continuing development of a Playwest title called Kachiku64. At the start of development our cohort was divided into teams where each one was tasked with a particular feature. In this case I was placed on the level editor team with the task of developing a level editor tools so the cohort could create levels for the game.

The level editor initially in an unusable state, so I along with the members of the team had to take the existing codebase and make it usable.

### Description
The level editor is a simple tile-based editor. Users are able to choose an entity which can range from a vehicle to a land/background tile, these can then be placed on one of several layers (depending on the object) which then determine the ordering of these entities.

The editor comes with a full suite of editing tools:
- Paint tool
- Pencil Tool
- Fill Tool
- Eraser Tool

Additional helper tools such as Undo, Redo, layer view and layer selection are included as standard.

The user is able to test the levels in the game directly via a level streaming system which allows levels to be opened in the main game when needed. The editor is fully configurable via a settings manager and includes an autosave recovery feature to prevent level progress being lost as well as a notification system to tell users when

### Role
I implemented several of the level editors new features:
- Level Streaming and new level loading system in the main game
- Autosave
- Notifications
- New saving and loading dialogs

Additionally, I added some user interface enhancements in the form of new buttons and adding button responsiveness.
