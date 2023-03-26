import 'package:flutter/material.dart';

class DialogDetail extends StatelessWidget {
  const DialogDetail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
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
                  child: const Text(
                    'TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  width: 400,
                  child: const Text(
                    'TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: 20),
                  width: 400,
                  child: const Text(
                    'TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle TitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitleTitle',
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
      ),
    );
  }
}
