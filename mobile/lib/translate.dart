import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:get/get.dart';
import 'package:mobile/translatechoice.dart';
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  void jumppage() {
    if (myController.text == "หลังตื่นแล้วมีอาการไหม") {
      Get.offNamed('/translatechoice');
    } else if (myController.text == "อาการที่มาหาหมอคืออะไร") {
      Get.offAllNamed('/translatemutichoice');
    } else if (myController.text == "ระดับความเจ็บปวด") {
      Get.offAllNamed('/levelpain');
    } else if (myController.text == "เริ่มปวดเมื่อไหร่") {
      Get.offAllNamed('/time');
    } else if (myController.text == "ขอบัตรประชาชนหน่อย") {
      Get.offAllNamed('/resultschoice');
    } else if (myController.text == "อธิบายเหตุการณ์ว่าเกิดขึ้นได้อย่างไร") {
      Get.offAllNamed('/translatechoice8');
    } else if (myController.text == "กลางคืนเจ็บจนต้องตื่นมากินยาหรือทายาไหม") {
      Get.offAllNamed('/translatechoice2');
    } else if (myController.text == "เคยเอ็กเรย์ไหม") {
      Get.offAllNamed('/translatechoice3');
    } else if (myController.text == "หลังปวดรักษาอย่างไร") {
      Get.offAllNamed('/translatechoice3');
    } else if (myController.text == "ตอนปวดทำอะไรอยู่") {
      Get.offAllNamed('/translatechoice6');
    } else if (myController.text == "ทำท่าไหนปวดมากที่สุด") {
      Get.offAllNamed('/mostpain');
    } else if (myController.text == "ระดับความเจ็บปวดตอนแรก") {
      Get.offAllNamed('/levelpain');
    } else if (myController.text == "ตลอดทั้งวันเจ็บไหม") {
      Get.offAllNamed('/allday');
    } else if (myController.text == "เคยเกิดอุบัติเหตุไหม") {
      Get.offAllNamed('/accident');
    } else if (myController.text == "สูบบุหรี่ไหม") {
      Get.offAllNamed('/smoke');
    } else if (myController.text == "ดื่มสุราไหม") {
      Get.offAllNamed('/wisky');
    } else if (myController.text == "เริ่มปวดเมื่อไหร่") {
      Get.offAllNamed('/time');
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
        print(locales[110].localeId);

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
                        Get.offAllNamed('/translatemutichoice');
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
                        Get.offAllNamed('/translatechoice8');
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
                        Get.offAllNamed('/translatechoice2');
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
                        Get.offAllNamed('/translatechoice3');
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
                        Get.offAllNamed('/translatechoice4');
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
                        Get.offAllNamed('/translatechoice6');
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
                        Get.offAllNamed('/mostpain');
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
                        Get.offAllNamed('/levelpain');
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
                        Get.offNamed('/translatechoice');
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
                        Get.offAllNamed('/allday');
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
                        Get.offAllNamed('/accident');
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
                        Get.offAllNamed('/smoke');
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
                        Get.offAllNamed('/wisky');
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
                        Get.offAllNamed('/time');
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
                        Get.offAllNamed('/resultschoice');
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
                        Get.offAllNamed('/fine');
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
