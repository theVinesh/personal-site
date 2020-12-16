enum ScreenSize { small, medium, large, xlarge }

extension XScreenSize on ScreenSize {
  // ignore: missing_return
  double maxDiagonalInInches() {
    switch (this) {
      case ScreenSize.small:
        return 7.0;
      case ScreenSize.medium:
        return 13.0;
      case ScreenSize.large:
        return 19.0;
      case ScreenSize.xlarge:
        return double.maxFinite;
    }
  }

  bool operator <(ScreenSize other) =>
      this.maxDiagonalInInches() < other.maxDiagonalInInches();

  bool operator >(ScreenSize other) =>
      this.maxDiagonalInInches() > other.maxDiagonalInInches();

  bool operator <=(ScreenSize other) =>
      this.maxDiagonalInInches() <= other.maxDiagonalInInches();

  bool operator >=(ScreenSize other) =>
      this.maxDiagonalInInches() >= other.maxDiagonalInInches();
}
