import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Timemonth extends StatefulWidget {
  const Timemonth({Key? key}) : super(key: key);

  @override
  _TimemonthState createState() => _TimemonthState();
}

class _TimemonthState extends State<Timemonth> {
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
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.settings),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: 480,
                height: 40,
                color: Colors.teal[400],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'ไทย',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Icon(
                      Icons.compare_arrows,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Text(
                      'กระเหรี่ยง',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: 390,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.teal[600],
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 20),
                      child: Container(
                        width: 350,
                        height: 100,
                        child: Text(
                          'เริ่มปวดเมื่อไหร่',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.volume_up),
                            color: Colors.teal[600],
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          width: 75,
                        ),
                        ButtonTheme(
                          minWidth: 20.0,
                          height: 30.0,
                          buttonColor: Colors.white,
                          child: RaisedButton(
                            onPressed: () {
                              Get.offAllNamed('/home');
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              "ย้อนกลับ",
                              style: TextStyle(
                                  fontSize: 10, color: Colors.teal[600]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 340,
                height: 970,
                decoration: BoxDecoration(
                  color: Colors.teal[400],
                  border: Border.all(color: Colors.teal),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(
                            flex: 4,
                          ),
                          Text(
                            'หลายเดือนที่แล้ว',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Spacer(),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 20,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(
                                Icons.volume_up,
                                size: 20,
                              ),
                              color: Colors.teal[600],
                              onPressed: () {},
                            ),
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '1',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'มกราคม',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '2',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'กุมภาพันธ์',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '3',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'มีนาคม',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '4',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'เมษายน',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '5',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'พฤษภาคม',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '6',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'มิถุนายน',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '7',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'กรกฏาคม',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '8',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'สิงหาคม',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '9',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'กันยายน',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '10',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'ตุลาคม',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 2,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '11',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'พฤศจิกายน',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.teal),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '12',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Text(
                                  'ธันวาคม',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Spacer(
              //       flex: 2,
              //     ),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         width: 130,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           color: Colors.teal[400],
              //           border: Border.all(color: Colors.teal),
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'วันนี้',
              //               style: TextStyle(color: Colors.white, fontSize: 20),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Spacer(),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         width: 130,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           color: Colors.teal[400],
              //           border: Border.all(color: Colors.teal),
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'เมื่อวาน',
              //               style: TextStyle(color: Colors.white, fontSize: 20),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Spacer(
              //       flex: 2,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Spacer(
              //       flex: 2,
              //     ),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         width: 130,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           color: Colors.teal[400],
              //           border: Border.all(color: Colors.teal),
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'ในสัปดาห์นี้',
              //               style: TextStyle(color: Colors.white, fontSize: 20),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Spacer(),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         width: 130,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           color: Colors.teal[400],
              //           border: Border.all(color: Colors.teal),
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'ในสัปดาห์ที่แล้ว',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 20,
              //               ),
              //               textAlign: TextAlign.center,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Spacer(
              //       flex: 2,
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Spacer(
              //       flex: 2,
              //     ),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         width: 130,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           color: Colors.teal[400],
              //           border: Border.all(color: Colors.teal),
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'เดือนที่แล้ว',
              //               style: TextStyle(color: Colors.white, fontSize: 20),
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Spacer(),
              //     InkWell(
              //       onTap: () {},
              //       child: Container(
              //         width: 130,
              //         height: 130,
              //         decoration: BoxDecoration(
              //           color: Colors.teal[400],
              //           border: Border.all(color: Colors.teal),
              //           borderRadius: BorderRadius.all(Radius.circular(10)),
              //         ),
              //         child: Column(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text(
              //               'หลายเดือนที่แล้ว',
              //               style: TextStyle(
              //                 color: Colors.white,
              //                 fontSize: 20,
              //               ),
              //               textAlign: TextAlign.center,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //     Spacer(
              //       flex: 2,
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
