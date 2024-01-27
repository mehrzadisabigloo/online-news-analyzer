

import 'package:news_analysis_design/core/resources/data_state.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/entities/favorite_entity.dart';

abstract class FavoriteRepository{

  Future<DataState<FavoriteEntity>> fetchFavoriteNews();

}