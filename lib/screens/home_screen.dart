import 'dart:ui';
import 'package:crypto_price_tracker/controllers/coin_controller.dart';
import 'package:crypto_price_tracker/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
  final CoinController controller = Get.put(CoinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 35, 23, 74),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 45),
          child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Crypto Market",
                    style: textStyle(25, Colors.white, FontWeight.bold),
                  ),
                  Obx(
                    () => controller.isLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  color: Color.fromARGB(
                                                      255, 109, 100, 132),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color:
                                                            Colors.grey[700]!,
                                                        offset:
                                                            const Offset(4, 4),
                                                        blurRadius: 5)
                                                  ]),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10),
                                                child: Image.network(controller
                                                    .coinsList[index].image),
                                              )),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                controller
                                                    .coinsList[index].name,
                                                style: textStyle(
                                                    18,
                                                    Colors.white,
                                                    FontWeight.w600),
                                              ),
                                              Text(
                                                "${controller.coinsList[index].priceChangePercentage24H.toStringAsFixed(2)} %",
                                                style: textStyle(
                                                    18,
                                                    Colors.grey,
                                                    FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            "\$ ${controller.coinsList[index].currentPrice.round()}",
                                            style: textStyle(18, Colors.white,
                                                FontWeight.w600),
                                          ),
                                          Text(
                                            controller.coinsList[index].symbol
                                                .toUpperCase(),
                                            style: textStyle(18, Colors.grey,
                                                FontWeight.w600),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  )
                ],
              )),
        ));
  }
}
