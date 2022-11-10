import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_yamm/screen/Home.dart';

import '../model/UserModel.dart';
import '../model/Users.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 109, 205),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Yamm ToDo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  )),
              Container(
                padding: const EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'User Name',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 17),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(horizontal: 5, vertical: 17),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: TextField(
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  controller: ConfpasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                  ),
                ),
              ),
              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 197, 6)),
                    child: const Text(
                      'SignUp',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    onPressed: () => verfiy(),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Have account?',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextButton(
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 197, 6)),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  )
                ],
              ),
            ],
          )),
    );
  }

  verfiy() {
    UserModel user = UserModel(
        username: nameController.text, password: passwordController.text);
    if (user.password == ConfpasswordController.text && user.password.isNotEmpty && user.username.isNotEmpty) {
      Users.add(user);
      Get.back();
    }
    // Get.offAll(Home());

    // Navigator.push(context, Home());
    // Navigator.pushAndRemoveUntil(
    //     context, MaterialPageRoute(builder: (context) => Home()), (r) => false);
    // if (Users.verifyUser(user)) {

    //   Navigator.pushReplacement(
    //     context,

    //     MaterialPageRoute(
    //       builder: (context) {
    //         return Scaffold(
    //           body: new Home(),
    //           backgroundColor: Color.fromARGB(255, 190, 109, 205),
    //         );
    //       },
    //     ),
    //   );
    // }
  }
}
