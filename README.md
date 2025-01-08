# Flutter-UsersGroupApp

App that allows to add users groups and users. Data is stored in local database.

1. Examples of used pacakges:
   - sqflite - to create database. Class `DatabaseServiceMain`
   - go_router - routing in the app. Class `AppRouter`
   - dio & retrofit - for networking. Classes `NetworkingServiceMain`, `ZipCodesNetworkServiceMain` and `ResponseFormatInterceptor` 
   - freezed - code generator for data classes
   - get_it - service locator - class `ServiceLocator` + `GetServices`
   - mobx & provider $ cubit - app state management
  
Additional notes:
1. App state management:
   - In the `main` branch MobX was used for managing app state.
   - In the `cubit_refactor` BLoC pattern (instead of MobX) was used to fetch data from API. Class `UsersCubit` -> `UserForm`. It was only used in that one place to show I know 
     how to use it.
   - App termination handled on iOS and Android to properly close database while exiting the app - see `AppDelegate.swift` and `MainActivity.kt` files and `_AppExitHandler` class.




