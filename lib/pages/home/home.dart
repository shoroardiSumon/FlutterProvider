import 'package:flutter/material.dart';
import 'package:flutterprovider/pages/counter/counter.dart';
import 'package:flutterprovider/pages/post/post.dart';
import 'package:flutterprovider/pages/user/user.dart';
import 'package:flutterprovider/utils/apptheme/app_mode.dart';
import 'package:flutterprovider/utils/custom_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Home"),
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
              CustomButton(
                text: "Counter", 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Counter()),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButton(
                text: "User", 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const User()),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButton(
                text: "Post", 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Post()),
                  );
                },
              ),

              const SizedBox(
                height: 20,
              ),

              CustomButton(
                text: "Theme", 
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AppMode()),
                  );
                },
              )
                
            ],
          ),
        ),
      ),
    );
  }
}