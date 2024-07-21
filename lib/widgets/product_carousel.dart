import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:shop_app/models/timbu_product.dart';
import 'package:shop_app/widgets/product_card.dart';

class ProductCarousel extends StatefulWidget {
  final ProductResponse products;
  final List<String> keyword;

  const ProductCarousel({
    Key? key,
    required this.products,
    required this.keyword,
  }) : super(key: key);

  @override
  State<ProductCarousel> createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  int _currentIndex = 0;
  final CarouselController _controller = CarouselController();
  final PageController _pageController = PageController(viewportFraction: 0.5);

  @override
  Widget build(BuildContext context) {
    // widget.products.items.shuffle();
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: PageView.builder(
                  pageSnapping: false,
                  padEnds: false,
                  controller: _pageController,
                  itemCount: widget.products.items.where((element) {
                    return widget.keyword.any((keyword) => element.name
                        .toLowerCase()
                        .contains(keyword.toLowerCase()));
                  }).length,
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  // Number of items in the carousel
                  itemBuilder: (context, index) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.only(right: 16),
                        //
                        decoration: BoxDecoration(
                          // color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ProductCard(
                            product: widget.products.items.where((element) {
                          return widget.keyword.any((keyword) => element.name
                              .toLowerCase()
                              .contains(keyword.toLowerCase()));
                        }).toList()[index]));
                  }),
            ),
          ),
          SizedBox(
            height: 39,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.products.items
                .where((element) {
                  return widget.keyword.any((keyword) => element.name
                      .toLowerCase()
                      .contains(keyword.toLowerCase()));
                })
                .toList()
                .asMap()
                .entries
                .map((entry) {
                  return GestureDetector(
                    // onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 12.0,
                      height: 12.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: entry.key != _currentIndex
                                ? Colors.grey
                                : Colors.transparent),
                        shape: BoxShape.circle,
                        color: entry.key != _currentIndex
                            ? Colors.white
                            : Color(0xffFF7F7D),
                      ),
                    ),
                  );
                })
                .toList(),
          ),
          SizedBox(
            height: 39,
          ),
        ],
      ),
      // SizedBox(
      //     height: MediaQuery.of(context).size.height * 0.4,
      //     child: CarouselSlider(
      //         items: widget.products.items
      //             .map((e) => ProductCard(product: e))
      //             .toList(),
      //         options: CarouselOptions(
      //           height: 400,
      //           enlargeCenterPage: true,
      //           enableInfiniteScroll: false,
      //           initialPage: 0,
      //           viewportFraction: 0.6,
      //           onPageChanged: (index, reason) {
      //             setState(() {
      //               _currentIndex = index;
      //             });
      //           },
      //         ))
      // ListView.builder(
      //   padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      //   shrinkWrap: true,
      //   scrollDirection: Axis.horizontal,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.only(right: 5.0),
      //       child: ProductCard(
      //         product: products.items[index],
      //       ),
      //     );
      //   },
      //   itemCount: products.items.length,
      // ),
      //       ),
    );
  }
}
