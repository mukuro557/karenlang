import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:get/get.dart';
import 'package:mobile/translatechoice.dart';
import 'package:http/http.dart' as http;
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
  final items = ['item1', 'item2', 'item3', 'item4', 'item5'];
  String? value;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _speech = stt.SpeechToText();
  }

  void jumppage() async {
    final box = GetStorage();
    var url = Uri.parse('http://192.168.0.106:8000/getquestion/' + question);

    http.Response response = await http.get(url);
    testtext = jsonDecode(response.body);
    var number = testtext[0][1];

    box.write('id', testtext[0][0]);
    box.write('question', question);

    if (number == 0) {
      box.write('sound', testtext[0][2]);
      Get.offAllNamed('/resultschoice');
    } else if (number == 1) {
      box.write('sound', testtext[0][2]);
      Get.offNamed('/translatechoice');
    } else if (number == 2) {
      box.write('sound', testtext[0][2]);
      Get.offAllNamed('/translatemutichoice');
    } else if (number == 3) {
      box.write('sound', testtext[0][2]);
      Get.offAllNamed('/levelpain');
    } else {
      setState(() {
        print(testtext[0][0]);
      });
    }
  }

  void showstatus() {}

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
        // floatingActionButtonLocation: FloatingActionButtonLocation,
        body: Stack(
      children: <Widget>[
        Container(
          // First child (child 1)
          width: 580,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.teal[400],
            border: Border.all(color: Colors.teal),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 160),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
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
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    SizedBox(
                      width: 160,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.history,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.offAllNamed('/history');
                      },
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  Container(
                    width: 380,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ไทย',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal[700]),
                        ),
                        SizedBox(
                          width: 70,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.teal[700],
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
                              color: Colors.teal[700]),
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
                      color: Colors.teal[700],
                      border: Border.all(color: Colors.teal),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 30, top: 10, right: 25),
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
                    padding: const EdgeInsets.only(top: 90),
                    child: Text(
                      'คำที่แนะนำ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.teal[700]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 380,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 1),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: value,
                        iconSize: 36,
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.teal[700],
                        ),
                        isExpanded: true,
                        items: items.map(buildMenuItem).toList(),
                        onChanged: (value) =>
                            setState(() => this.value = value),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            item,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.teal[700]),
          ),
        ),
      );
}
