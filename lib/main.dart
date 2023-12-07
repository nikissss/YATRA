import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'package:my_project/screens/bottom_bar.dart';
import 'package:my_project/utils/app_styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_2567db2f2f6944f791f9768fcabbf3a1',
      enabledDebugging: true,
      builder: (context,navkey){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData( 
        primaryColor: primary,
      ),
      home: const BottomBar(),
      navigatorKey: navkey,
      localizationsDelegates: const [
        KhaltiLocalizations.delegate
,      ],
    );
  },);
  }
}

