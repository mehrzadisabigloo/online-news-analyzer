

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_analysis_design/features/feature_favorite/domain/entities/favorite_entity.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/bloc/news_event.dart';
import 'package:news_analysis_design/features/feature_favorite/presentation/bloc/news_state.dart';

import '../../../../core/resources/data_state.dart';
import '../../domain/usecase/favorite_usecase.dart';

class FavoriteNewsBloc extends Bloc<NewsEvent, NewsState> {
  final FavoriteUseCase favoriteUseCase;

  FavoriteNewsBloc(this.favoriteUseCase) : super(NewsInitial()) {
    on<GetFavoriteNewsList>((event, emit) async {
      emit(NewsLoading());
      DataState dataState = await favoriteUseCase('');
      if(dataState is DataSuccess){
        print("hello");
        emit(NewsLoaded(dataState.data as List<FavoriteEntity>));
      }
      else{
        emit(NewsError(dataState.error.toString()));
      }

    });
  }
}
