// ignore_for_file: library_private_types_in_public_api, unused_local_variable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:folloiraq/boardingscreen.dart';
import 'package:folloiraq/webview.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? initScreen;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);

  runApp(const MaterialApp(
    home: MySplash(),
  ));
}

class MySplash extends StatefulWidget {
  const MySplash({super.key});

  @override
  _MySplashState createState() => _MySplashState();
}

class _MySplashState extends State<MySplash> {
  final Color kDarkBlueColor = const Color.fromARGB(255, 239, 196, 0);

  @override
  void initState() {
    super.initState();

    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            // Do what you want to do
            Future.delayed(const Duration(seconds: 10), () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scaffold(
                          body: initScreen == 0 || initScreen == null
                              ? const Boarding()
                              : const webscreen())));
            });
            break;
          case InternetConnectionStatus.disconnected:
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "لا يوجد اتصال بالانترنت",
                    style: GoogleFonts.notoKufiArabic(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.amber)),
                        onPressed: () {
                          MaterialPageRoute(builder: (context) => MySplash());
                        },
                        child: Text(
                          "إعادة المحاولة",
                          style: GoogleFonts.notoKufiArabic(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                  ],
                );
              },
            );

            break;
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Lottie.asset('assest/splash.json'),
      ]),
    );
  }
}
