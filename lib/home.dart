import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Solvingx.in")),
      body: Column(
          children: <Widget>[
            SizedBox(height: 8,),
            SizedBox(height: 500,child: CarouselWithIndicatorDemo(),)
          ]),
        drawer: Drawer(
          child: ListView(
            children: [
              Container(
                height: 150,
                child: DrawerHeader(
                  child: Column(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage("https://live.staticflickr.com/433/32467277971_bf7420eac1_b.jpg")
                            )
                        ),
                      ),
                      SizedBox(width: 15,),
                      Text("Rishabh Jha", style: Theme.of(context).textTheme.headline4,),
                      Text("Member Since 2016")
                    ],
                  ),
                ),
              ),
              ListTile(),
              ListTile()
            ],
          ),
        ),
    );
  }

}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;
  List<String> imageList = ["https://live.staticflickr.com/7185/6834290450_d6e74881b4_b.jpg",
    "https://live.staticflickr.com/689/20815840526_ce0c35ce7d_b.jpg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            CarouselSlider(
              items: imageList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image.network(i, height: 0.3*MediaQuery.of(context).size.height);
                  },
                );
              }).toList(),
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16/9,
                  height: 0.3 * MediaQuery.of(context).size.height,
                  viewportFraction: MediaQuery.of(context).size.height>MediaQuery.of(context).size.width?0.8:0.3,
                  enableInfiniteScroll: false,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imageList.map((url) {
                int index = imageList.indexOf(url);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4),
                  ),
                );
              }).toList(),
            ),
          ]
      ),
    );
  }
}