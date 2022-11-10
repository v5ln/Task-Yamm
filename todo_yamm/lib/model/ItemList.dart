import 'package:flutter/material.dart';

import 'ItemModel.dart';

class ItemList  extends ChangeNotifier {
  List<ItemModel> ItemsData = [
    ItemModel(name: 'Study Big Data',checked: false),
    ItemModel(name: 'Make the canva',checked: false),
    ItemModel(name: 'HW3',checked: false),
  ];

  void addTask(String newTaskTitle) {
    ItemsData.add(ItemModel(name: newTaskTitle, checked: false));
    notifyListeners();
  }

  void updateTask(ItemModel item) {
    item.complete();
    notifyListeners();
  }

  void editTask(ItemModel item, String value) {
    item.edit(value);
    notifyListeners();
  }

  void deleteTask(ItemModel item) {
    ItemsData.remove(item);
    notifyListeners();
  }
}
