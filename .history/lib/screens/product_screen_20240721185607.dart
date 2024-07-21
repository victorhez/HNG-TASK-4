import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/blocs/cart/cart_bloc.dart';
import 'package:shop_app/blocs/wishlist/wishlist_bloc.dart';

import 'package:shop_app/widgets/custom_app_bar.dart';
import 'package:shop_app/widgets/hero_carousel.dart';

import '../models/timbu_product.dart';

class ProductScreen extends StatelessWidget {
  final Item? product;

  const ProductScreen({super.key, this.product});
  static const String routeName = '/product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product!.name),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
        child: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 1.5,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                HeroCarousel(
                  product: product,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product!.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white),
                          ),
                          Text(
                            'NGN${product!.currentPrice[0].price["NGN"]![0]}',
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Product Information',
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'Courtsey of HNG11, This product is coming from Timbu API. This product is one of the best in the country',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text(
                  'Delivery Information',
                  style: Theme.of(context).textTheme.headline3,
                ),
                children: [
                  ListTile(
                    title: Text(
                      'At our e-commerce platform, we pride ourselves on fast and reliable delivery. We understand the importance of receiving your orders promptly, so we guarantee delivery within two days. Our efficient logistics network ensures your products arrive safely and on time, providing a seamless shopping experience. Shop with confidence, knowing your purchase is just 48 hours away!',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: Colors.black,
        child: SizedBox(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.share),
                onPressed: () {},
                color: Colors.white,
              ),
              BlocBuilder<WishlistBloc, WishlistState>(
                builder: (context, state) {
                  return IconButton(
                    icon: Icon(Icons.favorite),
                    onPressed: () {
                      BlocProvider.of<WishlistBloc>(context).add(
                        AddWishlistProduct(product!),
                      );
                      Fluttertoast.showToast(
                        msg: "Item added to wishlist.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.grey,
                        textColor: Colors.black,
                        fontSize: 16.0,
                      );
                    },
                    color: Colors.white,
                  );
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                child: Text(
                  'ADD TO CART',
                  style: Theme.of(context).textTheme.headline3,
                ),
                onPressed: () {
                  context.read<CartBloc>().add(HistoryProductAdded(product!));
                  Fluttertoast.showToast(
                    msg: "Item added to cart.",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.grey,
                    textColor: Colors.black,
                    fontSize: 16.0,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
