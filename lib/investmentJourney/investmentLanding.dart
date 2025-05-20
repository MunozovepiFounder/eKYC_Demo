import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/header.dart';
import 'package:ekyc_prototypes/components/input.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:flutter/material.dart';

class InvestmentJourney extends StatefulWidget {
  const InvestmentJourney({super.key});

  @override
  State<InvestmentJourney> createState() => _InvestmentJourneyState();
}

class _InvestmentJourneyState extends State<InvestmentJourney> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;

  void _validateInput() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    setState(() {
      isButtonEnabled = email.contains('@mcb.mu') && password == 'muno_123';
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateInput);
    _passwordController.addListener(_validateInput);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 1,
        child: Column(
          children: [
            InvestmentHeader(),

            SS64(),
            //
            Heading03(text: 'For testing purposes'),
            SS24(),
            Container(
              width: 400,
              child: Column(
                children: [
                  BodyRegular16(
                    textAlign: TextAlign.center,
                    text:
                        'Please note that this is a prototype for testing purposes.',
                  ),
                  SS32(),
                  CustomTextField(
                    labelText: 'Email address:',
                    controller: _emailController,
                    containerWidth: 400,
                    onChanged: (value) {},
                  ),

                  SS32(),
                  CustomTextField(
                    labelText: 'Password:',
                    controller: _passwordController,
                    containerWidth: 400,
                  ),

                  SS56(),

                  MPrimaryButton(
                    enabled: isButtonEnabled,
                    onTap: () {},
                    buttonText: 'Start Journey',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
