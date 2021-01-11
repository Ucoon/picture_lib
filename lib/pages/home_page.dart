import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:picture_lib/generated/l10n.dart';
import 'package:picture_lib/model/entity/result_entity.dart';
import 'package:picture_lib/model/home_model.dart';
import 'package:picture_lib/pages/base/base_page_stateful_widget.dart';
import 'package:picture_lib/utils/colors.dart';
import 'package:picture_lib/utils/image_helper.dart';
import 'package:picture_lib/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:quiver/strings.dart';
import 'package:tuple/tuple.dart';

class HomePage extends BasePageStatefulWidget {
  @override
  getState() => _HomePageState();
}

class _HomePageState extends BasePageStatefulWidgetState<HomePage> {
  TextEditingController _contentControl;
  HomeViewModel _homeViewModel;
  _getPictures() {
    String content = _contentControl.text;
    if (isBlank(content)) {
      EasyLoading.showToast('please enter a random number');
      return;
    }
    EasyLoading.show(status: "Loading...");
    _homeViewModel.getPictures(content).then((value) => EasyLoading.dismiss());
  }

  @override
  void initState() {
    super.initState();
    _contentControl = TextEditingController();
    _homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _homeViewModel.getAllPictures();
    });
  }

  @override
  void dispose() {
    _contentControl.dispose();
    super.dispose();
  }

  @override
  Widget buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(left: 25, right: 25),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.41,
            child: Image.asset(ImageHelper.getImageUrl('home_banner_bg', 'gif')),
          ),
          Container(
            width: 700,
            height: 467,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: ImageHelper.getImage('home_button_bg', 'png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: 200,
                  height: 29,
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: MyColors.grey_border_color, width: 1),
                  ),
                  child: TextField(
                    controller: _contentControl,
                    onChanged: (value) {
                      _homeViewModel.clearHomePictureList();
                    },
                    decoration: InputDecoration(
                      hintText: S.of(context).submit_hint,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: MyColors.grey_font_color,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: _getPictures,
                  child: Container(
                    width: 200,
                    height: 29,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 21),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: MyColors.red_border_color, width: 1),
                    ),
                    child: Text(
                      'SUBMIT TEXT',
                      style: TextStyle(
                        fontSize: 14,
                        color: MyColors.red_font_color,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  height: 29,
                  margin: EdgeInsets.only(top: 21),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: MyColors.red_border_color, width: 1),
                  ),
                  child: Text(
                    'GENERATE MONUMENT',
                    style: TextStyle(
                      fontSize: 14,
                      color: MyColors.red_font_color,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 200,
            child: _buildResultList(),
          ),
          Container(
            width: 817,
            height: 1156,
            child: ImageHelper.getIconPng('home_banner_bottom'),
          ),
        ],
      ),
    );
  }

  Widget _buildResultList() {
    return Selector<HomeModel, Tuple2<int, List<Result>>>(
      selector: (context, provider) {
        return Tuple2(provider.resultList.length, provider.resultList);
      },
      builder: (context, data, child) {
        return data.item1 == 0
            ? Container()
            : ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: data.item2?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    height: 206,
                    child: ImageHelper.getNetworkImage(data.item2[index].imageUrl, 'home_result_place_holder_icon'),
                  );
                },
              );
      },
    );
  }
}
