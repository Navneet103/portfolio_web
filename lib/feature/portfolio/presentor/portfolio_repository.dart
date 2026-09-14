import 'portfolio_state.dart';

abstract class PortfolioRepository {
  Future<List<ProjectModel>> getProjects();
}
