import 'package:e_commerce/dio/dio_helper.dart';
import 'package:e_commerce/pages/home_page/home_page.dart';
import 'package:e_commerce/shared/styles/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_cupit/app_cubit.dart';

void main() {
  runApp(const MyApp());
  DioHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getHomeData()..geCategoriesData(),
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myLightTheme,
        home: const HomePage(),
      ),
    );
  }
}

