import 'package:flutter/material.dart';
import 'package:flutterprovider/utils/apptheme/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({super.key});

  @override
  State<CustomProgressIndicator> createState() => _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: context.watch<ThemeProvider>().isLightMode? Colors.indigo: Colors.white,
      ),
    );
  }
}