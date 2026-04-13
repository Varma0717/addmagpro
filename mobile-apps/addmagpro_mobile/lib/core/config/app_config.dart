class AppConfig {
  static const String appName = 'AddMagPro';
  static const String apiBaseUrl = 'https://addmagpro.pmratnam.com/api/v1';
  static const String baseUrl = 'https://addmagpro.pmratnam.com';

  /// Ensures an image URL is absolute.
  /// Backend may return relative paths like `/storage/...`.
  static String? resolveImageUrl(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http://') || url.startsWith('https://')) return url;
    if (url.startsWith('/')) return '$baseUrl$url';
    return '$baseUrl/$url';
  }
}
