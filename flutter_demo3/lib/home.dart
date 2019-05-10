import 'package:flutter/material.dart';
import 'package:flutter_demo3/Detail.dart';

class HomePage extends StatelessWidget {
  var imageSection = ImageSection();
  var titleSection =
      TitleSection('Oeschinen Lake Campground', 'Kandersteg, Switzerland', 41);
  var buttonSection = ButtonSection();
  final textSection = Container(
    padding: const EdgeInsets.all(32.0),
    child: Text(
      '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
          ''',
      softWrap: true,
    ),
  );
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[imageSection, titleSection, GestureDetector(child:buttonSection ,onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context){
          return DetailPage();
        })),),textSection],
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Image.asset(
      "images/lake.jpg",
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );
  }
}

class TitleSection extends StatelessWidget {
  final String title;
  final String subTitle;
  final int count;

  TitleSection(this.title, this.subTitle, this.count);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.only(bottom: 8),
                ),
                Text(
                  subTitle,
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          Text(
            count.toString(),
            style: TextStyle(fontSize: 20, color: Colors.black),
          )
        ],
      ),
      padding: EdgeInsets.all(32.0),
    );
  }
}

class ButtonSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        IconWidget("CALL", Icons.call),
        IconWidget("ROUTE", Icons.send),
        IconWidget("SHARE", Icons.share),
      ],
    );
  }
}

class IconWidget extends StatelessWidget {
  final String title;
  final IconData icon;

  IconWidget(this.title, this.icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
        ),
        Container(
          padding: EdgeInsets.only(top: 8.0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400,color: Colors.blue),
          ),
        )
      ],
    );
  }
}
