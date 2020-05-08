extension StringExtensions on String {
  String stripMargin() => this.splitMapJoin(RegExp(r'^', multiLine: true),
      onMatch: (_) => "\n", onNonMatch: (s) => s.trim());
}
