import 'package:planets/data/model/apod/apod.dart';
import 'package:planets/data/model/planet/planet.dart';

class AppState {
  final UiState state;
  final Apod apod;
  final List<Planet> planets;
  AppState(this.state, this.apod, this.planets);

  AppState.initial()
      : state = UiState.LOADING,
        planets = List.unmodifiable([]),
        apod = null;

  AppState copy({UiState state, Apod apod, List<Planet> planets}) =>
      AppState(state ?? this.state, apod ?? this.apod, planets ?? this.planets);
}

enum UiState { LOADING, CONTENT, ERROR }
