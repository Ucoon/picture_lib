import 'package:picture_lib/model/entity/result_entity.dart';
import 'package:picture_lib/model/home_model.dart';
import 'package:picture_lib/provider/view_state_model.dart';
import 'package:picture_lib/repository/common_repository.dart';

///当前用户视图数据绑定类
class HomeViewModel extends ViewStateModel {
  final HomeModel homeModel;

  HomeViewModel(this.homeModel) : assert(homeModel != null);

  Future<int> getAllPictures() async {
    setBusy();
    ResultEntity resultEntity = await CommonRepository.getPictures();
    homeModel.saveAllPictureList(resultEntity);
    setIdle();
    return resultEntity?.results?.length ?? 0;
  }

  Future<int> getPictures() async {
    setBusy();
    homeModel.saveHomePictureList();
    setIdle();
    return homeModel?.resultList?.length ?? 0;
  }

  Future<int> clearHomePictureList() async {
    setBusy();
    homeModel.clearHomePictureList();
    setIdle();
    return homeModel?.resultList?.length ?? 0;
  }

  Future<int> clearAllPictureList() async {
    setBusy();
    homeModel.clearAllPictureList();
    setIdle();
    return 0;
  }
}
