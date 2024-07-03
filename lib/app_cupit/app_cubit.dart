
import 'package:e_commerce/models/products_model/products_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../dio/dio_helper.dart';
import 'app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<Products> products = [];
  List<Products> categoryDetails = [];
  List<dynamic> categories = [];

  Products? productsModel  ;
  Future<void> getHomeData() async {
    emit(getHomeLoadingState());
    DioHelper.getData(url: 'products'
    ).then((value) async {



    for (Map jsonProduct in value.data) {
      products.add(Products.fromJson(jsonProduct));
      productsModel = Products.fromJson(jsonProduct);

    }


       // print(products.toString());
      emit(getHomeSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(getCategoriesErrorState());
    });
  }

  Future<void> geCategoriesData() async {
    emit(getCategoriesLoadingState());
    categories = [];
    //print('function opened');
    DioHelper.getData(url: 'products/categories'
    ).then((value) async {

    categories = value.data ;
    debugPrint(categories.toString());
    emit(getCategoriesSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(getCategoriesErrorState());
    });
  }


  Future<void> getCategoryDetails({required String category}) async {
    emit(getCategoryDetailsLoadingState());

    categoryDetails = [];
    DioHelper.getData(url: 'products/category/$category'
    ).then((value) async {


      for (Map jsonProduct in value.data) {
        categoryDetails.add(Products.fromJson(jsonProduct));
        productsModel = Products.fromJson(jsonProduct);

        print(productsModel?.category);
      }
      emit(getCategoryDetailsSuccessState());
    }).catchError((error) {
      debugPrint(error.toString());
      emit(getCategoryDetailsErrorState());
    });
  }



}
