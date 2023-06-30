import 'dart:convert';
import 'dart:isolate';

import 'search_result_model.dart';

class SearchResultsParser {
  SearchResultsParser(this.encodedJson);
  final String encodedJson;

  Future<List<SearchResult>> parseInBackground() async {
    final p = ReceivePort();
    Isolate.spawn(_decodeAndParseJson, p.sendPort);
    return await p.first;
  }

  Future<void> _decodeAndParseJson(SendPort p) async {
    final jsonData = jsonDecode(encodedJson);
    final resultsJson = jsonData['results'] as List<dynamic>;
    final results =
        resultsJson.map((json) => SearchResult.fromJson(json)).toList();
    Isolate.exit(p, results);
  }
}
