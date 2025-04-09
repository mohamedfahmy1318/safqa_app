part of 'home_view_model_cubit.dart';

@immutable
sealed class HomeStates {}

final class HomeInitialState extends HomeStates {}

final class ChangeBottomNavState extends HomeStates {}
