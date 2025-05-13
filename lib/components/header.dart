import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: 72, maxHeight: 72),
      child: Container(
        width: MediaQuery.of(context).size.width * 1,
        decoration: BoxDecoration(
          color: Colors.white /* surface-default */,
          boxShadow: [
            BoxShadow(
              color: Color(0x0F000000),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: double.infinity,
              // padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16,
                children: [
                  Container(height: 40, child: Stack()),
                  Row(
                    children: [
                      Image.asset('assets/images/logo.png'),
                      SizedBox(width: 16),
                      Heading03(text: 'Customer Profile'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
