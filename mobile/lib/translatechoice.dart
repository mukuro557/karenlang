import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;

class Translatechoice extends StatefulWidget {
  const Translatechoice({Key? key}) : super(key: key);

  @override
  _TranslatechoiceState createState() => _TranslatechoiceState();
}

class _TranslatechoiceState extends State<Translatechoice> {
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
    int result = await audioPlayer
        .play('http://192.168.0.106:8000/static/sound/' + _sound);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Get.offAllNamed('/translate');
                      },
                    ),
                  ],
                ),
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
                Column(
                  children: [
                    Container(
                      width: 390,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
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
                                style: TextStyle(
                                    color: Colors.teal[700], fontSize: 20),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.teal[700],
                                radius: 20,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: Icon(Icons.volume_up),
                                  color: Colors.white,
                                  onPressed: () {
                                    playmp3();
                                  },
                                ),
                              ),
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
                              'มี',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
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
                              'ไม่มี',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
