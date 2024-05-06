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
              return ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CircleAvatar(
                  radius: 60,
                  child: con.imagePath.isNotEmpty
                      ? Image.file(File(con.imagePath.toString()))
                      : Image.network(
                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                ),
              );
            }),
          ),
        )
      ],
    ));
  }
}
