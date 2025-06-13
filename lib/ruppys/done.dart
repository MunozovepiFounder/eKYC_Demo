import 'package:ekyc_prototypes/components/alerts.dart';
import 'package:ekyc_prototypes/components/buttons.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/layout.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ApplicationDone extends StatefulWidget {
  const ApplicationDone({super.key});

  @override
  State<ApplicationDone> createState() => _ApplicationDoneState();
}

class _ApplicationDoneState extends State<ApplicationDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ResponsiveContainer(
          headername: 'Rupy\'s Account Opening',
          child: Column(
            children: [
              SS56(),

              Container(child: Image.asset('assets/images/happy.png')),

              //image
              SS40(),
              Heading03(
                textAlign: TextAlign.center,
                text: 'Great news, application has been submitted',
              ),
              SS40(),
              AlertBox(
                alertHeading: 'Application submitted',
                alertText:
                    'Application id: GH7899 \n\nYour application is being processed, we will get back to you as soon as possible',
              ),

              SS64(),

              DGOutlinedButton(
                onTap: () async {
                  try {
                    if (await canLaunchUrl(
                      Uri.parse(
                        'https://www.figma.com/proto/b6OHIIdMt3TJNJhQAQcEhN/eKYC---Customer-Amendment?node-id=158-2375&t=CbfNjgZA6NkIZvK7-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=1%3A4&show-proto-sidebar=1',
                      ),
                    )) {
                      await launchUrl(
                        Uri.parse(
                          'https://www.figma.com/proto/b6OHIIdMt3TJNJhQAQcEhN/eKYC---Customer-Amendment?node-id=158-2375&t=CbfNjgZA6NkIZvK7-1&scaling=scale-down&content-scaling=fixed&page-id=0%3A1&starting-point-node-id=1%3A4&show-proto-sidebar=1',
                        ),
                      );
                    }
                  } catch (e) {
                    // Handle error or show a message
                    debugPrint('Could not launch URL: $e');
                  }
                },
                buttonText: 'Done',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
