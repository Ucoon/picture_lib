import 'dart:convert';

///路由传参封装类
///参考：https://juejin.cn/post/6844903941503713294#heading-4
class Bundle {
  Map<String, dynamic> _map = {};

  _setValue(var k, var v) => _map[k] = v;

  _getValue(String k) {
    if (_map == null || !_map.containsKey(k)) {
      throw Exception('key does not exist');
    }
    return _map[k];
  }

  putInt(String k, int v) => _setValue(k, v);

  int getInt(String k) => _getValue(k) as int;

  putDouble(String k, double v) => _setValue(k, v);

  double getDouble(String k) => _getValue(k) as double;

  putString(String k, String v, {bool isComponent = false}) {
    if (isComponent) {
      _setValue(k, Uri.encodeComponent(v));
    } else {
      _setValue(k, v);
    }
  }

  String getString(String k, {bool isComponent = false}){
    if(isComponent){
      return Uri.decodeComponent(_getValue(k) as String);
    }else{
      return _getValue(k) as String;
    }
  }

  putBool(String k, bool v) => _setValue(k, v);

  bool getBool(String k) => _getValue(k) as bool;

  putList<V>(String k, List<V> v) => _setValue(k, v);

  List getList(String k) => _getValue(k) as List;

  putMap<K, V>(String k, Map<K, V> v) => _setValue(k, v);

  Map getMap(String k) => _getValue(k) as Map;

  @override
  String toString() {
    return _map.toString();
  }

  String toJson() {
    return json.encode(_map);
  }

  void setMap(Map<String, dynamic> value) {
    _map = value;
  }

  static Bundle convert(Map<String, List<String>> params) {
    Bundle bundle;
    if (params != null && params.containsKey('arguments')) {
      bundle = Bundle()..setMap(json.decode(params['arguments']?.first));
    }
    return bundle;
  }
}
