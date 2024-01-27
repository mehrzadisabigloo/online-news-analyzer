import 'package:news_analysis_design/core/resources/data_state.dart';
import 'package:news_analysis_design/core/usecase/use_case.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/entities/main_page_entity.dart';
import 'package:news_analysis_design/features/feature_main_page/domain/repository/main_page_repository.dart';

class MainPageUseCase extends UseCase<DataState<MainPageEntity>, String>{
  final MainPageRepository mainPageRepository;
  MainPageUseCase(this.mainPageRepository);

  @override
  Future<DataState<MainPageEntity>> call(String param) {
    return mainPageRepository.fetchMainPageNews();
  }


}