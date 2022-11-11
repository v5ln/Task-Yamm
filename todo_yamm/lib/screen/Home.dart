// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_yamm/widget/Items.dart';

import '../widget/add_item.dart';
import 'Location.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 109, 205),
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 20,
          right: 20,
          bottom: 80,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Yamm',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'ToDo',
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 197, 6),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                // const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => Get.to(Location()),
                  child: Icon(
                    Icons.location_pin,
                    size: 40,
                    color: Color.fromARGB(255, 255, 197, 6),
                  ),
                ),
              ],
            ),
            Items(),
            add_item(),
          ],
        ),
      ),
    );
  }
}
