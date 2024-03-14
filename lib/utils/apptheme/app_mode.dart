import 'package:flutter/material.dart';
import 'package:flutterprovider/utils/apptheme/theme_provider.dart';
import 'package:provider/provider.dart';

class AppMode extends StatefulWidget {
  const AppMode({super.key});

  @override
  State<AppMode> createState() => _AppModeState();
}

class _AppModeState extends State<AppMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("App Mode"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Dark Mode'),
                    Switch(
                      value: !context.watch<ThemeProvider>().isLightMode,
                      onChanged: (value) {
                        context.read<ThemeProvider>().toggleTheme();
                      },
                      inactiveThumbColor: Colors.grey.shade900,
                      activeColor: Colors.grey.shade100,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text(context.watch<ThemeProvider>().modeText),
            ],
          ),
        ),
      ),
    );
  }
}