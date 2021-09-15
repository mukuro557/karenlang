import 'package:flutter/material.dart';
import 'package:get/get.dart';

class translatechoice8 extends StatefulWidget {
  const translatechoice8({Key? key}) : super(key: key);

  @override
  _translatechoice8State createState() => _translatechoice8State();
}

class _translatechoice8State extends State<translatechoice8> {
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
        body: ListView(
          children: [
            Column(
              children: [
                Container(
                  width: 400,
                  height: 60,
                  decoration: BoxDecoration(border: Border.all(width: 0.1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text('อธิบายเหตุการณ์ว่าเกิดขึ้นได้อย่างไร'),
                      SizedBox(
                        width: 50,
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
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 370,
                    height: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/images/exercise.png',
                          fit: BoxFit.fitWidth,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                              ),
                              Text('เล่นกีฬา'),
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
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 370,
                    height: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/images/job.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 110,
                              ),
                              Text('ทำงานในสายอาชีพ'),
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
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 370,
                    height: 220,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        Image.asset(
                          'asset/images/stllhere.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 160,
                              ),
                              Text('อยู่เฉยๆ'),
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
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                width: 30,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ],
        ));
  }
}
