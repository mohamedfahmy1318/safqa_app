import 'package:ecommerce_app/core/cache/shared_pref_helper.dart';
import 'package:ecommerce_app/core/di/di.dart';
import 'package:ecommerce_app/core/utils/bloc_observer.dart';
import 'package:ecommerce_app/features/ui/pages/cart_screen/cubit/cart_view_model_cubit.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/cubit/product_view_model_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_routes.dart';
import 'core/utils/app_theme.dart';
import 'features/ui/auth/login/login_screen.dart';
import 'features/ui/auth/register/register_screen.dart';
import 'features/ui/pages/cart_screen/cart_screen.dart';
import 'features/ui/pages/home_screen/home_screen.dart';
import 'features/ui/pages/product_details_screen/product_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  await SharedPrefHelper.init();
  String routeName;
  var token = SharedPrefHelper.getData(key: 'token');
  if (token == null) {
    routeName = AppRoutes.loginRoute;
  } else {
    routeName = AppRoutes.homeRoute;
  }
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<ProductViewModel>(),
        ),
        BlocProvider(
          create: (context) => getIt<CartViewModelCubit>(),
        ),
      ],
      child: MyApp(routeName: routeName),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.routeName});

  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: routeName,
          routes: {
            AppRoutes.loginRoute: (context) => const LoginScreen(),
            AppRoutes.registerRoute: (context) => const RegisterScreen(),
            AppRoutes.homeRoute: (context) => HomeScreen(),
            AppRoutes.cartRoute: (context) => CartScreen(),
            AppRoutes.productRoute: (context) => const ProductDetailsScreen(),
          },
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
