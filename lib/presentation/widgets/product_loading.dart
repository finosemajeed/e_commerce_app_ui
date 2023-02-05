import 'package:e_comerce_app_ui/core/color_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductLoading extends StatelessWidget {
  const ProductLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: offWhite,
            highlightColor: Colors.white,
            child: Container(
              color: offWhite,
              width: 150,
              height: 150,
            ),
          ),
          Column(
            children: [
              Shimmer.fromColors(
                baseColor: offWhite,
                highlightColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: offWhite,
                highlightColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: offWhite,
                highlightColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
