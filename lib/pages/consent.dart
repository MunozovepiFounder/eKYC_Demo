import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/pages/liveliness.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class ConsentScreen extends StatefulWidget {
  final bool addressChanged;
  final bool emailChanged;
  final bool mobileChanged;

  ConsentScreen({
    required this.addressChanged,
    required this.emailChanged,
    required this.mobileChanged,
  });

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
          builder:
              (context) => CameraPreviewScreen(
                step: 'selfie',
                addressChanged: widget.addressChanged,
                emailChanged: widget.emailChanged,
                mobileChanged: widget.mobileChanged,
              ),
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
      backgroundColor: Colors.white,
      // appBar: AppBar(title: Text('Liveliness Test')),
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomerProfileStepper(
                  backButton: false,
                  step1Status: 'completed',
                  step2Status: 'completed',
                  step3Status: 'active',
                  step4Status: 'inactive',
                  activeLabel: 'Verification',
                ),

                SS32(),
                Image.asset(
                  'assets/verify/IDP.png',
                  width: 260, // optional
                  //height: 100, // optional
                  fit: BoxFit.contain, // optional
                ),

                SS24(),

                Row(
                  children: [
                    Container(
                      width: 298,
                      child: Text(
                        'I consent to MCB and Jumio accessing my personal information, including biometric data, for security and user improvement purposes, as stated in the Jumio Privacy Notice.',
                      ),
                    ),
                    Checkbox(
                      value: _consentGiven,
                      onChanged: (value) {
                        setState(() {
                          _consentGiven = value ?? false;
                        });
                      },
                    ),
                  ],
                ),
                SS40(),

                Container(
                  width: 298,
                  child: Column(
                    children: [
                      MPrimaryButton(onTap: _onNext, buttonText: 'Start'),
                      SS24(),
                      DGOutlinedButton(onTap: () {}, buttonText: 'Cancel'),

                      SS24(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
