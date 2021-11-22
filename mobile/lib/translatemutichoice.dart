import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;

class TranslateMutiChoice extends StatefulWidget {
  const TranslateMutiChoice({Key? key}) : super(key: key);

  @override
  _TranslateMutiChoiceState createState() => _TranslateMutiChoiceState();
}

class _TranslateMutiChoiceState extends State<TranslateMutiChoice> {
  var litems = [];
  final maxLines = 5;
  var question = "";
  var _sound;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getquestion();
  }

  void getquestion() async {
    final box = GetStorage();
    question = box.read('question');
    var id = box.read('id').toString();
    print(id);
    var url = Uri.parse('http://192.168.0.34:8000/getanswer/' + id);
    http.Response response = await http.get(url);
    setState(() {
      litems = jsonDecode(response.body);
      
    });
  }

  void playmp3(song) async {
    AudioPlayer audioPlayer = AudioPlayer();
    AudioCache audioCache = new AudioCache();
    AudioPlayer advancedPlayer = new AudioPlayer();
    String localFilePath;
    // audioCache.play('Karen.mp3');
    int result = await audioPlayer
        .play('http://192.168.0.34:8000/static/sound/' + song);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.offAllNamed('/translate');
            },
          ),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(question),
                SizedBox(
                  width: 130,
                ),
                CircleAvatar(
                  backgroundColor: Colors.teal[600],
                  radius: 20,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(
                      Icons.volume_up,
                      size: 15,
                    ),
                    color: Colors.white,
                    onPressed: () {
                      final box = GetStorage();
                      _sound = box.read('sound');
                      playmp3(_sound);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return new Card(
                      child: Container(
                        width: 370,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey.shade300),
                          // borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          children: [
                            Image.network('http://192.168.0.34:8000/static/sound/' + litems[index][1]!),
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 150,
                                  ),
                                  Text(litems[index][0]!),
                                  Spacer(),
                                  CircleAvatar(
                                    backgroundColor: Colors.teal[600],
                                    radius: 15,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      icon: Icon(
                                        Icons.volume_up,
                                        size: 15,
                                      ),
                                      color: Colors.white,
                                      onPressed: () {
                                        playmp3(litems[index][2]!);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
