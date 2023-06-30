import 'package:flutter/material.dart';

import 'repo/search_result_model.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key, required this.results});
  final List<SearchResult> results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('$index. ${results[index].title}'),
              ),
            );
          },
          itemCount: results.length,
        ),
      ),
    );
  }
}
