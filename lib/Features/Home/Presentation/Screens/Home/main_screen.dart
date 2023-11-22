import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Core/Styles/color.dart';
import 'package:shop_app/Core/Utils/app_svg.dart';
import 'package:shop_app/Core/enum.dart';
import 'package:shop_app/Core/widget/Button/button.dart';
import 'package:shop_app/Core/widget/Images/app_images.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/BannerBloc/banner_bloc.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/CategoryBlocc/category_bloc.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/HomeBloc/home_bloc.dart';
import 'package:shop_app/Features/Home/Presentation/Screens/Home/CategoriesDetails/categories_ddetails.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();
  TextEditingController searchController = TextEditingController();
  final productBloc = HomeBloc(sl());
  final bannerBloc = BannerBloc(sl());
  final categoryBloc = CategoryBloc(sl(),sl());

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => productBloc..add(ProductEvent()),
        ),
        BlocProvider(
          create: (context) => bannerBloc..add(const BannerEvent()),
        ),
        BlocProvider(
          create: (context) => categoryBloc..add(GetCategoryEvent()),
        )
      ],
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.sp, horizontal: 15.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Shopify',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      width: 6.w,
                      height: 3.5.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.sp),
                          color: Colors.black12),
                      child: AppSVG(
                        assetName: 'favorite',
                        width: 4.w,
                        height: 4.h,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 7.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.sp),
                          color: Colors.black12),
                      child: AppSVG(
                        assetName: 'notification',
                        width: 5.w,
                        height: 5.h,
                        color: Colors.blueGrey,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 9.w,
                      height: 4.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3.sp),
                          color: Colors.black12),
                      child: AppSVG(
                        color: Colors.blueGrey,
                        assetName: 'cart',
                        width: 5.w,
                        height: 5.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9.w,
                ),
                BlocBuilder<BannerBloc, BannerState>(
                  builder: (context, state) {
                    return state.bannerState == RequestState.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : Padding(
                            padding: EdgeInsets.symmetric(vertical: 3.h),
                            child: Column(
                              children: [
                                CarouselSlider.builder(
                                  itemCount: state.banner.length,
                                  itemBuilder: (context, index, realIndex) =>
                                      SizedBox(
                                    width: 75.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: AppImage(
                                          imageUrl:
                                              '${state.banner[index].image}',
                                          width: 16.h,
                                          height: 16.h),
                                    ),
                                  ),
                                  carouselController: carouselController,
                                  options: CarouselOptions(
                                    animateToClosest: true,
                                    pageSnapping: true,
                                    padEnds: true,
                                    aspectRatio: 16 / 9,
                                    viewportFraction: 0.8,
                                    initialPage: 0,
                                    enableInfiniteScroll: true,
                                    reverse: false,
                                    autoPlay: true,
                                    autoPlayInterval:
                                        const Duration(seconds: 3),
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.3,
                                    scrollDirection: Axis.horizontal,
                                    height: 18.h,
                                    onPageChanged: (index, reason) {
                                      setState(() {
                                        currentIndex = index;
                                      });
                                    },
                                  ),
                                ),
                                state.banner.isEmpty
                                    ? const SizedBox()
                                    : DotsIndicator(
                                        decorator: const DotsDecorator(
                                          activeColor: AppColors.primary,
                                        ),
                                        dotsCount: state.banner.length,
                                        position: currentIndex,
                                      ),
                              ],
                            ),
                          );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_right,color: Colors.black,size: 20.sp,
                      ),
                      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => CategoriesDetails(),));},),


                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),

                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return SizedBox(
                      height: 14.h,
                      child: ListView.builder(
                        itemCount: state.categories.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => state.categoriesState ==
                                RequestState.isLoading
                            ? const Padding(
                                padding: EdgeInsets.all(15),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              )
                            : Padding(
                                padding: EdgeInsetsDirectional.only(
                                  end: 15.sp,
                                ),
                                child: SizedBox(
                                  width: 30.w,
                                  child: Padding(
                                    padding: const EdgeInsets.all(4),
                                    child: Material(
                                      borderRadius:
                                          BorderRadius.circular(20.sp),
                                      elevation: 5.0,
                                      shadowColor: Colors.grey.shade300,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadiusDirectional
                                                      .circular(
                                                20.sp,
                                              ),
                                              child: Image.network(
                                                  state.categories[index].image,
                                                  width: 22.w),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                                state.categories[index].name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 16.sp,
                                                    overflow: TextOverflow
                                                        .ellipsis),
                                                maxLines: 1),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    );
                  },
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: Colors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recommended Product',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'See all',
                      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
                    ),

                  ],
                ),
                SizedBox(height: 2.h,),
                SizedBox(
                  height: 72.h,
                  width: 150.w,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3.2.sp,
                      crossAxisSpacing: 13.sp,
                      mainAxisSpacing: 13.sp,
                    ),
                    itemCount: 4,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) => state.productState ==
                            RequestState.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : SizedBox(
                            height: 100.h,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15.sp),
                                  color: Colors.grey.shade200),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8.sp, horizontal: 10.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade300,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Text(
                                            '${state.product[index].discount}%',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.redAccent,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.black,
                                          size: 18.sp,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 14.5.h,
                                    width: 50.w,
                                    child: Image.network(
                                      '${state.product[index].image}',
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 10.sp,
                                    ),
                                    child: Text(
                                      '${state.product[index].name}',
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                          overflow: TextOverflow.ellipsis),
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8.sp,
                                    ),
                                    child: Text(
                                      '${state.product[index].description}',
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis),
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Text(
                                    '${state.product[index].price} EGP',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    height: 4.h,
                                    child: AppButton(
                                      onPressed: () {},
                                      label: 'Add to cart',
                                      sizeFont: 15.sp,
                                      bgColor: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
