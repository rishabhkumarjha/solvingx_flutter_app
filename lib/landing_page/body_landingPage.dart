import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> imgList = [
      "https://live.staticflickr.com/2896/33583627230_066841a2fb_b.jpg",
      "https://live.staticflickr.com/7158/6629088361_602f6c9736_b.jpg",
      "https://pixnio.com/free-images/2017/07/18/2017-07-18-12-47-47-300x199.jpg"
    ];
    Widget _sectionBuilder(context, index) {
      return Card(
        color: Color(0xff10111c),
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
      color: new Color(0xff11284d),
      child: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Featured",
                style: TextStyle(color: Colors.orange, fontSize: 26),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: imgList.length,
                itemBuilder: _sectionBuilder,
              ),
            )
          ],
        )
      ]),
    );
  }
}
