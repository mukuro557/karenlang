import 'package:flutter/material.dart';

import 'dart:async';

import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int loading_page = 3;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer) {
      setState(() {
        loading_page--;
        if (loading_page == 0) {
          Get.offNamed('/translate');
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 480,
      height: 900,
      color: Colors.teal[600],
      child: Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/logo.png',
              fit: BoxFit.fitHeight,
              scale: 4.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'ภาษากระเหรี่ยงสำหรับกายภาพ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 55,
            ),
          ],
        ),
      ),
    ));
  }
}
