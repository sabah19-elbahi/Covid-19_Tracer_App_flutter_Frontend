import 'package:flutter/material.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

class _QrCodeState extends State<QrCode> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR CODE',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('QR CODE'),
        ),
        body: const Center(
          child: Text('QR CODE'),
        ),
      ),
    );
  }
}
