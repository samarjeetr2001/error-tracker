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
  
 * here, `initialize()` of Errortracker class take three parameters1. callback: This is required paramter of type `void Function()`. Plugin will only catch unhandled exception passed to this parameter.
   1. In above code, we have passed `runapp` to `callback` parameter. Hence, we are able to catch all unhandled exception.
   2. url: This is also required parameter of type `String`. It the url where `errortracker` plugin will push post request when it catch unhandled exception.
   3. onError: This is optional parameter of type `Function(Object, StackTrace)`. Definition of this function is define by the you. This will do execute operations when unhandled exception comes.
