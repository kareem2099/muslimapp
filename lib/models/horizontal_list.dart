import 'package:flutter/material.dart';
import 'package:muslimapp/models/tasbeh_list_model.dart';
import 'package:muslimapp/modules/allah_names.dart';
import 'package:muslimapp/modules/prayers.dart';
import 'package:muslimapp/modules/salah.dart';
import 'package:muslimapp/modules/tasbih.dart';

class HorizontalListButtons extends StatefulWidget {
  const HorizontalListButtons({Key? key}) : super(key: key);

  @override
  _HorizontalListButtonsState createState() => _HorizontalListButtonsState();
}

class _HorizontalListButtonsState extends State<HorizontalListButtons> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(context, 'adeia', 'assets/adeia.jpg', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DoaaPage()));
              }),
              buildButton(context, 'sebha', 'assets/sebha.jpg', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Tasbih(tasbeh: tasbeh)));
              }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton(context, 'allah names', 'assets/allahNames.gif', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AllahNames()));
              }),
              buildButton(context, 'salah', 'assets/home.jpeg', () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SalahWidget()));
              }),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(
      BuildContext context, String text, String image, Function() onPressed) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(40),
      elevation: 5,
      child: InkWell(
        onTap: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                foregroundImage: AssetImage(image),
                radius: 78,
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 26),
            ),
          ],
        ),
      ),
    );
  }
}
