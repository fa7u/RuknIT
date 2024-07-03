import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/shared/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../app_cupit/app_cubit.dart';
import '../../app_cupit/app_states.dart';
import '../../models/products_model/products_model.dart';
import '../../pages/details_page/details_page.dart';

dynamic navigateTo(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (c) => screen));
}
dynamic navigateAndFinish(BuildContext context, Widget screen) {
  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (c) => screen));
}


Widget myDivider() => Divider(
      color: DARKCOLOR,
      thickness: .7,
    );



Widget defaultButton(
        {required context,
        required double width,
        required double height,
        required Function() function,
        required String title,
        required Color titleColor,
        Color buttonColor = mainColor,
        double radius = 5}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: buttonColor, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: titleColor,
                fontSize: 25,
              ),
        ),
      ),
    );






Widget buildProductInfoSquare(Products productsModel, context) =>
    BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return InkWell(
          onTap: (){
            navigateTo(context, DetailsPage(productsModel: productsModel,));
          },
          child: Container(

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: DARKBACKGROUND,
                      blurRadius: 2,
                      spreadRadius: 1,
                      blurStyle: BlurStyle.outer
                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height:190,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: productsModel.image!,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productsModel.title!,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 15,
                          color: DARKCOLOR,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [


                          RatingBar.builder(
                            itemSize: 16.0,
                            minRating: 1,
                            allowHalfRating: true,

                            initialRating: productsModel.rating!.rate!.toDouble(),
                            itemBuilder: (context, _ )
                            => Icon(
                              Icons.star ,
                              color: Colors.orange,
                              size: 10.0,
                            ),
                            onRatingUpdate: (rating)=>(){},
                          ),
                          SizedBox(width: 5),

                          Text('  ( ${productsModel.rating!.count.toString()} )',
                            style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),
                          )
                        ],
                      ),
                      SizedBox(height:10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            productsModel.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.w300,color: Colors.grey,fontSize: 16),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            height: 50,
                            width: 70,

                            decoration: BoxDecoration(

                              border:Border.all(
                                  width: 1.5,
                                  color: Colors.orange
                              ),
                              borderRadius: BorderRadius.circular(5),


                            ),

                            child: Text('-30% on pag',

                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(fontSize: 15,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,

                              ),
                            ),
                          ),

                          SizedBox(width: 10,),

                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 100,

                        height: 30,
                        decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: Center(
                          child: Text(

                            'Free Shipping',
                            textAlign: TextAlign.center,

                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(fontWeight: FontWeight.bold,color: whiteColor,
                              fontSize: 14,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );



