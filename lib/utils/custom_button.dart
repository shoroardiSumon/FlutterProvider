import 'package:flutter/material.dart';
import 'package:flutterprovider/utils/apptheme/theme_provider.dart';
import 'package:provider/provider.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.watch<ThemeProvider>().isLightMode? Colors.blue : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Text(text, style: TextStyle(color: context.watch<ThemeProvider>().isLightMode? Colors.white : Colors.black),),
      ),
    );
  }
}
