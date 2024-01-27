
import 'package:news_analysis_design/features/feature_favorite/domain/entities/favorite_entity.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/repository/favorite_repository.dart';

import '../../../../core/resources/data_state.dart';
import '../../../../core/usecase/use_case.dart';

class FavoriteUseCase extends UseCase<DataState<FavoriteEntity>, String>{
  final FavoriteRepository favoriteRepository;
  FavoriteUseCase(this.favoriteRepository);
  @override
  Future<DataState<FavoriteEntity>> call(String param) {
    return favoriteRepository.fetchFavoriteNews();
  }


}