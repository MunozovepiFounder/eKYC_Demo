import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/option1/detailsPage.dart';
import 'package:ekyc_prototypes/pages/otp.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:flutter/material.dart';

class EmailOTPPage extends StatefulWidget {
  final bool emailChanged;
  final bool mobileChanged;
  final bool addressChanged;
  String? preferredBranch;

  EmailOTPPage({
    required this.emailChanged,
    required this.mobileChanged,
    required this.addressChanged,
    required this.preferredBranch,
  });
  @override
  _EmailOTPPageState createState() => _EmailOTPPageState();
}

class _EmailOTPPageState extends State<EmailOTPPage> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;
  int _secondsRemaining = 90;
  Timer? _timer;
  bool otpValid = false;

  @override
  void initState() {
    super.initState();
    _focusNodes = List.generate(5, (_) => FocusNode());
    _controllers = List.generate(5, (_) => TextEditingController());
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          _secondsRemaining--;
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controllers.forEach((controller) => controller.dispose());
    _focusNodes.forEach((node) => node.dispose());
    super.dispose();
  }

  String get otpCode =>
      _controllers.map((controller) => controller.text).join();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomerProfileStepper(
                  backButton: true,
                  step1Status: 'completed',
                  step2Status: 'completed',
                  step3Status: 'active',
                  step4Status: 'inactive',
                  activeLabel: 'Verification',
                ),

                SS32(),
                Image.asset(
                  'assets/verify/email.png',
                  width: 100, // optional
                  height: 100, // optional
                  fit: BoxFit.contain, // optional
                ),

                SS24(),
                Heading03(text: 'You have got mail'),
                SS16(),
                BodyBold14(
                  text:
                      'Please enter the 5-digit code sent the email address you provided.',
                  color: AppColors.labelGrey,
                ),

                SS40(),
                Text(
                  'Time remaining: $_secondsRemaining seconds',
                  style: TextStyle(fontSize: 16, color: Colors.red),
                ),
                SS24(),
                Container(
                  width: 298,
                  //color: Colors.amber,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(5, (index) {
                      return SizedBox(
                        width: 50,
                        child: TextField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          keyboardType: TextInputType.number,
                          maxLength: 1,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (value) {
                            if (value.length == 1 && index < 4) {
                              FocusScope.of(
                                context,
                              ).requestFocus(_focusNodes[index + 1]);
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(
                                context,
                              ).requestFocus(_focusNodes[index - 1]);
                            }

                            // Check if all 5 fields are filled
                            bool allFilled = _controllers.every(
                              (controller) => controller.text.length == 1,
                            );

                            setState(() {
                              otpValid =
                                  allFilled; // set true if all filled, false otherwise
                            });
                          },
                        ),
                      );
                    }),
                  ),
                ),
                SS16(),
                Container(
                  child: Row(
                    children: [
                      BodyRegular12(
                        text: 'Did not recieve OTP?',
                        color: AppColors.labelGrey,
                      ),
                      SizedBox(width: 2),
                      LinkButton(text: "Resend OTP"),
                    ],
                  ),
                ),
                SS56(),
                Container(
                  width: 298,
                  child: Column(
                    children: [
                      MPrimaryButton(
                        onTap: () {
                          if (otpValid) {
                            if (widget.mobileChanged) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => DefaultOTPPage(
                                        preferredBranch: widget.preferredBranch,
                                        addressChanged: widget.addressChanged,
                                        emailChanged: widget.emailChanged,
                                        mobileChanged: widget.mobileChanged,
                                      ),
                                ),
                              );
                            } else {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:
                                      (context) => Detailspage(
                                        preferredBranch: widget.preferredBranch,
                                        eKYCamendment: false,
                                        newStatus: true,
                                        addressChanged: widget.addressChanged,
                                      ),
                                ),
                              );
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Please provide a valid 5-digit OTP",
                                ),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                //backgroundColor: App,
                              ),
                            );
                          }
                        },
                        buttonText: 'Next',
                      ),
                      SS24(),

                      DGOutlinedButton(onTap: () {}, buttonText: 'Cancel'),
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
