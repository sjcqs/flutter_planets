import 'package:flutter/material.dart';
import 'package:planets/res/res.dart';
import 'package:planets/ui/detail/planet_detail_ui_model.dart';
import 'package:planets/ui/widgets/summary/planet_summary.dart';
import 'package:planets/ui/widgets/separator.dart';
import 'package:planets/ui/widgets/summary/planet_summary_ui_model.dart';

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
            _buildToolbar(context)
          ],
        ),
      ),
    );
  }

  Container _buildToolbar(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: BackButton(
        color: Colors.white,
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
