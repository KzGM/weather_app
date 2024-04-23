import 'package:flutter/material.dart';

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return GridView.count(
    //   scrollDirection: Axis.vertical,
    //   crossAxisCount: 2,
    //   children: [
    //     Container(margin: const EdgeInsets.all(8), color: Colors.red[500]),
    //     Container(margin: const EdgeInsets.all(8), color: Colors.red[300]),
    //     Container(margin: const EdgeInsets.all(8), color: Colors.red[500]),
    //     Container(margin: const EdgeInsets.all(8), color: Colors.red[300]),
    //   ],
    // );
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, mainAxisSpacing: 3, crossAxisSpacing: 3),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            color: Colors.red,
            alignment: Alignment.center,
            child: Text(
              index.toString(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          );
        });
  }
}
