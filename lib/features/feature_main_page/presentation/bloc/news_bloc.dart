import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_analysis_design/core/resources/data_state.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/entities/main_page_entity.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/usecase/main_page_usecase.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_event.dart';
import 'package:news_analysis_design/features/feature_main_page/presentation/bloc/news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final MainPageUseCase mainPageUseCase;
  NewsBloc(this.mainPageUseCase) : super(NewsInitial()) {
    on<GetNewsList>((event, emit) async {
        emit(NewsLoading());
        DataState dataState = await mainPageUseCase('');
        if(dataState is DataSuccess){
          emit(NewsLoaded(dataState.data as List<MainPageEntity>));
        }
        else{
          emit(NewsError(dataState.error.toString()));
        }
    });
  }
}
