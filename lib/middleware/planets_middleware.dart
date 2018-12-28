import 'package:planets/actions/planets_list.dart';
import 'package:planets/data/repository/apod_repository.dart';
import 'package:planets/data/repository/planet_repository.dart';
import 'package:planets/states/app_state.dart';
import 'package:redux/redux.dart';

Middleware<AppState> fetchPlanetsMiddleware =
    TypedMiddleware<AppState, FetchPlanetsRefreshAction>(_fetchPlanets);

void _fetchPlanets(Store<AppState> store, FetchPlanetsRefreshAction action,
    NextDispatcher next) async {
  store.dispatch(FetchPlanetsRefreshingAction());
  final planets = PlanetRepository.planets;
  final apod = await ApodRepository.fetchApod();
  store.dispatch(FetchPlanetsSuccessAction(apod: apod, planets: planets));
  next(action);
}
