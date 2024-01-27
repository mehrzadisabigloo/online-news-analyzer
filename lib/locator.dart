import 'package:get_it/get_it.dart';
import 'package:news_analysis_design/features/feature_favorite/data/data_source/remote/apiprovider.dart';
import 'package:news_analysis_design/features/feature_favorite/data/repository/favorite_repositoryimpl.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/repository/favorite_repository.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/usecase/favorite_usecase.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/bloc/news_bloc.dart';
import 'package:news_analysis_design/features/feature_main_page/data/data_source/remote/apiprovider.dart';
import 'package:news_analysis_design/features/feature_main_page/data/repository/main_page_repositoryimpl.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/repository/main_page_repository.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/usecase/main_page_usecase.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_bloc.dart';

GetIt locator = GetIt.instance;

setup(){
  locator.registerSingleton<MainPageApiProvider>(MainPageApiProvider());
  locator.registerSingleton<FavoriteApiProvider>(FavoriteApiProvider());

  //repository
  locator.registerSingleton<MainPageRepository>(MainPageRepositoryImpl(locator()));
  locator.registerSingleton<FavoriteRepository>(FavoriteRepositoryImpl(locator()));


  //usecase
  locator.registerSingleton<MainPageUseCase>(MainPageUseCase(locator()));
  locator.registerSingleton<FavoriteUseCase>(FavoriteUseCase(locator()));


  //bloc
  locator.registerSingleton<FavoriteNewsBloc>(FavoriteNewsBloc(locator()));
  locator.registerSingleton<NewsBloc>(NewsBloc(locator()));
}