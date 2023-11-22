import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Core/enum.dart';
import 'package:shop_app/Core/widget/Button/button.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/CategoryBlocc/category_bloc.dart';

class ProductsCategory extends StatefulWidget {
  const ProductsCategory({super.key, required this.id});

  final String id;

  @override
  State<ProductsCategory> createState() => _ProductsCategoryState();
}

class _ProductsCategoryState extends State<ProductsCategory> {
  final productCategory = CategoryBloc(sl(), sl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          productCategory..add(GetCategoryProductEvent(widget.id.toString())),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: IconButton(
                      icon: Icon(
                        CupertinoIcons.arrow_left,color: Colors.black,size: 25.sp,
                      ),
                      onPressed: () {Navigator.pop(context);},),
                  ),
                  SizedBox(
                  height: 190.h,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3.5.sp,
                        crossAxisSpacing: 13.sp,
                        mainAxisSpacing: 13.sp,
                      ),
                      itemCount: state.productsCategories!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) =>
                      state.productCategoriesState == RequestState.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                        height: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.sp),
                                color: Colors.grey.shade200),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 13.5.h,
                                  width: 40.w,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Image.network(
                                      '${state.productsCategories![index].image}',
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.sp,
                                  ),
                                  child: Text(
                                    '${state.productsCategories![index].name}',
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
                                    '${state.productsCategories![index].description}',
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.black,
                                        overflow: TextOverflow.ellipsis),
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                  ),
                                ),
                                Text(
                                  '${state.productsCategories![index].price} EGP',
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
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
