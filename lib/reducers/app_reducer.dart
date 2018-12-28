import 'package:planets/reducers/planets_reducers.dart';
import 'package:planets/states/app_state.dart';
import 'package:redux/redux.dart';

Reducer<AppState> appReducer = combineReducers([planetsReducer]);
