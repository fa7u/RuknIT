
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/app_cupit/app_states.dart';
import 'package:e_commerce/models/data_model/data_model.dart';
import 'package:e_commerce/models/products_model/products_model.dart';
import 'package:e_commerce/pages/categories_pages/CategoryDetailsPage.dart';
import 'package:e_commerce/shared/styles/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../app_cupit/app_cubit.dart';
import '../../dio/dio_helper.dart';
import '../../shared/widgets/widgets.dart';
import '../details_page/details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // HomeModel? homeModel;
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context) ;
    return Scaffold(
        appBar: AppBar(
          title: Text('متجر ركن'),
        ),

        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

              Container(
                padding: EdgeInsetsDirectional.only(bottom: 10),
              height: 82,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) =>
                      buildCategory(context: context,title :cubit.categories[index],),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 25,
                  ),
                  itemCount:cubit.categories.length),
              ),
            GridView.count(
              shrinkWrap: true,

              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 1 / 2.17,
              mainAxisSpacing: 7,
              crossAxisSpacing: 7,
              children: List.generate(cubit.products.length,
                      (index) => buildProductInfoSquare(cubit.products[index], context)),
            )

              ],
            ),
          ),
        ));
  },
);
  }
}








Widget buildCategory({context, required String title}) =>
    BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);

  return InkWell(
      onTap: (){
        cubit.getCategoryDetails(category: title);
        navigateTo(context, CategoryDetailsPage(category: title));
        print(cubit.productsModel?.title);
        print(cubit.categoryDetails[0].category);

      },
      child: Container(
        width: 80,
        height: 30,

        decoration: BoxDecoration(
          color:mainColor,

          borderRadius: BorderRadius.circular(20)
        ),
        child: Center(child:  Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16,color: whiteColor,fontWeight: FontWeight.w600),
        ),),

      ),
    );
  },
);
