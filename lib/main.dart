import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: const MyPage(),
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("fa", "IR"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("fa", "IR") // OR Locale('ar', 'AE') OR Other RTL locales,
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  String dropdownValue = "السعودية,جدة";

  List <String> spinnerItems = [
    "السعودية,جدة",
    "لبنان,بيروت",
    "سوريا,دمشق",
    "تركيا,انقرة",
  ];

  List MyCars=[
    {"id": "1","name":"Audi","img":"assets/audi.png"},
    {"id": "2","name":"BMW","img":"assets/bmw.png"},
    {"id": "3","name":"Ferrari","img":"assets/car.png"},
    {"id": "4","name":"Hundai","img":"assets/hundai.png"},
    {"id": "5","name":"Mercedes","img":"assets/mercedes.png"},
    {"id": "6","name":"Volvo","img":"assets/volvo.png"},
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.asset("assets/logo.png",width: 60, height: 60,),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
            Icons.qr_code,
            color: Colors.blue,
            size: 35,
          ),
            onPressed: () {
            },
          ),
        ],
        leading: const Icon(
          Icons.clear_all,
          color: Colors.blue,
          size: 35,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    ElevatedButton(
                        onPressed: (){},
                        child: const Text("الرئيسية",style: TextStyle(color: Colors.black,),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black, backgroundColor: Colors.white,
                          elevation: 8,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                        textStyle: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text("السيارات",style: TextStyle(color: Colors.white,),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black, backgroundColor: Colors.blue,
                          elevation: 8,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text("العقار",style: TextStyle(color: Colors.black,),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black, backgroundColor: Colors.white,
                          elevation: 8,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: (){},
                      child: const Text("الهواتف",style: TextStyle(color: Colors.black,),),
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.black, backgroundColor: Colors.white,
                          elevation: 8,
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(8))),
                          textStyle: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 40,
              child: Center(
                child: DropdownButton(

                  // Initial Value
                  value: dropdownValue,

                  // Down Arrow Icon
                  icon: const Icon(Icons.keyboard_arrow_down),

                  // Array list of items
                  items: spinnerItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  // After selecting the desired option,it will
                  // change button value to selected value
                  onChanged: (String? data) {
                    setState(() {
                      dropdownValue = data!;
                    });
                  },
                ),
              ),
            ),

            SizedBox(
              width: double.infinity,
              height: 500,
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.all(5),
                      child: Card(
                          semanticContainer: true,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(MyCars[index]["img"]),
                                          fit: BoxFit.fill),
                                    ),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Center(
                                    child: Text(
                                      MyCars[index]["name"],
                                      style: const TextStyle(fontSize: 15.0, color: Colors.green, fontWeight: FontWeight.bold),
                                    ),
                                  )),
                              Container(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.person,size: 15,),
                                    const SizedBox(width: 3,),
                                    const Text("معرض سيارات",style: TextStyle(fontSize: 13),),
                                    const SizedBox(width: 12,),
                                    const Icon(Icons.lock_clock, size: 15,),
                                    const SizedBox(width: 3,),
                                    const Text("الأن",style: TextStyle(fontSize: 13),)
                                  ],
                                ),
                              )
                            ],
                          )),
                  );
                },
              ),
            ),

          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
              onPressed: (){},
              child: const Icon(Icons.add,color: Colors.white,size: 50,),
            ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            child: Container(
              height: 60,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  // button 1
                  IconButton(
                    icon: const Icon(Icons.home,
                      color: Colors.blue,
                      size: 30,
                    ),
                    onPressed: (){
                    },
                    splashColor: Colors.white,

                  ),

                  // button 2
                  IconButton(
                      icon: const Icon(Icons.heart_broken,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: (){
                      }),
                  const SizedBox.shrink(),

                  // button 3
                  IconButton(
                      icon: const Icon(Icons.notifications_active,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: (){
                      }),

                  // button 4
                  IconButton(
                      icon: const Icon(Icons.email,
                        color: Colors.grey,
                        size: 25,
                      ),
                      onPressed: (){
                      }),
                ],
              ),
            ),
          ),
    );
  }
}

