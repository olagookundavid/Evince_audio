
- [Evince Media App](#evince-media-app)
    - [Features](#features)
    - [Development Features](#development-features)
## Evince Media App

This App has a very simplistic UI that consumes the api endpoint at [link](https://media.abeti.xyz/api/v1/media-list), the data is returned as a scrollable list. 
#### Features
- Pull down to refresh
- Detail page
    - play audios
    - download and view audios locally
- Dynamic background that changes as the data is interacted with
- Search feature that filters the result


#### Development Features
- StateNotifier with RiverPod(MVVM Pattern)
- Dependency injection
- Seperation of concerns and clear abstraction
- Error Handling
- On-generate Named routes
- Well detailed widgets seperate