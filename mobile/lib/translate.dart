import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:get/get.dart';
import 'package:mobile/translatechoice.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;

// import 'package:assets_audio_player/assets_audio_player.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  _TranslateState createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  final maxLines = 5;
  late String uri;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  bool _delete = false;
  String _text = 'Press mic button or type to tranlate';
  var info;
  final myController = TextEditingController();
  var question = '';
  var testtext;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  void jumppage() async {
    var url = Uri.parse('http://192.168.0.106:8000/getquestion/' + question);

    http.Response response = await http.get(url);
    if (response.body == 0) {
      Get.offAllNamed('/resultschoice');
    } else if (response.body == 1) {
      Get.offNamed('/translatechoice');
    } else if (response.body == 2) {
      Get.offAllNamed('/translatemutichoice');
    } else if (response.body == 3) {
      Get.offAllNamed('/levelpain');
    } else {
      setState(() {
        testtext = jsonDecode(response.body);
        print(testtext[0]);
      });
    }
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        var locales = await _speech.locales();
        print(locales[115].localeId);

        var selectedLocale = locales[115];
        _speech.listen(
          onResult: (val) => setState(() {
            myController.text = val.recognizedWords;
          }),
          localeId: selectedLocale.localeId,
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
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
            )
          ],
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                Get.offAllNamed('/history');
              },
            ),
          ),
        ],
        elevation: 0,
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation,
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
                width: 380,
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
                        controller: myController,
                        style: TextStyle(color: Colors.white),
                        maxLines: maxLines,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'แตะเพื่อพิมพ์',
                          hintStyle: TextStyle(color: Colors.white),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.only(bottom: 70),
                            child: IconButton(
                              onPressed: myController.clear,
                              icon: Icon(
                                Icons.close,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Icon(Icons.cancel),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: [
                          AvatarGlow(
                            animate: _isListening,
                            glowColor: Theme.of(context).primaryColor,
                            endRadius: 20.0,
                            duration: const Duration(milliseconds: 2000),
                            repeatPauseDuration:
                                const Duration(milliseconds: 100),
                            repeat: true,
                            child: FloatingActionButton(
                              onPressed: _listen,
                              child: Icon(
                                _isListening ? Icons.mic : Icons.mic_none,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
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
                              onPressed: () {
                                question = myController.text;
                                jumppage();
                                // print(myController);
                              },
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
                      onPressed: () {
                        question = "อาการที่มาหาหมอคืออะไร";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "อธิบายเหตุการณ์ว่าเกิดขึ้นได้อย่างไร";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "กลางคืนเจ็บจนต้องตื่นมากินยาหรือทายาไหม";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "เคยเอ็กเรย์ไหม";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "หลังปวดรักษาอย่างไร";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "ตอนปวดทำอะไรอยู่";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "ทำท่าไหนปวดมากที่สุด";
                        jumppage();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "ทำท่าไหนปวดมากที่สุด",
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 360.0,
                    height: 40.0,
                    buttonColor: Colors.white,
                    child: RaisedButton(
                      onPressed: () {
                        question = "ระดับความเจ็บปวดตอนแรก";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "หลังตื่นแล้วมีอาการไหม";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "ตลอดทั้งวันเจ็บไหม";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "เคยเกิดอุบัติเหตุไหม";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "สูบบุหรี่ไหม";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "ดื่มสุราไหม";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "เริ่มปวดเมื่อไหร่";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "ขอบัตรประชาชนหน่อย";
                        jumppage();
                      },
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
                      onPressed: () {
                        question = "ทำท่าที่อยู่แล้วสบายที่สุด";
                        jumppage();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "ทำท่าที่อยู่แล้วสบายที่สุด",
                        style: TextStyle(fontSize: 13),
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
