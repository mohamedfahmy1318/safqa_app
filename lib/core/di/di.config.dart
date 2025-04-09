// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/data_sources/remote/auth_remote_data_Source_impl.dart'
    as _i436;
import '../../data/data_sources/remote/cart_remote_data_Sourse_impl.dart'
    as _i705;
import '../../data/data_sources/remote/home_remote_data_sourse_impl.dart'
    as _i486;
import '../../data/repo/autt_repo_impl.dart' as _i98;
import '../../data/repo/cart_repo_impl.dart' as _i818;
import '../../data/repo/home_repo_impl.dart' as _i330;
import '../../domain/repo/data_sources/remote/auth_remote-data_source.dart'
    as _i280;
import '../../domain/repo/data_sources/remote/cart_remote_data_sourse.dart'
    as _i58;
import '../../domain/repo/data_sources/remote/home_remote_data_source.dart'
    as _i1022;
import '../../domain/repo/repos/auth/auth_repo.dart' as _i819;
import '../../domain/repo/repos/cart/items_cart_repo.dart' as _i915;
import '../../domain/repo/repos/home/home_repo.dart' as _i950;
import '../../domain/usecases/add_cart_use_case.dart' as _i1024;
import '../../domain/usecases/delete_items_cart_use_case.dart' as _i200;
import '../../domain/usecases/get_all_brands_use_case.dart' as _i318;
import '../../domain/usecases/get_all_categories_use_case.dart' as _i716;
import '../../domain/usecases/get_all_products_use_case.dart' as _i436;
import '../../domain/usecases/get_cart_use_case.dart' as _i749;
import '../../domain/usecases/login_use_case.dart' as _i210;
import '../../domain/usecases/register_use_case.dart' as _i502;
import '../../domain/usecases/update_items_cart_use_case.dart' as _i683;
import '../../features/ui/auth/login/cubit_login/login_view_model_cubit.dart'
    as _i175;
import '../../features/ui/auth/register/cubit/register_view_model_cubit.dart'
    as _i277;
import '../../features/ui/pages/cart_screen/cubit/cart_view_model_cubit.dart'
    as _i122;
import '../../features/ui/pages/home_screen/cubit/home_view_model_cubit.dart'
    as _i573;
import '../../features/ui/pages/home_screen/tabs/home_tab/cubit/home_tab_view_cubit.dart'
    as _i470;
import '../../features/ui/pages/home_screen/tabs/products_tab/cubit/product_view_model_cubit.dart'
    as _i706;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i573.HomeViewModel>(() => _i573.HomeViewModel());
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i280.AuthRemoteDataSource>(() =>
        _i436.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()));
    gh.factory<_i819.AuthRepository>(() => _i98.AuthRepoImpl(
        authRemoteDataSource: gh<_i280.AuthRemoteDataSource>()));
    gh.factory<_i58.CartRemoteDataSource>(
        () => _i705.CartRemoteDataSourceImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i1022.HomeRemoteDataSource>(
        () => _i486.HomeRemoteDataSourseImpl(gh<_i1047.ApiManager>()));
    gh.factory<_i950.HomeRepo>(
        () => _i330.HomeRepoImpl(gh<_i1022.HomeRemoteDataSource>()));
    gh.factory<_i915.CartRepo>(() => _i818.CartRepoImpl(
        cartRemoteDataSource: gh<_i58.CartRemoteDataSource>()));
    gh.factory<_i210.LoginUseCase>(
        () => _i210.LoginUseCase(gh<_i819.AuthRepository>()));
    gh.factory<_i502.RegisterUseCase>(
        () => _i502.RegisterUseCase(gh<_i819.AuthRepository>()));
    gh.factory<_i1024.AddCartUseCase>(
        () => _i1024.AddCartUseCase(gh<_i950.HomeRepo>()));
    gh.factory<_i318.GetAllBrandsUseCase>(
        () => _i318.GetAllBrandsUseCase(gh<_i950.HomeRepo>()));
    gh.factory<_i716.GetAllCategoriesUseCase>(
        () => _i716.GetAllCategoriesUseCase(gh<_i950.HomeRepo>()));
    gh.factory<_i436.GetAllProductsUseCase>(
        () => _i436.GetAllProductsUseCase(gh<_i950.HomeRepo>()));
    gh.factory<_i706.ProductViewModel>(() => _i706.ProductViewModel(
          getAllProductsUseCase: gh<_i436.GetAllProductsUseCase>(),
          addCartUseCase: gh<_i1024.AddCartUseCase>(),
        ));
    gh.factory<_i470.HomeTabViewModel>(() => _i470.HomeTabViewModel(
          getAllCategoriesUseCase: gh<_i716.GetAllCategoriesUseCase>(),
          getAllBrandsUseCase: gh<_i318.GetAllBrandsUseCase>(),
        ));
    gh.factory<_i749.GetItemsInCartUseCase>(
        () => _i749.GetItemsInCartUseCase(gh<_i915.CartRepo>()));
    gh.factory<_i200.DeleteItemsInCartUseCase>(
        () => _i200.DeleteItemsInCartUseCase(gh<_i915.CartRepo>()));
    gh.factory<_i683.UpdateItemsInCartUseCase>(
        () => _i683.UpdateItemsInCartUseCase(gh<_i915.CartRepo>()));
    gh.factory<_i277.RegisterViewModel>(() =>
        _i277.RegisterViewModel(registerUseCase: gh<_i502.RegisterUseCase>()));
    gh.factory<_i175.LoginViewModel>(
        () => _i175.LoginViewModel(loginUseCase: gh<_i210.LoginUseCase>()));
    gh.factory<_i122.CartViewModelCubit>(() => _i122.CartViewModelCubit(
          getItemsInCartUseCase: gh<_i749.GetItemsInCartUseCase>(),
          deleteItemsInCartUseCase: gh<_i200.DeleteItemsInCartUseCase>(),
          updateItemsInCartUseCase: gh<_i683.UpdateItemsInCartUseCase>(),
        ));
    return this;
  }
}
