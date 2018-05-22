---
layout: post
title:  "Smashing Core - Part 2"
date:   2018-03-20 14:30:00
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

With the basic scene control and infrastructure in place the goal now was to work out how to represent objects within the game. At the time of the last post, I was able to get a functional scene management structure with the scene-manager responsible for a scene object. Whilst a GameObject2D with basic functionality has been defined there are some limitations that are still present which could present challenges if not resolved. Hence my goal was to overcome these limitations via the utilisation of appropriate design patterns.

<!--more-->

# Extending game objects

In the first version of the engine that our team was presented with there did exist an implementation of a system for game objects. Game object behaviour was divided into two separate classes. A 2D game object and a 3D game object. Both of these classes had tick and render routines which were practically identical. With 3D objects containing additional behaviour to allow 3D transformations to be performed for any 3D objects such as cubes.

## The problem

With these being just ordinary game objects, the behaviour was notably limited and simply provided a framework for additional objects to be created following a similar pattern. This way similar objects could be pooled and collectively updated. Whilst this portion of the engines principles was sound, the initial implementation was seriously flawed. This is because additional objects were created from inheriting from the base GameObject. Hence an image object for example to provide rendering functionality would be created from inheriting from a GameObject and then implement its behaviour, which over a large codebase can result in illogical structures such as the one below where it essentially stays that a Physics2D object is an ImageGO2D.

![Initial Stricture](https://n86-64.github.io/assets/img/blog/GEP/problematic-inheritance.png)

This will inevitably result in unexpected behaviour which over time could require fixes which will have a greater potential of breaking the game engine. Whilst you could inherit from both ImageGO2D and Physics2D it would result in a diamond pattern which would be an even more problematic system to have to deal with. Hence I began to consider a more effective mechanism for adding additional functionalities to objects.

## The solution

To allow for specialisation of GameObjects whilst avoiding excessive inheritance I decided to utilise a commonly scene programming pattern known as the object-component model. This was a model I had used previously in other games that I had created as part of my course.

This model is commonly scene in many major game engines such as the Unity 3D and Unreal Engines. In these engines most behaviour is represented as a component which function in a very similar way to a game object in that it is subject to ticking and rendering calls except components specialise in performing single functions or behaviours. An Example of this would be a collider component which could then specify collision data for use in a physics system.

![Initial Stricture](https://n86-64.github.io/assets/img/blog/GEP/Scene-Manager-basic.png)

Components would be managed and stored within the game objects themselves via the use of a game component manager. This component is merely an interface for managing the storage and access of game components. It contains a set of functions to allow game components to be retrieved by either typename (via the utilisation of the C++ template system) or by a tag within the game component itself. A game object could be allowed to have any number of components they want and multiple versions of the same component would also be allowed.

As components each perform different sets of functionality, its inevitable that some components will need to be seen or registered with various other subsystems such as how the physics and collision system will need to know of the existence of the collider components to allow for collision calculations to be performed. Hence the creation of this search function allows either specific components to be located either for per-component access or registration with subsystems.

### Implementation

The implementation of these systems was a relatively simple process in terms of designing the algorithms. For storing game components I decided to utilise a dynamic storage template which would allow for fast retrieval of contents as well as resizing and dynamic addition and removal. In C++ these functions are performed by the vector template which I ended up utilising due to its ease of resizing and fast data retrieval which is essential for this system.

In terms of the vectors contents I decided the vector should represent a collection of unique_ptrs to game components. As game component instances are strongly coupled and all retrieval of them is merely for referencing purposes, it made sense to do it this way. Allowing for automatic de-allocation via the unique_ptr class rather than manual de-allocation as is seen in the original gameobject containers, in turn reducing the risk of any memory leaks occurring.

In terms of retrieving game components this would be done via the following routine, which if successful returns a pointer to the object instance.

```C++
  GetComponentByType<typename T>()
        Component* component <- Null Refrence

       For every Component C in GameComponentList
            if C.Type is T.Type
                component = C
            end if
       End For

       return component
  End Function
```

As you can see if a component is needed we simply perform a simple linear search of the components within the GameComponentManager and a similar method is also used when finding component instances via tag. However in the case of the need to retrieve a set of components the same algorithm is used except that we return an array of pointers instead of a single pointer.

Whilst the search algorithm could be better optimised it is fast and it allows any component an object may have to be retrieved easily and quickly with a syntax similar to Unity3D which is easy to remember and use.

```C++
      object_components.getComponentByType<ComponentGoesHere>()->memberFunctionIsCalledHere()
```

Whilst this may be an issue if an object is nullptr, this system does allow such checks to be performed which will help to prevent crashes and simplify the debugging process.

Such a system has also been beneficial in terms of allowing for flexible behaviour changes in game objects as well as allowing for easy random access.

## Implementation
All the functionalities for GameComponents within objects were wrapped up in the GameComponentManager class. The process was quite simple and introduced no major issues into the engine whilst allowing component functionality to now be implemented into all corresponding objects.

## Other Considerations
I did consider unifying consolidating the GameObject2D and GameObject3D into a single GameObject which specialisations in place for a 3D object. However this proved to be problematic to do header conflicts in the original project. The result was that building the project became impossible. Hence considering this I decided to defer the issue to a later date, whilst I will maintaining this separation I do plan on addressing this in the future. Therefore I attached the component mechanism to both these objects, ensuring functional parity.

## Next Steps
With this now implemented the basic foundation of the engines core structure is now complete and I can focus on implementing the engines functionalities.

<!-- TODO - Finish the blogpost talking about the game-->
