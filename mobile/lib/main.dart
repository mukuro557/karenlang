// import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:mobile/Translate.dart';
import 'package:mobile/accident.dart';
import 'package:mobile/afterwakeup.dart';
import 'package:mobile/allday.dart';
import 'package:mobile/fine.dart';
import 'package:mobile/history.dart';
import 'package:mobile/home.dart';
import 'package:mobile/lesspain.dart';
import 'package:mobile/levelpain.dart';
import 'package:mobile/mostpain.dart';
import 'package:mobile/resultschoice.dart';
import 'package:mobile/resultschoice1.dart';
import 'package:mobile/smoke.dart';
import 'package:mobile/time.dart';
import 'package:mobile/timemonth.dart';
import 'package:mobile/translatechoice.dart';
import 'package:mobile/translatechoice2.dart';
import 'package:mobile/translatechoice3.dart';
import 'package:mobile/translatechoice4.dart';
import 'package:mobile/translatechoice5.dart';
import 'package:mobile/translatechoice7.dart';
import 'package:mobile/translatechoice8.dart';
import 'package:mobile/translatemutichoice.dart';
import 'package:mobile/wisky.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.teal,
    ),
    initialRoute: '/translate',
    getPages: [
      GetPage(name: '/home', page: () => Home()),
      GetPage(name: '/translate', page: () => Translate()),
      GetPage(name: '/resultschoice', page: () => Resultschoice()),
      GetPage(name: '/translatemutichoice', page: () => TranslateMutiChoice()),
      GetPage(name: '/levelpain', page: () => Levelpain()),
      GetPage(name: '/translatechoice', page: () => Translatechoice()),
      GetPage(name: '/time', page: () => Time()),
      GetPage(name: '/timemonth', page: () => Timemonth()),
      GetPage(name: '/resultschoice1', page: () => Resultschoice1()),
      GetPage(name: '/translatechoice2', page: () => translatechoice2()),
      GetPage(name: '/translatechoice3', page: () => Translatechoice3()),
      GetPage(name: '/translatechoice4', page: () => Translatechoice4()),
      GetPage(name: '/translatechoice5', page: () => translatechoice5()),
      GetPage(name: '/translatechoice6', page: () => translatechoice5()),
      GetPage(name: '/translatechoice7', page: () => translatechoice7()),
      GetPage(name: '/translatechoice8', page: () => translatechoice8()),
      GetPage(name: '/afterwakeup', page: () => Afterwakup()),
      GetPage(name: "/allday", page: () => Allday()),
      GetPage(name: "/accident", page: () => Accident()),
      GetPage(name: "/smoke", page: () => Smoke()),
      GetPage(name: "/wisky", page: () => Drink()),
      GetPage(name: "/history", page: () => History()),
      GetPage(name: "/fine", page: () => Fine()),
      GetPage(name: "/mostpain", page: () => Actmostpain()),
      GetPage(name: "/lesspain", page: () => Actlesspain()),
    ],
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Voice',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SpeechScreen(),
    );
  }
}

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  // main() async {
  //   // var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8000);
  //   try {
  //     var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8000);
  //     uri = server.address.host.toString();
  //     print(server.address.host);
  //   } catch (e) {
  //     print("Something went wrong while creating a server...");
  //   }
  // }

  late String uri;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Press the button and start speaking';
  String _sound = '';
  double _confidence = 1.0;
  var info;

  @override
  void initState() {
    super.initState();
    main();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        animate: _isListening,
        glowColor: Theme.of(context).primaryColor,
        endRadius: 75.0,
        duration: const Duration(milliseconds: 2000),
        repeatPauseDuration: const Duration(milliseconds: 100),
        repeat: true,
        child: FloatingActionButton(
          onPressed: _listen,
          child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Container(
          padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
          child: Column(
            children: [
              Text(_text),
              RaisedButton(
                onPressed: callpage,
                child: Text('ส่ง'),
              ),
              RaisedButton(
                onPressed: () {}, // playmp3
                child: Text('เล่น'),
              )
            ],
          ),
        ),
      ),
    );
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
        // Some UI or other code to select a locale from the list
        // resulting in an index, selectedLocale

        var selectedLocale = locales[115];
        _speech.listen(
          onResult: (val) => setState(() {
            _text = val.recognizedWords;

            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
          localeId: selectedLocale.localeId,
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  void callpage() async {
    // var url = Uri.parse();

    var url = Uri.parse('http://127.0.0.1:8000/cutkum/ขอบัตรประชาชนหน่อย');
    Map<String, String> headers = {
      "Content-type": "application/json",
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    http.Response response = await http.get(url);
    print(response.body);
    setState(() {
      _sound = response.body;
    });
  }

  void playmp3() async {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audioCache = new AudioCache();
    AudioPlayer advancedPlayer = new AudioPlayer();
    String localFilePath;
    // audioCache.play('Karen.mp3');
    int result = await audioPlayer
        .play('http://' + uri + '/:8000/static/sound/' + _sound);
  }
}
