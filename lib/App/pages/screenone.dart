import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  @override
  _ScreenOneState createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  var colorsMatch = {
    'Khaki': [
      'NavyBlueShirt',
      'MaroonShirt',
      'RedShirt',
      'GreenShirt',
      'BlackShirt',
      'WhiteShirt',
      'PurpleShirt',
      'TealShirt',
      'PinkShirt',
      'GrayShirt'
    ],
    'Black': [
      'BlueShirt',
      'MaroonShirt',
      'RedShirt',
      'TurquoiseGreenShirt',
      'LightOrangeShirt',
      'WhiteShirt',
      'PurpleShirt',
      'LightYellowShirt',
      'LightPinkShirt',
      'LightGrayShirt'
    ],
    'Cream': [
      'NavyBlueShirt',
      'MaroonShirt',
      'PinkShirt',
      'SeaGreenShirt',
      'BlackShirt'
    ],
    'Gray': [
      'BlueShirt',
      'GreenShirt',
      'RedShirt',
      'BlackShirt',
      'SpringBloomShirt',
      'WhiteShirt',
      'PurpleShirt',
      'AquaShirt',
      'LightPinkShirt',
      'CherryShirt'
    ],
    'NavyBlue': [
      'WhiteShirt',
      'YellowShirt',
      'PinkShirt',
      'PeachShirt',
      'LightGreenShirt',
      'PurpleShirt',
      'RoyalBlueShirt',
      'BrownShirt',
      'MaroonShirt',
      'MagentaShirt',
      'AquaShirt',
      'CreamShirt',
      'KhakiShirt',
      'RedShirt',
      'GrayShirt',
      'BlackShirt',
      'RustOrangeShirt',
      'CrimsonShirt',
      'SunnyYellowShirt'
    ]
  };

  List<String> _baseColors = ["Khaki", "Black", "Cream", "Gray", "NavyBlue"];
  List<String> _result;
  String _currentBaseColor;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: screenHeight / 5,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              'Match Colors',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
              child: DropdownButton<String>(
            hint: Text('Select Pant Color'),
            value: _currentBaseColor,
            isExpanded: true,
            onChanged: (String _value) {
              setState(() {
                _currentBaseColor = _value;
              });
            },
            items: _baseColors.map((String value) {
              return new DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        'assets/images/' + value + '.png',
                        height: 24,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ));
            }).toList(),
          )),
          SizedBox(height: 24),
          Center(
            child: FlatButton(
                onPressed: () {
                  setState(() {
                    _result = colorsMatch[_currentBaseColor];
                    print(_result);
                    print('res $_result');
                  });
                },
                color: Colors.red,
                padding:
                    EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                child: Text(
                  "Find Match",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w200),
                )),
          ),
          _currentBaseColor != null && _result != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 36.0, bottom: 16),
                  child: Text(
                    'Result',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                )
              : Text(''),
          _currentBaseColor != null && _result != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[for (var item in _result) ListItem(item)])
              : Text(''),
        ],
      ),
    );
  }

  Widget ListItem(String name) {
    String imgPath = 'assets/images/' + name + '.png';

    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            imgPath,
            height: 60,
            fit: BoxFit.cover,
          ),
          Text(name)
        ],
      ),
    );
  }
}
