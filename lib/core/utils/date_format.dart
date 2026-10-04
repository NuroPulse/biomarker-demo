/// Local date and time as "dd/MM/yyyy HH:mm". Stored times are UTC and shown
/// in the device's time zone.
String formatLocalDateTime(DateTime utc) {
  final local = utc.toLocal();
  String two(int n) => n.toString().padLeft(2, '0');
  return '${two(local.day)}/${two(local.month)}/${local.year} '
      '${two(local.hour)}:${two(local.minute)}';
}
