import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  String _previewImageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 170,
            width: double.infinity,
            child: _previewImageUrl == null
                ?
            Text('No Location chosen', textAlign: TextAlign.center,):


        )
      ],
    );
  }
}
