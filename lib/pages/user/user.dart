import 'package:flutter/material.dart';
import 'package:flutterprovider/pages/user/user_provider.dart';
import 'package:flutterprovider/utils/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

  @override
  void initState() {
    super.initState();

    context.read<UserProvider>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: userProvider.allusers.isNotEmpty? ListView.builder(
                itemCount: userProvider.allusers.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: Text(userProvider.allusers[index].id.toString()),
                    title: Text(userProvider.allusers[index].name),
                    subtitle: Text(userProvider.allusers[index].email),
                  );
                },
              ): const CustomProgressIndicator(),
              ),
            ),
          ],
        )
      ),
    );
  }
}