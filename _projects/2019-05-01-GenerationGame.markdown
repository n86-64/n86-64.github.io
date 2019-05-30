---
layout: project
title:  "The Generation Game - Deep Learning Game Generation."
date: 2019-05-01
author: Nathan Butt
categories:
- Machine Learning
- Tensorflow
- Unity
- Game Dev
img: tgg_thumb.png
thumb: tgg_thumb.png
carousel:
- tgg/c5.png
- tgg/c2.png
- tgg/c3.png
- tgg/c4.png
- tgg/c1.png
tagged: AI, Convolutional Neural Networks, Machine Learning, C#, Unity
client: University Project
website: N/A
published: true
---

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

### Get it Here:
<a href="/assets/documents/AT_Report_2.pdf">Research Report</a>

<!-- Place this tag where you want the button to render. -->
<a class="github-button" href="https://github.com/n86-64/GamesTechYear3-AT-Task2-NFlow/archive/master.zip" data-icon="octicon-cloud-download" data-size="large" aria-label="Download n86-64/CTP-T-racer on GitHub">Download Here</a>

<a class="github-button" href="https://github.com/n86-64/GamesTechYear3-AT-Task2-NFlow" data-size="large" aria-label="Download The Generation Game on GitHub">View Source on GitHub</a>

### Details
- Platform - PC
- Programming Language - C#
- Engines - Unity, Tensorflow (for AI)
- Role - Sole Developer
- Objective - Create a procedural game who's content is generated according to input images.

### Introduction
As part of my course I took a module called advanced technology where we were required to complete a set of projects based around advanced technologies used within or that may be used within games such as physics systems. For my second task, I chose to create a system which would generate a game according to an image which could either be captured by the game or loaded into the game with classification performed using a convolutional neural network (CNN) given its ability to pick out features from images and classify accordingly. The result of this is the generation game which implements these functions.

### Description
The generation game is a simple unity game which utilises a CNN classifier to classify images according to a set of labels provided using a text file. Labels are in turn grouped into feature categories which determine the various aspects of the game  such as the character that the player will have or the level that the game will take place in. One example of this is the character feature category where based on the image an appropriate character is chosen for the player. This is then used to setup a game environment which the player is then able to interact with.

Images can either be taken via webcam or imported from a file. These are then sent to the classifier resulting in an array of outputs corresponding to the classes specified within the game. These results are then presented to the player and if there happy with the result then they can go on to play the game. Classifications are performed via a separate python script which uses the Tensorflow API in order to perform predictions. These are outputted to stdout in the form of a string which is then parsed by the main game, resulting in the predictions.

The resulting games are simple 3D games with the chosen character and the gameplay level being determined via the image recognition system in the game.

More information on the system can be found in the enclosed research report.
