import 'package:picture_lib/model/home_model.dart';
import 'package:picture_lib/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

/// 独立的model
List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<HomeModel>(create: (context) => HomeModel()),
];

/// 需要依赖的model
/// UserModel依赖globalFavouriteStateModel
List<SingleChildWidget> dependentServices = [
  ChangeNotifierProxyProvider<HomeModel, HomeViewModel>(
    create: null,
    update: (context, homeModel, homeViewModel) => homeViewModel ?? HomeViewModel(homeModel),
  ),
];
