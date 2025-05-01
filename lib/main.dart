import 'package:TeleCon/screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:zego_zimkit/zego_zimkit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  ZIMAppConfig appConfig = ZIMAppConfig();
  appConfig.appID = 1261518879;
  appConfig.appSign = '76a8d22d0d2faff6f24c5a8c88ce8b74e3b2653e7ad704463bc7005ab313dbe3';

  ZIM.create(appConfig);
  ZIMKit().init(
    appID: 1261518879, // your appid
    appSign:
    '76a8d22d0d2faff6f24c5a8c88ce8b74e3b2653e7ad704463bc7005ab313dbe3', // your appSign
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}




