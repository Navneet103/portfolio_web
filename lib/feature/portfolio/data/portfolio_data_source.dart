import '../presentor/portfolio_state.dart';

abstract class PortfolioDataSource {
  Future<List<ProjectModel>> getProjects();
}

class PortfolioDataSourceImpl implements PortfolioDataSource {
  @override
  Future<List<ProjectModel>> getProjects() async {
    // Simulating API call/Local Fetch
    await Future.delayed(const Duration(milliseconds: 800));
    return [
      const ProjectModel(
        title: "Nexus Core - Enterprise ERP",
        description: "A high-performance ERP system built for multi-tenant cloud infrastructure, featuring real-time inventory sync and predictive analytics.",
        techStack: ["Flutter", "Riverpod", "gRPC", "PostgreSQL"],
        impactMetric: "Reduced latency by 40% across 50k DAUs",
        architecture: "Clean Architecture + Feature-First",
        tags: ["FinTech", "Scalability", "Real-time"],
      ),
      const ProjectModel(
        title: "OmniHealth AI",
        description: "AI-driven telemedicine platform with offline-first capabilities and secure medical data encryption.",
        techStack: ["Flutter", "Isar DB", "TensorFlow Lite", "WebRTC"],
        impactMetric: "99.9% sync reliability in low-bandwidth zones",
        architecture: "MVVM-C with Repository Pattern",
        tags: ["HealthTech", "AI/ML", "Offline-First"],
      ),
      const ProjectModel(
        title: "CryptoStream Pro",
        description: "Low-latency cryptocurrency trading dashboard with custom Canvas-based charting engine.",
        techStack: ["Flutter Web", "CustomPainter", "WebSockets", "GetIt"],
        impactMetric: "60 FPS rendering for 1000+ data points",
        architecture: "Redux-inspired deterministic state",
        tags: ["Web3", "Graphics", "Performance"],
      ),
    ];
  }
}
