import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import '../../../injection_container.dart';
import 'portfolio_repository.dart';
import 'portfolio_state.dart';

final portfolioProvider = StateNotifierProvider<PortfolioNotifier, PortfolioState>((ref) {
  return PortfolioNotifier(sl<PortfolioRepository>());
});

class PortfolioNotifier extends StateNotifier<PortfolioState> {
  final PortfolioRepository repository;

  PortfolioNotifier(this.repository) : super(PortfolioInitial()) {
    getProjects();
  }

  Future<void> getProjects() async {
    state = PortfolioLoading();
    try {
      final projects = await repository.getProjects();
      state = PortfolioLoaded(projects);
    } catch (e) {
      state = PortfolioError(e.toString());
    }
  }
}
