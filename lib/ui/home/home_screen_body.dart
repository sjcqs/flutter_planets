import 'package:flutter/material.dart';
import 'package:planets/data/model/apod/apod.dart';
import 'package:planets/data/model/planet/planet.dart';
import 'package:planets/data/repository/apod_repository.dart';
import 'package:planets/data/repository/planet_repository.dart';
import 'package:planets/ui/detail/planet_detail.dart';
import 'package:planets/ui/detail/planet_detail_ui_model.dart';
import 'package:planets/ui/widgets/summary/planet_summary.dart';
import 'package:planets/ui/widgets/summary/planet_summary_ui_model.dart';

class PlanetChildDelegate extends SliverChildBuilderDelegate {
  PlanetChildDelegate(
    List<Planet> planets,
    Future<AstronomyObjectOfTheDay> future,
    PlanetSummaryUIModelMapper summaryMapper,
    PlanetDetailUIModelMapper detailMapper,
  ) : super(
          (context, index) => _buildItem(
                index,
                future,
                summaryMapper,
                planets,
                detailMapper,
                context,
              ),
          childCount: planets.length + 1,
        );

  static Widget _buildItem(
      int index,
      Future<AstronomyObjectOfTheDay> future,
      PlanetSummaryUIModelMapper summaryMapper,
      List<Planet> planets,
      PlanetDetailUIModelMapper detailMapper,
      BuildContext context) {
    if (index == 0) {
      return _buildAstronomyObject(future, summaryMapper, detailMapper);
    } else {
      return _buildPlanet(planets, index, summaryMapper, detailMapper, context);
    }
  }

  static PlanetSummaryWidget _buildPlanet(
    List<Planet> planets,
    int index,
    PlanetSummaryUIModelMapper summaryMapper,
    PlanetDetailUIModelMapper detailMapper,
    BuildContext context,
  ) {
    final planet = planets[index - 1];
    final summary = summaryMapper.mapPlanet(planet);
    final detail = detailMapper.mapPlanet(planet);
    return PlanetSummaryWidget(
      summary,
      () => Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => PlanetDetailScreen(detail),
              transitionsBuilder: _fadeTransition,
            ),
          ),
    );
  }

  static FutureBuilder<AstronomyObjectOfTheDay> _buildAstronomyObject(
    Future<AstronomyObjectOfTheDay> future,
    PlanetSummaryUIModelMapper summaryMapper,
    PlanetDetailUIModelMapper detailMapper,
  ) {
    return FutureBuilder<AstronomyObjectOfTheDay>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var summary = summaryMapper.mapAstronomyObjectOfTheDay(snapshot.data);
          var detail = detailMapper.mapAstronomyObjectOfTheDay(snapshot.data);
          return PlanetSummaryWidget(
            summary,
            () => Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (_, __, ___) => PlanetDetailScreen(detail),
                    transitionsBuilder: _fadeTransition,
                  ),
                ),
          );
        } else if (snapshot.hasError) {
          return Container();
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  static Widget _fadeTransition(
          context, animation, secondaryAnimation, child) =>
      FadeTransition(opacity: animation, child: child);
}

class HomeBody extends StatelessWidget {
  final planets = PlanetRepository.planets;
  final Future<AstronomyObjectOfTheDay> astronomyObjectOfTheDay =
      AstronomyObjectOfTheDayRepository.fetchAstronomyObjectOfTheDay();
  final PlanetSummaryUIModelMapper summaryMapper = PlanetSummaryUIModelMapper();
  final PlanetDetailUIModelMapper detailMapper = PlanetDetailUIModelMapper();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Color(0xFF736AB7),
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: <Widget>[
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            sliver: SliverList(
              delegate: PlanetChildDelegate(
                planets,
                astronomyObjectOfTheDay,
                summaryMapper,
                detailMapper,
              ),
              //itemExtent: 152.0,
            ),
          )
        ],
      ),
    ));
  }
}
