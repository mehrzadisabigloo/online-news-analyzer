

import 'package:news_analysis_design/core/resources/data_state.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/entities/main_page_entity.dart';

abstract class MainPageRepository{

  Future<DataState<MainPageEntity>> fetchMainPageNews();

}