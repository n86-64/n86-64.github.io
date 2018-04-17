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
thumb:
published: false
---

Development of the game has well and truly begun and has seen good progress over the last few days. Whilst there have been some difficulties with some aspects of the game, other aspects have been quite positive and have taken less time than I expected allowing us to devote more time to other aspects of the game.

<!--more-->

## Networking

Along with threading, networking was going to be in my view one of the most challenging elements to implement. Therefore the first task was to add networking support into the 'Sentire engine'. As part of the new project our lecturer provided an object that would allow us to implement networking into our game both on the client and the server.

This object of sort acted as a manager for Enet, a networking library which acts as a cross-platform interface for system networking sockets. Enet contains a relatively set of simple functions that allows us to setup a connection to a server and send data over the network. Hence using this as I base I implemented my networking model.

There were problems with the base components design such as over connection initialisation and connection settings as well as data processing. As stated this was only a basic template, not a complete system hence I added several features to it. Namely I turned it into a fully comprehensive manager where settings such as destination IP address could be configured and where connection status was now toggle-able. Hence it would allow for more refined control to support features such as lobbies.

With a basic interface created to send and receive packets now available, my next goal was to represent the data being sent across the network this was done via the packet class. The final implementation of the packet design did differ slightly from the original concept, but the

<!-- TODO - Finish the blogpost talking about the game-->
