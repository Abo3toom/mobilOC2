import 'dart:io';
import 'package:flutter/material.dart';
import 'package:stn_pap_sci/Page/game_page.dart';
import 'package:colours/colours.dart';

class menuPage extends StatelessWidget {
  MaterialColor backgroundColor = Colours.swatch('#589595');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80.0,
              ),
              const Text(
                'stone-paper-scissors',
                style: TextStyle(color: Colors.white, fontSize: 35.0),
              ),
              const SizedBox(
                height: 130.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(130, 65),
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => gamePage()));
                },
                child: const Text(
                  'Play',
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(130, 65),
                  primary: Colors.white,
                  side: const BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
                onPressed: () {
                  exit(0);
                },
                child: const Text(
                  'Exit',
                  style: TextStyle(
                    fontSize: 35.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
