---
layout: post
title:  "Smooth Strategy"
date:   2018-04-06 14:30:00
author: Nathan Butt
categories:
- Low Level Programming
- Games Programming
- C++
- Developer Dairy
- Networking Game
img: network-thumb.jpg
thumb: network.png
published: true
---

Development of the game has well and truly begun and has seen good progress over the last few days. Whilst there have been some difficulties with some aspects of the game, other aspects have been quite positive and have taken less time than I expected allowing us to devote more time to other aspects of the game.

<!--more-->

## Networking

Along with threading, networking was going to be in my view one of the most challenging elements to implement. Therefore the first task was to add networking support into the 'Sentire engine'. As part of the new project our lecturer provided an object that would allow us to implement networking into our game both on the client and the server.

This object of sort acted as a manager for Enet, a networking library which acts as a cross-platform interface for system networking sockets. Enet contains a relatively set of simple functions that allows us to setup a connection to a server and send data over the network. Hence using this as I base I implemented my networking model.

There were problems with the base components design such as over connection initialisation and connection settings as well as data processing. As stated this was only a basic template, not a complete system hence I added several features to it. Namely I created a fully comprehensive manager where settings such as destination IP address could be configured and where connection status was now toggle-able. Hence it would allow for more refined control to support features such as lobbies.

With a basic interface created to send and receive packets now available, my next goal was to represent the data being sent across the network this was done via the packet class. The final implementation of the packet design did differ slightly from the original concept, but the fundamental principle remained the same. That is it contained a basic header describing the packet type and source and then contained the data represented as a file. After retrieving a packet from a random source, the server and client proceed to queue the packets and then send the data on to there accompanying managers, where it is then processed in a specialised manner.

Such a system is quite useful as it allows all kind of data representations to be processed regardless of the files contents. This greatly simplified matters such as handshaking and messaging we could add custom behaviours based on the type of data received. Being simple and flexible allowed the implementation of these features to be relatively painless and I was able to setup the systems with little to no hassle.

## Scene Management

The previous game had featured a hardcoded scene system where the scene manager would load a scene that was hardcoded from a separate class. For this type of game this would be a problem as we could have a large selection of levels. Hence, a dynamic loading system was defiantly a must in this case. With this in mind I designed a system for loading .stremap or sentire map files. 'stremaps' were basically scene files that can be opened by the game and then loaded on screen. These files are JSON files with a custom JSON interpreter in order to extract the data from the files. Upon reading information from the files the said object is then created and added to a world. Once the object loading process has been completed the world is then loaded.

```
    Load World:
         for each JSONEntity in FILE:
              world.addObject from FILE
         end for
```

Such a system was very well put together. By having this type of object factory it allowed for levels and the such to be created simply from a file rather than being hardcoded. Hence all of the in game scenes could in essence be made in a matter of minutes. Whilst some form of routine would be needed to initialise every form of object which is a limitation, all that would be needed is an extra field and then it could be created dynamically at any time.



<!-- TODO - Finish the blogpost talking about the game-->
