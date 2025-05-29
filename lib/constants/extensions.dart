extension ExtensionOnNullString on String? {
  bool get isNullString => this == null || this!.isEmpty;
}
