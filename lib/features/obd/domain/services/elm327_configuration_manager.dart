class Elm327Configuration {
  final int defaultTimeoutMs;
  final bool enableHeaders;
  final bool enableLinefeeds;
  final bool enableSpaces;
  final String preferredProtocol;

  const Elm327Configuration({
    this.defaultTimeoutMs = 3000,
    this.enableHeaders = false,
    this.enableLinefeeds = false,
    this.enableSpaces = false,
    this.preferredProtocol = 'ATSP0',
  });
}

class Elm327ConfigurationManager {
  Elm327Configuration _config = const Elm327Configuration();

  Elm327Configuration get config => _config;

  void updateConfiguration(Elm327Configuration newConfig) {
    _config = newConfig;
  }
}
