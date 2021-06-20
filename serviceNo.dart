import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quesies Website',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Services(title: 'الخدمات',),
    );
  }
}

class Services extends StatefulWidget {
  Services({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("الخدمات", style: TextStyle(
          fontSize: 30,
          color: Colors.black,
        )),
        centerTitle: true,
        leading:  IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Container(
        child: Column(
          children: [
            SizedBox(width: 1300, height: 150,),
            Text("رقم الخدمة", 
              style: (
                TextStyle(
                  color: Colors.black,
                  fontSize: 50,              
                )
              )
            ),

            SizedBox(height: 30,),

            Container(
              width: 300,
              height: 50,
              child: TextField(
                enableInteractiveSelection: false,
                textAlign: TextAlign.right,
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'ادخل رقم الخدمة',
                  alignLabelWithHint: true,
                ),
              ),
            ),

            SizedBox(height: 30,),

            Container(
              width: 300,
              height: 50,
              child: ElevatedButton(
                child: Text("دخول", style: TextStyle(
                ),),
                onPressed: (){}, 
              ),
            ),
          ],
        ),
      )
    );
  }
}
