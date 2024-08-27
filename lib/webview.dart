// ignore_for_file: must_be_immutable, camel_case_types, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:folloiraq/whatsapp.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

bool isLoading = true;

class webscreen extends StatefulWidget {
  const webscreen({super.key});

  @override
  State<webscreen> createState() => _webscreenState();
}

class _webscreenState extends State<webscreen> {
  launchURL(url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    //here
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..enableZoom(false)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {
            const Icon(
              Icons.abc_outlined,
              size: 120,
            );
          },
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) async {
            final Uri uri = Uri.parse(request.url);

            // Checks if the link starts with the WhatsApp pattern, here you can also check if it matches Telegram, Messenger, ...
            if (request.url.startsWith('api') ||
                request.url.startsWith('whatsapp') ||
                request.url.startsWith('https://api.whatsapp.com')) {
              // Launch in an external application, or browser if the app is not installed on the phone
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const whats()));
              //whats

              // Prevent the redirection to avoid displaying your "net::err_unknown_url_scheme" error
              // return NavigationDecision.navigate;
            }

            // For other links, allow the navigation

            return NavigationDecision.navigate;

            // if (request.url.startsWith('https://www.youtube.com/')) {
            //   return NavigationDecision.prevent;
            // }
            // return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://foloiq.com/'));
    Future<bool> _willPopCallback() async {
      WebViewController webViewController = controller;
      bool canNavigate = await webViewController.canGoBack();
      if (canNavigate) {
        webViewController.goBack();
        return false;
      } else {
        return true;
      }
    }

    return WillPopScope(
      onWillPop: () => _willPopCallback(),
      child: Scaffold(
          body: SafeArea(
              child: WebViewWidget(
        controller: controller,
      ))),
    );
  }
}
