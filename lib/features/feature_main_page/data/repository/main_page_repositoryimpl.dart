import 'package:dio/dio.dart';
import 'package:news_analysis_design/core/resources/data_state.dart';
import 'package:news_analysis_design/features/feature_main_page/data/data_source/remote/apiprovider.dart';
import 'package:news_analysis_design/features/feature_main_page/data/model/newsArticle.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/entities/main_page_entity.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/repository/main_page_repository.dart';

class MainPageRepositoryImpl extends MainPageRepository{
  MainPageApiProvider mainPageApiProvider;
  MainPageRepositoryImpl(this.mainPageApiProvider);

  @override
  Future<DataState<MainPageEntity>> fetchMainPageNews() async {
    try{
      Response response = await mainPageApiProvider.fetchNewsList();
      if(response.statusCode == 200){
        List<dynamic> dataList = response.data as List<dynamic>;
        List<MainPageEntity> mainPageEntity = dataList
            .map((item) => NewsArticle.fromJson(item as Map<String, dynamic>)).cast<MainPageEntity>()
            .toList();
        return DataSuccess(mainPageEntity);
      }
      else{
        return const DataFailed("Something Went Wrong");
      }


    }catch(e){
      return const DataFailed("Please Check Your Connection");
    }
  }


}
