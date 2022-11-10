class ItemModel {
  String name;
  bool checked;

  ItemModel({required this.name, this.checked = false});

  void complete() {
    checked = !checked;
  }

  void edit(String val) {
    name = val;
  }
}
