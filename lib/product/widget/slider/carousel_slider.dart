import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:motaperp_tctsolutions/core/extension/context_extension.dart';

class CarouselSliderCustom extends StatelessWidget {
  final List<Widget>? items;
  const CarouselSliderCustom({Key? key,this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items:items,
      options: CarouselOptions(
        scrollPhysics: NeverScrollableScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        height:context.screenHeight,
        viewportFraction:1.11,
       // viewportFraction: context.screenHeight/589,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
