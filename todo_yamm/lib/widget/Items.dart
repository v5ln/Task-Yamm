// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_yamm/model/ItemList.dart';
import 'package:todo_yamm/model/ItemModel.dart';
import 'package:todo_yamm/widget/swip_sides.dart';

class Items extends StatefulWidget {
  Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  late TextEditingController editController;
  @override
  void initState() {
    super.initState;
    editController = TextEditingController();
  }

  @override
  void dispose() {
    editController.dispose();
    super.dispose;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: Consumer<ItemList>(
        builder: (context, Data, child) {
          return ListView.builder(
              itemCount: Data.ItemsData.length,
              itemBuilder: ((context, index) {
                return SwipSides(
                  item: Data.ItemsData[index],
                  onDismissed: (direction) =>
                      dismissItem(context, Data.ItemsData[index], direction),
                  child: GestureDetector(
                    onLongPress: () => setState(() {
                      editController.text =
                          Provider.of<ItemList>(context, listen: false)
                              .ItemsData[index]
                              .name;
                      edit_name(Provider.of<ItemList>(context, listen: false)
                          .ItemsData[index]);
                    }),
                    child: Container(
                        padding: const EdgeInsets.only(
                          top: 15,
                          bottom: 15,
                        ),
                        margin: EdgeInsets.only(bottom: 20),
                        height: 100,
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(231, 255, 255, 255),
                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(123, 127, 0, 149),
                                blurRadius: 10,
                                offset: Offset(0, 9), // Shadow position
                              ),
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(22))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Text(
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                  Data.ItemsData[index].name),
                            ),
                            Checkbox(
                              checkColor: Colors.white,
                              // fillColor: MaterialStateProperty.resolveWith(getColor),
                              activeColor: Colors.black,
                              value: Data.ItemsData[index].checked,
                              onChanged: (bool? value) {
                                Data.updateTask(Data.ItemsData[index]);
                              },
                            )
                          ],
                        )),
                  ),
                );
              }));
        },
      ),
    );
  }

  dismissItem(
      BuildContext context, ItemModel item, DismissDirection direction) {
    Provider.of<ItemList>(context, listen: false).deleteTask(item);
  }

  edit_name(ItemModel item) => showModalBottomSheet(
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
                      Text("Edit the name", style: TextStyle(fontSize: 20)),
                      TextField(
                        autofocus: true,
                        controller: editController,
                      ),
                      TextButton(
                          onPressed: () => {
                                Provider.of<ItemList>(context, listen: false)
                                    .editTask(item, editController.text),
                                Navigator.of(context).pop(),
                              },
                          child: Text("Save"))
                    ],
                  )),
            ),
          ));
}
