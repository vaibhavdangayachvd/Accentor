import 'package:accentor/layouts/record.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyAppHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppHomeState();
}

class MyAppHomeState extends State<MyAppHome> {
  String _currentSelected;
  final _titleStyle = TextStyle(
      fontSize: 32, color: Colors.indigo, fontWeight: FontWeight.w800);
  final _list = [
    'Indian',
    'American',
    'British',
    'Chinese',
    'French',
    'German'
  ];

  @override
  void initState() {
    super.initState();
    _currentSelected = _list[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            Image.asset(
              'images/background.png',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to\nAccentor',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 60,
                  ),
                ),
                Image.asset(
                  'images/image.png',
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Choose an accent to practise',
                    textAlign: TextAlign.center,
                    style: _titleStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton<String>(
                    onChanged: (value) => _changeSelected(value),
                    items: _getDropDownItems(),
                    value: _currentSelected,
                    elevation: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: FloatingActionButton(
                    backgroundColor: Colors.indigo,
                    child: Icon(Icons.arrow_right),
                    onPressed: () =>
                        Navigator.of(context).push(MaterialPageRoute<void>(
                      builder: (context) => Recorder(_currentSelected),
                    )),
                    elevation: 4,
                    tooltip: 'Check accent',
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  _changeSelected(value) {
    setState(() {
      this._currentSelected = value;
    });
  }

  List<DropdownMenuItem> _getDropDownItems() {
    return _list
        .map((value) => DropdownMenuItem<String>(
              child: Text(
                value,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 24,
                    fontStyle: FontStyle.italic),
              ),
              value: value,
            ))
        .toList();
  }
}
