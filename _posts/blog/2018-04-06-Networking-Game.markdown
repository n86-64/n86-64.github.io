---
layout: post
title:  "Connection Carnage"
date:   2018-04-06 14:30:00
author: Nathan Butt
categories:
- Low Level Programming
- Games Programming
- C++
- Development Dairy
- Networking Game
img: network-thumb.jpg
thumb: network.png
published: true
---

In LLP we have now been tasked with our final assignment of the year. Just as fitting that it is also the most challenging assignment of the year. For this assignment we have been tasked with creating a turn-based game which can be played over a network. The game must possess multi-threading capabilities such as utilising multiple threads in network and input management. We will be required to produce a vertical slice or short-demo demonstrating some set of mechanics in the game.

<!--more-->

Like in the previous game we were allocated teams, whilst a good few sets of individuals were shuffled around I was put on the same team as the last game. Hence it didn't take long before we hit the ground running and started designing the various elements to our game.

## Game design

The first issue we as a team encountered was what game to make. Whilst our game only requires a turn based mechanic of some form, we had a choice as to what set of game mechanics we could base our game on, these games being Heroes of Might and Magic and XCOM. Whilst these games do share commonalities such as grid based gameplay, the games do have subtle differences such as the concept of 'fog of war' which obscures the player's view of the present map.

Whilst we considered this it wasn't at the forefront of our minds when deciding on the games mechanics. After a few minutes I suggested an idea based on XCOM's game mechanics which in the end we adopted.

### Project Horde

This is the placeholder name for this game and idea which is a turn-based strategy game based on the idea of wondering and rescuing civilians from zombie hordes. The game is inspired by an arcade game series called House of the Dead. In House of the Dead the goal is to wonder around streets shooting any zombies that get in your way before they attack you. Its a game series which has given me great pleasure over the years and based on these mechanics our team aims to create an experience that will be in the same vain.

<iframe width="560" height="315" src="https://www.youtube.com/embed/4zTujonaRfM?start=218" frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>

Our game is played in co-op over the network with each player selecting an initial survivor which they are provided with at the beginning of the game. These survivors then have to in a turn based manner navigate the game world and killing any zombies in order to achieve an objective of some form. In the case of this demo we are only going to require the player navigate a level to get to the end. Throughout the level the player is required to rescue survivors, these survivors will then join you and fight for your side. However if zombies get there hands on civilians then they are infected and will pose a threat to your squads. Hence the goal is to grow your squad as much as possible in order to kill the various zombies.

Whilst there are additional elements to the game that we are considering the core of the game resolves around scouring a terrain completing objectives using your team of civilians.

## Technical Design

As you can imagine are significantly more aspects we had to consider in this game.

### Networking

The first challenge for this system was to decide how we should approach networking. This is an area of the game that is primarily my responsibility and my goal was to ensure data of any type could be transferred over a network seamlessly and the streamed according to its type. These packets could then be processed by the client and the server accordingly. The packets would also provide information such as the username and IP address of the client for use on the server and visa versa.

![Scene Manager acts as an observer to the scene.](https://n86-64.github.io/assets/img/blog/LLP/network-packet.png)

These packets after being queued will then be polled on the main thread. Hence the clients state can then be updated quickly and efficiently whilst server data is collected in the background without having to wait for a response from the server. However as two threads could be accessing the data at the same time I intend to use a mutex to prevent the possibility of data racing\ memory RW order errors.

```
    packet_queue = new Queue of NetworkPacketObject

    On Network Thread:

          Every tick in Network Thread:
               Perform Mutex Check
               Poll Events for Network Client

          OnPacketRecieved():
              packet_queue.addObject(recieved_packet)

    OnMainThread:

            Every Update:
                if game.isConnected
                    Perform Mutex Check
                    convert and process all packets from packet_queue
```

In terms of networking architectures we had to decide whether to use peer to peer (P2P) or client-server. After considering the trade-offs of the two architectures we decided on using a client-server architecture. For us a client-server architecture is ideal as it ensures consistency in terms of the games simulation as well as flexibility allowing anyone to use the server software component to host there own server with a set of custom configurations if they so choose. The client-server also allows us to easily manage the game such as the ability to change missions on the fly for example.

### Main System

For this game our team is going to be utilising what I have dubbed the 'Sentire engine' built on top of the existing ASGE framework that we have been using. This refers to the set of objects and systems that my team originally wrote for the last assignment in LLP. Whilst we may have wrote these elements specifically for that game, the data driven approach I took with many of the components means that a good chunk of the code base can be reused without any issues. Hence many aspects such as the world manager and GameObject system will be reused with some additional modifications to correct any system issues that the game may have previously had, due to last minute system design etc.

Such a model is useful as it makes creating and adding new gameplay systems relatively fast and easy. This includes the extensions to the system which need to be made to allow for network communication.

## Current Progress

Currently, I have managed to finish planning the game and have made a start on the new networking system. Using the base system provided by my lecturer as a guide I have been able to successfully implement the packet and data transmission system. Whilst I am unable to read the contents of the packet queue, the data transmission works as expected and I am able to serialize data of a random nature into a packet allowing me to then stream the data out and in turn have the client and server behave according to the said command.

This was however a difficult process to a certain extent. The biggest issue was serializing the packet into a binary file whilst it was possible to cast the packet object as a enet_uint8* type this would result in issues. This was a result of pointers to members being send instead of the raw data itself. The result was that when quantities such as strings were passed through the data would not exist and attempts to access it would result in segmentation faults or other 'undefined' behaviours.  

My solution was to serialise the data with the metadata and data being serialised into a byte string quantity and then sent over the network. Then upon the data being received the packet would then be reassembled using the said bytestream. This in combination with error checking is a simple and flexible mechanism for sending all types of data over the network, as the data in the packet can be then streamed in and out to the appropriate classes as needed.

```
    Get Packet As Bytes ():
          DataSize = Size of all Members in Bytes
          File is Array Characters\Bytes of size DataSize

          File[0..(Size of Metadata)] = MetaData As Bytes
          File[(Size of MetaData)..DataSize] = Packet Data As Bytes
```

By the time of my next post I hope to have all of this sorted, putting me in a position to begin to implement the basic gameplay.
