import 'package:picture_lib/configs/api.dart';
import 'package:picture_lib/http/http_utils.dart';
import 'package:picture_lib/model/entity/result_entity.dart';

///通用请求实现类
class CommonRepository {
  ///获取通用字典值
  static Future<ResultEntity> getPictures() async {
    var params = Map<String, dynamic>();
    params["limit"] = 500;
    final response = await HttpUtils.get(CommonApi.GET_PICTURES, params: params);
    return ResultEntity.fromJson(response);
  }
}
