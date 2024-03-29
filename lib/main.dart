import 'package:flutter/material.dart';
import 'package:weather/screens/loading_screen.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main()async{
  await dotenv.load(fileName: 'lib/.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Sizer(
        builder: (context, orientation, deviceType){
          return MaterialApp(
              debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: LoadingScreen(),
          );
        },
    );
  }
}