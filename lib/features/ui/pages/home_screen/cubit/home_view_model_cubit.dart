import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/favorite_tab/favorite_tab.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/home_tab/home_tab.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/products_tab/products_tab.dart';
import 'package:ecommerce_app/features/ui/pages/home_screen/tabs/user_tab/user_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'home_view_model_state.dart';

@injectable
class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());
  int selectedIndex = 0;
  List<Widget> bodyList = [
    HomeTab(),
    ProductsTab(),
    FavoriteTab(),
    const UserTab()
  ];

  void bottomNavOnTap(int index) {
    selectedIndex = index;
    emit(ChangeBottomNavState());
  }
}
