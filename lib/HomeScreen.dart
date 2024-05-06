import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'imagecontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ImageController con = Get.put(ImageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(60),
          onTap: () {
            con.getImage();
          },
          child: Center(
            child: Obx(() {
              return CircleAvatar(
                  radius: 60,
                  backgroundImage: con.imagePath.isNotEmpty
                      ? FileImage(File(con.imagePath.toString()))
                      : null);
            }),
          ),
        )
      ],
    ));
  }
}
