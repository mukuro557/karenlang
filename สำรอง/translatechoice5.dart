import 'package:flutter/material.dart';
import 'package:get/get.dart';

class translatechoice5 extends StatefulWidget {
  const translatechoice5({Key? key}) : super(key: key);

  @override
  _translatechoice5State createState() => _translatechoice5State();
}

class _translatechoice5State extends State<translatechoice5> {
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
                      Text('ตอนปวดทำอะไรอยู่'),
                      SizedBox(
                        width: 150,
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
                          'asset/images/walk.png',
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
                              Text('เดิน'),
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
                          'asset/images/work.png',
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
                              Text('ทำงาน'),
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
                          'asset/images/sleep.png',
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
                              Text('นอน'),
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
                          'asset/images/still.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 170,
                              ),
                              Text('นั่ง'),
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
                          'asset/images/still1.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                              ),
                              Text('นั่งหยองๆ'),
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
                          'asset/images/bent.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 170,
                              ),
                              Text('ก้ม'),
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
                          'asset/images/up.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                              ),
                              Text('ยกของ'),
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
                          'asset/images/stan.png',
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
                              Text('ยืนขึ้น'),
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
                          'asset/images/sleepground.png',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 150,
                              ),
                              Text('นอนราบ'),
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
              ],
            ),
          ],
        ));
  }
}
