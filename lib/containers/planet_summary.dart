import 'package:flutter/material.dart';
import 'package:planets/containers/icon_text.dart';
import 'package:planets/res/res.dart';
import 'package:planets/containers/separator.dart';
import 'package:planets/models/planet_summary.dart';

enum Orientation { VERTICAL, HORIZONTAL }

typedef OnPlanetClickedCallback();

class PlanetSummaryWidget extends StatelessWidget {
  final PlanetSummaryUIModel model;
  final Orientation orientation;
  final OnPlanetClickedCallback onPlanetClickedCallback;

  bool get isHorizontal => orientation == Orientation.HORIZONTAL;

  PlanetSummaryWidget(this.model, this.onPlanetClickedCallback,
      {this.orientation = Orientation.HORIZONTAL});

  PlanetSummaryWidget.vertical(this.model)
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
        tag: Strings.planetIconHeroTag(model.id),
        child: Image(
          image: AssetImage(model.image),
          height: Dimens.unit10,
          width: Dimens.unit10,
        ),
      ),
    );

    final planetCardContent = Container(
      margin: EdgeInsets.fromLTRB(
        isHorizontal ? 76.0 : Dimens.unit2,
        isHorizontal ? Dimens.unit2 : 42.0,
        Dimens.unit2,
        Dimens.unit2,
      ),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment:
            isHorizontal ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: <Widget>[
          Container(height: 4.0),
          Text(model.title, style: AppTextStyle.headerTextStyle),
          Container(height: 10.0),
          Text(model.subtitle, style: AppTextStyle.subHeaderTextStyle),
          Separator(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CompoundIconText(
                icon: model.leftIcon,
                text: model.leftField,
                flex: isHorizontal ? 1 : 0,
              ),
              Container(
                width: isHorizontal ? 0 : Dimens.unit2,
              ),
              CompoundIconText(
                icon: model.rightIcon,
                text: model.rightField,
                flex: isHorizontal ? 1 : 0,
              ),
            ],
          )
        ],
      ),
    );

    final planetCard = Container(
      height: isHorizontal ? 124.0 : 154.0,
      margin: isHorizontal
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
