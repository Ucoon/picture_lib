///全局配置
class Global{
  ///token
  static bool retryEnable = true;

  ///是否release
  static bool get isRelease => const bool.fromEnvironment('dart.vm.product');

  static String get bmobApplicationId => 'cd5cb3217d97fe58823f615602c8fced';
  static String get bmobRestApiKey => '01539a41ae20e22df5f422524736a4d7';
}