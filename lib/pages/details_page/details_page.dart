import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce/pages/home_page/home_page.dart';
import 'package:e_commerce/shared/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../app_cupit/app_cubit.dart';
import '../../app_cupit/app_states.dart';
import '../../models/products_model/products_model.dart';
import '../../shared/styles/colors/colors.dart';


class DetailsPage extends StatelessWidget {
final Products productsModel;
  const DetailsPage({Key? key, required this.productsModel}) : super(key: key,) ;


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    var cubit = AppCubit.get(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('التفاصيل'),
      ),
      body: Padding(
        padding: EdgeInsetsDirectional.all(15),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              headerPic(context,productsModel),
              SizedBox(
                height: 10,
              ),
              nameAndQuantity(context,productsModel),
              SizedBox(
                height: 15,
              ),
              evaluationAndPrice(context,productsModel),
              SizedBox(
                height: 15,
              ),
              Text(
                productsModel.description!,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodySmall,
              ),

              myDivider(),
              Container(
                padding: EdgeInsetsDirectional.only(bottom: 10),
                height: 82,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>detailsSuggestions(productsModel:cubit.products[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      width: 25,
                    ),
                    itemCount:cubit.products.length),
              ),
              defaultButton(
                  context: context,
                  width: double.infinity,
                  height: 70,
                  function: (){},
                  title: 'اضافة الى حقيبة التسوق',
                  titleColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  },
);
  }
}

Container headerPic(BuildContext context , Products productsModel) {
  return Container(
    width: double.infinity,
    height: MediaQuery.of(context).size.height / 3,
    child: CachedNetworkImage(
      imageUrl: productsModel.image!,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}

Row nameAndQuantity(BuildContext context, Products productsModel) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

      Expanded(
        child: Container(
          alignment: AlignmentDirectional.topEnd,
          child: Wrap(
            children: [
              Text(
                productsModel.title!,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

Row evaluationAndPrice(BuildContext context, Products productsModel) {
  return Row(
    children: [
      Text(
       productsModel.price!.toString(),
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      Spacer(),
      RatingBar.builder(
        itemSize: 20,
        initialRating: productsModel.rating!.rate!.toDouble(),
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: false,
        itemCount: 5,

        itemPadding: EdgeInsets.symmetric(horizontal: 1),
        itemBuilder: (context, _) => Icon(
          Icons.star,
          color: Colors.amber,
        ),
        onRatingUpdate: (rating) {},
      ),
    ],
  );
}


Widget detailsSuggestions({context, Products? productsModel}) =>
    BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);

        return InkWell(
          onTap: (){
            navigateTo(context, DetailsPage(productsModel: productsModel));


          },
          child: Container(
            width: 80,
            height: 30,

            decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20)
            ),
            child: CachedNetworkImage(
              imageUrl: productsModel!.image!,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),

          ),
        );
      },
    );