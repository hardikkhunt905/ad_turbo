import 'package:ad_turbo_example/Screen/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:ad_turbo/ad_turbo.dart';

void main() {
  adTurbo();
  runApp(const MyApp());
}

adTurbo() async{
  AdTurbo.init();
  await AdTurbo.adTurboTestDevice(testDeviceIds: "BC754A812958EE7FF20599662417762B");
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage()
    );
  }
}
