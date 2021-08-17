import 'package:release_and_map/screens/page2.dart';
import 'package:release_and_map/utils.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool showPassword = true;

  void printincremntValue() {
    _counter++;
    print(_counter);
    setState(() {});
  }

  void showMyPassword() {
    showPassword = !showPassword;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///////////////////////////////////////////////
      ///App bar Section
      appBar: AppBar(
        title: Text("Page1"),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications),
          SizedBox(
            width: 10,
          ),
          Icon(Icons.logout)
        ],
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.language),
        ),
      ),
      ///////////////////////////////////////////////
      ///Body Section
      body: ListView(
        padding: EdgeInsets.only(top: 10),
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.network("https://via.placeholder.com/150"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              obscureText: showPassword,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
                color: Colors.red,
                child: Text("Press here"),
                onPressed: () {
                  pushPage(
                      context,
                      PageTwo(
                        counterFromPage1: _counter,
                      ));
                }),
          ),
          Center(
              child: Text(
            "$_counter",
            style: TextStyle(fontSize: 60, color: Colors.green),
          ))
        ],
      ),
      ///////////////////////////////////////////////
      // FAB Section
      // floatingActionButton: FloatingActionButton(
      //   onPressed: printincremntValue,
      //   child: Icon(Icons.add),
      // ),

      floatingActionButton: FloatingActionButton(
        onPressed: showMyPassword,
        child: Icon(Icons.visibility),
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("page1"),
//     ),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: <Widget>[
//           const TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Password',
//             ),
//           ),
//           Text(
//             'New string',
//           ),
//           Text(
//             '$_counter',
//             style: TextStyle(color: Colors.red, fontSize: 50),
//           ),
//           TextField(
//             obscureText: true,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(),
//               labelText: 'Password',
//             ),
//           )
//           // Image.network("https://via.placeholder.com/150"),
//           // Container(
//           //     width: 100, height: 100, child: Image.asset("assets/1.jpg"))
//         ],
//       ),
//     ),
//     floatingActionButton: FloatingActionButton(
//       onPressed: _incrementCounter,
//       child: Icon(Icons.add),
//     ),
//   );
// }
