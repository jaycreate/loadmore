class Application {
  //

  static String listUrl = '';
  static String listApiKey = '';

  ///Singleton factory
  static final Application _instance = Application._internal();

  factory Application() {
    return _instance;
  }

  Application._internal();
}
