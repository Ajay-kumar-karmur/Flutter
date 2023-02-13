import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/page2.dart';

class Page3 extends StatefulWidget {
  dynamic image;
  dynamic name;

  Page3({Key? key, this.image, this.name}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<Map> Users = [];

  void initUsers() {
    Map<String, dynamic> map = {};
    map["Name"] = 'Brunch Menu';
    map["Image"] = 'asset/image/pexels-julie-aagaard-1426715.jpg';
    Users.add(map);

    map = {};
    map["Name"] = 'Dinner Menu';
    map["Image"] = 'asset/image/pexels-chan-walrus-958545.jpg';
    Users.add(map);

    map = {};
    map["Name"] = 'BreakFast Menu';
    map["Image"] = 'asset/image/pexels-nicole-michalou-5779181.jpg';
    Users.add(map);

    map = {};
    map["Name"] = 'Snack & Tea';
    map["Image"] = 'asset/image/pexels-samer-daboul-1212809.jpg';
    Users.add(map);
  }

  @override
  void initState() {
    super.initState();
    initUsers();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image(
                        image: AssetImage(
                          widget.image.toString(),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 15,
                  left: 10,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(
                        MaterialPageRoute(
                          builder: (context) {
                            return Page2();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: Icon(Icons.arrow_back_ios_new,
                          color: Colors.black54, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Text(
                    widget.name.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 33,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Main Street 6A \n12:00-22:00',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 170,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: Users.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 170,
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
                            children: [
                              Container(
                                width: double.infinity,
                                height: 115,
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
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      Users[index]['Name'],
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Icon(Icons.arrow_forward_outlined)
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Book a Table',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 22),
                      ),
                    ),
                  ),

                  //
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
