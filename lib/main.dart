import 'package:firebase_auth/firebase_auth.dart';
import 'package:first/Home.dart';
import 'package:first/Welcomee/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ProFile/thems.dart';
import 'package:firebase_core/firebase_core.dart';

import 'QRGenerator.dart';

Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp
    (

    ChangeNotifierProvider
      (
      create: (BuildContext context) {},
      child: const MyApp
        (
      ),)
    ,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
          builder: (context, ThemeNotifier notifier, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: notifier.darkTheme ? dark : light,
              home: LoginPage(),
              // home: StreamBuilder<User?>(
              //   stream: FirebaseAuth.instance.authStateChanges(),
              //   builder: (context, snapshot) {
              //     return LoginPage();
              //     if(snapshot.hasData){
              //       return GeneratePage();
              //     }else
              //       {
              //         return LoginPage();
              //       }
              //   }
              // ),
            );
          }),
    );
  }
}
