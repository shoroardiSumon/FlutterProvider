import 'package:flutter/material.dart';
import 'package:flutterprovider/models/post_model.dart';
import 'package:flutterprovider/pages/post/post_provider.dart';
import 'package:flutterprovider/utils/custom_progress_indicator.dart';
import 'package:provider/provider.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  void initState() {
    super.initState();

    context.read<PostProvider>().fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Post List"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: postProvider.isLoading
                    ? loadingScreen()
                    : postProvider.error.isNotEmpty
                        ? errorScreen(postProvider.error)
                        : postBodyScreen(postProvider.allPosts)

              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loadingScreen() {
    return const Center(child: CustomProgressIndicator());
  }

  Widget errorScreen(String error) {
    return Center(
      child: Text(error),
    );
  }

  Widget postBodyScreen(List<PostModel> allPosts) {
    return ListView.builder(
      itemCount: allPosts.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: ListTile(
            leading: Text(allPosts[index].id.toString()),
            title: Text(allPosts[index].title),
          ),
        );
      },
    );
  }
}
