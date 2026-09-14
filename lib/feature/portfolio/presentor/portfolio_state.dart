import 'package:flutter/foundation.dart';

@immutable
abstract class PortfolioState {
  const PortfolioState();
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<ProjectModel> projects;
  const PortfolioLoaded(this.projects);
}

class PortfolioError extends PortfolioState {
  final String message;
  const PortfolioError(this.message);
}

class ProjectModel {
  final String title;
  final String description;
  final List<String> techStack;
  final String impactMetric;
  final String architecture;
  final List<String> tags;

  const ProjectModel({
    required this.title,
    required this.description,
    required this.techStack,
    required this.impactMetric,
    required this.architecture,
    required this.tags,
  });
}
