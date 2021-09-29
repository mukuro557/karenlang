import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;

class Resultschoice extends StatefulWidget {
  const Resultschoice({Key? key}) : super(key: key);

  @override
  _ResultschoiceState createState() => _ResultschoiceState();
}

class _ResultschoiceState extends State<Resultschoice> {
  final maxLines = 5;
  var question = "";
  var _sound;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getquestion();
  }

  void getquestion() {
    final box = GetStorage();
    question = box.read('question');
    _sound = box.read('sound');
    print(_sound);
  }

  void playmp3() async {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audioCache = new AudioCache();
    AudioPlayer advancedPlayer = new AudioPlayer();
    String localFilePath;
    // audioCache.play('Karen.mp3');
    int result =
        await audioPlayer.play('http://192.168.0.106:8000/static/sound/' + _sound);
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
              icon: const Icon(Icons.close),
              onPressed: () {
                Get.offAllNamed('/translate');
              },
            ),
          ),
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
                      question,
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
                        onPressed: () {
                          playmp3();
                        },
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
