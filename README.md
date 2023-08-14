# Movie Characters App

White label movie characters app.

## Getting Started

First you need to select what app will use.
In order to select an application run 
        
    dart run movie_characters_app --app [applicationName].

Then you can run the application using the command
        
    flutter run

Example:

    dart run movie_characters_app --app wireviewer
    flutter run

For all available apps look in `apps/` directory.

## The Architecture

### Feature-first project structure

- lib
    - src
        - features
        - feature1
            - presentation
            - application
            - domain
            - data
        - feature2
            - presentation
            - application
            - domain
            - data

## Data Layer

Responsible for data retrieval like:

- API calls from a server
- Local database
- Repository implementations

### Parts

1. Repositories
    1. Includes the actual implementation of the repository in the domain layer
    2. Responsible to coordinate data from the different data sources
2. Data sources - consists of:
    1. Remote data sources
        1. HTTP calls
        2. UDP calls
    2. Local data sources
        1. Will cash our persist data
3. Models
    1. Representation of JSON structure
    2. Allows us to interact with our data sources
    3. Why not use the entities instead?
        1. Because, the domain layers must be independent. If we use entities instead of the model in the data layer we could change our database in the future or use XML instead of JSON and have to change the entity which is against the rule of clean architecture

## Domain Layer

It should be pure Dart (no flutter). Should only be concerned for the business logic of the application not of the implementation details.

### Parts

- Entities
    - Business objects of an application or a system
    - Must be our data types or classes that are used throughout the application OR in other words the entities are the objects that we can be returned to us or can be send to an API
- Repository Interfaces
    - Abstract classes or contracts that describe properties and methods that our project will need in specific feature
- Use Cases
    - Includes application specific business rules
    - Each event is an interaction of the user with the system and we can call this a use case like:
        - Sign up
        - Login
        - Register
    - Use cases are nothing but a bride between layers (a single call to business logic)

## Presentation Layer

Presents the app content and triggers events that modify the application state

### Parts

- state management
    - files related to state management like:
        - bloc
        - riverpod
- pages
    - App pages/screens
- widgets
    - All the specific widgets that we use on the pages

# Project folder structure

- config
    - Project specific configurations such as
        - Theme
        - Routes
- core
    - Anything that has to be shared between multiple features such as:
        - network
        - layers
        - util
        - use cases


Resources:
- https://codewithandrea.com/articles/flutter-project-structure/
- https://www.youtube.com/@flutterguys
- https://docs.flutter.dev/