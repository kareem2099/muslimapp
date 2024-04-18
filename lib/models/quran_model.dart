import 'package:flutter/material.dart';
import 'package:animations/animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'quran_list.dart';
import 'search_delegates.dart';
import 'details_page.dart';

class QuranModel extends StatefulWidget {
  @override
  _QuranModelState createState() => _QuranModelState();
}

class _QuranModelState extends State<QuranModel> {
  bool isGridView = false;
  List<Surah> filteredSurahs = [];
  List<Surah> allSurahs = allsurahsDetails;

  @override
  void initState() {
    filteredSurahs = allsurahsDetails;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate('plural.surahs.appBarTitle'),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(isGridView ? Icons.list : Icons.grid_on),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final String? selectedSurah = await showSearch<String>(
                context: context,
                delegate: AllahNamesSearchDelegate(
                  allNames: allSurahs.map((surah) => surah.name).toList(),
                  filterCallback: (String query) {
                    if (query.isEmpty) {
                      return allSurahs;
                    }
                    return allSurahs
                        .where((surah) => surah.name
                            .toLowerCase()
                            .contains(query.toLowerCase()))
                        .toList();
                  },
                ),
              );
              if (selectedSurah != null) {
                setState(() {
                  filteredSurahs = allSurahs
                      .where((surah) => surah.name == selectedSurah)
                      .toList();
                });
              }
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              setState(() {
                filteredSurahs = allSurahs;
              });
            },
          ),
        ],
      ),
      body: isGridView ? buildGridView() : buildListView(),
    );
  }

  Widget buildGridView() {
    return AnimationLimiter(
      child: GridView.builder(
        padding: EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: filteredSurahs.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredGrid(
            position: index,
            duration: const Duration(milliseconds: 375),
            columnCount: 2,
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: buildGridItem(index),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildListView() {
    return AnimationLimiter(
      child: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: filteredSurahs.length,
        itemBuilder: (context, index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: buildListItem(index),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildGridItem(int index) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 500),
      openBuilder: (BuildContext context, VoidCallback _) {
        return DetailsPage(surah: filteredSurahs[index]);
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return GestureDetector(
          onTap: openContainer,
          child: Card(
            color: Colors.tealAccent,
            child: Center(
              child: Text(
                filteredSurahs[index].name,
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildListItem(int index) {
    return OpenContainer(
      transitionDuration: Duration(milliseconds: 500),
      openBuilder: (BuildContext context, VoidCallback _) {
        return DetailsPage(surah: filteredSurahs[index]);
      },
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return ListTile(
          title: GestureDetector(
            onTap: openContainer,
            child: Card(
              color: Colors.tealAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${translate('plural.quran.surah_name')}: ${filteredSurahs[index].name}',
                            style: TextStyle(
                                fontSize: 16.0, fontFamily: 'quranFont'),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${translate('plural.quran.number')}: ${filteredSurahs[index].number}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${translate('plural.quran.number_of_verses')}: ${filteredSurahs[index].numberOfVerses}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${translate('plural.quran.revelation_type')}: ${filteredSurahs[index].revelationType}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '${translate('plural.quran.revelation_type')}: ${filteredSurahs[index].revelationType}',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
