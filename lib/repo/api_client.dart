import 'package:http/http.dart' as http;

import 'search_result_model.dart';
import 'search_result_parser.dart';

class APIClient {
  Future<List<SearchResult>> downloadAndParseJson() async {
    final response = await http
        .get(Uri.parse('https://codewithandrea.com/search/search.json'));
    if (response.statusCode == 200) {
      final parser = SearchResultsParser(response.body);
      return parser.parseInBackground();
    } else {
      throw Exception('Failed to load json');
    }
  }
}
