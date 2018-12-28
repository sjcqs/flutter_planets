import 'package:planets/actions/planets_list.dart';
import 'package:planets/states/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> planetsReducer = combineReducers([
  TypedReducer<AppState, FetchPlanetsRefreshingAction>(_fetchPlanet),
  TypedReducer<AppState, FetchPlanetsSuccessAction>(_planetsFetched),
  TypedReducer<AppState, FetchPlanetsErrorAction>(_fetchPlanetError),
]);

AppState _fetchPlanet(AppState state, FetchPlanetsRefreshingAction action) =>
    state.copy(state: UiState.LOADING);

AppState _planetsFetched(AppState state, FetchPlanetsSuccessAction action) =>
    state.copy(
        apod: action.apod, planets: action.planets, state: UiState.CONTENT);

AppState _fetchPlanetError(AppState state, FetchPlanetsErrorAction action) =>
    state.copy(state: UiState.ERROR);
