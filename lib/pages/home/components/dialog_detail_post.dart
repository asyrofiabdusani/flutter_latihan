import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as fetch;

class DialogDetailPost extends StatelessWidget {
  DialogDetailPost({
    super.key,
    required this.id,
  });

  int id;

  @override
  Widget build(BuildContext context) {
    var post;

    Future getPost() async {
      try {
        var res = await fetch
            .get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${id}'));
        post = jsonDecode(res.body);
        print(id);
      } catch (e) {
        print(e);
      }
    }

    ;
    return AlertDialog(
        title: FutureBuilder(
      future: getPost(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text('Loading...');
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network('https://picsum.photos/id/237/400/600'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(bottom: 20),
                    width: 400,
                    child: Text(
                      '${post['title']}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    width: 400,
                    child: Text(
                      '${post['body']}',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  FilledButton(
                    onPressed: () {},
                    child: const Text(
                      'Back',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    ));
  }
}
