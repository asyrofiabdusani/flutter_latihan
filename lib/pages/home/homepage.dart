import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as fetch;
import 'package:latihan_1/pages/home/components/dialog_detail_post.dart';
import 'package:latihan_1/pages/movie/components/dialog_detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List dataRow = [];
  List<DataRow> getPosts = [];

  List<DataRow> _createRows() {
    if (dataRow.isNotEmpty) {
      return getPosts;
    } else {
      return [
        const DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('19')),
          ],
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    double wScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(wScreen * 0.1, 40, wScreen * 0.1, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: FilledButton(
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(30, 10, 30, 10))),
                      onPressed: () async {
                        var res = await fetch.get(
                          Uri.parse(
                              'https://jsonplaceholder.typicode.com/posts'),
                        );
                        setState(() {
                          dataRow = jsonDecode(res.body);
                        });
                        for (var i = 0; i < dataRow.length; i++) {
                          getPosts.add(
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Text('${dataRow[i]['id']}')),
                                DataCell(Text('${dataRow[i]['title']}')),
                                DataCell(FilledButton(
                                    onPressed: () {
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            DialogDetailPost(
                                                id: dataRow[i]['id']),
                                      );
                                    },
                                    child: Text('details'))),
                              ],
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Post',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: FilledButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)))),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(30, 10, 30, 10))),
                      onPressed: () {},
                      child: const Text(
                        'To Do',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: FilledButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  side: BorderSide(color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)))),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.fromLTRB(30, 10, 30, 10))),
                      onPressed: () {},
                      child: const Text(
                        'Images',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  width: wScreen,
                  child: DataTable(
                    headingTextStyle:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'id',
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'title',
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'action',
                          ),
                        ),
                      ),
                    ],
                    rows: _createRows(),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
