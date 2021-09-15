import 'dart:ui';

import 'package:flutter/material.dart';

class Levelpain extends StatefulWidget {
  const Levelpain({Key? key}) : super(key: key);

  @override
  _LevelpainState createState() => _LevelpainState();
}

class _LevelpainState extends State<Levelpain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Icon(Icons.close),
        ),
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 400,
                  height: 60,
                  decoration: BoxDecoration(border: Border.all(width: 0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('ระดับความเจ็บปวด'),
                      SizedBox(
                        width: 190,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.teal[600],
                        radius: 20,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.volume_up,
                            size: 15,
                          ),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.lightGreenAccent[400],
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji1.png'),
                            Text(
                              'ไม่ปวดเลย',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.lime[400],
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji2.png'),
                            Text(
                              'ปวดเล็กน้อย',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji3.png'),
                            Text(
                              'ปวดพอทนได้',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.yellow[600],
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji1.png'),
                            Text(
                              'ปวดพอประมาณ',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji2.png'),
                            Text(
                              'ปวดประมาณกลาง',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.yellow[800],
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji3.png'),
                            Text(
                              'ปวดค่อนข้างมาก ',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.amber[800],
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji1.png'),
                            Text(
                              'ปวดรุนแรง',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.yellow[900],
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji2.png'),
                            Text(
                              'ปวดมาก',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.amber[900],
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji3.png'),
                            Text(
                              'ปวดรุนแรงมาก',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Spacer(),
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.red[900],
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('asset/images/emoji2.png'),
                            Text(
                              'ปวดมากที่สุด',
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
