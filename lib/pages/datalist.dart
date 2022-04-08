import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app2/provider/testprovider.dart';

class DataList extends StatefulWidget {
  const DataList({Key? key}) : super(key: key);

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  @override
  void initState() {
    Provider.of<TestProvider>(context, listen: false).getData();
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
                          return Card(
                              child: ListTile(
                            title:
                                Text(provider.detail[index].title.toString()),
                            trailing:
                                Text(provider.detail[index].userid.toString()),
                            leading: Text(
                              provider.detail[index].id.toString(),
                            ),
                          ));
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(color: Colors.red),
                      ));
  }
}
