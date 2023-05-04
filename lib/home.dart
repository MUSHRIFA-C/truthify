import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo1/login.dart';
import 'package:demo1/profile.dart';
import 'package:demo1/scanlogo.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key,  String? email}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController searchController=TextEditingController();
  int currentTab = 0;

  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return Scaffold(

        body: Stack(
          children: [
        Container(
        height: size.height * .45,
          decoration: BoxDecoration(
            color: Colors.purple,
          ),
        ),


        SafeArea(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 20,),
    Text("Hi\n WELCOME BACK !",style: TextStyle(fontWeight: FontWeight.w700,fontSize:20,color: Colors.white),),


    SizedBox(height: 40,),
    CarouselSlider(
    options: CarouselOptions(height: 180.0),
    items: ["images/img.png","images/img_1.png","images/img_5.png"].map((i) {
    return Builder(
    builder: (BuildContext context) {
    return Container(
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.symmetric(horizontal: 5.0),
    decoration: BoxDecoration(
    image: DecorationImage(image: AssetImage("$i"),fit: BoxFit.cover),

    ),

    );
    },
    );
    }).toList(),
    ),
    SizedBox(height: 50,),

    Expanded(
    child: GridView.count(
    crossAxisCount: 2,
    childAspectRatio: .85,
    crossAxisSpacing: 20,
    mainAxisSpacing: 20,
    children: [

    Container(
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(15),
    boxShadow: [
    BoxShadow(
    offset: Offset(0,17),
    blurRadius: 17,
    spreadRadius: -23
    )
    ]
    ),
    child: Material(
    color: Colors.transparent,
    child: InkWell(
    onTap: () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));
    },
    child: Column(
    children: [

    new Image.asset('images/img_3.png',
    height: 130,
    width: 200,
    alignment: Alignment.topCenter,
    ),
    Spacer(),
    Text('Profile',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

    ],
    ),
    ),
    ),
    ),

      Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0,17),
                  blurRadius: 17,
                  spreadRadius: -23
              )
            ]
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Scanlogo()));
            },
            child: Column(
                  children: [

                    new Image.asset('images/img_2.png',
                      height: 120,
                      width: 200,
                      alignment: Alignment.topCenter,
                    ),
                    SizedBox(height: 10,),
                    Text('Scan Logo',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                  ],

            )))),
      Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    offset: Offset(0,17),
                    blurRadius: 17,
                    spreadRadius: -23
                )
              ]
          ),
          child: Material(
              color: Colors.transparent,
              child: InkWell(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                  },
                  child: Column(
                    children: [

                      new Image.asset('images/img_6.png',
                        height: 100,
                        width: 200,
                        alignment: Alignment.topCenter,
                      ),
                      SizedBox(height: 10,),
                      Text('Logout',textAlign: TextAlign.center,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)

                    ],

                  ))))
    ],
            ),
          ),
        ] ),


        ),
        ),
        ] ),

       );

}
}