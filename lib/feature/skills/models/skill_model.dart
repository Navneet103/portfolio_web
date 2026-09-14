class SkillModel {
  final String name;
  final String iconPath; // Optional, can use icons instead
  final double level; // 0.0 to 1.0 if we use progress bars, but user said keep it light

  const SkillModel({
    required this.name,
    this.iconPath = '',
    this.level = 1.0,
  });
}
