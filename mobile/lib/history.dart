import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  var testtext;
  var items = [];

  void rec() async {
    var url = Uri.parse('http://192.168.1.228:8000/history');
    http.Response response = await http.get(url);
    testtext = jsonDecode(response.body);
    items = [];
    for (var i = 0; i < testtext.length; i++) {
      setState(() {
        if (testtext[i]['type'] == 1) {
          items.add(testtext[i]['wordque']);
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    rec();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Row(
          children: [
            Image.asset(
              'asset/images/logo.png',
              scale: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'ภาษากระเหรี่ยงสำหรับกายภาพ',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.offAllNamed('/translate');
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 250, top: 10, bottom: 10),
            child: Text(
              'ประวัติการแปล',
              style: TextStyle(fontSize: 15),
            ),
          ),
          Flexible(
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.white,
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        items[index],
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
