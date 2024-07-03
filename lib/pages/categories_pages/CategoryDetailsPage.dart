import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../app_cupit/app_cubit.dart';
import '../../app_cupit/app_states.dart';
import '../../models/products_model/products_model.dart';
import '../../shared/widgets/widgets.dart';
import '../home_page/home_page.dart';

class CategoryDetailsPage extends StatelessWidget {
  final String category;

  const CategoryDetailsPage({Key? key, required this.category})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
            appBar:AppBar(
              title: Text('الفئات'),
            ),
            body: ConditionalBuilder(
                condition: cubit.categoryDetails.isNotEmpty,
                builder: (context) =>
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [


                            GridView.count(
                              shrinkWrap: true,

                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 1 / 2.17,
                              mainAxisSpacing: 7,
                              crossAxisSpacing: 7,
                              children: List.generate(
                                  cubit.categoryDetails.length,
                                      (index) =>
                                      buildProductInfoSquare(
                                          cubit.categoryDetails[index],
                                          context)),
                            )

                          ],
                        ),
                      ),
                    ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator(),)));
      },
    );
  }

}