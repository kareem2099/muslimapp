import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class AllahNamesSearchDelegate extends SearchDelegate<String> {
  final List<String> allNames;
  List<String> searchHistory = [];
  final Function(String) filterCallback;

  AllahNamesSearchDelegate(
      {required this.allNames, required this.filterCallback});

  void loadSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    searchHistory = prefs.getStringList('searchHistory') ?? [];
  }

  void updateSearchHistory(String query) async {
    if (!searchHistory.contains(query)) {
      searchHistory.add(query);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setStringList('searchHistory', searchHistory);
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> searchResults = allNames
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index]),
          onTap: () {
            close(context, searchResults[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> suggestionList = allNames
        .where((name) => name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    final List<String> recentSearches = searchHistory
        .where((search) => search.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return ListView.builder(
      itemCount: query.isEmpty ? recentSearches.length : suggestionList.length,
      itemBuilder: (context, index) {
        final String suggestion =
            query.isEmpty ? recentSearches[index] : suggestionList[index];
        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;
            updateSearchHistory(suggestion); // Update search history
            showResults(context);
          },
        );
      },
    );
  }
}
