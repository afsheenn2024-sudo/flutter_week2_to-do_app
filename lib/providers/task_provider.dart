import 'package:flutter/material.dart';
import '../services/storage_service.dart';

class TaskProvider extends ChangeNotifier {
  int _counter = 0;
  List<String> _tasks = [];

  int get counter => _counter;
  List<String> get tasks => List.unmodifiable(_tasks);
  TaskProvider() {
    loadData();
  }

  // Load saved data
  Future<void> loadData() async {
    _counter = await StorageService.getCounter();
    _tasks = await StorageService.getTasks();
    notifyListeners();
  }

  // Increase counter
  Future<void> increaseCounter() async {
    _counter++;
    await StorageService.saveCounter(_counter);
    notifyListeners();
  }

  // Decrease counter
  Future<void> decreaseCounter() async {
    if (_counter > 0) {
      _counter--;
      await StorageService.saveCounter(_counter);
      notifyListeners();
    }
  }

  // Add task
  Future<void> addTask(String task) async {
    if (task.trim().isEmpty) return;

    _tasks.add(task.trim());
    await StorageService.saveTasks(_tasks);
    notifyListeners();
  }
  //Delete task
  Future<void> deleteTask(int index) async {
    _tasks.removeAt(index);
    await StorageService.saveTasks(_tasks);
    notifyListeners();
  }
}