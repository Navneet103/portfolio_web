import '../presentor/portfolio_repository.dart';
import '../presentor/portfolio_state.dart';
import 'portfolio_data_source.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  final PortfolioDataSource dataSource;

  PortfolioRepositoryImpl({required this.dataSource});

  @override
  Future<List<ProjectModel>> getProjects() async {
    return await dataSource.getProjects();
  }
}
