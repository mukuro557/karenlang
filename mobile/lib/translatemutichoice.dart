import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TranslateMutiChoice extends StatefulWidget {
  const TranslateMutiChoice({Key? key}) : super(key: key);

  @override
  _TranslateMutiChoiceState createState() => _TranslateMutiChoiceState();
}

class _TranslateMutiChoiceState extends State<TranslateMutiChoice> {
  var litems = [
    {'name': 'ปวดไหล่', 'image': 'asset/images/shoulder.png'},
    {'name': 'ปวดหลังด้านล่าง', 'image': 'asset/images/back.png'},
    {'name': 'ปวดเข่า', 'image': 'asset/images/knee.png'},
    {'name': 'ปวดสะโพกร้าวลงขา', 'image': 'asset/images/hip.png'},
    {'name': 'ปวดข้อศอก', 'image': 'asset/images/elbow.png'},
    {'name': 'ปวดท้อง', 'image': 'asset/images/abdomen.png'},
    {'name': 'ปวดหัว', 'image': 'asset/images/head.png'},
    {'name': 'ปวดคอ', 'image': 'asset/images/neck.png'},
    {'name': 'ปวดตา', 'image': 'asset/images/eye.png'},
    {'name': 'ตาพล่ามัว', 'image': 'asset/images/blurry.png'},
    {'name': 'ปวดมือ', 'image': 'asset/images/wrist.png'}
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                Text('อาการที่มาหาหมอคืออะไร'),
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
                    onPressed: () {},
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
                            Image.asset(
                              litems[index]['image']!,
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
                                  Text(litems[index]['name']!),
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
