import 'package:flutter/material.dart';
import 'allah_names_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'search_delegates.dart';
import 'package:flutter_translate/flutter_translate.dart';

class AllahNamesGrid extends StatefulWidget {
  const AllahNamesGrid({Key? key}) : super(key: key);

  @override
  _AllahNamesGridState createState() => _AllahNamesGridState();
}

class _AllahNamesGridState extends State<AllahNamesGrid> {
  int columnCount = 3;
  bool isHorizontal = true;
  bool isContainerVisible = false;
  String currentMeaning = '';
  TextEditingController searchController = TextEditingController();
  List<String> filteredNames = []; // Initial list set to Arabic names
  final AllahNamesSearchDelegate delegate = AllahNamesSearchDelegate(
    allNames: allArabicNames,
    filterCallback: (String query) {
      // Define your filter logic here
    },
  );

  @override
  void initState() {
    filteredNames = allArabicNames;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translate('plural.allah_names_page.appBarTitle')),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final String? selectedName = await showSearch<String>(
                context: context,
                delegate: delegate,
              );
              if (selectedName != null) {
                setState(() {
                  filteredNames = [selectedName];
                  currentMeaning = allahNamesMeaning[filteredNames.indexOf(
                      selectedName)]; // Use filteredNames list to get index
                  isContainerVisible =
                      true; // Show the container only when a name is selected
                });
              }
            },
          ),
          if (isContainerVisible)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                setState(() {
                  filteredNames = allArabicNames;
                  isContainerVisible = false;
                  currentMeaning = '';
                });
              },
            ),
          IconButton(
            icon: Icon(isHorizontal ? Icons.grid_view : Icons.view_headline),
            onPressed: () {
              setState(() {
                isHorizontal = !isHorizontal;
                columnCount = isHorizontal ? 3 : 1;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (isContainerVisible) // Only show the container if isContainerVisible is true
            Container(
              color: Colors.grey,
              height: 100,
              width: double.infinity,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isContainerVisible = false;
                    });
                  },
                  child: Text(currentMeaning),
                ),
              ),
            ),
          Expanded(
            child: AnimationLimiter(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child:
                    isHorizontal ? buildGridView(columnCount) : buildListView(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGridView(int columnCount) {
    return GridView.count(
      crossAxisCount: columnCount,
      children: AnimationConfiguration.toStaggeredList(
        duration: const Duration(milliseconds: 1000),
        childAnimationBuilder: (widget) => SlideAnimation(
          horizontalOffset: 50.0,
          child: FadeInAnimation(
            child: widget,
          ),
        ),
        children: filteredNames.map((name) {
          return GestureDetector(
            onTap: () {
              setState(() {
                isContainerVisible = true;
                currentMeaning = allahNamesMeaning[filteredNames
                    .indexOf(name)]; // Use filteredNames list to get index
              });
            },
            child: _buildGridItem(name),
          );
        }).toList(),
      ),
    );
  }

  Widget buildListView() {
    return ListView.builder(
      itemCount: filteredNames.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              isContainerVisible = true;
              currentMeaning = allahNamesMeaning[index]; // Use index directly
            });
          },
          child: AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: _buildListTile(filteredNames[index]),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildGridItem(String name) {
    return Card(
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }

  Widget _buildListTile(String name) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
