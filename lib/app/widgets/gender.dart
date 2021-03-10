import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Row(
          children: <Widget>[
            Container(
              width: 80.0,
              child: Text(
                "Gênero",
                textAlign: TextAlign.left,
                style: TextStyle(
                        color: Colors.lightBlue
                      ),
              ),
            ),
            SizedBox(
              width: 40.0,
            ),
            CircleAvatar(
              backgroundColor: Colors.blue[50],
              child: Icon(Icons.tag_faces, color: Colors.grey),
            ),
            SizedBox(
              width: 30.0,
            ),
            Container(
              width: 70.0,
              child: Text(
                "Homem",
                textAlign: TextAlign.left,
              ),
            ),
            CircleAvatar(
              backgroundColor: Colors.blue[50],
              child: Icon(
                Icons.face,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 30.0,
            ),
            Container(
              width: 140.0,
              child: Text(
                "Mulher",
                textAlign: TextAlign.left,
              ),
            ),
          ],
        );
      },
    );
  }
}
