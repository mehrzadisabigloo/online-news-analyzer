import 'package:equatable/equatable.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/entities/main_page_entity.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object?> get props => [];
}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final List<MainPageEntity> newsModel;
  const NewsLoaded(this.newsModel);
}

class NewsError extends NewsState {
  final String? message;
  const NewsError(this.message);
}