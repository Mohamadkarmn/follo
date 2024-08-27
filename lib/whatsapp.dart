// ignore_for_file: camel_case_types, no_leading_underscores_for_local_identifiers, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:folloiraq/webview.dart';
import 'package:url_launcher/url_launcher.dart';

class whats extends StatefulWidget {
  const whats({super.key});

  @override
  State<whats> createState() => _whatsState();
}

class _whatsState extends State<whats> {
  @override
  Widget build(BuildContext context) {
    _launchWhatsapp() async {
      var whatsapp = "+9647801118875";
      var whatsappAndroid = Uri.parse("whatsapp://send?phone=$whatsapp");
      if (await canLaunchUrl(whatsappAndroid)) {
        await launchUrl(whatsappAndroid);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const webscreen()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("You do not have Whatsapp")));
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const webscreen()));
      }
    }

    _launchWhatsapp();
    return Container(
      color: Colors.white,
    );
  }
}
