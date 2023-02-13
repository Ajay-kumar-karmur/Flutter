import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/page3.dart';

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  List<Map> Users = [];

  void initUsers() {
    Map<String, dynamic> map = {};
    map["Name"] = 'Saint Germain';
    map["Image"] = 'asset/image/patrick-tomasso-GXXYkSwndP4-unsplash.jpg';
    map["Name1"] = 'Piizza';
    map["Image1"] = 'asset/image/download.jpg';

    Users.add(map);

    map = {};
    map["Name"] = 'Full Moon';
    map["Image"] = 'asset/image/pexels-rene-asmussen-1581384.jpg';
    map["Name1"] = 'Burger';
    map["Image1"] = 'asset/image/download (1).jpg';
    Users.add(map);

    map = {};
    map["Name"] = 'The Golden Era';
    map["Image"] = 'asset/image/alex-haney-CAhjZmVk5H4-unsplash.jpg';
    map["Name1"] = 'Vegan';
    map["Image1"] = 'asset/image/images.jpg';
    Users.add(map);

    map = {};
    map["Name"] = 'Blue Plates';
    map["Image"] = 'asset/image/pexels-adrienn-1537635.jpg';
    map["Name1"] = 'Desert';
    map["Image1"] = 'asset/image/images (1).jpg';
    Users.add(map);
  }

  @override
  void initState() {
    super.initState();
    initUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              color: Colors.blueAccent,
              height: 270,
            ),
            Container(
              margin: EdgeInsets.only(top: 100, left: 20),
              child: Text(
                "Discover places \nand Restaurants",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(35.0),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 205),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(),
                          hintText: 'Type location and restaurants',
                          suffixIcon: Icon(Icons.arrow_forward_outlined)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 330, left: 15),
              child: Text(
                "Near you",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 359, left: 15),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Users.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return Page3(
                                    image: Users[index]["Image"],
                                    name: Users[index]['Name'],
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            width: 180,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                      blurRadius: 5,
                                      offset: Offset(2, 2))
                                ]),
                            margin: EdgeInsets.only(right: 25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 130,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      Users[index]['Image'],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        Users[index]['Name'],
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        Users[index]['Name'],
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 600, left: 15, bottom: 15),
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 100,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: Users.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 70,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          // boxShadow: [
                          // BoxShadow(
                          //     color: Color.fromRGBO(0, 0, 0, 0.4),
                          //     blurRadius: 5,
                          //     offset: Offset(2, 2))
                          // ],
                        ),
                        margin: EdgeInsets.only(right: 15, left: 15),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 70,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  Users[index]['Image1'],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: 5,
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5, left: 5),
                                    child: Text(
                                      Users[index]['Name1'],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
