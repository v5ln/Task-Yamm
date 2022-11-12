// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/ItemList.dart';

class add_item extends StatefulWidget {
  @override
  State<add_item> createState() => _add_itemState();
}

class _add_itemState extends State<add_item> {
  late String newTaskTitle;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 255, 197, 6),
      onPressed: () => add(),
      child: Icon(
        Icons.add,
        size: 35,
        color: Color.fromARGB(255, 151, 11, 176),
      ),
    );
  }
    Future add() => showModalBottomSheet(
        isScrollControlled: true,
        isDismissible: true,
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: Container(
                    padding: EdgeInsets.all(30),
                    // color: Color.fromARGB(0, 255, 255, 255),
                    child: Column(
                      children: [
                        Text("Add New Item", style: TextStyle(fontSize: 20)),
                        TextField(
                          autofocus: true,
                          onChanged: (newText) {
                            newTaskTitle = newText;
                          },
                        ),
                        TextButton(
                            onPressed: () => {
                                  Provider.of<ItemList>(context, listen: false)
                                      .addTask(newTaskTitle),
                                  Navigator.of(context).pop(),
                                },
                            child: Text("Save"))
                      ],
                    )),
              ),
            ));
  }

