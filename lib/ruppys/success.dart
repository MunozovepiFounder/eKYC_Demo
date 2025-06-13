import 'package:ekyc_prototypes/components/alerts.dart';
import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/ruppys/details.dart';
import 'package:flutter/material.dart';

class SuccessfulReview extends StatefulWidget {
  const SuccessfulReview({super.key});

  @override
  State<SuccessfulReview> createState() => _SuccessfulReviewState();
}

class _SuccessfulReviewState extends State<SuccessfulReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          child: Column(
            children: [
              SS40(),

              Container(child: Image.asset('assets/images/new.png')),

              //image
              SS40(),
              Heading03(
                textAlign: TextAlign.center,
                text:
                    'Great, now within a few minutes, complete your application',
              ),
              SS40(),
              SuccessBox(
                alertHeading: 'Successful profile update',
                alertText: 'Your profile has been successfully updated',
              ),

              SS64(),
              MPrimaryButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RuppyDetails()),
                  );
                },
                buttonText: 'Start application',
              ),
              SS24(),
              DGOutlinedButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => RuppyDetails()),
                  );
                },
                buttonText: 'Cancel',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
