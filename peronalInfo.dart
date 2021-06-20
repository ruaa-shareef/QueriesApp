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
      home: personalInfo(title: 'المعلومات الشخصية',),
    );
  }
}

class personalInfo extends StatefulWidget {
  personalInfo({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _personalInfo createState() => _personalInfo();
}

class _personalInfo extends State<personalInfo>{
  late TextEditingController _controllerName;
  late TextEditingController _controllerService;

  @override
  void initState() {
    super.initState();
    _controllerName = TextEditingController();
    _controllerService = TextEditingController();
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("المعلومات الشخصية", style: TextStyle(
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
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            children: [
              SizedBox(height: 30,),
              TextField(
                enableInteractiveSelection: false,
                textAlign: TextAlign.right,
                controller: _controllerName,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'رؤى الشريف',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                enableInteractiveSelection: false,
                textAlign: TextAlign.right,
                controller: _controllerService,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'رقم الخدمة',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                enabled: false, 
                enableInteractiveSelection: false,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'رقم الهاتف',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                enabled: false, 
                enableInteractiveSelection: false,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'العنوان',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 30,),
              TextField(
                enabled: false, 
                enableInteractiveSelection: false,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'رقم الهوية',
                  alignLabelWithHint: true,
                ),
              ),
              SizedBox(height: 30,),
              Container(
                width: 300,
                height: 50,
                child: ElevatedButton(
                  child: Text("ارسال", style: TextStyle(
                  ),),
                  onPressed: (){}, 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}