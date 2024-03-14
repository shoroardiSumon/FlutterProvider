import 'package:flutter/material.dart';

import 'dart:ui' as ui;

class NetworkAlertBar extends StatelessWidget {
  const NetworkAlertBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        color: Colors.red.shade900,
        height: 50,
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            textDirection: ui.TextDirection.ltr,
            children: [
              Icon(
                Icons.error,
                color: Colors.white,
                textDirection: ui.TextDirection.ltr,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "No Internet connection!",
                textDirection: ui.TextDirection.ltr,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}