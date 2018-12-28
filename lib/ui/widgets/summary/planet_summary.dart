import 'package:flutter/material.dart';
import 'package:planets/res/res.dart';
import 'package:planets/ui/widgets/separator.dart';
import 'package:planets/ui/widgets/summary/planet_summary_ui_model.dart';

enum Orientation { VERTICAL, HORIZONTAL }

typedef OnPlanetClickedCallback();

class PlanetSummaryWidget extends StatelessWidget {
  final PlanetSummaryUIModel uiModel;
  final Orientation orientation;
  final OnPlanetClickedCallback onPlanetClickedCallback;

  bool isHorizontal() => orientation == Orientation.HORIZONTAL;

  PlanetSummaryWidget(this.uiModel, this.onPlanetClickedCallback,
      {this.orientation = Orientation.HORIZONTAL});

  PlanetSummaryWidget.vertical(this.uiModel)
      : orientation = Orientation.VERTICAL,
        onPlanetClickedCallback = null;

  @override
  Widget build(BuildContext context) {
    final planetThumbnail = Container(
      margin: EdgeInsets.symmetric(vertical: Dimens.unit2),
      alignment: orientation == Orientation.HORIZONTAL
          ? FractionalOffset.centerLeft
          : FractionalOffset.center,
      child: Hero(
        tag: Strings.planetIconHeroTag(uiModel.id),
        child: Image(
          image: AssetImage(uiModel.image),
          height: Dimens.unit10,
          width: Dimens.unit10,
        ),
      ),
    );

    Row _planetValue(String image, String text) {
      return Row(
        children: <Widget>[
          Image.asset(image, height: 12.0),
          Container(width: Dimens.unit1),
          Text(text, style: AppTextStyle.regularTextStyle),
        ],
      );
    }

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
        isHorizontal() ? 76.0 : Dimens.unit2,
        isHorizontal() ? Dimens.unit2 : 42.0,
        Dimens.unit2,
        Dimens.unit2,
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: isHorizontal()
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(
            uiModel.title,
            style: AppTextStyle.headerTextStyle,
          ),
          Container(height: 10.0),
          Text(
            uiModel.subtitle,
            style: AppTextStyle.subHeaderTextStyle,
          ),
          Separator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: isHorizontal() ? 1 : 0,
                child: _planetValue(uiModel.leftIcon, uiModel.leftField),
              ),
              Container(
                width: isHorizontal() ? 0 : Dimens.unit2,
              ),
              Expanded(
                flex: isHorizontal() ? 1 : 0,
                child: _planetValue(uiModel.rightIcon, uiModel.rightField),
              )
            ],
          )
        ],
      ),
    );

    final planetCard = Container(
      height: isHorizontal() ? 124.0 : 154.0,
      margin: isHorizontal()
          ? EdgeInsets.only(left: Dimens.unit5)
          : EdgeInsets.only(top: Dimens.unit8),
      child: planetCardContent,
      decoration: BoxDecoration(
          color: AppColors.rhino,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(Dimens.unit1),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 1.0),
            ),
          ]),
    );

    return GestureDetector(
      onTap: () {
        if (onPlanetClickedCallback != null) {
          onPlanetClickedCallback();
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
            vertical: Dimens.unit2, horizontal: Dimens.unit3),
        child: Stack(
          children: <Widget>[
            planetCard,
            planetThumbnail,
          ],
        ),
      ),
    );
  }
}
