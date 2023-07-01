# memento_design_pattern_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## 1. Research: Memento Design Pattern Flutter

- Keywords:
    - memento design pattern flutter
    - memento design pattern in flutter
    - behavioral design pattern
    - behavioral design pattern in flutter
    - memento design pattern
    - memento design pattern with example
- Video Title: Memento Design Pattern in Flutter | Behavioral Design Pattern in Flutter | Memento
  Design Pattern with Example

## 2. Research: Competitors

**Flutter Videos/Articles**

- 98K: https://youtu.be/jOnxYT8Iaoo
- https://medium.com/flutter-community/flutter-design-patterns-13-memento-b487769cf104
- https://scottt2.github.io/design-patterns-in-dart/memento/

**Android/Swift/React Videos**

- 1.1K: https://youtu.be/JS6H3Zo4_2I
- 7.5K: https://youtu.be/AReejnoyysk
- 9.4K: https://youtu.be/_Q5rXfGuyLQ
- 98K: https://youtu.be/jOnxYT8Iaoo
- 6.2K: https://youtu.be/YLxrlcoc69Y
- 11K: https://youtu.be/QPhSMIBfMjA
- 14K: https://youtu.be/wpkYAdPDO30
- https://www.tutorialspoint.com/design_pattern/memento_pattern.htm
- https://www.baeldung.com/java-memento-design-pattern
- https://www.geeksforgeeks.org/memento-design-pattern/
- https://refactoring.guru/design-patterns/memento
- https://refactoring.guru/design-patterns/memento/java/example
- https://www.javatpoint.com/memento-pattern
- https://www.techcrashcourse.com/2015/10/memento-design-pattern-in-java.html
- https://dzone.com/articles/memento-design-pattern-in-java
- https://incusdata.com/blog/design-patterns-memento-pattern
- https://www.learn-it-with-examples.com/development/java/java-design-patterns/java-memento.html
- https://refactoring.guru/design-patterns/memento/swift/example
- https://medium.com/@iam_saurav/memento-design-pattern-a94bafd0e081
- https://holyswift.app/memento-pattern-with-swiftui/
- http://www.coursegalaxy.com/design-patterns/memento-swift.html
- http://coursegalaxy.com/design-patterns/memento.html
- https://www.appcoda.com/design-pattern-behavorial/
- https://github.com/ochococo/Design-Patterns-In-Swift/blob/master/source/behavioral/memento.swift
- https://sourcemaking.com/design_patterns/memento
- https://www.geeksforgeeks.org/memento-design-pattern/

**Great Features**

- The memento pattern allows an object to be saved and restored. It has three parts: Originator,
  Memento, and Caretaker.

**Problems from Videos**

- NA

**Problems from Flutter Stackoverflow**

- https://stackoverflow.com/questions/65418536/memento-design-pattern-real-world-examples
- https://stackoverflow.com/questions/60847759/memento-pattern-and-violation-of-encapsulation
- https://stackoverflow.com/questions/58788115/what-does-without-violating-encapsulation-mean-in-memento-pattern

## 3. Video Structure

**Main Points / Purpose Of Lesson**

1. In this video lesson, you will learn how to use to capture and restore the internal state of an
   object without violating encapsulation. It provides a way to save and restore the state of an
   object, enabling undo/redo functionality or the ability to revert back to a previous state.
2. Main points:
    - The originator is the object to be saved or restored.
    - The memento represents a stored state.
    - The caretaker requests a save from the originator and receives a memento in response. The
      caretaker is responsible for persisting the memento and, later on, providing the memento back
      to the originator to restore the originator’s state.
3. The Memento pattern can be used in a variety of situations where you need to save and restore the
   state of an object. It is a useful pattern to know about if you are working on object-oriented
   software.

**The Structured Main Content**

# Memento Design Pattern

## Definition:

Memento, also known as Token, belongs to the category of behavioural design patterns.

_Without violating encapsulation, capture and externalize an object’s internal state so that the
object can be restored to this state later._

## Analysis:

![](memento_design_pattern.png)

**Memento** is an object that represents the saved state of the Originator. It provides a way to
store and retrieve the state of the Originator, without exposing the details of the state itself.

**Originator** is the object whose state we want to save and restore. It has an internal state that
can change over time.

**Caretaker** is responsible for managing the Mementos. It requests a Memento from the Originator
to save its state and can later use the Memento to restore the Originator's state if needed.

## Implementation:

In `main.dart` file:

1. Create a Memento class with `state` as type of String in default constructor and a getter for
   getting value of state. It represents a saved state of Originator.

```dart
class Memento {
  late final String _state;

  Memento(this._state);

  String getState() => _state;
}
```

2. Create Originator class. It is the object to be saved or restored.
    - `write()` method is used to write a new state of originator.
    - `save()` method is used to save the current state of originator.
    - `getText()` method is used to get the current state of originator.
    - `undo()` method is used to set the state which memento currently has.

```dart
class Originator {
  late String _state;

  void write(String newState) => _state = newState;

  Memento save() => Memento(_state);

  String getText() => _state;

  void undo(Memento memento) => _state = memento.getState();
}
```

3. Create Caretaker class. It is responsible for managing the Mementos. It requests a Memento from
   the Originator to save its state in list and can later use the Memento to restore the
   Originator's state if needed.

```dart
class Caretaker {
  final List<Memento> _mementos = [];

  void add(Memento memento) {
    _mementos.add(memento);
  }

  Memento undo() {
    return _mementos.removeLast();
  }
}
```

4. In `main()` method, I created `originator` object and `caretaker` object. I write some drafts
   using write() method, save their states using the save() method, and add the Mementos into the
   caretaker list caretaker.add() method.

We can then restore the originator's state to a previous point using the undo() method and observe
the changes in the output.

```dart
void main() {
  var originator = Originator();
  var caretaker = Caretaker();

  originator.write("First draft"); // Set initial state
  caretaker.add(originator.save()); // Save the state

  originator.write("Second draft"); // Modify state
  caretaker.add(originator.save()); // Save the state

  originator.write("Final draft"); // Modify state
  caretaker.add(originator.save()); // Save the state

  // Restore to previous state
  originator.undo(caretaker.undo());
  print(originator.getText()); // Output: Final draft

  // Restore to initial state
  originator.undo(caretaker.undo());
  print(originator.getText()); // Output: Second draft
  originator.undo(caretaker.undo());
  print(originator.getText()); // Output: First draft
}
```

The Memento pattern allows us to capture and restore the internal state of the Originator without
exposing its implementation details or violating encapsulation. It enables us to implement undo/redo
functionality or revert back to previous states of an object when needed.
