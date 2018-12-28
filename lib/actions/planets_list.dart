import 'package:flutter/foundation.dart';
import 'package:planets/data/model/apod/apod.dart';
import 'package:planets/data/model/planet/planet.dart';

abstract class FetchPlanetsAction {}

class FetchPlanetsRefreshAction extends FetchPlanetsAction {}

class FetchPlanetsRefreshingAction extends FetchPlanetsAction {}

class FetchPlanetsErrorAction extends FetchPlanetsAction {}

class FetchPlanetsSuccessAction extends FetchPlanetsAction {
  final Apod apod;
  final List<Planet> planets;

  FetchPlanetsSuccessAction({
    @required this.apod,
    @required this.planets,
  });
}
