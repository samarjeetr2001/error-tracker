# Error Tracker

A Flutter plugin to handle unhandled exceptions.

## Getting Started

**How to install**

* Go to your project's `pubspec.yaml` file.
* Add `errortracker` plugin in your project dependencies.

  ```
  errortracker:
      git:
        url: https://github.com/samarjeetr2001/error-tracker.git
        ref: master

  ```
  
**How to use**

* Make sure you have added `errortracker` plugin in your application.
* Import `errortracker` plugin in the `main.dart` file of your project.
  `import'package:errortracker/errortracker.dart';`
* Now, initialize errortracker plugin in `main()`

```
  void main() {
    Errortracker.initialize(
      () => runApp(const MyApp()),
      url: 'https://example.com/error',
      onError: (error, stackTrace) {
       // add your code here to handle unhandled exceptions 
      },
    );
  }
  ```
  
 * here, `initialize()` of Errortracker class take three parameters
   1. callback: This is required paramter of type `void Function()`. Plugin will only catch unhandled exception passed to this parameter.
    In above code, we have passed `runapp` to `callback` parameter. Hence, we are able to catch all unhandled exception.
   2. url: This is also required parameter of type `String`. It the url where `errortracker` plugin will push post request when it catch unhandled exception.
   3. onError: This is optional parameter of type `Function(Object, StackTrace)`. Definition of this function is define by the you. This will do execute operations when unhandled exception comes.


**Example app - single digit calculator**

* This is simple calculator which calculate single operation of single digit operands.
* All the calculation is done in native via `methodchannel`.
* divide by zero is unhandle exception in this use case which is catch by `errortracker` and snackbar is show to the user.
* app screens -

  ![ss1](https://user-images.githubusercontent.com/61595281/182706351-cd641911-fac6-4332-acd9-2818b6c44189.jpeg)
   
  ![ss2](https://user-images.githubusercontent.com/61595281/182706363-98d04c8e-ff98-407d-84cf-a07c67828389.jpeg)
  
  ![ss3](https://user-images.githubusercontent.com/61595281/182706371-12d2ffd2-c29b-4ece-a338-1e93ddbf861e.jpeg)
  
  ![image](https://user-images.githubusercontent.com/61595281/182710738-7836079c-0453-4deb-b9dd-e5503ceca7d2.png)
