import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:markdown/markdown.dart' as md;

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      "https://live.staticflickr.com/2896/33583627230_066841a2fb_b.jpg",
      "https://live.staticflickr.com/7158/6629088361_602f6c9736_b.jpg",
      "https://live.staticflickr.com/6210/6141063234_c40c8466c9_b.jpg",
      "https://live.staticflickr.com/5167/5269425200_2aca6cfe60_b.jpg"
    ];
    Widget _featuredItemBuilder(context, index) {
      return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            imgList[index],
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width >
                    MediaQuery.of(context).size.height
                ? MediaQuery.of(context).size.width * 0.3
                : MediaQuery.of(context).size.width * 0.7,
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
      );
    }

    return Container(
      color: Colors.grey[100],
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "#Featured",
                style: TextStyle(color: Colors.orange, fontSize: 26),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imgList.length,
                  itemBuilder: _featuredItemBuilder,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "#Apps",
                style: TextStyle(color: Colors.orange, fontSize: 26),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: _featuredItemBuilder,
                  itemCount: imgList.length,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "#About Us",
                style: TextStyle(color: Colors.orange, fontSize: 26),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 700)
                  return AboutUsBroad();
                else
                  return FutureBuilder(
                    future: Firebase.initializeApp(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) return Text("error encountered");
                      if (snapshot.connectionState == ConnectionState.done)
                        return AboutUsBroad();
                      return Placeholder();
                    },
                  );
              },
            ),
          ],
        )
      ]),
    );
  }
}

class AboutUsBroad extends StatelessWidget {
  List<Widget> _getAboutUsSections(List<DocumentSnapshot> docs) {
    List<Widget> sections = [];
    for (var doc in docs) {
      sections.add(Card(
        child: ListTile(
          dense: true,
          title: Text(doc['title']),
          subtitle: Text(doc['subtitle']),
        ),
      ));
    }
    return sections;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("aboutUs").snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData)
          return Text(
            "Loading...",
            style: TextStyle(color: Colors.orange),
          );
        return Column(children: _getAboutUsSections(snapshot.data.docs));
      },
    );
  }
}

class AboutUsNarrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.security_rounded,
                size: 26,
                color: Colors.blue,
              ),
              title: Text(
                "Security",
                style: TextStyle(fontSize: 26),
              ),
              subtitle: Text(
                  "We take our members security seriously hence we anonymise all data collected in our databases"),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.security_rounded,
                size: 26,
                color: Colors.blue,
              ),
              title: Text(
                "Security",
                style: TextStyle(fontSize: 26),
              ),
              subtitle: Text(
                  "We take our members security seriously hence we anonymise all data collected in our databases"),
            ),
          )
        ],
      ),
    );
  }
}
