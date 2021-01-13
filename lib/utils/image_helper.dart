import 'package:flutter/cupertino.dart';
import 'package:quiver/strings.dart';

///图片管理类
class ImageHelper {
  static const String imagePrefix = 'http://ucoon.gitee.io/myblogimg/';
  static String wrapUrl(String url) {
    if (url.startsWith('http')) {
      return url;
    } else {}
    return imagePrefix + url;
  }
  static Widget getIconPng(String url, {double iconSize}) {
    return getIcon(url, "png", iconSize: iconSize);
  }

  static Widget getIconJpg(String url, {double iconSize}) {
    return getIcon(url, "jpg", iconSize: iconSize);
  }

  static Widget getIcon(String url, String suffix, {double iconSize}) {
    return Image(
      image: getImage(url, suffix),
      width: iconSize,
      color: null,
    );
  }

  static AssetImage getImage(String url, String suffix) {
    return AssetImage("assets/images/$url.$suffix");
  }

  static String getImageUrl(String url, String suffix){
    return "assets/images/3.0x/$url.$suffix";
  }

  static Widget getNetworkImage(String url, String placeholderIcon, {double width, double height, String suffix : 'png'}){
    return isBlank(url) ? getIconPng(placeholderIcon) : FadeInImage.assetNetwork(
      fit: BoxFit.fill,
      width: width,
      height: height,
      placeholder: ImageHelper.getImageUrl(placeholderIcon, suffix),
      image: url ?? '',
    );
  }

  static Widget getNetworkGif(String url, String placeholderIcon, {double width, double height}){
    return isBlank(url) ? Image.asset(ImageHelper.getImageUrl(placeholderIcon, 'gif')) : FadeInImage.assetNetwork(
      fit: BoxFit.fill,
      width: width,
      height: height,
      placeholder: ImageHelper.getImageUrl(placeholderIcon, 'gif'),
      image: url ?? '',
    );
  }
}
