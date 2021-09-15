import 'package:flutter/material.dart';
import 'package:get/get.dart';

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 250, top: 10, bottom: 10),
                child: Text(
                  'ประวัติการแปล',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "กลางคืนเจ็บจนต้องตื่นมากินยาหรือทายาไหม",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "อาการที่มาหาหมอคืออะไร",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "อธิบายเหตุการณ์ว่าเกิดขึ้นได้อย่างไร",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "อธิบายเหตุการณ์ว่าเกิดขึ้นได้อย่างไร",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "หลังปวดรักษาอย่างไร",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "ตอนปวดทำอะไรอยู่",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "ตอนไหน",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "ระดับความเจ็บปวดตอนแรก",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "หลังตื่นแล้วมีอาการไหม",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "ตลอดทั้งวันเจ็บไหม",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
              ButtonTheme(
                minWidth: 360.0,
                height: 40.0,
                buttonColor: Colors.white,
                child: RaisedButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    "เคยเอ็กเรย์ไหม",
                    style: TextStyle(fontSize: 13, color: Colors.black),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
