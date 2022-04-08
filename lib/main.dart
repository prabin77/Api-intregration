import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app2/pages/comments_list.dart';
import 'package:test_app2/pages/datalist.dart';
import 'package:test_app2/pages/postslist.dart';
import 'package:test_app2/provider/testprovider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TestProvider(),
    child: const MaterialApp(
      home: MyHomePage(),
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DataList()));
              },
              child: const Text("Albums")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostsLists()));
              },
              child: const Text("Posts")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CommentsList()));
              },
              child: const Text("Comments")),
          // ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(context,
          //           MaterialPageRoute(builder: (context) => const DataList()));
          //     },
          //     child: const Text("Photos")),
        ],
      ),
    );
  }
}
