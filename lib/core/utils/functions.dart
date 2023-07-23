import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchBookPreview({
  context,
  required String? url}) async {
  if(url!=null) {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      launchUrl(uri);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Cant launch book url")));
    }
  }
}