import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:flutter/material.dart';

class HeaderCustome extends StatelessWidget {
  const HeaderCustome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.white, // surface-default
        boxShadow: [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset('assets/images/logo.png', height: 40),
                const SizedBox(width: 16),
                Heading03(text: 'Customer Profile'),
              ],
            ),
            // Add more widgets to the right side of the header here
          ],
        ),
      ),
    );
    ;
  }
}
