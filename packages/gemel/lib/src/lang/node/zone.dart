///
class Zone {
  /// uniquity-by-package helpful to prevent updating many referers when moving.
  /// use a global id to prevent needing to id other contained things that don't
  /// have global ids by a variable-length list of zone path parts.
  final int id;

  Zone(this.id);
}
