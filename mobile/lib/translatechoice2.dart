import 'package:flutter/material.dart';
import 'package:get/get.dart';

class translatechoice2 extends StatefulWidget {
  const translatechoice2({Key? key}) : super(key: key);

  @override
  _translatechoice2State createState() => _translatechoice2State();
}

class _translatechoice2State extends State<translatechoice2> {
  final maxLines = 5;
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
              )),
        ],
        elevation: 0,
      ),
      body: Column(
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
                )
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
                      'กลางคืนเจ็บจนต้องตื่นมากินยาหรือทายาไหม',
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
                          style:
                              TextStyle(fontSize: 10, color: Colors.teal[600]),
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
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 350,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.teal[400],
                border: Border.all(color: Colors.teal),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 2,
                  ),
                  Icon(
                    Icons.check_circle_outline,
                    size: 100,
                    color: Colors.white,
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Text(
                    'เจ็บ',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 350,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.red[900],
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Icon(
                    Icons.cancel_outlined,
                    size: 100,
                    color: Colors.white,
                  ),
                  Spacer(
                    flex: 5,
                  ),
                  Text(
                    'ไม่เจ็บ',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Spacer(
                    flex: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
