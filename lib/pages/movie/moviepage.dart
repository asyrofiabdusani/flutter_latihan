import 'package:flutter/material.dart';
import 'package:latihan_1/pages/movie/components/card.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    double wScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Homepage'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(wScreen * 0.1, 40, wScreen * 0.1, 0),
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: wScreen * 0.2,
              child: const MovieCard(),
            ),
          ],
        ),
      ),
    );
  }
}
