class TodoModel {
  String title;
  bool isDone;

  TodoModel({required this.title, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}