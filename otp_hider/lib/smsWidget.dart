import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_sms_listener/flutter_sms_listener.dart';

class SmsListener extends StatefulWidget {
  @override
  _SmsListenerState createState() => _SmsListenerState();
}

class _SmsListenerState extends State<SmsListener> {
  String _latestMessage = '';

  @override
  void initState() {
    super.initState();
    FlutterSmsListener smsListener = FlutterSmsListener();
    smsListener.onSmsReceived!.listen((SmsMessage sms) {
      // Do something with sms message
      setState(() {
        _latestMessage = sms.body!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        _latestMessage,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}
