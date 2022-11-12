import 'package:flutter/material.dart';
import 'package:todo_yamm/model/ItemModel.dart';

class SwipSides extends StatelessWidget {
  final ItemModel item;
  final Widget child;
  final DismissDirectionCallback onDismissed;
  const SwipSides({
    required this.child,
    Key? key,
    required this.item,
    required this.onDismissed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(item),
      direction: DismissDirection.endToStart,
      // background: buildSwipeActionLeft(),
      background: buildSwipeActionRight(),
      onDismissed: onDismissed,
      child: child,
    );
  }
}
Widget buildSwipeActionLeft() => Container(
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color.fromARGB(74, 108, 108, 108),
        child: Icon(Icons.edit, color: Colors.white, size: 32),
      );

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        color: Color.fromARGB(138, 244, 67, 54),
        child: Icon(Icons.delete_forever, color: Colors.white, size: 32),
      );
