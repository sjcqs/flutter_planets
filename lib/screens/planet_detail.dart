import 'package:flutter/material.dart';
import 'package:planets/containers/planet_summary.dart';
import 'package:planets/containers/separator.dart';
import 'package:planets/containers/transparent_app_bar.dart';
import 'package:planets/models/planet_detail.dart';
import 'package:planets/models/planet_summary.dart';
import 'package:planets/res/res.dart';

class PlanetDetailScreen extends StatelessWidget {
  final PlanetDetailUIModel model;
  final PlanetSummaryUIModelMapper mapper = PlanetSummaryUIModelMapper();
  PlanetDetailScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: BoxConstraints.expand(),
        color: AppColors.deluge,
        child: Stack(
          children: <Widget>[
            _buildBackground(),
            _buildGradient(),
            _buildContent(),
            TransparentAppBar()
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    return ListView(
      padding: EdgeInsets.fromLTRB(0.0, Dimens.unit8, 0.0, Dimens.unit4),
      children: <Widget>[
        PlanetSummaryWidget.vertical(model.summaryUiModel),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: Dimens.unit3, vertical: Dimens.unit3),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.deluge00,
                AppColors.deluge,
              ],
              stops: [0.0, 0.1],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.0, 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                Strings.planetDetailTitle,
                style: AppTextStyle.headerTextStyle,
              ),
              Separator(),
              Text(model.description, style: AppTextStyle.commonTextStyle)
            ],
          ),
        )
      ],
    );
  }

  Container _buildGradient() {
    return Container(
      margin: EdgeInsets.only(top: 190.0),
      height: 120.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.deluge00,
            AppColors.deluge,
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _buildBackground() {
    final planetDetailBackgroundHeight = Dimens.planetDetailBackgroundHeight;
    return Container(
      child: Image.network(
        model.background,
        fit: BoxFit.cover,
        height: planetDetailBackgroundHeight,
      ),
      constraints: BoxConstraints.expand(height: planetDetailBackgroundHeight),
    );
  }
}
