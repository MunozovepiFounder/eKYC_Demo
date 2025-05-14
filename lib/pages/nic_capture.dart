import 'package:ekyc_prototypes/pages/address.dart';
import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  final bool emailChanged;
  final bool mobileChanged;
  String? preferredBranch;

  ProgressScreen({
    required this.emailChanged,
    required this.mobileChanged,
    required this.preferredBranch,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liveliness Test')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Processing your data...', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            LinearProgressIndicator(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => AddressPage(
                          preferredBranch: preferredBranch,
                          emailChanged: emailChanged,
                          mobileChanged: mobileChanged,
                        ),
                  ),
                );
              },
              child: Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
