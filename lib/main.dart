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
