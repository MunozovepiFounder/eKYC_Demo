import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/header.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:ekyc_prototypes/components/status.dart';
import 'package:ekyc_prototypes/investmentJourney/investmentLanding.dart';
import 'package:ekyc_prototypes/investmentJourney/otp.dart';
import 'package:ekyc_prototypes/option1/detailsPage.dart';
import 'package:ekyc_prototypes/option1/landing.dart';
import 'package:ekyc_prototypes/pages/address.dart';
import 'package:ekyc_prototypes/pages/consent.dart';
import 'package:ekyc_prototypes/pages/emailOTP.dart';
import 'package:ekyc_prototypes/ruppys/details.dart';
import 'package:ekyc_prototypes/ruppys/ruppyLanding.dart';
import 'package:ekyc_prototypes/ruppys/success.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryRed),
      ),
      home: RuppyLanding(),

      //Option1Landing(), //change back to the landing
    );
  }
}
