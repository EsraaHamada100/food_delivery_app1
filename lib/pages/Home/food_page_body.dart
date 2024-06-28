import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:food_delivery_app/resources/app_values.dart';
import 'package:food_delivery_app/resources/assets_manager.dart';
import 'package:food_delivery_app/resources/color_manager.dart';
import 'package:food_delivery_app/resources/constants.dart';
import 'package:food_delivery_app/widgets/big_text.dart';
import 'package:food_delivery_app/widgets/icon_and_text_widget.dart';
import 'package:food_delivery_app/widgets/small_text.dart';
import 'package:get/get.dart';

import '../../routes/route_helper.dart';
import '../../widgets/food_details_column.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  double _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  final double _height = AppValues.pageViewContainer;
  final List<String> imagesList = [
    ImageAssets.bread,
    ImageAssets.fish,
    ImageAssets.fruits,
    ImageAssets.meats,
    ImageAssets.snakes,
    ImageAssets.vegetables,
  ];
  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // container that has the slider
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? SizedBox(
                    height: AppValues.pageView,
                    // color: Colors.red,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: popularProducts.popularProductList.length,
                      itemBuilder: (_, position) {
                        return _buildPageItem(
                          position,
                          popularProducts.popularProductList[position],
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: ColorManager.mainColor,
                    ),
                  );
          },
        ),
        // dots
        GetBuilder<PopularProductController>(
          builder: (popularProducts) {
            return popularProducts.isLoaded
                ? DotsIndicator(
                    dotsCount: popularProducts.popularProductList.length,
                    position: _currentPageValue,
                    decorator: DotsDecorator(
                      activeColor: ColorManager.mainColor,
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s5),
                      ),
                    ),
                  )
                : Container();
          },
        ),

        SizedBox(height: AppHeight.h30),
        // Popular text container
        Container(
          margin: EdgeInsets.only(left: AppSize.s30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: AppWidth.w10),
              Container(
                margin: EdgeInsets.only(bottom: AppSize.s3),
                child: BigText(
                  text: ".",
                ),
              ),
              SizedBox(width: AppWidth.w10),
              Container(
                margin: EdgeInsets.only(bottom: AppSize.s2),
                child: SmallText(text: "Food pairing"),
              ),
            ],
          ),
        ),
        // list of recommended products at the end
        GetBuilder<RecommendedProductController>(
            builder: (recommendedProductController) {
          return recommendedProductController.isLoaded
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: recommendedProductController
                      .recommendedProductList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteHelper.getRecommendedFood(pageId: index));
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          left: AppSize.s20,
                          right: AppSize.s20,
                          top: AppSize.s20,
                        ),
                        child: Row(
                          children: [
                            // images section
                            Container(
                              width: AppWidth.w120,
                              height: AppHeight.h130,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppSize.s5),
                                color: Colors.white38,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    AppConstants.baseUrl +
                                        AppConstants.uploadUrl +
                                        recommendedProductController
                                            .recommendedProductList[index].img,
                                  ),
                                ),
                              ),
                            ),
                            // text section
                            Expanded(
                              child: Container(
                                height: AppHeight.h120,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(AppSize.s20),
                                    bottomRight: Radius.circular(AppSize.s20),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(AppSize.s10),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      BigText(
                                          text: recommendedProductController
                                              .recommendedProductList[index]
                                              .name!),
                                      SmallText(
                                        text: recommendedProductController
                                            .recommendedProductList[index]
                                            .description!,
                                        maxLines: 2,
                                      ),
                                      const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconAndTextWidget(
                                            icon: Icons.circle,
                                            iconColor: ColorManager.iconsColor1,
                                            text: "Normal",
                                          ),
                                          IconAndTextWidget(
                                            icon: Icons.location_on,
                                            iconColor: ColorManager.mainColor,
                                            text: "1.7km",
                                          ),
                                          IconAndTextWidget(
                                            icon: Icons.access_time,
                                            iconColor: ColorManager.iconsColor2,
                                            text: "32min",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              : const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.mainColor,
                  ),
                );
        }),
      ],
    );
  }

  Widget _buildPageItem(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      // the current card that we are in
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);
      double currentTranslation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranslation, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      // the next one
      double currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      double currentTranslation = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currentTranslation, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      // the previous one
      double currentScale =
          1 - (_currentPageValue - index) * (1 - _scaleFactor);
      // var currentTranslation = _height*(1-currentScale)/2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - currentScale) / 2, 0);
    } else {
      // others
      double currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          // the container that has the image
          GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.getPopularFood(pageId: index));
            },
            child: Container(
              height: AppValues.pageViewContainer,
              margin: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s30),
                color:
                    index.isEven ? const Color(0xFF69C5DF) : const Color(0xFF9294CC),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(AppConstants.baseUrl +
                      AppConstants.uploadUrl +
                      popularProduct.img!),
                ),
              ),
            ),
          ),
          // the side that has the details
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: AppValues.pageViewDetailsContainer,
              margin: EdgeInsets.only(
                left: AppSize.s30,
                right: AppSize.s30,
                bottom: AppSize.s30,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s20),
                color: Colors.white,
                // here we make a shadow in the center middle only
                boxShadow: const [
                  BoxShadow(
                    color: ColorManager.shadowColor,
                    blurRadius: 5.0,
                    // here means we get the axis's as it and we swap y to
                    // the bottom by 5
                    offset: Offset(0, 5),
                  ),
                  // to cover the shadow in the left and we make it the same as
                  // background shadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0),
                  ),
                  // to cover the shadow in the right and we make it the same as
                  // background shadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0),
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                    top: AppSize.s10,
                    right: AppSize.s10,
                    left: AppSize.s10,
                    bottom: AppSize.s5),
                child: FoodDetailsColumn(text: popularProduct.name!),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
