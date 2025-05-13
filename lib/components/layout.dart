import 'dart:io';

import 'package:ekyc_prototypes/components/colors.dart';
import 'package:ekyc_prototypes/components/fonts.dart';
import 'package:ekyc_prototypes/components/header.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VS4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 4);
  }
}

class SS8 extends StatelessWidget {
  const SS8({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 8);
  }
}

class SS16 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 16);
  }
}

class SS24 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 24);
  }
}

class SS32 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 32);
  }
}

class SS40 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 40);
  }
}

class SS48 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 48);
  }
}

class SS56 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 56);
  }
}

class SS64 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 64);
  }
}

class SS72 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 72);
  }
}

class SS80 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 80);
  }
}

//page layout

class ResponsiveContainer extends StatelessWidget {
  final Widget child;

  const ResponsiveContainer({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth > 360 ? 400 : 320;

    return Center(
      child: Container(
        //color: Colors.amber,
        width: containerWidth,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [Header(), child]),
        ),
      ),
    );
  }
}

//the bullet points

class BulletPoints extends StatelessWidget {
  final String bulletText;
  final bool link;
  final String? linkText;

  BulletPoints({required this.bulletText, required this.link, this.linkText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double containerWidth = screenWidth > 360 ? 400 : 320;

    return Container(
      width: containerWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              width: 4, // Diameter of the circle
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black, // Background color
                shape: BoxShape.circle,
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 280,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyRegular14(text: bulletText, color: Colors.black),

                SizedBox(height: 2),
                link
                    ? Text(
                      linkText!,
                      style: GoogleFonts.lato(
                        fontSize: 14,
                        color: AppColors.statusBlue,
                        fontWeight: FontWeight.bold,
                        decoration:
                            TextDecoration
                                .underline, // <-- This adds the underline
                      ),
                    )
                    : SizedBox(height: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NullBox extends StatelessWidget {
  const NullBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 0);
  }
}

class MAccordion extends StatefulWidget {
  final String label;
  final List<Widget> children;

  const MAccordion({super.key, required this.label, required this.children});

  @override
  State<MAccordion> createState() => _MAccordionState();
}

class _MAccordionState extends State<MAccordion> {
  bool _isOpen = false;

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        shadows: [
          BoxShadow(
            color: Color(0x19000000),
            blurRadius: 8,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        children: [
          InkWell(
            onTap: _toggle,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BodyBold16(text: widget.label),

                  AnimatedRotation(
                    turns: _isOpen ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
            ),
          ),
          if (_isOpen) Column(children: widget.children),
        ],
      ),
    );
  }
}
