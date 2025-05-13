import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/input.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/pages/otp.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  final bool emailChanged;
  final bool mobileChanged;

  AddressPage({required this.emailChanged, required this.mobileChanged});
  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? residentialStatus;
  bool? documentUploaded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SS32(),
                CustomerProfileStepper(
                  backButton: false,
                  step1Status: 'completed',
                  step2Status: 'completed',
                  step3Status: 'active',
                  step4Status: 'inactive',
                  activeLabel: 'Verification',
                ),

                SS32(),
                Heading03(text: 'We need to confirm your proof of address'),

                SS40(),

                CustomDropdown(
                  items: [
                    'Own',
                    'Name of spouse',
                    'Name of parents',
                    'Name of landlord',
                  ],
                  onChanged: (value) {
                    if (value == 'Own') {
                      setState(() {
                        residentialStatus = 'own';
                      });
                    } else if (value == 'Name of spouse') {
                      setState(() {
                        residentialStatus = 'spouse';
                      });
                    } else if (value == 'Name of parents') {
                      setState(() {
                        residentialStatus = 'parents';
                      });
                    } else if (value == 'Name of landlord') {
                      setState(() {
                        residentialStatus = 'landlord';
                      });
                    }
                  },
                  labelText: 'Whose name is on proof of address?',
                  containerWidth: 298,
                ),

                //the document upload
                (residentialStatus == 'own' ||
                        residentialStatus == 'parents' ||
                        residentialStatus == 'spouse' ||
                        residentialStatus == 'landlord')
                    ? Column(
                      children: [
                        SS24(),
                        UploadBox(
                          labelText: 'Please upload your birth certificate',
                          containerWidth: 298,
                          onFilePicked: (file) {
                            print("File picked: ${file.name}");
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                          onImageCaptured: (image) {
                            print("Image captured: ${image.path}");
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                        ),
                      ],
                    )
                    : NullBox(),

                (residentialStatus == 'parents')
                    ? Column(
                      children: [
                        SS24(),
                        UploadBox(
                          labelText: 'Please upload your birth certificate',
                          containerWidth: 298,
                          onFilePicked: (file) {
                            print("File picked: ${file.name}");
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                          onImageCaptured: (image) {
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                        ),
                      ],
                    )
                    : NullBox(),

                (residentialStatus == 'spouse')
                    ? Column(
                      children: [
                        SS24(),
                        UploadBox(
                          labelText: 'Please upload your marriage certificate',
                          containerWidth: 298,
                          onFilePicked: (file) {
                            print("File picked: ${file.name}");
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                          onImageCaptured: (image) {
                            print("Image captured: ${image.path}");
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                        ),
                      ],
                    )
                    : NullBox(),

                (residentialStatus == 'landlord')
                    ? Column(
                      children: [
                        SS24(),
                        UploadBox(
                          labelText: 'Please upload your rental agreement',
                          containerWidth: 298,
                          onFilePicked: (file) {
                            print("File picked: ${file.name}");
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                          onImageCaptured: (image) {
                            print("Image captured: ${image.path}");
                            setState(() {
                              documentUploaded = true;
                            });
                          },
                        ),
                      ],
                    )
                    : NullBox(),

                //the next button
                //the final buttons
                Container(
                  width: 298,
                  child: Column(
                    children: [
                      SS40(),
                      MPrimaryButton(
                        onTap: () {
                          // If none of the above are true, navigate to OTP page
                          if (documentUploaded == false) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Please upload documents"),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => DefaultOTPPage(
                                      addressChanged: true,
                                      emailChanged: widget.emailChanged,
                                      mobileChanged: widget.mobileChanged,
                                    ),
                              ),
                            );
                          }
                        },
                        buttonText: 'Next',
                      ),
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
