import 'package:dio/dio.dart';
import 'package:news_analysis_design/core/resources/data_state.dart';
import 'package:news_analysis_design/features/feature_favorite/data/data_source/remote/apiprovider.dart';
import 'package:news_analysis_design/features/feature_favorite/data/model/newsArticle.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/entities/favorite_entity.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/repository/favorite_repository.dart';


class FavoriteRepositoryImpl extends FavoriteRepository{
  FavoriteApiProvider favoriteApiProvider;
  FavoriteRepositoryImpl(this.favoriteApiProvider);

  @override
  Future<DataState<FavoriteEntity>> fetchFavoriteNews() async {
    try{
      Response response = await favoriteApiProvider.fetchNewsList();
      if(response.statusCode == 200){
        List<dynamic> dataList = response.data as List<dynamic>;
        List<FavoriteEntity> favoriteEntity = dataList
            .map((item) => NewsArticle.fromJson(item as Map<String, dynamic>)).cast<FavoriteEntity>()
            .toList();


        return DataSuccess(favoriteEntity);
      }
      else{
        return const DataFailed("Something Went Wrong");
      }


    }catch(e){
      return const DataFailed("Please Check Your Connection");
    }
  }



}
