import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/pages/liveliness.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ConsentScreen extends StatefulWidget {
  @override
  _ConsentScreenState createState() => _ConsentScreenState();
}

class _ConsentScreenState extends State<ConsentScreen> {
  bool _consentGiven = false;

  void _onNext() {
    if (_consentGiven) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraPreviewScreen(step: 'selfie'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please provide your consent to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text('Liveliness Test')),
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You will be using this liveliness test to verify your identity.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _consentGiven,
                      onChanged: (value) {
                        setState(() {
                          _consentGiven = value ?? false;
                        });
                      },
                    ),
                    Text('I provide my consent.'),
                  ],
                ),
                SizedBox(height: 20),
                ElevatedButton(onPressed: _onNext, child: Text('Start')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
