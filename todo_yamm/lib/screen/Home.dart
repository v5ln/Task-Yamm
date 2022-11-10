// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:todo_yamm/widget/Items.dart';

import '../widget/add_item.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(
                Icons.playlist_add_check,
                size: 40,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              const Text(
                'Yamm ToDo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Items(),
          add_item(),
        ],
      ),
    );
  }
}
