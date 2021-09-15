import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:provider/provider.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:http/http.dart';
// import 'package:assets_audio_player/assets_audio_player.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
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
                      padding:
                          const EdgeInsets.only(left: 30, top: 10, right: 25),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        maxLines: maxLines,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'แตะเพื่อพิมพ์',
                            hintStyle: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 2),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                            backgroundColor: Colors.teal[600],
                            radius: 20,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: Icon(Icons.mic),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ),
                          Text(
                            'กดเพื่อพูด',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            width: 150,
                          ),
                          ButtonTheme(
                            minWidth: 20.0,
                            height: 30.0,
                            buttonColor: Colors.white,
                            child: RaisedButton(
                              onPressed: () {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                "แปลภาษา",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.teal[600]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 280, top: 10),
                child: Text(
                  'คำที่แนะนำ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Column(
                children: [
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "อาการที่มาหาหมอคืออะไร",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "กลางคืนเจ็บจนต้องตื่นมากินยาหรือทายาไหม",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "หลังปวดรักษาอย่างไร",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "ตอนไหน",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "หลังตื่นแล้วมีอาการไหม",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "กลางคืนเจ็บจนต้องตื่นมากินยาหรือทายาไหม",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "เคยเกิดอุบัติเหตุไหม",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        "สูบบุหรี่ไหม",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "ดื่มสุราไหม",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        "เริ่มปวดเมื่อไหร่",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "ขอบัตรประชาชนหน่อย",
                        style: TextStyle(fontSize: 13, color: Colors.white),
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
                        "ทำท่าที่อยู่แล้วสบายที่สุด",
                        style: TextStyle(fontSize: 13),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.teal[400],
                    child: RaisedButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "ทำท่าไหนปวดมากที่สุด",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
