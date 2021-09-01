import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kPrimaryColor = Color(0XFFEEDB78);

const BoxDecoration backgroundImage = BoxDecoration(
    image: DecorationImage(
        image: AssetImage("assets/images/empty_screen.png"),
        fit: BoxFit.cover));

// const categoryStyle = TextStyle(fontSize: 36);
// const ButtonStyle = TextStyle(fontSize: 24);
const quote1 = "\"We can\'t help everyone, but everyone can help someone.\"";
const quote2 = "\"Charity makes no decrease in property.\"";
const quoteStyleItalic =
    TextStyle(fontSize: 18, color: Colors.black, fontStyle: FontStyle.italic);
const quoteStyle = TextStyle(fontSize: 18, color: Colors.black);

const double kDefaultPadding = 20.0;

final TextStyle buttonFontSansita =
    GoogleFonts.sansita(textStyle: TextStyle(fontSize: 24));
final TextStyle categoryFont =
    GoogleFonts.sansita(textStyle: TextStyle(fontSize: 36));

final TextStyle animatedFont =
    GoogleFonts.lobsterTwo(textStyle: TextStyle(fontSize: 28));
final TextStyle animatedFontOne =
    GoogleFonts.lobsterTwo(textStyle: TextStyle(fontSize: 30));
final TextStyle animatedFontTwo =
    GoogleFonts.pacifico(textStyle: TextStyle(fontSize: 30));


const kContentColorDarkTheme = Color(0xFFF5FCF9);
