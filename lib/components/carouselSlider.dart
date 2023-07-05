import 'package:agi_app/model/carouselModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class carouselSlider extends StatefulWidget {
  const carouselSlider({super.key});

  @override
  State<carouselSlider> createState() => _carouselSliderState();
}

class _carouselSliderState extends State<carouselSlider> {
  List<CarouselModel> carouselList = [];
  bool isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    fetchCarousel();
    super.initState();
  }

  fetchCarousel() async {
    var carousels =
        await FirebaseFirestore.instance.collection('carousel').get();
    mapRecords(carousels);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map(
          (item) => CarouselModel(
            image: item['image'],
          ),
        )
        .toList();
    print(_list.length);
    setState(() {
      isLoaded = true;
      carouselList = _list;
    });
  }

  Widget build(BuildContext context) {
    return isLoaded
        ? Container(
            margin: EdgeInsets.all(10),
            child: CarouselSlider.builder(
              itemCount: carouselList.length,
              itemBuilder: (context, index, realIndex) {
                ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: carouselList[index].image,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
                return ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: CachedNetworkImage(
                    imageUrl: carouselList[index].image,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                value: downloadProgress.progress)),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                );
              },

              // items: [
              //   Container(
              //     margin: EdgeInsets.all(6.0),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20.0),
              //       image: const DecorationImage(
              //         image: AssetImage("assets/carousel/auditorium.jpg"),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              //   Container(
              //     margin: EdgeInsets.all(6.0),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20.0),
              //       image: const DecorationImage(
              //         image: AssetImage("assets/carousel/auditorium.jpg"),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              //   Container(
              //     margin: EdgeInsets.all(6.0),
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(20.0),
              //       image: const DecorationImage(
              //         image: AssetImage("assets/carousel/auditorium.jpg"),
              //         fit: BoxFit.cover,
              //       ),
              //     ),
              //   ),
              // ],
              options: CarouselOptions(
                height: 150.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.95,
              ),
            ),
          )
        : SizedBox(
            height: 20, child: Center(child: CircularProgressIndicator()));
  }
}
