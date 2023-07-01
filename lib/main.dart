// class Memento {
//   String state = 'null';
//
//   Memento(String newState) {
//     state = newState;
//     print("[Memento] State \"$newState\" has been saved!");
//   }
//
//   String get getState {
//     print("[Memento] Providing saved state \"$state\"...");
//     return state;
//   }
// }
//
// class Originator {
//   String state = 'null';
//
//   // NOTE: This uses the state setter on init to get a handy print
//   Originator(String newState) {
//     getState = newState;
//   }
//
//   String get getState => state;
//   set getState(String newState) {
//     state = newState;
//     print("[Originator] Set state to $newState");
//   }
//
//   Memento saveToMemento() {
//     print("[Originator] Saving to memento...");
//     return Memento(getState);
//   }
//
//   void restoreFromMemento(Memento memento) {
//     print("[Originator] Restoring from memento...");
//     state = memento.getState;
//     print("[Originator] Restored to $getState.");
//   }
// }
//
// class CareTaker {
//   late Memento memento;
// }
//
// void main() {
//   var me = Originator("Returned from store");
//   me.getState = "Placing car keys down";
//
//   var locationOfKeys = me.saveToMemento();
//   var memory = CareTaker();
//   memory.memento = locationOfKeys;
//
//   me.getState = "Putting away groceries";
//   me.getState = "Noticed missing pickles";
//   me.getState = "Looking for car keys...";
//
//   me.restoreFromMemento(memory.memento);
//   me.getState = "Going back to store for pickles";
//
//   /*
//     [Originator] Set state to Returned from store
//     [Originator] Set state to Placing car keys down
//     [Originator] Saving to memento...
//     [Memento] State "Placing car keys down" has been saved!
//     [Originator] Set state to Putting away groceries
//     [Originator] Set state to Noticed missing pickles
//     [Originator] Set state to Looking for car keys...
//     [Originator] Restoring from memento...
//     [Memento] Providing saved state "Placing car keys down"...
//     [Originator] Restored to Placing car keys down.
//     [Originator] Set state to Going back to store for pickles
//   */
// }









// Memento class
class Memento {
  late final String _state;

  Memento(this._state);

  String getState() => _state;
}

// Originator class
class Originator {
  late String _state;

  void write(String newState) => _state = newState;

  Memento save() => Memento(_state);

  String getText() => _state;

  void undo(Memento memento) => _state = memento.getState();
}

// Caretaker class
class Caretaker {
  final List<Memento> _mementos = [];

  void add(Memento memento) {
    _mementos.add(memento);
  }

  Memento undo() {
    return _mementos.removeLast();
  }
}

// Usage example
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










// // Memento class
// class Memento {
//   String state;
//
//   Memento(this.state);
// }
//
// // Originator class
// class Originator {
//   late String state;
//
//   Memento createMemento() => Memento(state);
//
//   void restoreMemento(Memento memento) => state = memento.state;
// }
//
// // Caretaker class
// class Caretaker {
//   late List<Memento> mementos;
//
//   Caretaker(this.mementos);
//
//   void addMemento(Memento memento) => mementos.add(memento);
//
//   Memento getMemento(int index) => mementos[index];
// }
//
// // Usage example
// void main() {
//   final originator = Originator();
//   final caretaker = Caretaker([]);
//
//   originator.state = "State 1";
//   caretaker.addMemento(originator.createMemento());
//
//   originator.state = "State 2";
//   caretaker.addMemento(originator.createMemento());
//
//   originator.state = "State 3";
//
//   originator.restoreMemento(caretaker.getMemento(0));
//
//   print(originator.state); // Prints "State 1"
// }
