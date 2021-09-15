import 'dart:io';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:mobile/Translate.dart';
import 'package:mobile/home.dart';
import 'package:mobile/resultschoice.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:http/http.dart' as http;
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/translate',
    getPages: [
      GetPage(name: '/home', page: () => Home()),
      GetPage(name: '/translate', page: () => Translate()),
      // GetPage(name: '/translatevoice', page: () => Translatevoice()),
      GetPage(name: '/resultschoice', page: () => Resultschoice()),
      // GetPage(name: '/history', page: () => History()),
      // GetPage(name: '/translatemutichoice', page: () => TranslateMutiChoice()),
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
  main() async {
    // var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 8000);
    try {
      var server = await HttpServer.bind(InternetAddress.loopbackIPv4, 8000);
      uri = server.address.host.toString();
      print(server.address.host);
    } catch (e) {
      print("Something went wrong while creating a server...");
    }
  }

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

    var url = Uri.parse('http://127.0.0.1:8000/cutkum/' + _text);
    Map<String, String> headers = {
      "Content-type": "application/json",
      'authorization': 'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
    };
    http.Response response = await http.get(url);

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
