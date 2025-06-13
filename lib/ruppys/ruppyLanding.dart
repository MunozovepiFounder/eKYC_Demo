import 'package:ekyc_prototypes/components/alerts.dart';
import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/option1/detailsPage.dart';
import 'package:ekyc_prototypes/option1/landing.dart';
import 'package:flutter/material.dart';

class RuppyLanding extends StatelessWidget {
  const RuppyLanding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          headername: 'Rupys Account Opening',
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: 298,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SS40(),

                  Heading01(text: 'Open a Rupys Account'),
                  SS32(),

                  //the bullet points
                  BodyRegular14(
                    text:
                        'Simplify your application process, by applying with your Customer Profile',
                  ),

                  SS24(),
                  BodyBold16(
                    text: 'How to get started',
                    color: AppColors.labelGrey,
                  ),
                  SS16(),

                  BulletPoints(
                    link: false,
                    bulletText:
                        'Shorten and imply confirm or amend all of personal details first, and then you can proceed with your application.',
                    linkText: 'ww',
                  ),

                  SS72(),
                  //the continue button
                  MPrimaryButton(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Option1Landing(),
                        ),
                      );
                    },
                    buttonText: 'Apply with my Profile',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
