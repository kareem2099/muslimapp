import 'dart:ui';
import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_islamic_icons/flutter_islamic_icons.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:muslimapp/models/tasbeh_list_model.dart';
import 'package:muslimapp/modules/allah_names.dart';
import 'package:muslimapp/modules/islamic_quiz.dart';
import 'package:muslimapp/modules/prayers.dart';
import 'package:muslimapp/modules/quran.dart';
import 'package:muslimapp/modules/salah.dart';
import 'package:muslimapp/modules/tasbih.dart';
import 'package:muslimapp/layout/home_screen.dart';

class MyNavigationRail extends StatefulWidget {
  const MyNavigationRail({Key? key, required this.hideRail}) : super(key: key);
  final bool hideRail;

  @override
  State<MyNavigationRail> createState() => _MyNavigationRailState();
}

class _MyNavigationRailState extends State<MyNavigationRail> {
  int _selectedIndex = 0;
  bool _extended = false;
  bool _hideRail = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer(const Duration(minutes: 1), () {
      setState(() {
        _hideRail = true;
      });
    });
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _hideRail = false;
    });
    _startTimer();
  }

  static List<Widget> _widgeOptions = <Widget>[
    const HomeScreen(),
    const DoaaPage(),
    Tasbih(tasbeh: tasbeh),
    const AllahNames(),
    const SalahWidget(),
    QuranPage(),
    IslamicQuizPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: widget.hideRail ? SizedBox.shrink() : _buildNavigationRail(),
        ),
        // Other widgets like DailyVerseCard and AzkarElsabahCardWidget will be positioned here
      ],
    );
  }

  Widget _buildNavigationRail() {
    return Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: _selectedIndex,
          extended: _extended,
          leading: MyNavigationRailFab(
            onPressed: () {
              setState(() {
                _extended = !_extended; // Toggle extended state
                _timer.cancel(); // Cancel previous timer
                // Start new timer to automatically collapse after 5 seconds
                _timer = Timer(const Duration(seconds: 5), () {
                  setState(() {
                    _extended = false;
                  });
                });
              });
            },
          ),
          onDestinationSelected: (int index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
            {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoaaPage(),
                    ),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tasbih(tasbeh: tasbeh),
                    ),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AllahNames(),
                    ),
                  );
                  break;
                case 4:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SalahWidget(),
                    ),
                  );
                  break;
                case 5:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuranPage(),
                    ),
                  );
                  break;
                case 6:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IslamicQuizPage(),
                    ),
                  );
                  break;
              }
            }
          },
          labelType: NavigationRailLabelType.none,
          destinations: <NavigationRailDestination>[
            NavigationRailDestination(
              icon: const Icon(Icons.home),
              selectedIcon: const Icon(Icons.home),
              label: Text(translate('plural.home.home_page')),
            ),
            NavigationRailDestination(
              icon: const Icon(FlutterIslamicIcons.prayer),
              selectedIcon: const Icon(FlutterIslamicIcons.prayer),
              label: Text(translate('plural.horizontal_list.adeia')),
            ),
            NavigationRailDestination(
              icon: const Icon(FlutterIslamicIcons.tasbihHand),
              selectedIcon: const Icon(FlutterIslamicIcons.tasbihHand),
              label: Text(
                translate('plural.horizontal_list.tasbih'),
              ),
            ),
            NavigationRailDestination(
              icon: const Icon(FlutterIslamicIcons.allah99),
              selectedIcon: const Icon(FlutterIslamicIcons.allah99),
              label: Text(
                translate('plural.horizontal_list.allah names'),
              ),
            ),
            NavigationRailDestination(
              icon: const Icon(FlutterIslamicIcons.kowtow),
              selectedIcon: const Icon(FlutterIslamicIcons.kowtow),
              label: Text(translate('plural.horizontal_list.salah')),
            ),
            NavigationRailDestination(
              icon: const Icon(FlutterIslamicIcons.quran),
              selectedIcon: const Icon(FlutterIslamicIcons.quran),
              label: Text(translate('plural.home.holy_quran')),
            ),
            NavigationRailDestination(
              icon: const Icon(FlutterIslamicIcons.drum),
              selectedIcon: const Icon(FlutterIslamicIcons.drum),
              label: Text(translate('plural.home.quiz')),
            ),
          ],
        ),
        const VerticalDivider(thickness: 1, width: 1),
        // This is the main content.
      ],
    );
  }

  Widget _buildExpandedButton() {
    return widget.hideRail
        ? const SizedBox()
        : Row(
            children: <Widget>[
              Expanded(
                child: Center(
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _hideRail = false;
                        _startTimer();
                      });
                    },
                    child: const Icon(Icons.add),
                  ),
                ),
              ),
            ],
          );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel timer when disposing the widget
    super.dispose();
  }
}

class MyNavigationRailFab extends StatelessWidget {
  const MyNavigationRailFab({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =
        NavigationRail.extendedAnimation(context);
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget? child) {
        // The extended fab has a shorter height than the regular fab.
        return Container(
          height: 40,
          padding: EdgeInsets.symmetric(
            vertical: lerpDouble(0, 6, animation.value)!,
          ),
          child: animation.value == 0
              ? FloatingActionButton(
                  onPressed: onPressed,
                  child: const Icon(Icons.add),
                )
              : Align(
                  alignment: AlignmentDirectional.centerStart,
                  widthFactor: animation.value,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8),
                    child: FloatingActionButton.extended(
                      icon: const Icon(Icons.add),
                      label: const Text('CREATE'),
                      onPressed: onPressed,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
