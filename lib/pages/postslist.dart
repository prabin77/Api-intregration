import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app2/provider/testprovider.dart';

class PostsLists extends StatefulWidget {
  const PostsLists({Key? key}) : super(key: key);

  @override
  State<PostsLists> createState() => _PostsListsState();
}

class _PostsListsState extends State<PostsLists> {
  @override
  void initState() {
    Provider.of<TestProvider>(context, listen: false).getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TestProvider>(context);
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: provider.loading
            ? const CircularProgressIndicator()
            : provider.error
                ? const Text('Error')
                : provider.detail.isNotEmpty
                    ? ListView.builder(
                        itemCount: provider.detail.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                child: ListTile(
                                  leading: Text(
                                      provider.postdetail[index].id.toString()),
                                  title: Text(provider.postdetail[index].title
                                      .toString()),
                                  trailing: Text(provider
                                      .postdetail[index].userid
                                      .toString()),
                                  subtitle: Text(provider.postdetail[index].body
                                      .toString()),
                                ),
                              ));
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ));
  }
}
