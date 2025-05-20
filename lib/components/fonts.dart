import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Heading01 extends StatelessWidget {
  final String text;
  final Color color;

  Heading01({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class Heading02 extends StatelessWidget {
  final String text;
  final Color color;

  Heading02({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        color: color,
      ),
    );
  }
}

class Heading03 extends StatelessWidget {
  final String text;
  final Color color;

  Heading03({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class BodyRegular18 extends StatelessWidget {
  final String text;
  final Color color;

  BodyRegular18({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class BodyBold18 extends StatelessWidget {
  final String text;
  final Color color;

  BodyBold18({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class BodyRegular16 extends StatelessWidget {
  final String text;
  final Color color;
  TextAlign? textAlign;

  BodyRegular16({
    required this.text,
    this.color = Colors.black,
    this.textAlign, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class BodyBold16 extends StatelessWidget {
  final String text;
  final Color color;

  BodyBold16({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class BodyRegular14 extends StatelessWidget {
  final String text;
  final Color color;

  BodyRegular14({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class BodyBold14 extends StatelessWidget {
  final String text;
  final Color color;

  BodyBold14({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}

class BodyRegular12 extends StatelessWidget {
  final String text;
  final Color color;

  BodyRegular12({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: color,
      ),
    );
  }
}

class BodyBold12 extends StatelessWidget {
  final String text;
  final Color color;

  BodyBold12({
    required this.text,
    this.color = Colors.black, // Default color
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
