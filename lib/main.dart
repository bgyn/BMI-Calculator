import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI CALCULATOR',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: myHomePage(),
    );
  }
}

class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  var wtTextController = TextEditingController();
  var ftTextController = TextEditingController();
  var inTextController = TextEditingController();
  var result = "";
  var bgColor = Colors.indigo.shade100;
  var msg = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
        centerTitle: true,
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: wtTextController,
                  decoration: InputDecoration(
                      label: Text("Enter your weight(kg)"),
                      prefixIcon: Icon(Icons.line_weight_outlined)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: ftTextController,
                  decoration: InputDecoration(
                    label: Text('Enter you height in feet(ft)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                TextField(
                  controller: inTextController,
                  decoration: InputDecoration(
                    label: Text('Enter you height in inch(in)'),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    
                    var wt = wtTextController.text.toString();
                    var ft = ftTextController.text.toString();
                    var inch = inTextController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {

                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tinch = (iFt * 12) + iInch;
                      var tcm = tinch * 2.54;
                      var tm = tcm / 100;

                      var bmi = iWt / (tm * tm);

                      if (bmi > 25) {
                        msg = "You are overweight";
                        bgColor = Colors.orange.shade200;
                      } else if (bmi < 10) {
                        msg = "You are underweight";
                        bgColor = Colors.red.shade200;
                      } else {
                        msg = "You're helthy";
                        bgColor = Colors.green.shade200;
                      }

                      setState(() {
                        result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill up all the fields";
                      });
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
