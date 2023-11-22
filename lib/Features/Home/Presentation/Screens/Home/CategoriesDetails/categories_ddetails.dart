import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shop_app/Core/Server/server_locator.dart';
import 'package:shop_app/Core/Utils/navigator.dart';
import 'package:shop_app/Core/widget/Images/app_images.dart';
import 'package:shop_app/Features/Home/Presentation/Controller/CategoryBlocc/category_bloc.dart';
import 'package:shop_app/Features/Home/Presentation/Screens/Home/CategoriesDetails/products_by_category.dart';

class CategoriesDetails extends StatefulWidget {
  const CategoriesDetails({super.key});

  @override
  State<CategoriesDetails> createState() => _CategoriesDetailsState();
}

class _CategoriesDetailsState extends State<CategoriesDetails> {
  final categoryBloc = CategoryBloc(sl(),sl());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => categoryBloc..add(GetCategoryEvent()),
      child: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    icon: Icon(
                      CupertinoIcons.arrow_left,color: Colors.black,size: 25.sp,
                    ),
                    onPressed: () {Navigator.pop(context);},),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.sp, horizontal: 20.sp),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                        const Divider(color: Colors.grey),
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) =>
                            GestureDetector(
                              onTap: () => push(context, ProductsCategory(id: state.categories[index].id.toString())),
                              child: Row(
                                children: [
                                  AppImage(
                                    imageUrl:
                                    state.categories[index].image,
                                    width: 30.w,
                                    height: 10.h,
                                  ),
                                  SizedBox(width: 5.w,),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      state.categories[index].name,
                                      style: TextStyle(
                                        fontSize: 20.sp, fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis,),
                                      maxLines: 1,
                                    ),
                                  ),
                                  const Spacer(),
                                  const Icon(Icons.arrow_forward_ios_outlined),
                                ],
                              ),
                            ),
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
