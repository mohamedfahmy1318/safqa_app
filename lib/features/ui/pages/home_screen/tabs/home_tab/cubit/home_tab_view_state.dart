part of 'home_tab_view_cubit.dart';

@immutable
sealed class HomeTabStates {}

final class CategoryInitialState extends HomeTabStates {}

final class CategoryLoadingState extends HomeTabStates {}

final class CategorySuccessState extends HomeTabStates {
  final CategoryOrBrandResponseEntity categoryResponseEntity;
  CategorySuccessState({required this.categoryResponseEntity});
}

final class CategoryErrorState extends HomeTabStates {
  final Failures errorMessage;
  CategoryErrorState({required this.errorMessage});
}

final class BrandLoadingState extends HomeTabStates {}

final class BrandSuccessState extends HomeTabStates {
  final CategoryOrBrandResponseEntity brandResponseEntity;
  BrandSuccessState({required this.brandResponseEntity});
}

final class BrandErrorState extends HomeTabStates {
  final Failures errorMessage;
  BrandErrorState({required this.errorMessage});
}
