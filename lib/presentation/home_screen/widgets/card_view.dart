import 'dart:developer';
import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:e_comerce_app_ui/db/data_model.dart';
import 'package:flutter/material.dart';

class ScreenCardView extends StatelessWidget {
  ScreenCardView({
    super.key,
    required this.productId,
  });

  final productId;

  @override
  Widget build(BuildContext context) {
    int? productPrice = productDetails[productId].productPrice?.toInt();
    ValueNotifier itemPriceNotifier = ValueNotifier(1);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        primary: true,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: textBlack),
            elevation: 0,
            pinned: true,
            centerTitle: false,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                width: 300,
                height: 300,
                image: AssetImage(productDetails[productId].productImage!),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        productDetails[productId].category!,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.black26,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    productDetails[productId].productName!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 30,
                      color: textBlack,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '\$ ${productDetails[productId].productPrice!}',
                    style: const TextStyle(
                      color: orange,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: itemPriceNotifier,
                        builder: (context, val, _) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  itemPriceNotifier.value > 1
                                      ? itemPriceNotifier.value--
                                      : itemPriceNotifier.value;
                                  log(val.toString());
                                },
                                icon: const Icon(
                                  Icons.horizontal_rule,
                                  size: 35,
                                  color: orange,
                                ),
                              ),
                              Text(
                                "${val}",
                                style: TextStyle(fontSize: 35),
                              ),
                              IconButton(
                                onPressed: () {
                                  itemPriceNotifier.value++;
                                },
                                icon: const Icon(
                                  Icons.add,
                                  size: 35,
                                  color: orange,
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    productDetails[productId].productDetails!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black45,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ValueListenableBuilder(
                valueListenable: itemPriceNotifier,
                builder: (context, val, _) {
                  return Text(
                    "${productPrice! * itemPriceNotifier.value}",
                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: () => 'Null',
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(purple)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Buy Now',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
