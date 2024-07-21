import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/widgets/product_carousel.dart';
import 'package:shop_app/widgets/section_title.dart';

import '../blocs/product/product_bloc.dart';
import '../blocs/product/product_event.dart';
import '../blocs/product/product_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ProductBloc()..add(FetchProducts()),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                print(state);
                return Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4),
                  child: Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Please Wait...")
                      ],
                    ),
                  ),
                );
              } else if (state is ProductLoadSuccess) {
                print(state.products);
                state.products.items.shuffle();
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: Container(
                        height: height * 0.25,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Stack(
                          children: [
                            // Image container
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://api.timbu.cloud/images/${state.products.items.last.photos[0].url}",
                                  ),
                                ),
                              ),
                            ),
                            // Overlay container
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            // Text container
                            Padding(
                              padding: const EdgeInsets.only(left: 26.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Premium ${state.products.items.last.name}, ",
                                    style: TextStyle(
                                      color: Color(0xffFAFAFA),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Premium Savings",
                                    style: TextStyle(
                                      color: Color(0xffFAFAFA),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    "Limited offer, hop on and get yours now ",
                                    style: TextStyle(
                                      color: Color(0xffFAFAFA),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    SectionTitle(
                      title: "Timbu Food",
                    ),
                    ProductCarousel(
                        products: state.products,
                        keyword: ["Beans", "Rice", "Salad"]),
                    SectionTitle(
                      title: 'Ice-cream and Cookies',
                    ),
                    ProductCarousel(
                      products: state.products,
                      keyword: ["Ice cream", "Busciut", "Ice"],
                    ),
                    SectionTitle(
                      title: 'Cake and Pizza',
                    ),
                    ProductCarousel(
                      products: state.products,
                      keyword: ["Cake", "Pizza"],
                    ),
                  ],
                );
              } else if (state is ProductLoadFailure) {
                print(state.error);
                return Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.4),
                  child: Center(child: Text(state.error)),
                );
              } else {
                return SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
