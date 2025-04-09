import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/core/errors/failures.dart';
import 'package:ecommerce_app/core/utils/app_assets.dart';
import 'package:ecommerce_app/domain/entities/CategoryORBrandResponseEntity.dart';
import 'package:ecommerce_app/domain/usecases/get_all_brands_use_case.dart';
import 'package:ecommerce_app/domain/usecases/get_all_categories_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'home_tab_view_state.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  HomeTabViewModel(
      {required this.getAllCategoriesUseCase,
      required this.getAllBrandsUseCase})
      : super(CategoryInitialState());
  final List<String> announcementImages = [
    AppAssets.announcement1,
    AppAssets.announcement2,
    AppAssets.announcement3,
  ];

  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  List<CategoryOrBrandEntity> categoriesList = [];
  List<CategoryOrBrandEntity> brandList = [];

  void getAllCategories() async {
    emit(CategoryLoadingState());
    var either = await getAllCategoriesUseCase.call();
    either.fold((error) {
      emit(CategoryErrorState(errorMessage: error));
    }, (response) {
      categoriesList = response.data!;
      emit(CategorySuccessState(categoryResponseEntity: response));
    });
  }

  void getAllBrands() async {
    emit(BrandLoadingState());
    var either = await getAllBrandsUseCase.call();
    either.fold((error) {
      emit(BrandErrorState(errorMessage: error));
    }, (response) {
      brandList = response.data!;
      emit(BrandSuccessState(brandResponseEntity: response));
    });
  }
}
