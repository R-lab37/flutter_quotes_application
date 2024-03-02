import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './quotes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MainApp_States();
}

class _MainApp_States extends State<MainApp> {
  var quote = "";
  var author = "";

  setQuote() {
    var randomNumber = Random().nextInt(quote.length);
    setState(() {
      quote = quotes[randomNumber]["quote"]!;
      author = quotes[randomNumber]["author"]!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setQuote();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Quotes App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 3.0,
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            "Daily Quotes",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade100,
            ),
          ),
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    quote,
                    style: GoogleFonts.aladin(
                      color: Colors.grey.shade600,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    author,
                    style: GoogleFonts.cabin(
                      color: Colors.white70,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          elevation: 4,
          color: Colors.blueGrey.shade900,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 80,
              child: Column(
                children: [
                  Center(
                    child: TextButton(
                      onPressed: setQuote,
                      child: Image.asset(
                        'assets/shuffle.png',
                        width: 80,
                        height: 60,
                        fit: BoxFit.contain,
                      ),
                    ),
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
