import 'package:flutter/material.dart';
import 'package:facebook_app_events/facebook_app_events.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FacebookAppEvents facebookAppEvents = FacebookAppEvents();

  String person = 'Vicky Patel';
  int count = 1;
  void logCartEvent() {
    facebookAppEvents.logEvent(
      name: 'AddToCart',
      parameters: {
        'value': '$person',
      },
    ).then((_) {
      print('Cart event logged successfully');
      Fluttertoast.showToast(
        msg: "sent the event time",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }).catchError((error) {
      print('Error logging cart event: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facebook Event'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: logCartEvent,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Add to Cart'),
              
            ),
            SizedBox(height: 10,),
             const Text('Event name - AddToCart',style: TextStyle(fontSize: 10),),
          ],
        ),
      ),
    );
  }
}
