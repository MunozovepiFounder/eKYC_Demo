import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/input.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/ruppys/review.dart';
import 'package:flutter/material.dart';

class RuppyDetails extends StatefulWidget {
  const RuppyDetails({super.key});

  @override
  State<RuppyDetails> createState() => _RuppyDetailsState();
}

class _RuppyDetailsState extends State<RuppyDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          headername: 'Ruppy\'s Account Opening',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              SS56(),
              Row(
                children: [
                  Heading03(
                    textAlign: TextAlign.left,
                    text: 'Please provide your child\'s details',
                  ),
                ],
              ),

              SS24(),
              BodyRegular16(
                text:
                    'Please upload a copy or picture of your child\s birth certificate.',
              ),

              SS32(),

              UploadBox(containerWidth: 298, labelText: 'Birth certificate'),
              SS64(),
              MPrimaryButton(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ChildDetails()),
                  );
                },
                buttonText: 'Next',
              ),
              SS24(),
              DGOutlinedButton(onTap: () {}, buttonText: 'Cancel'),
            ],
          ),
        ),
      ),
    );
  }
}
