import 'package:flutter/material.dart';
import 'package:planets/res/style.dart';
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
        color: Color(0xFF736AB7),
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
      padding: EdgeInsets.fromLTRB(0.0, 72.0, 0.0, 32.0),
      children: <Widget>[
        PlanetSummaryWidget.vertical(model.summaryUiModel),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0x00736AB7),
                Color(0xFF736AB7),
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
                "overview".toUpperCase(),
                style: Style.headerTextStyle,
              ),
              Separator(),
              Text(model.description, style: Style.commonTextStyle)
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
            Color(0x00736AB7),
            Color(0xFF736AB7),
          ],
          stops: [0.0, 0.9],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(0.0, 1.0),
        ),
      ),
    );
  }

  Container _buildBackground() {
    return Container(
      child: Image.network(
        model.background,
        fit: BoxFit.cover,
        height: 300.0,
      ),
      constraints: BoxConstraints.expand(height: 300.0),
    );
  }
}
