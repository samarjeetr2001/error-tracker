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
