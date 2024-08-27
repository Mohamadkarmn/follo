// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:folloiraq/webview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class Boarding extends StatelessWidget {
  final Color kDarkBlueColor = const Color.fromARGB(255, 239, 196, 0);

  const Boarding({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: "ابدأ الآن",
      finishButtonTextStyle: TextStyle(
          color: kDarkBlueColor,
          fontFamily: GoogleFonts.notoKufiArabic().fontFamily,
          fontSize: 16),
      onFinish: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const webscreen()),
        );
        SharedPreferences board = await SharedPreferences.getInstance();
        await board.setString('val', "b");
      },
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: kDarkBlueColor,
      ),
      skipTextButton: Text(
        'تخطي',
        style: GoogleFonts.notoKufiArabic(
          fontSize: 16,
          color: kDarkBlueColor,
          fontWeight: FontWeight.w600,
        ),
      ),
      controllerColor: kDarkBlueColor,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: const [Text(""), Text(""), Text("")],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assest/one.png',
                height: 300,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                """مرحبا بكم في فولو عراق\n شركة فولو عراق الموزع الرسمي للخدمات في الشرق الأوسط
              """,
                textAlign: TextAlign.center,
                style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assest/two.png',
                height: 300,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'احصل الان على ارخص الخدمات التواصل الاجتماعي بشكل فوري\n ، مع ضمان الجوده العاليه لتعزيز علامتكم التجارية',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assest/threee.png',
                height: 300,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                "نعمل بجهد لضمان نجاحكم ، ثقتكم هي اولوياتنا",
                textAlign: TextAlign.center,
                style: GoogleFonts.notoKufiArabic(
                  color: Colors.black,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                '',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black26,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
