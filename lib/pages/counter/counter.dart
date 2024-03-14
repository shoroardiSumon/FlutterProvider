import 'package:flutter/material.dart';
import 'package:flutterprovider/pages/counter/counter_provider.dart';
import 'package:provider/provider.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
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
              Text(context.watch<CounterProvider>().value.toString()),
              const SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      context.read<CounterProvider>().decrementCounter();
                    }, 
                    icon: const Icon(Icons.remove_circle)
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<CounterProvider>().incrementCounter();
                    }, 
                    icon: const Icon(Icons.add_circle_sharp)
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}