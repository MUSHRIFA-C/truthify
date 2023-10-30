import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo1/auth_controller.dart';
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

  List<String>images =[
    "images/img.png",
    "images/img_1.png",
    "images/img_5.png"
  ];

  TextEditingController searchController=TextEditingController();
  int currentTab = 0;

  Widget currentScreen = HomePage();
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;

    return Scaffold(

        body: SafeArea(
          child: Stack(
            children: [
              InkWell(
                onTap: (){
                  print(currentIndex);
                },
                child: CarouselSlider(
                  items: images.map(
                          (item) => Image.asset(
                        item,
                        fit: BoxFit.fitWidth,
                        width: 600,
                        height: size.height * .45,
                      )
                  ).toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                      scrollPhysics: const BouncingScrollPhysics(),
                      autoPlay: true,
                      aspectRatio: 1.5,
                      viewportFraction: 1,
                      onPageChanged: (index,reason){
                        setState(() {
                          currentIndex=index;
                        });
                      }
                  ),
                ),
              ),

          SafeArea(
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 100,),
   /* Text("Hi\n WELCOME BACK !",style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,color: Colors.black),),*/


    SizedBox(height: 30,),


    SizedBox(height: 160,),
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
                      AuthController.instance.logOut();
                       //Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
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
    ]
    ),
        ));



}
}