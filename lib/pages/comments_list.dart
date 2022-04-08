import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app2/provider/testprovider.dart';

class CommentsList extends StatefulWidget {
  const CommentsList({Key? key}) : super(key: key);

  @override
  State<CommentsList> createState() => _CommentsListState();
}

class _CommentsListState extends State<CommentsList> {
  @override
  void initState() {
    Provider.of<TestProvider>(context, listen: false).getComments();
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
                        itemCount: provider.commentdetails.length,
                        itemBuilder: (BuildContext context, int index) {
                          // return Card(
                          //     child: ListTile(
                          //   title: Text(
                          //       provider.commentdetails[index].name.toString()),
                          //   trailing: Text(provider.commentdetails[index].postid
                          //       .toString()),
                          //   leading: Text(
                          //     provider.commentdetails[index].id.toString(),
                          //   ),
                          // ));
                          return Card(
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 70,
                                  color: Colors.white,
                                  child: Center(
                                    child: Text(provider
                                        .commentdetails[index].id
                                        .toString()),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 250,
                                      child: Text(provider
                                          .commentdetails[index].name
                                          .toString()),
                                    ),
                                    Container(
                                      height: 30,
                                      width: 250,
                                      child: Text(provider
                                          .commentdetails[index].email
                                          .toString()),
                                    ),
                                    Container(
                                      height: 100,
                                      width: 250,
                                      child: Text(provider
                                          .commentdetails[index].body
                                          .toString()),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: 100,
                                  width: 40,
                                  child: Center(
                                    child: Text(provider
                                        .commentdetails[index].postid
                                        .toString()),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      ));
  }
}
